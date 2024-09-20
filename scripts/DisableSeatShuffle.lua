ESX = nil
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local seatIndex = -1  -- Index für den Fahrersitz

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, seatIndex) == 0 then
            local passengerSeatIndex = 0  -- Index für den Beifahrersitz
            if GetPedInVehicleSeat(vehicle, passengerSeatIndex) == playerPed then
                -- ESX.ShowHelpNotification('Drücke ~INPUT_CONTEXT~ um auf den Fahrersitz zu wechseln')

                if IsControlJustReleased(0, 38) then  -- 38 ist der Standardkey für E
                    TaskWarpPedIntoVehicle(playerPed, vehicle, seatIndex)
                end
            end
        end
    end
end)

--ALREADY IN ES_EXTENDED

-- local actionkey = 21 --Lshift (or whatever your sprint key is bound to)
-- local allowshuffle = false

-- -- Main loop to handle seat shuffling
-- Citizen.CreateThread(function()
    -- while true do
        -- local playerped = PlayerPedId()
        -- local currentvehicle = GetVehiclePedIsIn(playerped, false)
        
        -- if IsPedInAnyVehicle(playerped, false) then
            -- -- Check for seat shuffle prevention
            -- if allowshuffle == false then
                -- SetPedConfigFlag(playerped, 184, true)
                -- if GetIsTaskActive(playerped, 165) then
                    -- local seat = (GetPedInVehicleSeat(currentvehicle, -1) == playerped) and -1 or 0
                    -- SetPedIntoVehicle(playerped, currentvehicle, seat)
                -- end
            -- else
                -- SetPedConfigFlag(playerped, 184, false)
            -- end
        -- end

        -- -- Key press detection for seat shuffle
        -- if IsControlJustPressed(1, actionkey) then
            -- TriggerEvent("SeatShuffle")
        -- end

        -- -- Handle key release during seat shuffle
        -- if IsControlJustReleased(1, actionkey) and allowshuffle then
            -- local elapsed = 0
            -- while IsControlPressed(0, actionkey) and GetIsTaskActive(playerped, 165) do
                -- Citizen.Wait(100)
                -- elapsed = elapsed + 0.1
            -- end

            -- local threshold = 0.8
            -- if GetIsTaskActive(playerped, 165) and elapsed < threshold then
                -- allowshuffle = false
            -- end
        -- end

        -- Citizen.Wait(100)
    -- end
-- end)

-- -- Event handler for seat shuffling
-- RegisterNetEvent("SeatShuffle")
-- AddEventHandler("SeatShuffle", function()
    -- local playerped = PlayerPedId()
    -- local currentvehicle = GetVehiclePedIsIn(playerped, false)
    
    -- if IsPedInAnyVehicle(playerped, false) then
        -- local seat = (GetPedInVehicleSeat(currentvehicle, -1) == playerped) and -1 or 0
        -- if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
            -- TaskShuffleToNextVehicleSeat(playerped, currentvehicle)
        -- end

        -- allowshuffle = true
        -- while GetPedInVehicleSeat(currentvehicle, seat) == playerped do
            -- Citizen.Wait(0)
        -- end
        -- allowshuffle = false
    -- else
        -- allowshuffle = false
        -- CancelEvent('SeatShuffle')
    -- end
-- end)