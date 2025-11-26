local TriggerServerEvent   = TriggerServerEvent
local GetPedLastDamageBone = GetPedLastDamageBone

local function checkInjuryCause(cause)
    local item = "bandage"

    if cause == "beaten" then
        item = "icepack"
    elseif cause == "stabbed" then
        item = "suturekit"
    elseif cause == "shot" then
        item = "tweezers"
    elseif cause == "fire" then
        item = "burncream"
    end

    utils.debug(item, cause)

    local count = exports.ox_inventory:Search('count', item)
    if count < 1 then 
        return utils.showNotification(locale("not_enough_" .. item)) 
    end

    local itemDurability = utils.getItem(item)?.metadata?.durability

    if itemDurability then
        if itemDurability < Config.ConsumeItemPerUse then
            utils.showNotification(locale("no_durability"))
            return false
        end
    end

    -- Use lib callback to remove item
    local success = lib.callback.await('ars_ambulancejob:removeItem', false, {
        item = item,
        quantity = 1
    })

    if not success then
        utils.showNotification(locale("failed_to_use_item"))
        return false
    end

    return true
end
function getItemNameFromCause(cause)
    local items = {
        ["beaten"] = "icepack",
        ["stabbed"] = "suturekit", 
        ["shot"] = "tweezers",
        ["fire"] = "burncream",
        ["default"] = "bandage"
    }
    return items[cause] or items["default"]
end
-- Handle specific injury treatment from server
RegisterNetEvent('ars_ambulancejob:treatSpecificInjury', function(bone)
    utils.debug("Received specific injury treatment for bone:", bone)
    treatInjury(bone)
end)

-- Handle general healing
RegisterNetEvent('ars_ambulancejob:healPlayer', function(data)
    if data.injury and data.bone then
        utils.debug("Received heal request for bone:", data.bone)
        treatInjury(data.bone)
    elseif data.revive then
        -- Handle revival logic here if needed
        utils.debug("Received revival request")
    end
end)
function checkInjuries(data)
    local injuries = {}

    utils.debug(data.injuries)

    if not data.injuries or not next(data.injuries) then
        injuries[#injuries + 1] = {
            title = 'No injuries',
        }
    else
        for _, v in pairs(data.injuries) do
            injuries[#injuries + 1] = {
                title = v.label,
                description = v.desc,

                arrow = true,
                onSelect = function()
                    lib.registerContext({
                        id = 'patient_injury' .. _,
                        title = v.label,
                        menu = "patient_injuries",
                        options = {
                            {
                                title = locale("injury_value"),
                                progress = v.value,
                                metadata = { v.value .. "%" },
                            },
                            {
                                title = locale("injury_cause"),
                                description = v.cause,
                            },
                           {
                                title = locale("injury_treat"),
                                onSelect = function()
                                    utils.debug("Starting treatment process for injury:", v)
                                    
                                    if checkInjuryCause(v.cause) then
                                        utils.debug("Item check passed, starting progress bar")
                                        
                                        local success = lib.progressBar({
                                            duration = 2000 * (v.value / 10),
                                            label = locale("treating_injury"),
                                            useWhileDead = false,
                                            canCancel = true,
                                            disable = {
                                                car = true,
                                                move = true
                                            },
                                            anim = {
                                                scenario = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"
                                            }
                                        })
                                        
                                        if success then
                                            utils.debug("Progress bar completed, sending to server")
                                            
                                            local dataToSend = {
                                                targetServerId = data.target,  -- Make sure this is the correct target ID
                                                injury = true,
                                                bone = v.bone,
                                                item = getItemNameFromCause(v.cause)  -- You need to implement this function
                                            }
                                            
                                            TriggerServerEvent("ars_ambulancejob:healPlayer", dataToSend)
                                            utils.addRemoveItem("add", "money", (100 * (v.value / 10)))
                                            utils.showNotification(locale("injurie_treated"))
                                            
                                            -- Close and reopen context to refresh
                                            lib.hideContext(true)
                                            checkInjuries(data)
                                        else
                                            utils.showNotification(locale("operation_canceled"))
                                        end
                                    else
                                        utils.debug("Item check failed")
                                    end
                                end


                            }
                        }
                    })

                    lib.showContext('patient_injury' .. _)
                end
            }
        end
    end

    lib.registerContext({
        id = 'patient_injuries',
        title = locale("injury_menu_title"),
        menu = "check_patient",
        options = injuries
    })

    lib.showContext('patient_injuries')
end

function treatInjury(bone)
    utils.debug("treatInjury called with bone:", bone)
    utils.debug("Current injuries before treatment:", player.injuries)
    
    if not player.injuries[bone] then 
        utils.debug("No injury found for bone:", bone)
        return 
    end

    player.injuries[bone] = nil
    LocalPlayer.state:set("injuries", player.injuries, true)

    local playerHealth = GetEntityHealth(cache.ped)
    local playerMaxHealth = GetEntityMaxHealth(cache.ped)
    local newHealth = math.min(playerHealth + 40, playerMaxHealth)

    utils.debug("Health before:", playerHealth, "Health after:", newHealth)
    SetEntityHealth(cache.ped, newHealth)
    
    utils.debug("Injuries after treatment:", player.injuries)
end

function updateInjuries(victim, weapon)
    local found, lastDamaagedBone = GetPedLastDamageBone(victim)

    local damagedBone = Config.BodyParts[tostring(lastDamaagedBone)]

    utils.debug("Damaged bone ", lastDamaagedBone, damagedBone.label)

    if damagedBone then
        if not player.injuries[damagedBone.id] then
            player.injuries[damagedBone.id] = { bone = damagedBone.id, label = damagedBone.label, desc = damagedBone.levels["default"], value = player.isDead and 100 or 10, cause = WEAPONS[weapon] and WEAPONS[weapon][2] or "not found" }
        else
            local newVal = math.min(player.injuries[damagedBone.id].value + 40, 100)
            player.injuries[damagedBone.id].value = newVal
            player.injuries[damagedBone.id].desc = damagedBone.levels[tostring(newVal)] or damagedBone.levels["default"]
        end

        LocalPlayer.state:set("injuries", player.injuries, true)
    end
end

-- © 𝐴𝑟𝑖𝑢𝑠 𝐷𝑒𝑣𝑒𝑙𝑜𝑝𝑚𝑒𝑛𝑡
