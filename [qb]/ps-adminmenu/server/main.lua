QBCore = exports['qb-core']:GetCoreObject()


local QBCore = exports['qb-core']:GetCoreObject()

-- 🧾 Discord webhook (replace with your own!)
local DISCORD_WEBHOOK = 'https://discord.com/api/webhooks/1434212681283408004/S2oZyXB-VSAViwvSF6AZRtycLhd6ZMNvWyVcMk9eFr1WF4btVd7FPEfhQn4wMeFQMvCX'

-- Temp store for confirmations
local pendingConfirmations = {}

-- 🔔 Send log to Discord
local function sendDiscordLog(adminSrc, targetName, targetCitizenId)
    local adminName = GetPlayerName(adminSrc) or "Console"
    local embed = {
        {
            ["title"] = "🗑️ Character Deleted",
            ["description"] = ("**Admin:** %s\n**Target:** %s\n**CitizenID:** `%s`\n**Time:** %s"):format(
                adminName, targetName, targetCitizenId, os.date("%Y-%m-%d %H:%M:%S")
            ),
            ["color"] = 16711680, -- red
        }
    }

    PerformHttpRequest(DISCORD_WEBHOOK, function() end, 'POST', json.encode({
        username = "QBCore Admin Logs",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("delchar", function(source, args)
    local admin = source
    local targetId = tonumber(args[1])

    if not targetId then
        TriggerClientEvent('QBCore:Notify', admin, "Usage: /delchar [id]", 'error')
        return
    end

    local Player = QBCore.Functions.GetPlayer(targetId)
    if not Player then
        TriggerClientEvent('QBCore:Notify', admin, "Player not found or offline", 'error')
        return
    end

    local citizenid = Player.PlayerData.citizenid
    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname

    -- Confirm message
    TriggerClientEvent('QBCore:Notify', admin, "Deleting " .. playerName .. " (" .. citizenid .. ")", 'primary')

    -- Kick the player first
    DropPlayer(targetId, "Your character has been deleted by an admin.")

    -- Wait a moment before DB deletion
    Wait(1000)

    -- Delete character data
    exports.oxmysql:execute('DELETE FROM players WHERE citizenid = ?', {citizenid})

    -- Optional: clean related data (uncomment if you want)
    -- exports.oxmysql:execute('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
    -- exports.oxmysql:execute('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
    -- exports.oxmysql:execute('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})

    -- Discord log (optional)
    local webhook = "https://discord.com/api/webhooks/1434212681283408004/S2oZyXB-VSAViwvSF6AZRtycLhd6ZMNvWyVcMk9eFr1WF4btVd7FPEfhQn4wMeFQMvCX"
    PerformHttpRequest(webhook, function() end, "POST", json.encode({
        username = "Character Deletion Logs",
        embeds = {{
            title = "Character Deleted",
            description = ("**Admin:** <@%s> (`%s`)\n**Character:** `%s`\n**CitizenID:** `%s`"):format(admin, GetPlayerName(admin), playerName, citizenid),
            color = 16711680
        }}
    }), { ["Content-Type"] = "application/json" })

    print(("[ADMIN] %s deleted character %s (%s)"):format(GetPlayerName(admin), playerName, citizenid))
end, 'admin')


lib.addCommand('admin', {
    help = 'Open the admin menu',
    restricted = 'qbcore.mod'
}, function(source)
    if not QBCore.Functions.IsOptin(source) then TriggerClientEvent('QBCore:Notify', source, 'You are not on admin duty', 'error'); return end
    TriggerClientEvent('ps-adminmenu:client:OpenUI', source)
end)
-- Callbacks


local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('ps-adminmenu:server:HasPermission', function(source, cb)
    local hasPerm = QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin')
    cb(hasPerm)
end)

local QBCore = exports['qb-core']:GetCoreObject()

-- permission callback
QBCore.Functions.CreateCallback('ps-adminmenu:server:HasPermission', function(source, cb)
    local hasPerm = QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin')
    cb(hasPerm)
end)

-- bring event
RegisterNetEvent('ps-adminmenu:server:ForceBring', function(targetId, coords)
    local src = source
    if not targetId or type(coords) ~= 'table' then return end

    local hasPerm = QBCore.Functions.HasPermission(src, 'god') or QBCore.Functions.HasPermission(src, 'admin')
    if not hasPerm then return end

    TriggerClientEvent('ps-adminmenu:client:ForceBring', tonumber(targetId), coords)
end)

-- Optional safety: log who used bring command
RegisterNetEvent('ps-adminmenu:server:bringPlayer', function(targetId)
    local src = source
    local hasPerm = QBCore.Functions.HasPermission(src, 'god') or QBCore.Functions.HasPermission(src, 'admin')
    if not hasPerm then
        print(('^1[ps-adminmenu]^7 Player %s tried to use bring without permission!'):format(src))
        return
    end
    local srcPed = GetPlayerPed(src)
    local srcCoords = GetEntityCoords(srcPed)
    TriggerClientEvent('ps-adminmenu:client:BringHere', targetId, srcCoords)
end)

local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('kill', function(source, args)
    local src = source
    local targetId = tonumber(args[1])

    -- ✅ Check admin permission
    if not QBCore.Functions.HasPermission(src, 'admin') and not QBCore.Functions.HasPermission(src, 'god') then
        TriggerClientEvent('QBCore:Notify', src, 'You do not have permission to use this command.', 'error')
        return
    end

    -- ✅ Check if target ID is valid
    if not targetId then
        TriggerClientEvent('QBCore:Notify', src, 'Usage: /kill [id]', 'error')
        return
    end

    -- ✅ Check if player exists
    if GetPlayerName(targetId) then
        TriggerClientEvent('custom:killPlayer', targetId)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Player not found.', 'error')
    end
end)
