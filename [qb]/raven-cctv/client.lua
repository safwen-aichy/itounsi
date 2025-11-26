local QBCore = exports['qb-core']:GetCoreObject()

local isViewingCamera = false

-- Freeze and show camera view
function StartCameraView(camCoords, camHeading)
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    isViewingCamera = true

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, camCoords.x, camCoords.y, camCoords.z + 2.0)
    SetCamRot(cam, -15.0, 0.0, camHeading)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)
    QBCore.Functions.Notify("Press ~r~[E]~w~ or ~r~[BACKSPACE]~w~ to exit.", "primary", 5000)

    CreateThread(function()
        while isViewingCamera do
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)   -- Look left/right
            EnableControlAction(0, 2, true)   -- Look up/down
            EnableControlAction(0, 249, true) -- PTT
            EnableControlAction(0, 46, true)  -- E
            EnableControlAction(0, 202, true) -- BACKSPACE
            Wait(0)

            if IsControlJustPressed(0, 38) or IsControlJustPressed(0, 202) then
                StopCameraView(cam)
            end
        end
    end)
end

function StopCameraView(cam)
    local playerPed = PlayerPedId()
    isViewingCamera = false
    RenderScriptCams(false, true, 1000, true, true)
    DestroyCam(cam, false)
    FreezeEntityPosition(playerPed, false)
    QBCore.Functions.Notify("Exited camera view.", "success", 3000)
end


local function LoadModel(modelHash)
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        local tries = 0
        while not HasModelLoaded(modelHash) and tries < 100 do
            Wait(10)
            tries = tries + 1
        end
    end
end


CreateThread(function()
    local camModel = GetHashKey(Config.CameraProp)
    LoadModel(camModel)

    for _, cam in ipairs(Config.Cameras) do
        local obj = CreateObject(camModel, cam.coords.x, cam.coords.y, cam.coords.z, false, false, false)
        SetEntityHeading(obj, cam.heading)
        FreezeEntityPosition(obj, true)
        SetEntityInvincible(obj, true)
        SetEntityAsMissionEntity(obj, true)

        exports['qb-target']:AddTargetEntity(obj, {
            options = {
                {
                    label = "Hack Camera",
                    icon = "fa-solid fa-laptop-code",
                    action = function()
                        TryHackCamera(cam.serial)
                    end
                }
            },
            distance = 2.0
        })
    end
end)


CreateThread(function()
    local p = Config.PoliceConsole
    local consoleModel = GetHashKey(p.prop)
    LoadModel(consoleModel)

    local obj = CreateObject(consoleModel, p.coords.x, p.coords.y, p.coords.z, false, false, false)
    SetEntityHeading(obj, p.heading)
    FreezeEntityPosition(obj, true)
    SetEntityInvincible(obj, true)
    SetEntityAsMissionEntity(obj, true)

    exports['qb-target']:AddTargetEntity(obj, {
        options = {
            {
                label = "Access CCTV Network",
                icon = "fa-solid fa-tv",
                job = Config.PoliceJob,
                action = function()
                    QBCore.Functions.TriggerCallback('raven-cctv:getAllCameras', function(cameras)
                        if not cameras or #cameras == 0 then
                            QBCore.Functions.Notify("No cameras available.", "error")
                            return
                        end
                        local menu = {}
                        for _,c in ipairs(cameras) do
                            menu[#menu+1] = {
                                header = c.serial,
                                txt = "View this camera",
                                params = { event = "raven-cctv:viewCamera", args = c }
                            }
                        end
                        exports['qb-menu']:openMenu(menu)
                    end)
                end
            }
        },
        distance = 2.0
    })
end)


function TryHackCamera(serial)
    QBCore.Functions.Progressbar("hack_camera", "Hacking Camera...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        QBCore.Functions.TriggerCallback('raven-cctv:hackCamera', function(res)
            if not res then
                QBCore.Functions.Notify("Unexpected error.", "error")
                return
            end
            if res.success then
                QBCore.Functions.Notify("Camera hacked! Serial: "..serial, "success")
            else
                if res.reason == "no_tools" then
                    QBCore.Functions.Notify("Missing hacking tools.", "error")
                elseif res.reason == "failed_hack" then
                    QBCore.Functions.Notify("Hack failed. USB destroyed.", "error")
                else
                    QBCore.Functions.Notify("Hack failed.", "error")
                end
            end
        end, serial)
    end, function() 
        QBCore.Functions.Notify("Hacking cancelled.", "error")
    end)
end


RegisterNetEvent("raven-cctv:viewCamera", function(cam)
    StartCameraView(cam.coords, cam.heading)
end)


RegisterCommand("cam", function(_, args)
    local serial = args[1]
    if not serial then return QBCore.Functions.Notify("Usage: /cam <serial>", "error") end
    QBCore.Functions.TriggerCallback('raven-cctv:hasAccess', function(hasAccess)
        if hasAccess then
            for _, c in ipairs(Config.Cameras) do
                if c.serial == serial then
                    StartCameraView(c.coords, c.heading)
                    return
                end
            end
            QBCore.Functions.Notify("Invalid camera serial.", "error")
        else
            QBCore.Functions.Notify("No access to this camera.", "error")
        end
    end, serial)
end)


local activeCam = nil
function StartCameraView(coords, heading)
    if activeCam then StopCameraView() end
    DoScreenFadeOut(500)
    Wait(500)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, coords.x, coords.y, coords.z + 2.0)
    SetCamRot(cam, -15.0, 0.0, heading)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)
    activeCam = cam
    DoScreenFadeIn(500)
    QBCore.Functions.Notify("Press [BACKSPACE] or [E] to exit camera.", "primary")

    CreateThread(function()
        local startTime = GetGameTimer()
        local endTime = startTime + (Config.HackDuration * 1000)
        while activeCam do
            Wait(0)
            if IsControlJustReleased(0, 177) or IsControlJustReleased(0, 38) then
                StopCameraView()
                break
            end
            
            if IsControlPressed(0, 34) then 
                local rot = GetCamRot(activeCam, 2)
                SetCamRot(activeCam, rot.x, rot.y, rot.z + 0.5, 2)
            elseif IsControlPressed(0, 35) then 
                local rot = GetCamRot(activeCam, 2)
                SetCamRot(activeCam, rot.x, rot.y, rot.z - 0.5, 2)
            end
            
            Wait(5)
        end
    end)
end

function StopCameraView()
    if activeCam then
        RenderScriptCams(false, true, 1000, true, true)
        DestroyCam(activeCam, false)
        activeCam = nil
        DoScreenFadeIn(500)
    end
end

RegisterNetEvent("raven-cctv:viewCamera", function(c)
    if not c or not c.coords or not c.heading then
        QBCore.Functions.Notify("Invalid camera data.", "error")
        return
    end
    StartCameraView(c.coords, c.heading)
end)
