local jumpCount = 0
local jumpResetTime = 10
local lastJumpTime = 0

CreateThread(function()
    while true do
        Wait(0)  -- This ensures the script runs constantly

        if IsPedJumping(PlayerPedId()) then
            local currentTime = GetGameTimer()

            if currentTime - lastJumpTime <= jumpResetTime * 1000 then
                jumpCount = jumpCount + 1
            else
                jumpCount = 1
            end

            lastJumpTime = currentTime

            if jumpCount >= math.random(3,7) then
				Wait (300)
                SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
                jumpCount = 0
            end

            -- To prevent multiple counts for one jump, wait until the jump action is finished
            while IsPedJumping(PlayerPedId()) do
                Wait(0)
            end
        end
    end
end)