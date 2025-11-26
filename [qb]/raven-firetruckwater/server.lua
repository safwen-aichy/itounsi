local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('raven-firetruckwater:server:LogRefill', function(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        print(("[FIRETRUCK] %s (%s) refilled the firetruck water tank."):format(Player.PlayerData.name, Player.PlayerData.citizenid))
    end
end)
