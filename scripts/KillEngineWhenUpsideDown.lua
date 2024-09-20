-- AUTO KAPUTT MACHEN WENN AUFM KOPF
local isVehicleUpsideDown = false
local lastNotificationTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        
        local playerPed = GetPlayerPed(-1)
        
        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false)
            
            if DoesEntityExist(veh) then
                local roll = math.abs(GetEntityRoll(veh))
                local height = GetEntityHeightAboveGround(veh)
                
                if roll > 75 and height < 2.0 then
                    if not isVehicleUpsideDown then
                        isVehicleUpsideDown = true
                        lastNotificationTime = GetGameTimer()
                        SetVehicleEngineHealth(veh, -4000)
                        SetVehicleEngineOn(veh, false, true, true)
                        TriggerEvent('sc_noti:Noti', "error", "Fahrzeug zerstört", "Dein Fahrzeug hat sich überschlagen und der Motor wurde dabei zerstört.", 5000)
                        Citizen.Wait(2000)
                    else
                        if GetGameTimer() - lastNotificationTime > 3000 then
                            break 
                        end
                    end
                else
                    isVehicleUpsideDown = false
                end
            end
        else
            isVehicleUpsideDown = false
        end
    end
end)