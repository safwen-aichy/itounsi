local QBCore = exports['qb-core']:GetCoreObject()

local burgerZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp
local oxtarget = GetResourceState('ox_target') == 'started'

local bs_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(bs_blip, 106)
SetBlipDisplay(bs_blip, 4)
SetBlipScale(bs_blip, 0.5)
SetBlipAsShortRange(bs_blip, true)
SetBlipColour(bs_blip, 75)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Burgershot')
EndTextCommandSetBlipName(bs_blip)

local function toggleEmotes(bool, emote)
    if bool then
        local doEmote = Config.Emotes[emote]
        lib.requestAnimDict(doEmote.dict)
        lib.requestModel(doEmote.prop)
        if doEmote.prop then
            emoteProp = CreateObject(doEmote.prop, 0.0, 0.0, 0.0, true, true, false)
            AttachEntityToEntity(emoteProp, cache.ped, GetPedBoneIndex(cache.ped, doEmote.bone), doEmote.coords.x, doEmote.coords.y, doEmote.coords.z, doEmote.rot.x, doEmote.rot.y, doEmote.rot.z, true, true, false, true, 1, true)
        end
        TaskPlayAnim(cache.ped, doEmote.dict, doEmote.anim, 8.0, 8.0, -1, 49, 0, 0, 0, 0)
        RemoveAnimDict(doEmote.dict)
        SetModelAsNoLongerNeeded(doEmote.prop)
    else
        ClearPedTasks(cache.ped)
        if emoteProp and DoesEntityExist(emoteProp) then 
            DetachEntity(emoteProp, true, false) 
            DeleteEntity(emoteProp)
            emoteProp = nil
        end
    end
end

function createJobZones()
    for k, v in pairs(Config.Zones) do
        if oxtarget then
            burgerZones[#burgerZones+1] = exports.ox_target:addSphereZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                radius = v.radius,
                debug = false,
                options = {
                    {
                        icon = v.icon,
                        label = v.label,
                        onSelect = function()
                            TriggerEvent(v.event)
                        end,
                        groups = v.job,
                        distance = 1.5,

                    }
                }
            })
        else
            exports['qb-target']:AddCircleZone('burgerShotZone'..k, v.coords, v.radius,{ 
                name= 'burgerShotZone'..k, 
                debugPoly = false, 
                useZ=true, 
            }, {
                options = {
                    { event = v.event, icon = v.icon, label = v.label, job = v.job, },
                },
                distance = 0.005
            })
            burgerZones[#burgerZones+1] = 'burgerShotZone'..k
        end
    end
end

function removeJobZones()
    for i = 1, #burgerZones do
        if oxtarget then
            exports.ox_target:removeZone(burgerZones[i])
        else
            exports['qb-target']:RemoveZone(burgerZones[i])
        end
    end
    table.wipe(burgerZones)
end
    
AddEventHandler('randol_burgershot2:client:storageInventory', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local job = PlayerData.job
    
    if job.name ~= 'burgershot2' or job.grade.level < 3 then
        DoNotification('You are not authorized to access this storage.', 'error')
        return
    end
    
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Storage'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Storage')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Storage', {
            maxweight = 2000000,
            slots = 50,
        })
    end
end)
AddEventHandler('randol_burgershot2:client:storageInventoryEmployer', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local job = PlayerData.job
    
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'employer_Storage'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'employer_Storage')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'employer_Storage', {
            maxweight = 2000000,
            slots = 50,
        })
    end
end)

AddEventHandler('randol_burgershot2:client:frontTray', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_1'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_1')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_1', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)
AddEventHandler('randol_burgershot2:client:sideTray', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_3'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_3')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_3', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)
AddEventHandler('randol_burgershot2:client:frontTray2', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_2'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_2')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_2', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('randol_burgershot2:client:passThrough', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Big_Tray'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Big_Tray')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Big_Tray', {
            maxweight = 150000,
            slots = 20,
        })
    end
end)

AddEventHandler('randol_burgershot2:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Burgershot'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'burgershot', Config.Items)
    end
end)

