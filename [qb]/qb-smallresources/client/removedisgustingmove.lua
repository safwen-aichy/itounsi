CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if IsPedUsingActionMode(playerPed) then
            SetPedUsingActionMode(playerPed, false, -1, 'DEFAULT_ACTION')
        end
        Wait(0)
    end
end)