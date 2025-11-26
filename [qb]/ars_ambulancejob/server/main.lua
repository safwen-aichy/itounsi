player = {}
distressCalls = {}

RegisterNetEvent("ars_ambulancejob:updateDeathStatus", function(death)
    local data = {}
    data.target = source
    data.status = death.isDead
    data.killedBy = death?.weapon or false

    updateStatus(data)
end)

RegisterNetEvent("ars_ambulancejob:revivePlayer", function(data)
    if not hasJob(source, Config.EmsJobs) or not source or source < 1 then return end

    local sourcePed = GetPlayerPed(source)
    local targetPed = GetPlayerPed(data.targetServerId)

    if data.targetServerId < 1 or #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) > 4.0 then
        print(source .. ' probile modder')
    else
        local dataToSend = {}
        dataToSend.revive = true

        TriggerClientEvent('ars_ambulancejob:healPlayer', tonumber(data.targetServerId), dataToSend)
    end
end)

RegisterNetEvent("ars_ambulancejob:healPlayer", function(data)
    if not hasJob(source, Config.EmsJobs) or not source or source < 1 then return end

    local sourcePed = GetPlayerPed(source)
    local targetPed = GetPlayerPed(data.targetServerId)

    if data.targetServerId < 1 or #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) > 4.0 then
        return print(source .. ' probable modder')
    end

    if data.injury and data.bone then
        -- Send healing directly to the target player
        TriggerClientEvent('ars_ambulancejob:treatSpecificInjury', tonumber(data.targetServerId), data.bone)
        
        -- Use item durability
        local itemData = {
            item = data.item or "bandage",
            value = Config.ConsumeItemPerUse or 10
        }
        TriggerEvent("ars_ambulancejob:useItem", itemData)
    else
        -- General healing logic
        data.anim = "medic"
        TriggerClientEvent("ars_ambulancejob:playHealAnim", source, data)
        data.anim = "dead"
        TriggerClientEvent("ars_ambulancejob:playHealAnim", data.targetServerId, data)
    end
end)

RegisterNetEvent("ars_ambulancejob:createDistressCall", function(data)
    if not source or source < 1 then return end
    distressCalls[#distressCalls + 1] = {
        msg = data.msg,
        gps = data.gps,
        location = data.location,
        name = getPlayerName(source)
    }

    local players = GetPlayers()

    for i = 1, #players do
        local id = tonumber(players[i])

        if hasJob(id, Config.EmsJobs) then
            TriggerClientEvent("ars_ambulancejob:createDistressCall", id, getPlayerName(source))
        end
    end
end)

RegisterNetEvent("ars_ambulancejob:callCompleted", function(call)
    for i = #distressCalls, 1, -1 do
        if distressCalls[i].gps == call.gps and distressCalls[i].msg == call.msg then
            table.remove(distressCalls, i)
            break
        end
    end
end)
lib.callback.register('ars_ambulancejob:removeItem', function(source, data)
    local count = exports.ox_inventory:GetItemCount(source, data.item)
    
    if count >= data.quantity then
        exports.ox_inventory:RemoveItem(source, data.item, data.quantity)
        return true
    else
        return false
    end
end)
RegisterNetEvent("ars_ambulancejob:removAddItem", function(data)
    if data.toggle then
        exports.ox_inventory:RemoveItem(source, data.item, data.quantity)
    else
        exports.ox_inventory:AddItem(source, data.item, data.quantity)
    end
end)

RegisterNetEvent("ars_ambulancejob:useItem", function(data)
    if not hasJob(source, Config.EmsJobs) then return end

    -- Check if item exists and has enough quantity
    local itemCount = exports.ox_inventory:GetItemCount(source, data.item)
    if itemCount < 1 then
        return
    end

    -- For durable items, reduce durability
    local itemData = exports.ox_inventory:GetSlotWithItem(source, data.item)
    if itemData and itemData.metadata?.durability then
        local newDurability = (itemData.metadata.durability - data.value)
        
        if newDurability <= 0 then
            -- Remove item if durability is depleted
            exports.ox_inventory:RemoveItem(source, data.item, 1)
        else
            -- Update durability
            exports.ox_inventory:SetDurability(source, itemData.slot, newDurability)
        end
    else
        -- For non-durable items, remove directly
        exports.ox_inventory:RemoveItem(source, data.item, 1)
    end
end)

