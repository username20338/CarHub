-- Carregar a RedzLib V5
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

-- Criar a Janela Principal do Hub
local Window = redzlib:MakeWindow({
    Title = "Blox Fruits Hub",
    SubTitle = "by Carlos",
    SaveFolder = "blox_fruits_hub.lua"
})

local player = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")

-------------------------------------------------
-- TAB 1: Auto Farm com Ultra Fast Attack
-------------------------------------------------
local Tab1 = Window:MakeTab({"Auto Farm", "sword"})

local autoFarmEnabled = false
local farmTarget = nil
local farmDistance = 50
local clickDelay = 0.05

local function ultraFastClickAttack(target)
    if target and target:FindFirstChild("ClickDetector") then
        for i = 1, 10 do
            fireclickdetector(target.ClickDetector)
            wait(clickDelay)
        end
    end
end

local function startAutoFarm()
    while autoFarmEnabled do
        wait(0.5)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            if farmTarget and farmTarget:FindFirstChild("HumanoidRootPart") then
                local distance = (farmTarget.HumanoidRootPart.Position - hrp.Position).Magnitude
                if distance <= farmDistance then
                    ultraFastClickAttack(farmTarget)
                else
                    farmTarget = nil
                end
            end

            if not farmTarget then
                for _, enemy in pairs(workspace:GetChildren()) do
                    if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                        local enemyDistance = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if enemyDistance <= farmDistance then
                            farmTarget = enemy
