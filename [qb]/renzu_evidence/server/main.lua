-- renzu_evidence (QBCore version) - Server
-- Rewritten to use QBCore and citizenid as the tracked identifier.
-- Notes:
--  * Uses MySQL.query.await for DB reads (assumes mysql-async / oxmysql compatible wrapper)
--  * Tries to use ox_inventory export when giving items as a best-effort fallback.
--  * FetchPlayerData attempts to read from `players` table and parse charinfo JSON. Adjust if your DB schema differs.
--  * Config values referenced: config.expiration, config.evidencelocker
--  * The script retains the GlobalState.Evidence structure and expiration cleanup.

local QBCore = exports['qb-core']:GetCoreObject()
local json = json

-- Simple SQL helper (same idea as original)
local sql = setmetatable({}, {
    __call = function(self)
        self.query = function(name, column, where, value)
            local str = 'SELECT %s FROM %s WHERE %s = ?'
            return MySQL.query.await(str:format(column, name, where), {value})
        end
        return self
    end
})

local db = sql()

-- Ensure GlobalState containers exist
if not GlobalState.Evidence then GlobalState.Evidence = {} end
if not GlobalState.Bloods then GlobalState.Bloods = {} end

-- identifier cache: maps server source -> citizenid
local identifiers = {}

local function GetPlayerIdentifier(src)
    if not tonumber(src) then return nil end
    if not identifiers[src] then
        local Player = QBCore.Functions.GetPlayer(tonumber(src))
        if not Player then return nil end
        identifiers[src] = Player.PlayerData.citizenid
    end
    return identifiers[src]
end

-- Utility: safe AddItem (best-effort)
local function AddItem(src, item, count, metadata)
    if GetResourceState('ox_inventory') == 'started' then
        -- ox_inventory commonly provides a server export
        if exports.ox_inventory and exports.ox_inventory.AddItem then
            exports.ox_inventory:AddItem(src, item, count, metadata)
            return true
        elseif exports.ox_inventory and exports.ox_inventory.AddItemToPlayer then
            exports.ox_inventory:AddItemToPlayer(src, item, count, metadata)
            return true
        end
    end

    -- If you use qb-inventory or another inventory, implement here.
    -- Fallback: notify admin in logs
    print(('renzu_evidence: AddItem fallback — could not add %s to %s'):format(item, tostring(src)))
    return false
end

-- Fetch player data by citizenid from DB. Attempts to parse charinfo column.
local function FetchPlayerData(citizenid)
    if not citizenid then return nil end

    -- Common qbcore uses `players` table with `charinfo` JSON column
    local result = MySQL.query.await('SELECT charinfo FROM players WHERE citizenid = ?', { citizenid })
    if not result or not result[1] then
        return nil
    end

    local charinfo_raw = result[1].charinfo
    if not charinfo_raw then return nil end

    local ok, charinfo = pcall(json.decode, charinfo_raw)
    if not ok or not charinfo then
        return nil
    end

    return {
        firstname = charinfo.firstname or '',
        lastname = charinfo.lastname or '',
        dateofbirth = charinfo.birthdate or charinfo.dateofbirth or '',
        job = (charinfo.job or (type(charinfo.job) == 'table' and charinfo.job.name) ) or '',
        citizenid = citizenid
    }
end

-- State bag handlers: bullets, magazine, bloods, vehiclefragments
AddStateBagChangeHandler('bullets', nil, function(bagName, key, value, _unused, replicated)
    Wait(0)
    if not value then return end
    local src = tonumber(bagName:gsub('player:', ''), 10)
    if not src then return end

    local identifier = GetPlayerIdentifier(src)
    if not identifier then return end

    if not GlobalState.Evidence.bullets then GlobalState.Evidence.bullets = {} end
    table.insert(GlobalState.Evidence.bullets, {
        serialid = value.serial,
        coord = value.coord,
        weapon = value.weapon,
        identifier = identifier,
        time = os.date("%Y-%m-%d %H:%M:%S"),
        location = value.location,
        invehicle = value.invehicle,
        ts = os.time(),
    })

    -- Optionally: broadcast the change or save to DB here
end)

AddStateBagChangeHandler('magazine', nil, function(bagName, key, value, _unused, replicated)
    Wait(0)
    if not value then return end
    local src = tonumber(bagName:gsub('player:', ''), 10)
    if not src then return end

    local identifier = GetPlayerIdentifier(src)
    if not identifier then return end

    if not GlobalState.Evidence.magazine then GlobalState.Evidence.magazine = {} end
    table.insert(GlobalState.Evidence.magazine, {
        serialid = value.serial,
        coord = value.coord,
        weapon = value.weapon,
        identifier = identifier,
        time = os.date("%Y-%m-%d %H:%M:%S"),
        location = value.location,
        ts = os.time(),
    })
end)

AddStateBagChangeHandler('bloods', nil, function(bagName, key, value, _unused, replicated)
    Wait(0)
    if not value then return end
    local src = tonumber(bagName:gsub('player:', ''), 10)
    if not src then return end

    local identifier = GetPlayerIdentifier(src)
    if not identifier then return end

    if not GlobalState.Evidence.bloods then GlobalState.Evidence.bloods = {} end
    table.insert(GlobalState.Evidence.bloods, {
        coord = value.coord,
        identifier = identifier,
        time = os.date("%Y-%m-%d %H:%M:%S"),
        location = value.location,
        ts = os.time(),
    })
end)

