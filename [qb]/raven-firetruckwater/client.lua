local QBCore = exports['qb-core']:GetCoreObject()


local maxWater = 100 -- tank capacity
local drainRate = 1  -- amount drained per second while spraying
local refillTime = 10 -- seconds to refill full tank
local waterLevel = maxWater
local isRefilling = false
local isSpraying = false


local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(5)
    end
end


local function GetNearestFiretruck()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, GetHashKey("scania"), 70)
    if veh and veh ~= 0 then
        return veh
    end
    return nil
end


CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)

        if veh ~= 0 and GetEntityModel(veh) == GetHashKey("scania") then
            -- Holding LMB (vehicle fire control)
            if IsControlPressed(0, 68) and waterLevel > 0 then
                if not isSpraying then
                    isSpraying = true
                end
            else
                if isSpraying then
                    isSpraying = false
                end
            end
        else
            isSpraying = false
        end
    end
end)


CreateThread(function()
    while true do
        Wait(1000)
        if isSpraying then
            waterLevel = waterLevel - drainRate
            if waterLevel <= 0 then
                waterLevel = 0
                isSpraying = false
                QBCore.Functions.Notify("Water tank empty! Refill needed.", "error")
            end
        end
    end
end)


CreateThread(function()
    exports['qb-target']:AddTargetModel(`prop_fire_hydrant_1`, {
        options = {
            {
                type = "client",
                event = "raven-firetruckwater:client:RefillTruck",
                icon = "fas fa-tint",
                label = "Refill Firetruck Tank",
                job = "firefighter"
            }
        },
        distance = 2.0
    })
end)


RegisterNetEvent("raven-firetruckwater:client:RefillTruck", function()
    if isRefilling then
        QBCore.Functions.Notify("Already refilling!", "error")
        return
    end

    local veh = GetNearestFiretruck()
    if not veh then
        QBCore.Functions.Notify("No firetruck nearby to refill!", "error")
        return
    end

    if waterLevel >= maxWater then
        QBCore.Functions.Notify("Tank already full!", "success")
        return
    end

    isRefilling = true
    local ped = PlayerPedId()


    LoadAnimDict("anim@am_hold_up@male")
    TaskPlayAnim(ped, "anim@am_hold_up@male", "hold_up_loop", 8.0, -8, 3000, 1, 0, false, false, false)
    QBCore.Functions.Notify("Connecting hose...", "primary")
    Wait(3000)


    LoadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
    QBCore.Functions.Notify("Refilling water tank...", "primary")

    local timeLeft = refillTime
    while timeLeft > 0 do
        Wait(1000)
        timeLeft = timeLeft - 1
        QBCore.Functions.Notify("Refilling... " .. timeLeft .. "s left", "info")
    end

    ClearPedTasks(ped)
    waterLevel = maxWater
    isRefilling = false
    QBCore.Functions.Notify("Firetruck water tank refilled!", "success")
end)


RegisterCommand("tankstatus", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)

    if veh == 0 then
        veh = GetClosestVehicle(GetEntityCoords(ped), 5.0, GetHashKey("scania"), 70)
    end

    if veh ~= 0 and GetEntityModel(veh) == GetHashKey("scania") then
        local percent = math.floor((waterLevel / maxWater) * 100)
        QBCore.Functions.Notify("Water Tank: " .. percent .. "%", "primary")
    else
        QBCore.Functions.Notify("No firetruck nearby.", "error")
    end
end)
