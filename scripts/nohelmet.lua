Citizen.CreateThread(function()
    while true do
        local REVEL = 1000 -- Standardwert f�r die Wartezeit

        if IsPedOnAnyBike(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) or IsPedInAnyHeli(PlayerPedId()) then
            REVEL = 1
            SetPedConfigFlag(PlayerPedId(), 35, false)
        end

        Citizen.Wait(REVEL)
    end
end)
