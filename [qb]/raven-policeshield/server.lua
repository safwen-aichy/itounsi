local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem(Config.ShieldItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    if Player.PlayerData.job.name ~= Config.AllowedJob then
        TriggerClientEvent("QBCore:Notify", source, "You are not allowed to use this.", "error")
        return
    end

    TriggerClientEvent("raven-policeshield:toggleShield", source)
end)
