local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('raven-biojob:server:craftItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name ~= Config.JobName then
        TriggerClientEvent('QBCore:Notify', src, 'You are not a bio worker!', 'error')
        return
    end

    local craftData = Config.CraftingPoints[item]
    if not craftData then return end

    
    for ingredient, amount in pairs(craftData.items) do
        if exports.ox_inventory:Search(src, 'count', ingredient) < amount then
            TriggerClientEvent('QBCore:Notify', src, 'Not enough ' .. ingredient, 'error')
            return
        end
    end

    
    for ingredient, amount in pairs(craftData.items) do
        exports.ox_inventory:RemoveItem(src, ingredient, amount)
    end

    -- Add crafted item
    exports.ox_inventory:AddItem(src, craftData.reward, craftData.amount)
    TriggerClientEvent('QBCore:Notify', src, 'Crafted ' .. craftData.reward .. ' successfully!', 'success')
end)
