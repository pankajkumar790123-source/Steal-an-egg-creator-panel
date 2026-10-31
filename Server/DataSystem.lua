
-- STEAL AN EGG
-- PLAYER DATA SYSTEM

local DataStoreService = game:GetService("DataStoreService")

local DataSystem = {}

local Store = DataStoreService:GetDataStore(
    "StealEgg_PlayerData_v1"
)

function DataSystem.SavePlayer(player)

    if not player then
        return false
    end

    local stats = player:FindFirstChild("leaderstats")
    local coins = stats and stats:FindFirstChild("Coins")

    local data = {
        Coins = coins and coins.Value or 0
    }

    local success, err = pcall(function()
        Store:SetAsync(
            "Player_" .. player.UserId,
            data
        )
    end)

    if not success then
        warn("Save failed:", err)
    end

    return success
end

function DataSystem.LoadPlayer(player)

    local success, data = pcall(function()
        return Store:GetAsync(
            "Player_" .. player.UserId
        )
    end)

    if success then
        return data
    end

    warn("Load failed:", data)
    return nil
end

return DataSystem
