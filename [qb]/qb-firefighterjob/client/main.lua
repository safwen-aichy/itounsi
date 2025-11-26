local QBCore = exports['qb-core']:GetCoreObject()

-- Duty toggle
CreateThread(function()
    exports['qb-target']:AddBoxZone("fire_duty", Config.Duty, 1.5, 1.5, {
        name = "fire_duty",
        heading = 0,
        minZ = Config.Duty.z - 1,
        maxZ = Config.Duty.z + 1
    }, {
        options = {
            {
                label = "Go On/Off Duty",
                icon = "fas fa-user-check",
                job = Config.JobName,
                action = function()
                    TriggerServerEvent("QBCore:ToggleDuty")
                end
            }
        },
        distance = 2.5
    })
end)

-- Garage Ped


-- Spawn vehicle
RegisterNetEvent("firefighter:client:SpawnVehicle", function(data)
    local model = GetHashKey(data.model)
    if not IsModelInCdimage(model) or not IsModelAVehicle(model) then
        QBCore.Functions.Notify("Vehicle model not found: "..data.model, "error")
        return
    end
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    QBCore.Functions.SpawnVehicle(data.model, function(veh)
        SetVehicleNumberPlateText(veh, "FIRE"..tostring(math.random(100,999)))
        SetEntityHeading(veh, Config.Garage.spawn.w)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleEngineOn(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    end, Config.Garage.spawn, true)
end)

-- Stash


-- Armory as shop

-- Boss menu


-- Death alert
RegisterNetEvent("firefighter:client:DeathAlert", function(coords)
    QBCore.Functions.Notify("?? Civilian Down! Check GPS.", "error")
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 487)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.9)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Medical Alert")
    EndTextCommandSetBlipName(blip)
    SetTimeout(60000, function() RemoveBlip(blip) end)
end)
