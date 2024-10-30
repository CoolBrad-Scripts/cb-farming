local milkedCows = {}

lib.callback.register('cb-farming:server:PickItem', function(source, item, location)
    local src = source
    if src == nil then return false end
    local coords = GetPlayerCoords(src)
    if #(coords - location) > 2.5 then return false end
    if OnCooldown(10) then
        return false
    else
        return AddItem(src, item, 1)
    end
end)

lib.callback.register('cb-farming:server:CanMilkCow', function(source)
    local time = Config.Cows.milkDuration / 1000
    local cooldown = OnCooldown(time)
    if cooldown then
        return "Cooldown"
    else
        if HasItem(source, Config.Cows.requiredItem, 1) then
            return "Allowed"
        else
            return "Missing"
        end
    end
end)

lib.callback.register('cb-farming:server:MilkCow', function(source, cow)
    local location = vector3(Config.Cows.spawnCows[cow].coords.x, Config.Cows.spawnCows[cow].coords.y, Config.Cows.spawnCows[cow].coords.z)
    local src = source
    if src == nil then return end
    local coords = GetPlayerCoords(src)
    milkedCows[cow] = true
    if #(coords - location) > 2.5 then return false end
    if Config.Cows.SkillCheck then
        local pass = lib.callback.await('cb-farming:client:MilkCowsMinigame', source)
        if pass then
            return AddItem(src, Config.Cows.milkItem, 1)
        end
    else
        return AddItem(src, Config.Cows.milkItem, 1)
    end
end)