AddStateBagChangeHandler('vehiclefragments', nil, function(bagName, key, value, _unused, replicated)
    Wait(0)
    if not value then return end
    local src = tonumber(bagName:gsub('player:', ''), 10)
    if not src then return end

    local identifier = GetPlayerIdentifier(src)
    if not identifier then return end

    if not GlobalState.Evidence.vehiclefragments then GlobalState.Evidence.vehiclefragments = {} end
    table.insert(GlobalState.Evidence.vehiclefragments, {
        plate = value.plate,
        coord = value.coord,
        identifier = identifier,
        time = os.date("%Y-%m-%d %H:%M:%S"),
        location = value.location,
        ts = os.time(),
    })
end)

-- Callback: Remove evidence (gives evidence item and removes from GlobalState)
lib.callback.register('renzu_evidence:removeevidence', function(src, data)
    local evidence = GlobalState.Evidence or {}

    local xPlayer = QBCore.Functions.GetPlayer(src)
    if not xPlayer then return false end

    local label = data.type == 'bullets' and 'Bullet Cartridge' or data.type == 'magazine' and 'Empty Magazine' or data.type == 'bloods' and 'Blood clot' or data.type == 'fingerprint' and 'Fingerprint Sample' or data.type == 'vehiclefragments' and 'Vehicle Fragment' or 'Evidence'
    local image = data.type == 'bullets' and 'ammo-9' or data.type == 'magazine' and 'magazine' or data.type == 'bloods' and 'blood' or data.type == 'fingerprint' and 'fingerprint' or data.type == 'vehiclefragments' and 'vehiclefragments' or 'evidence'

    local info = data.info or {}
    local metadata = {
        serialid = info.serialid,
        plate = info.plate,
        recoveredby = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname,
        type = data.type,
        label = label,
        description = 'unidentified '..tostring(data.type),
        location = info.location,
        time = info.time or os.date("%Y-%m-%d %H:%M:%S"),
        identifier = info.identifier,
        image = image,
    }

    -- Give an evidence item
    AddItem(src, 'evidence', 1, metadata)

    -- Remove from state
    if data.type ~= 'fingerprint' then
        local item = evidence[data.type]
        if item and item[data.index] then
            evidence[data.type][data.index] = nil
            GlobalState.Evidence = evidence
        elseif data.entity then
            local ent = NetworkGetEntityFromNetworkId(data.entity)
            if ent and DoesEntityExist(ent) then
                pcall(function()
                    Entity(ent).state:set('vehiclebullets', false, true)
                end)
            end
        end
    else
        -- fingerprint
        if data.entity then
            local ent = NetworkGetEntityFromNetworkId(data.entity)
            if ent and DoesEntityExist(ent) then
                pcall(function()
                    Entity(ent).state:set('fingerprint', false, true)
                end)
            end
        end
    end
end)

-- Callback: Identify evidence (creates a detailed report item)
lib.callback.register('renzu_evidence:Identify', function(src, data, metadata, slot)
    if not metadata then return false end

    local xPlayer = QBCore.Functions.GetPlayer(src)
    if not xPlayer then return false end

    local num = math.random(69, 69999)
    local fetchplayer = FetchPlayerData(metadata.identifier)
    local firstname = (fetchplayer and fetchplayer.firstname) or ''
    local lastname = (fetchplayer and fetchplayer.lastname) or ''
    local person = (firstname .. ' ' .. lastname):match('^%s*(.-)%s*$') or ''

    local report = {
        label = 'Evidence #'..tostring(num),
        description = 'Suspect: '..person..' Date: '..(metadata.time or os.date("%Y-%m-%d %H:%M:%S")),
        evidence = true,
        evidenceid = num,
        type = metadata.type,
        location = metadata.location,
        time = metadata.time,
        name = metadata.label,
        person = person,
        dateofbirth = (fetchplayer and fetchplayer.dateofbirth) or '',
        occupation = (fetchplayer and fetchplayer.job) or '',
        submit_by = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname,
        recoveredby = metadata.recoveredby,
        description_evidence = data[2] or 'Undisclosed',
        description_offense = data[3] or 'Undisclosed',
        victim = data[1] or 'Unidentified',
        case = data[4] or 'none',
        remarks = data[5] or 'none',
        sealed_time = os.date("%Y-%m-%d %H:%M:%S"),
        plate = metadata.plate,
        serialid = metadata.serialid,
    }

    AddItem(src, 'evidence', 1, report)
    return report
end)

-- Evidence expiration thread
Citizen.CreateThread(function()
    while true do
        Wait(60000) -- check every minute
        local evidence = GlobalState.Evidence or {}
        for etype, data in pairs(evidence) do
            for idx, v in pairs(data) do
                if v and v.ts and (os.time() - v.ts) > (config and config.expiration or 60 * 60 * 24) then
                    evidence[etype][idx] = nil
                end
            end
        end
        GlobalState.Evidence = evidence
    end
end)

-- Cleanup when player disconnects
AddEventHandler('playerDropped', function()
    local src = source
    if identifiers[src] then identifiers[src] = nil end
end)

-- Register stashes/lockers if ox_inventory is available
Citizen.CreateThread(function()
    if GetResourceState('ox_inventory') ~= 'started' then return end
    if config and config.evidencelocker then
        for k, v in pairs(config.evidencelocker) do
            exports.ox_inventory:RegisterStash('file_locker_'..k, 'Storage', 90, 1000000, false)
        end
    end
end)

-- Optional: Expose an export to fetch evidence snapshot (for admin UI)
exports('GetEvidenceSnapshot', function()
    return GlobalState.Evidence or {}
end)

print('renzu_evidence (qb) loaded')
