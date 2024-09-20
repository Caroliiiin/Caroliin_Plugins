-- DEAKTIVIERE STEUERUNG WENN AUTO FALSCHRUM ODER IN LUFT
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
                
                if IsEntityInAir(veh) or math.abs(GetEntityRoll(veh)) > 75 then
                    local isDoorBroken = IsVehicleDoorDamaged(veh, 0)  -- 0 for driver side door
                    local isDoorFullyOpen = IsVehicleDoorFullyOpen(veh, 0)  -- 0 for driver side door

                    Citizen.CreateThread(function()
                        while DoesEntityExist(veh) and not IsEntityDead(veh) 
                              and (IsEntityInAir(veh) or math.abs(GetEntityRoll(veh)) > 75) do
                            
                            Citizen.Wait(0)
                            DisableControlAction(0, 59, true) -- leaning left/right
                            DisableControlAction(0, 60, true) -- leaning up/down
                            
                            if isDoorBroken or isDoorFullyOpen then
                                -- DisableControlAction(0, 75, false)
                            else
                                DisableControlAction(0, 75, true)
                            end
                        end
                    end)
                end
            end
        end
    end
end)


-- TÜR BENACHRICHTIGUNG-ABFRAGE WENN AUFM KOPF
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            local roll = GetEntityRoll(vehicle)
            if roll > 75.0 or roll < -75.0 then
                local isDriverDoorFullyOpen = IsVehicleDoorFullyOpen(vehicle, 0)  -- 0 für die Fahrertür
                
                local isDriverDoorBroken = IsVehicleDoorDamaged(vehicle, 0)  -- 0 für die Fahrertür
                
                if not isDriverDoorFullyOpen and not isDriverDoorBroken and IsControlJustPressed(0, 23) then

                    TriggerEvent('sc_noti:Noti', "error", "Fahrzeug zerstört", "Die Tür klemmt. Ich sollte Hilfe rufen.", 5000)
                end
            end
        end
    end
end)