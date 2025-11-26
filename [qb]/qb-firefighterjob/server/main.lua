local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('raven-firefighter:server:stash', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if not Player then return end
	local citizenId = Player.PlayerData.citizenid
	local stashName = 'firefighter stash_' .. citizenId
	exports['qb-inventory']:OpenInventory(src, stashName)
end)

-- Armory as shop
RegisterNetEvent("raven-firefighter:server:OpenArmory", function()
    local src = source
    local items = {}
    for _, v in ipairs(Config.Armory.items) do
        table.insert(items, v)
    end
    TriggerClientEvent("inventory:client:OpenInventory", src, "shop", "firefighter_armory", items)
end)

-- Death alert
RegisterNetEvent("firefighter:server:SendDeathAlert", function(coords)
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == Config.JobName then
            TriggerClientEvent("firefighter:client:DeathAlert", Player.PlayerData.source, coords)
        end
    end
end)
