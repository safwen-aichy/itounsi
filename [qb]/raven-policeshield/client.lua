local QBCore = exports['qb-core']:GetCoreObject()
local shieldEntity = nil
local isShieldEquipped = false


RegisterNetEvent("raven-policeshield:toggleShield", function()
    if isShieldEquipped then
        RemoveShield()
    else
        EquipShield()
    end
end)


function EquipShield()
    if isShieldEquipped then return end

    local ped = PlayerPedId()
    local model = GetHashKey(Config.ShieldModel)

    
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    
    shieldEntity = CreateObject(model, 0, 0, 0, true, true, false)
    AttachEntityToEntity(shieldEntity, ped, GetPedBoneIndex(ped, 28422), 0.15, 0.05, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)

    
    RequestAnimDict(Config.AnimDict)
    while not HasAnimDictLoaded(Config.AnimDict) do Wait(0) end

    
    TaskPlayAnim(ped, Config.AnimDict, Config.AnimName, 8.0, -8.0, -1, 49, 0, false, false, false)

    
    Citizen.CreateThread(function()
        while isShieldEquipped do
            Wait(0)
            
            DisableControlAction(0, 24, true) 
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 140, true) 
            DisableControlAction(0, 37, true) 
            DisablePlayerFiring(PlayerId(), true)

            
            if not IsEntityPlayingAnim(ped, Config.AnimDict, Config.AnimName, 3) then
                TaskPlayAnim(ped, Config.AnimDict, Config.AnimName, 8.0, -8.0, -1, 49, 0, false, false, false)
            end
        end
    end)

    isShieldEquipped = true
    QBCore.Functions.Notify("Riot shield equipped.", "success")
end


function RemoveShield()
    if not isShieldEquipped then return end

    local ped = PlayerPedId()
    ClearPedTasks(ped)

    if DoesEntityExist(shieldEntity) then
        DeleteEntity(shieldEntity)
    end
    shieldEntity = nil
    isShieldEquipped = false

    QBCore.Functions.Notify("Riot shield removed.", "primary")
end


AddEventHandler("baseevents:onPlayerDied", RemoveShield)
AddEventHandler("baseevents:onPlayerKilled", RemoveShield)
AddEventHandler("playerSpawned", RemoveShield)


AddEventHandler("gameEventTriggered", function(name, args)
    if name == "CEventNetworkEntityDamage" then
        local victim = args[1]
        local attacker = args[2]

        if victim == PlayerPedId() and isShieldEquipped and attacker ~= 0 then
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local attackerCoords = GetEntityCoords(attacker)

            local forwardVector = GetEntityForwardVector(ped)
            local directionToAttacker = vector3(
                attackerCoords.x - pedCoords.x,
                attackerCoords.y - pedCoords.y,
                attackerCoords.z - pedCoords.z
            )

            
            local dot = (forwardVector.x * directionToAttacker.x + forwardVector.y * directionToAttacker.y) /
                        (math.sqrt(forwardVector.x^2 + forwardVector.y^2) * math.sqrt(directionToAttacker.x^2 + directionToAttacker.y^2))

            if dot > Config.BlockAngle then
                CancelEvent()
                QBCore.Functions.Notify("Shield blocked the bullet!", "success")
            end
        end
    end
end)
