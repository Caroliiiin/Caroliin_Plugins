Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        local veh = GetVehiclePedIsIn(playerPed, false)
        
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            local deluxoHash = GetHashKey("deluxo")
            
            if model ~= deluxoHash and not IsThisModelABoat(model) and not IsThisModelAHeli(model) 
                and not IsThisModelAPlane(model) and not IsThisModelABike(model) and not IsThisModelABicycle(model) then
                
                -- Überprüfen, ob das Fahrzeug in der Luft ist oder sich stark geneigt hat
                if IsEntityInAir(veh) or math.abs(GetEntityRoll(veh)) > 75 then

                    -- Erstelle neuen Thread zum Deaktivieren der Steuerung
                    Citizen.CreateThread(function()
                        while DoesEntityExist(veh) and not IsEntityDead(veh) 
                              and (IsEntityInAir(veh) or math.abs(GetEntityRoll(veh)) > 75) do
                            
                            Citizen.Wait(0)
                            DisableControlAction(0, 59, true) -- Leaning left/right deaktivieren
                            DisableControlAction(0, 60, true) -- Leaning up/down deaktivieren
                        end

                        -- Steuerung wieder aktivieren, wenn das Fahrzeug nicht mehr in der Luft oder falsch geneigt ist
                        EnableControlAction(0, 59, true) -- Leaning left/right wieder aktivieren
                        EnableControlAction(0, 60, true) -- Leaning up/down wieder aktivieren
                    end)
                end
            end
        end
    end
end)
