QBCore = GetResourceState('qb-core'):find('start') and exports['qb-core']:GetCoreObject() or nil
if not QBCore then return end

local player = {}

function removeAccountMoney(target, account, amount)
    local xPlayer = QBCore.Functions.GetPlayer(target)
    if not xPlayer then return end
    xPlayer.Functions.RemoveMoney(account, amount)
end

function hasJob(target, jobs)
    local xPlayer = QBCore.Functions.GetPlayer(target)
    if not xPlayer then return false end

    if type(jobs) == "table" then
        for _, jobName in pairs(jobs) do
            if xPlayer.PlayerData.job.name == jobName then 
                return true 
            end
        end
    else
        return xPlayer.PlayerData.job.name == jobs
    end
    return false
end

function playerJob(target)
    local xPlayer = QBCore.Functions.GetPlayer(target)
    if not xPlayer then return nil end
    return xPlayer.PlayerData.job.name
end

function updateStatus(data)
    local Player = QBCore.Functions.GetPlayer(data.target)
    if not Player then return end

    Player.Functions.SetMetaData("isdead", data.status)

    if not player[data.target] then
        player[data.target] = {}
    end

    player[data.target].isDead = data.status
    if data.status then
        player[data.target].killedBy = data.killedBy
    end
end

function getPlayerName(target)
    local xPlayer = QBCore.Functions.GetPlayer(target)
    if not xPlayer then return "Unknown" end
    return xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
end

function getDeathStatus(target)
    local Player = QBCore.Functions.GetPlayer(target)
    if not Player then return { isDead = false } end
    return { isDead = Player.PlayerData.metadata['isdead'] }
end

QBCore.Functions.CreateUseableItem(Config.MedicBagItem, function(source, item)
    if not hasJob(source, Config.EmsJobs) then return end
    TriggerClientEvent("ars_ambulancejob:placeMedicalBag", source)
end)
