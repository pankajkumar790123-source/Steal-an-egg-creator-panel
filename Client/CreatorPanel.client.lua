
-- STEAL AN EGG CREATOR PANEL UI

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remote = ReplicatedStorage:WaitForChild("CreatorPanelCommand")

local gui = Instance.new("ScreenGui")
gui.Name = "EggCreatorPanel"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "STEAL AN EGG"
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(100,50,180)
title.Parent = frame

local commands = {
    "Spawn Egg",
    "Spawn Pet",
    "Give Coins",
    "Walk Speed",
    "Jump Power",
    "Freeze",
    "Unfreeze",
    "Announcement"
}

for i, name in ipairs(commands) do

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 32)
    button.Position = UDim2.new(0.05, 0, 0, 50 + i * 36)
    button.Text = name
    button.TextScaled = true
    button.Parent = frame

    button.Activated:Connect(function()
        print("Selected:", name)
    end)
end

print("Creator Panel UI loaded")
