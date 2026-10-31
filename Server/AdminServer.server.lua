
-- STEAL AN EGG
-- ADMIN SERVER

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(script.Parent.Config)

local remote = Instance.new("RemoteEvent")
remote.Name = "CreatorPanelCommand"
remote.Parent = ReplicatedStorage

local function isAdmin(player)
    return Config.ADMIN_USER_IDS[player.UserId] == true
end

remote.OnServerEvent:Connect(function(player, command, args)

    if not isAdmin(player) then
        warn("Unauthorized command:", player.Name)
        return
    end

    if typeof(command) ~= "string" then
        return
    end

    args = typeof(args) == "table" and args or {}

    local target

    if args.target then
        target = Players:FindFirstChild(args.target)
    end

    if command == "speed" and target then

        local humanoid = target.Character
            and target.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = math.clamp(
                tonumber(args.amount) or 16, 0, 100
            )
        end

    elseif command == "jump" and target then

        local humanoid = target.Character
            and target.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.JumpPower = math.clamp(
                tonumber(args.amount) or 50, 0, 200
            )
        end

    elseif command == "freeze" and target then

        local humanoid = target.Character
            and target.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
        end

    elseif command == "unfreeze" and target then

        local humanoid = target.Character
            and target.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end

    elseif command == "kick" and target then

        target:Kick("Removed by admin")

    elseif command == "announce" then

        if typeof(args.message) == "string" then
            ReplicatedStorage:SetAttribute(
                "Announcement",
                string.sub(args.message, 1, 180)
            )
        end
    end
end)

print("Creator Panel Admin Server Loaded!")
