
-- STEAL AN EGG
-- PET SYSTEM

local ServerStorage = game:GetService("ServerStorage")

local PetSystem = {}

local PetFolder = ServerStorage:WaitForChild("Pets")

function PetSystem.Spawn(petName, position, rarity)

    local pet = PetFolder:FindFirstChild(petName)

    if not pet then
        warn("Pet not found: " .. petName)
        return nil
    end

    local clone = pet:Clone()

    clone:SetAttribute("Rarity", rarity or "Normal")
    clone:SetAttribute("PetSpeed", 16)
    clone:SetAttribute("UpgradeLevel", 1)
    clone:SetAttribute("CreatorPanelPet", true)

    clone.Parent = workspace

    clone:PivotTo(CFrame.new(position))

    return clone
end

function PetSystem.RemoveLatest()

    for _, pet in ipairs(workspace:GetChildren()) do
        if pet:GetAttribute("CreatorPanelPet") then
            pet:Destroy()
            return true
        end
    end

    return false
end

function PetSystem.SetLatestSpeed(speed)

    for _, pet in ipairs(workspace:GetChildren()) do
        if pet:GetAttribute("CreatorPanelPet") then
            pet:SetAttribute("PetSpeed", speed)
        end
    end
end

function PetSystem.UpgradeLatest(level)

    for _, pet in ipairs(workspace:GetChildren()) do
        if pet:GetAttribute("CreatorPanelPet") then
            pet:SetAttribute("UpgradeLevel", level)
        end
    end
end

return PetSystem