RegisterNetEvent("ars_ambulancejob:removeInventory", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local isDead = Player.PlayerData.metadata["isdead"] or false
    if not (isDead and Config.RemoveItemsOnRespawn) then return end

    local amountToRemove = 1500
    local cashMoney = Player.Functions.GetMoney('cash') or 0
    local bankMoney = Player.Functions.GetMoney('bank') or 0
    local totalRemoved = 0
    local message = "Medical fee: "

    -- Remove from cash first
    if cashMoney > 0 then
        local removeFromCash = math.min(cashMoney, amountToRemove)
        Player.Functions.RemoveMoney('cash', removeFromCash)
        totalRemoved = totalRemoved + removeFromCash
        amountToRemove = amountToRemove - removeFromCash
        message = message .. "$"..removeFromCash.." from cash"
    end

    -- Then remove from bank
    if amountToRemove > 0 and bankMoney > 0 then
        local removeFromBank = math.min(bankMoney, amountToRemove)
        Player.Functions.RemoveMoney('bank', removeFromBank)
        totalRemoved = totalRemoved + removeFromBank

        if totalRemoved > cashMoney then
            message = message .. ", $"..removeFromBank.." from bank"
        else
            message = message .. "$"..removeFromBank.." from bank"
        end
    end

    -- Notify
    if totalRemoved > 0 then
        if amountToRemove > 0 then
            message = message .. " - insufficient funds ($"..(1500 - totalRemoved).." short)"
        end
        TriggerClientEvent('QBCore:Notify', source, message, "error")
    else
        TriggerClientEvent('QBCore:Notify', source, "No funds available for medical fee", "error")
    end
end)
RegisterNetEvent("ars_ambulancejob:putOnStretcher", function(data)
    if not player[data.target].isDead then return end
    TriggerClientEvent("ars_ambulancejob:putOnStretcher", data.target, data.toggle)
end)

RegisterNetEvent("ars_ambulancejob:togglePatientFromVehicle", function(data)
    print(data.target)
    if not player[data.target].isDead then return end

    TriggerClientEvent("ars_ambulancejob:togglePatientFromVehicle", data.target, data.vehicle)
end)

lib.callback.register('ars_ambulancejob:getDeathStatus', function(source, target)
    return player[target] and player[target] or getDeathStatus(target or source)
end)

lib.callback.register('ars_ambulancejob:getData', function(source, target)
    local data = {}
    data.injuries = Player(target).state.injuries or false
    data.status = getDeathStatus(target or source) or Player(target).state.dead
    data.killedBy = player[target]?.killedBy or false

    return data
end)

lib.callback.register('ars_ambulancejob:getDistressCalls', function(source)
    return distressCalls
end)

lib.callback.register('ars_ambulancejob:openMedicalBag', function(source)
    exports.ox_inventory:RegisterStash("medicalBag_" .. source, "Medical Bag", 10, 50 * 1000)

    return "medicalBag_" .. source
end)
lib.callback.register('ars_ambulancejob:getItem', function(source, name)
    local item = exports.ox_inventory:GetSlotWithItem(source, name)

    return item
end)

lib.callback.register('ars_ambulancejob:getMedicsOniline', function(source)
    local count = 0
    local players = GetPlayers()

    for i = 1, #players do
        local id = tonumber(players[i])

        if hasJob(id, Config.EmsJobs) then
            count += 1
        end
    end
    return count
end)

exports.ox_inventory:registerHook('swapItems', function(payload)
    if string.find(payload.toInventory, "medicalBag_") then
        if payload.fromSlot.name == Config.MedicBagItem then return false end
    end
end, {})


lib.versionCheck('Arius-Development/ars_ambulancejob')
