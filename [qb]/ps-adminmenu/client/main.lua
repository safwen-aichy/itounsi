QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

-- Functions
local function setupMenu()
	Wait(500)
	PlayerData = QBCore.Functions.GetPlayerData()
	local resources = lib.callback.await('ps-adminmenu:callback:GetResources', false)
	local commands = lib.callback.await('ps-adminmenu:callback:GetCommands', false)
	GetData()
	SendNUIMessage({
		action = "setupUI",
		data = {
			actions = Config.Actions,
			resources = resources,
			playerData = PlayerData,
			commands = commands
		}
	})
end

-- Event Handlers
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	setupMenu()
end)

AddEventHandler("onResourceStart", function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		setupMenu()
	end
end)

-- NUICallbacks
RegisterNUICallback("hideUI", function()
	ToggleUI(false)
end)

RegisterNUICallback("clickButton", function(data)
	local selectedData = data.selectedData
	local key = data.data
	local data = CheckDataFromKey(key)
	if not data or not CheckPerms(data.perms) then return end

	if data.type == "client" then
		TriggerEvent(data.event, key, selectedData)
	elseif data.type == "server" then
		TriggerServerEvent(data.event, key, selectedData)
	elseif data.type == "command" then
		ExecuteCommand(data.event)
	end

	Log("Action Used: " .. key,
            PlayerData.name ..
            " (" ..
            PlayerData.citizenid ..
            ") - Used: " .. key .. (selectedData and (" with args: " .. json.encode(selectedData)) or ""))
end)

-- Open UI Event
RegisterNetEvent('ps-adminmenu:client:OpenUI', function()
	ToggleUI(true)
end)

-- Close UI Event
RegisterNetEvent('ps-adminmenu:client:CloseUI', function()
	ToggleUI(false)
end)

-- Change resource state
RegisterNUICallback("setResourceState", function(data, cb)
	local resources = lib.callback.await('ps-adminmenu:callback:ChangeResourceState', false, data)
	cb(resources)
end)

-- Get players
RegisterNUICallback("getPlayers", function(data, cb)
	local players = lib.callback.await('ps-adminmenu:callback:GetPlayers', false)
	cb(players)
end)



local QBCore = exports['qb-core']:GetCoreObject()

-- /noclip command
RegisterCommand('noclip', function()
    QBCore.Functions.TriggerCallback('ps-adminmenu:server:HasPermission', function(hasPerm)
        if hasPerm then
            TriggerEvent('ps-adminmenu:client:ToggleNoClip')
        else
            QBCore.Functions.Notify('You do not have permission to use this command.', 'error')
        end
    end)
end, false)

local QBCore = exports['qb-core']:GetCoreObject()

local QBCore = exports['qb-core']:GetCoreObject()

-- /bring [id] command
RegisterCommand('bring', function(_, args)
    local targetId = tonumber(args[1])
    if not targetId then
        return QBCore.Functions.Notify('Usage: /bring [id]', 'error')
    end

    QBCore.Functions.TriggerCallback('ps-adminmenu:server:HasPermission', function(hasPerm)
        if not hasPerm then
            return QBCore.Functions.Notify('You do not have permission to use this command.', 'error')
        end

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        TriggerServerEvent('ps-adminmenu:server:ForceBring', targetId, { x = coords.x, y = coords.y, z = coords.z })
    end)
end, false)

-- receive bring request and teleport
RegisterNetEvent('ps-adminmenu:client:ForceBring', function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
end)

-- chat suggestions
TriggerEvent('chat:addSuggestion', '/bring', 'Teleport a player to your position', {
    { name = 'id', help = 'The server ID of the player you want to bring' }
})

RegisterNetEvent('custom:killPlayer', function()
    SetEntityHealth(PlayerPedId(), 0)
end)
TriggerEvent('chat:addSuggestion', '/kill', 'Kill a player instantly', {
    { name = 'id', help = 'Player ID to kill' }
})