RegisterNetEvent('randol_burgershot2:client:Eat', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Munching..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('hunger', itemName)
        --lib.callback.await('randol_burgershot2:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('randol_burgershot2:client:Drink', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Drinking..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('thirst', itemName)
        --lib.callback.await('randol_burgershot2:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('randol_burgershot2:client:makeFood', function()
    -- local hasItems = lib.callback.await('randol_burgershot2:server:checkIngredients', false, 'food')
    -- if not hasItems then return end
    if GetInvokingResource() then return end
    toggleEmotes(true, 'bbqf')
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making food..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('randol_burgershot2:client:cookBurgers')
    end
end)

RegisterNetEvent('randol_burgershot2:client:makeFries', function()
    --     local hasItems = lib.callback.await('randol_burgershot2:server:checkIngredients', false, 'fries')
    -- if not hasItems then return end
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making noodles',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('randol_burgershot2:client:friesStation')
    end
end)

RegisterNetEvent('randol_burgershot2:client:makeDrink', function()
        local hasItems = lib.callback.await('randol_burgershot2:server:checkIngredients', false, 'drink')
    if not hasItems then return end
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('randol_burgershot2:client:drinkStation')
    end
end)

AddEventHandler('randol_burgershot2:client:cookBurgers', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Noodles Station',
        options = {
            {
                title = 'Chicken Noodles',
                description = 'Requires: 1x noodles | 1x chicken | 1x lettuce slice | 1x tomato slice',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot2:server:handleFood', false, 'noodles-chicken')
                end,
            },
            {
                title = 'Beef Noodles',
                description = 'Requires: 1x noodles | 1x beef | 1x lettuce slice | 1x tomato slice',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot2:server:handleFood', false, 'noodles-beef')
                end,
            },
            -- {
            --     title = 'Touhemi s Meatless Burger',
            --     description = 'Requires: 1x Bun | 1x Raw Patty',
            --     icon = 'fa-solid fa-burger',
            --     onSelect = function()
            --         lib.callback.await('randol_burgershot2:server:handleFood', false, 'burger-torpedo')
            --     end,
            -- },
            -- {
            --     title = 'Heartstopper Burger',
            --     description = 'Requires: 1x Bun | 1x Raw Patty | 1x Lettuce | 1x Tomato',
            --     icon = 'fa-solid fa-burger',
            --     onSelect = function()
            --         lib.callback.await('randol_burgershot2:server:handleFood', false, 'burger-heartstopper')
            --     end,
            -- },
            {
                title = 'Vegan Noodles',
                description = 'Requires: 1x noodles | 1x lettuce slice | 1x tomato slice',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('randol_burgershot2:server:handleFood', false, 'noodles-vegan')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

AddEventHandler('randol_burgershot2:client:drinkStation', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Drink Station',
        options = {
            {
                title = 'Grape Juice',
                description = 'Requires: 1x Grapes',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('randol_burgershot2:server:handleFood', false, 'burger-softdrink')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

AddEventHandler('randol_burgershot2:client:friesStation', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Noodles Machine',
        options = {
            {
                title = 'Prepare Noodles',
                description = 'Prepare 2x Wheat 1x Noodles',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x Wheat'},
                    {label = 'Produces', value = '2x Noodles'}
                },
                onSelect = function()
                    cutIngredients('noodles')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)
AddEventHandler('randol_burgershot2:client:cuttingStation', function()
    local cuttingMenu = {
        id = 'burgershot_cutting',
        title = 'Cutting Station',
        options = {
            {
                title = 'Slice Tomatoes',
                description = 'Cut 1x Tomato into 2x Tomato Slice',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x Tomato'},
                    {label = 'Produces', value = '2x Tomat Slices'}
                },
                onSelect = function()
                    cutIngredients('burger-tomato')
                end,
            },
            {
                title = 'Shred Lettuce',
                description = 'Cut 1x Lettuce into 2x Lettuce Slices',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '2x Lettuce'},
                    {label = 'Produces', value = '1x Lettuce Slices'}
                },
                onSelect = function()
                    cutIngredients('burger-lettuce')
                end,
            },
            {
                title = 'prepare Meat',
                description = 'Cut 1x Meat into 2x Sliced Meat',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x RAW Meat'},
                    {label = 'Produces', value = '2x Sliced Raw Meat'}
                },
                onSelect = function()
                    cutIngredients('burger-raw')
                end,
            },
             {
                title = 'Cut chicken',
                description = 'Cut 1x raw chicken into 2x chicken pieces',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x RAW Chicken'},
                    {label = 'Produces', value = '2x Chicken Slices'}
                },
                onSelect = function()
                    cutIngredients('chicken_raw')
                end,
            },
        }
    }
    lib.registerContext(cuttingMenu)
    lib.showContext('burgershot_cutting')
end)

AddEventHandler('randol_burgershot2:client:meatStation', function()
    local burgerShot = 'bs_info'
    local bsMenu = {
        id = burgerShot,
        title = 'Meat Station',
        options = {
            {
                title = 'Prepare Chicken',
                description = 'Cook Chicken',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x RAW Chicken'},
                    {label = 'Produces', value = '2x cooked-chicken'}
                },
                onSelect = function()
                    cutIngredients('cooked-chicken')
                end,
            },
            {
                title = 'Cook Meat',
                description = 'Cut 1x Meat into 2x Sliced Meat',
                icon = 'fa-solid fa-kitchen-set',
                metadata = {
                    {label = 'Requires', value = '1x RAW Meat'},
                    {label = 'Produces', value = '1x cooked-beef'}
                },
                onSelect = function()
                    cutIngredients('cooked-beef')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(burgerShot)
end)

function cutIngredients(recipeKey)
    local Config = lib.require('config')
    local recipe = Config.CuttingRecipes[recipeKey]
    
    if not recipe then return end
    
    -- Check if player has items BEFORE starting progress bar
    local hasItems = lib.callback.await('randol_burgershot2:server:checkCuttingIngredients', false, recipeKey)
    if not hasItems then return end
    
    -- Play cutting animation
    lib.requestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    TaskPlayAnim(cache.ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 8.0, 8.0, -1, 49, 0, false, false, false)
    
    if lib.progressCircle({
        duration = recipe.duration,
        position = 'bottom',
        label = recipe.label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true,
        },
        anim = {
            dict = 'anim@heists@prison_heiststation@cop_reactions',
            clip = 'cop_b_idle'
        },
    }) then
        ClearPedTasks(cache.ped)
        local success = lib.callback.await('randol_burgershot2:server:cutIngredients', false, recipeKey)
        if success then
            DoNotification('Successfully cut ingredients!', 'success')
            -- Reopen the cutting station menu after successful completion
            Wait(500) -- Small delay for better UX
            TriggerEvent('randol_burgershot2:client:cuttingStation')
        else
            DoNotification('Failed to cut ingredients.', 'error')
        end
    else
        ClearPedTasks(cache.ped)
        DoNotification('Cancelled cutting.', 'inform')
    end
end
AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)
