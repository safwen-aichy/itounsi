local QBCore = exports['qb-core']:GetCoreObject()
local HackedCameras = {}


QBCore.Functions.CreateCallback('raven-cctv:hackCamera', function(source, cb, serial)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then
        cb({success = false, reason = "player_not_found"})
        return
    end

    local hasLaptop = xPlayer.Functions.GetItemByName("hacking_laptop") ~= nil
    local hasUsb = xPlayer.Functions.GetItemByName("hacking_usb") ~= nil

    if not hasLaptop and not hasUsb then
        cb({success = false, reason = "no_tools"})
        return
    end

    local success = (math.random(1,100) <= (Config.HackSuccessChance or 60))

    if success then
        HackedCameras[source] = HackedCameras[source] or {}
        HackedCameras[source][serial] = true

       
        if hasUsb then
            xPlayer.Functions.RemoveItem("hacking_usb", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["hacking_usb"], "remove")
        end
        if hasLaptop then
            xPlayer.Functions.RemoveItem("hacking_laptop", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["hacking_laptop"], "remove")
        end

        
        TriggerClientEvent('qb-phone:client:sendNewMail', source, {
            sender = "CCTV System",
            subject = "Camera Hacked",
            message = "You successfully hacked camera: "..serial,
            button = {}
        })

        
        SetTimeout((Config.HackDuration or 600) * 1000, function()
            if HackedCameras[source] then
                HackedCameras[source][serial] = nil
            end
        end)

        cb({success = true})
    else
        
        if hasUsb then
            xPlayer.Functions.RemoveItem("hacking_usb", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["hacking_usb"], "remove")
        end
        cb({success = false, reason = "failed_hack"})
    end
end)


QBCore.Functions.CreateCallback('raven-cctv:hasAccess', function(source, cb, serial)
    cb(HackedCameras[source] and HackedCameras[source][serial] or false)
end)


QBCore.Functions.CreateCallback('raven-cctv:getAllCameras', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job.name == Config.PoliceJob then
        cb(Config.Cameras)
    else
        cb({})
    end
end)


AddEventHandler('playerDropped', function()
    HackedCameras[source] = nil
end)
