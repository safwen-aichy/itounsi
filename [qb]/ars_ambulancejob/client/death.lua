-- death.lua (fixed version)

local DoScreenFadeOut              = DoScreenFadeOut
local DoScreenFadeIn               = DoScreenFadeIn
local GetEntityCoords              = GetEntityCoords
local GetEntityMaxHealth           = GetEntityMaxHealth
local IsScreenFadedOut             = IsScreenFadedOut
local NetworkResurrectLocalPlayer  = NetworkResurrectLocalPlayer
local ShakeGameplayCam             = ShakeGameplayCam
local AnimpostfxPlay               = AnimpostfxPlay
local AnimpostfxStopAll            = AnimpostfxStopAll
local CreateThread                 = CreateThread
local Wait                         = Wait
local SetEntityCoords              = SetEntityCoords
local SetEntityHeading             = SetEntityHeading
local SetEntityHealth              = SetEntityHealth
local TaskPlayAnim                 = TaskPlayAnim
local FreezeEntityPosition         = FreezeEntityPosition
local ClearPedTasks                = ClearPedTasks
local SetEntityInvincible          = SetEntityInvincible
local SetEveryoneIgnorePlayer      = SetEveryoneIgnorePlayer
local GetGameTimer                 = GetGameTimer
local IsControlJustPressed         = IsControlJustPressed
local TriggerServerEvent           = TriggerServerEvent
local AddEventHandler              = AddEventHandler
local PlayerPedId                  = PlayerPedId
local NetworkGetPlayerIndexFromPed = NetworkGetPlayerIndexFromPed
local IsPedAPlayer                 = IsPedAPlayer
local IsPedDeadOrDying             = IsPedDeadOrDying
local IsPedFatallyInjured          = IsPedFatallyInjured
local EnableAllControlActions      = EnableAllControlActions

player = {}
player.injuries = {}

-- Heal player fully
local function healPlayer()
    local ped = cache.ped or PlayerPedId()
    local maxHealth = GetEntityMaxHealth(ped)
    SetEntityHealth(ped, maxHealth)
    healStatus()
end

-- Stop death state and restore controls
function stopPlayerDeath()
    player.isDead = false

    local playerPed = cache.ped or PlayerPedId()
    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do Wait(50) end

    local coords = cache.coords or GetEntityCoords(playerPed)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.w or 0.0, false, false)

    TriggerServerEvent('ars_ambulancejob:updateDeathStatus', { isDead = false })

    playerPed = PlayerPedId()

    if cache.vehicle then
        SetPedIntoVehicle(cache.ped, cache.vehicle, cache.seat)
    end

    ClearPedBloodDamage(playerPed)
    SetEntityInvincible(playerPed, false)
    SetEveryoneIgnorePlayer(cache.playerId, false)
    ClearPedTasks(playerPed)
    AnimpostfxStopAll()

    DoScreenFadeIn(700)
    TaskPlayAnim(playerPed, Config.DeathAnimations["revive"].dict, Config.DeathAnimations["revive"].clip, 8.0, -8.0, -1, 0, 0, 0, 0, 0)

    LocalPlayer.state:set("dead", false, true)
    player.distressCallTime = nil

    playerSpawned()
    healPlayer()

    -- ✅ Unfreeze player & restore full control
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
    SetEntityInvincible(playerPed, false)
    EnableAllControlActions(0)

    -- Re-enable phone if lb-phone is used
    if exports['lb-phone'] then
        exports['lb-phone']:SetPhoneDisabled(false)
    end
end

-- Handle server-triggered healing or revive
RegisterNetEvent("ars_ambulancejob:healPlayer", function(data)
    if data.revive then
        stopPlayerDeath()
    elseif data.injury then
        treatInjury(data.bone)
    elseif data.heal then
        healPlayer()
    end
end)

-- Respawn player at hospital
local function respawnPlayer()
    local playerPed = cache.ped or PlayerPedId()

    if Config.RemoveItemsOnRespawn then
        TriggerServerEvent("ars_ambulancejob:removeInventory")
    end

    lib.requestAnimDict("anim@gangops@morgue@table@")
    lib.requestAnimDict("switch@franklin@bed")

    local hospital = utils.getClosestHospital()
    local bed = nil

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(1) end

    for i = 1, #hospital.respawn do
        local _bed = hospital.respawn[i]
        if not utils.isBedOccupied(_bed.bedPoint) then
            bed = _bed
            break
        end
    end
    if not bed then bed = hospital.respawn[1] end

    player.respawning = true

    SetEntityCoords(playerPed, bed.bedPoint)
    SetEntityHeading(playerPed, bed.bedPoint.w)
    TaskPlayAnim(playerPed, "anim@gangops@morgue@table@", "body_search", 2.0, 2.0, -1, 1, 0, false, false, false)
    FreezeEntityPosition(playerPed, true)

    DoScreenFadeIn(300)
    Wait(5000)

    SetEntityCoords(playerPed, vector3(bed.bedPoint.x, bed.bedPoint.y, bed.bedPoint.z) + vector3(0.0, 0.0, -1.0))
    FreezeEntityPosition(playerPed, false)
    SetEntityHeading(playerPed, bed.bedPoint.w + 90.0)
    TaskPlayAnim(playerPed, "switch@franklin@bed", "sleep_getup_rubeyes", 1.0, 1.0, -1, 8, -1, 0, 0, 0)

    Wait(5000)
    stopPlayerDeath()
    ClearPedTasks(playerPed)
    SetEntityCoords(playerPed, bed.spawnPoint)
    player.respawning = false
