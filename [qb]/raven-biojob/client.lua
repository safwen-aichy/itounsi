local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for itemName, data in pairs(Config.CraftingPoints) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(1.5, 1.5, 1.5),
            rotation = 0.0,
            debug = false,
            options = {
                {
                    name = 'bio_craft_' .. itemName,
                    icon = 'fa-solid fa-flask',
                    label = 'Craft ' .. itemName:gsub("^%l", string.upper),
                    onSelect = function()
                        TriggerEvent('raven-biojob:client:craftItem', { item = itemName })
                    end,
                    groups = Config.JobName
                }
            }
        })
    end
end)

RegisterNetEvent('raven-biojob:client:craftItem', function(data)
    print('[DEBUG] Target interaction triggered:', json.encode(data))
    local itemName = data.item
    local craftInfo = Config.CraftingPoints[itemName]
    if not craftInfo then return end

    QBCore.Functions.Progressbar('craft_' .. itemName, 'Crafting ' .. itemName .. '...', 6000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('raven-biojob:server:craftItem', itemName)
    end, function()
        QBCore.Functions.Notify('Cancelled crafting', 'error')
    end)
end)
