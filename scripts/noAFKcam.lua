Citizen.CreateThread(function()
    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
        Wait(1000) -- Warten Sie 1 Sekunde (1000 Millisekunden), bevor Sie die Funktionen erneut aufrufen
    end
end)

Citizen.CreateThread(function() 
    while true do
        N_0xf4f2c0d4ee209e20() 
        Wait(1000) -- Warten Sie 1 Sekunde (1000 Millisekunden), bevor Sie die Funktionen erneut aufrufen
    end
end)