end

-- Initialize player death state
local function initPlayerDeath(logged_dead)
    if player.isDead then return end
    player.isDead = true
    startCommandTimer()

    for _, anim in pairs(Config.DeathAnimations) do
        lib.requestAnimDict(anim.dict)
    end

    if logged_dead then goto logged_dead end

    if Config.ExtraEffects then
        ShakeGameplayCam('DEATH_FAIL_IN_EFFECT_SHAKE', 1.0)
        AnimpostfxPlay('DeathFailOut', 0, true)
        Wait(4000)
        DoScreenFadeOut(200)
        Wait(800)
        DoScreenFadeIn(400)
    end
    if not player.isDead then return end

    ::logged_dead::
    local playerPed = cache.ped or PlayerPedId()

    CreateThread(function()
        while player.isDead do
            DisableFirstPersonCamThisFrame()
            Wait(0)
        end
    end)

    local coords = cache.coords or GetEntityCoords(playerPed)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(playerPed), false, false)
    playerPed = PlayerPedId()

    if cache.vehicle then
        SetPedIntoVehicle(cache.ped, cache.vehicle, cache.seat)
    end

    SetEntityInvincible(playerPed, true)
    SetEntityHealth(playerPed, 100)
    SetEveryoneIgnorePlayer(cache.playerId, true)

    local time = 60000 * Config.RespawnTime
    local deathTime = GetGameTimer()

    CreateThread(function()
        while player.isDead do
            local sleep = 1500

            if not player.gettingRevived and not player.respawning then
                sleep = 0
                local anim = cache.vehicle and Config.DeathAnimations["car"] or Config.DeathAnimations["normal"]

                if not IsEntityPlayingAnim(playerPed, anim.dict, anim.clip, 3) then
                    TaskPlayAnim(playerPed, anim.dict, anim.clip, 50.0, 8.0, -1, 1, 1.0, false, false, false)
                end

                local elapsedSeconds = math.floor((GetGameTimer() - deathTime) / 1000)

                utils.drawTextFrame({
                    x = 0.5,
                    y = 0.9,
                    msg = "Press ~r~E~s~ to call medics"
                })

                if IsControlJustPressed(0, 38) then
                    createDistressCall()
                end

                if GetGameTimer() - deathTime >= time then
                    EnableControlAction(0, 47, true)

                    utils.drawTextFrame({
                        x = 0.5,
                        y = 0.86,
                        msg = "Press ~r~G~s~ to respawn"
                    })

                    if IsControlJustPressed(0, 47) then
                        local confirmation = lib.alertDialog({
                            header = 'Top G',
                            content = 'Are you sure you want to respawn!',
                            centered = true,
                            cancel = true
                        })

                        if confirmation == "confirm" then
                            respawnPlayer()
                        end
                    end
                else
                    utils.drawTextFrame({
                        x = 0.5,
                        y = 0.86,
                        msg = ("Respawn available in ~b~ %s seconds~s~"):format(math.floor((time / 1000) - elapsedSeconds))
                    })
                end
            end

            Wait(sleep)
        end
    end)
end

-- Event triggered on player load
function onPlayerLoaded()
    exports.spawnmanager:setAutoSpawn(false) -- for qbcore

    local data = lib.callback.await('ars_ambulancejob:getDeathStatus', false)

    if data?.isDead then
        initPlayerDeath(true)
        utils.showNotification("logged_dead")
    end
end

-- Detect player death
AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end

    local victim, victimDied, weapon = data[1], data[4], data[7]

    if not IsPedAPlayer(victim) then return end

    local playerPed = cache.playerId or PlayerId()
    if NetworkGetPlayerIndexFromPed(victim) ~= playerPed then return end

    local victimDiedAndPlayer = victimDied and NetworkGetPlayerIndexFromPed(victim) == playerPed and (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim))
    if victimDiedAndPlayer then
        TriggerServerEvent('ars_ambulancejob:updateDeathStatus', { isDead = true, weapon = weapon })
        LocalPlayer.state:set("dead", true, true)
        initPlayerDeath()
    end

    updateInjuries(victim, weapon)
end)

-- Export for checking death state
exports("isDead", function()
    return player.isDead
end)

