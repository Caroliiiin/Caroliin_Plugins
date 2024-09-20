Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Überprüfung alle 500 Millisekunden, um die Leistung zu schonen
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            while IsPedArmed(ped, 6) do
                Citizen.Wait(0)
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end
        end
    end
end)