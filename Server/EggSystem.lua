
-- STEAL AN EGG
-- EGG SYSTEM

local ServerStorage = game:GetService("ServerStorage")

local EggSystem = {}

local EggFolder = ServerStorage:WaitForChild("Eggs")

function EggSystem.Spawn(eggName, position, variant)

    local egg = EggFolder:FindFirstChild(eggName)

    if not egg then
        warn("Egg not found: " .. eggName)
        return nil
    end

    local clone = egg:Clone()

    clone:SetAttribute("Variant", variant or "Normal")
    clone:SetAttribute("CreatorPanelEgg", true)

    clone.Parent = workspace

    clone:PivotTo(CFrame.new(position))

    return clone
end

function EggSystem.RemoveLatest()

    for _, egg in ipairs(workspace:GetChildren()) do
        if egg:GetAttribute("CreatorPanelEgg") then
            egg:Destroy()
            return true
        end
    end

    return false
end

function EggSystem.SetLuck(amount)

    amount = math.clamp(amount, 1, 100)

    workspace:SetAttribute("EggLuck", amount)

end

return EggSystem
