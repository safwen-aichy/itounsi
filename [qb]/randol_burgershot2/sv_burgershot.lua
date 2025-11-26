local Config = lib.require('config')
local BurgershotFood = {
    ['noodles-chicken'] = {
        event = 'randol_burgershot2:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-raw', amount = 1}, {ing = 'fried-chicken', amount = 1}, {ing = 'noodles', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['noodles-beef'] = {
        event = 'randol_burgershot2:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-raw', amount = 1}, {ing = 'noodles', amount = 1}, {ing = 'burger-tomato', amount = 1}, }
    },
    ['noodles-vegan'] = {
        event = 'randol_burgershot2:client:makeFood',
        remove = { {ing = 'burger-lettuce', amount = 1}, {ing = 'burger-tomato', amount = 1}, {ing = 'noodles', amount = 1}, }
    },
    ['fried-chicken'] = {
        event = 'randol_burgershot2:client:makeFries',
        remove = { {ing = 'chicken_legs', amount = 1},}
    },
    ['burger-softdrink'] = {
        event = 'randol_burgershot2:client:makeDrink',
        remove = { {ing = 'grapes', amount = 1},}
    },
    ['burger-softdrink'] = {
        event = 'randol_burgershot2:client:makeDrink',
        remove = { {ing = 'grapes', amount = 1},}
    },

}
lib.callback.register('randol_burgershot2:server:checkCuttingIngredients', function(source, recipeKey)
    local src = source
    local Player = GetPlayer(src)
    local Config = lib.require('config')
    
    if not isBurgerShot2(Player) then 
        DoNotification(src, 'You must be a Burgershot employee.', 'error')
        return false 
    end
    
    local recipe = Config.CuttingRecipes[recipeKey]
    if not recipe then return false end
    
    -- Check if player has the required raw ingredient
    if not itemCount(Player, recipe.requireItem, recipe.requireAmount) then
        DoNotification(src, 'You don\'t have '..recipe.requireAmount..'x '..recipe.requireItem, 'error')
        return false
    end
    
    return true
end)
lib.callback.register('randol_burgershot2:server:canAccessStorage', function(source)
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return false end
    
    local job = player.PlayerData.job
    return job.name == 'burgershot2' and job.grade.level >= 3
end)
lib.callback.register('randol_burgershot2:server:cutIngredients', function(source, recipeKey)
    local src = source
    local Player = GetPlayer(src)
    local Config = lib.require('config')
    
    if not isBurgerShot2(Player) then return false end
    
    local recipe = Config.CuttingRecipes[recipeKey]
    if not recipe then return false end
    
    -- Check if player has required item
    if not itemCount(Player, recipe.requireItem, recipe.requireAmount) then
        DoNotification(src, 'You don\'t have the required ingredients.', 'error')
        return false
    end
    
    -- Remove raw ingredient
    RemoveItem(Player, recipe.requireItem, recipe.requireAmount)
    
    -- Add processed ingredients
    AddItem(Player, recipe.giveItem, recipe.giveAmount)
    
    DoNotification(src, 'Successfully cut '..recipe.requireItem..' into '..recipe.giveAmount..'x '..recipe.giveItem, 'success')
    return true
end)
lib.callback.register('randol_burgershot2:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = BurgershotFood[itemName]
    if not food or not isBurgerShot2(Player) then return end

    local canMake = true
    for _, ingredient in pairs(food.remove) do
        if not itemCount(Player, ingredient.ing, ingredient.amount) then
            canMake = false
            break
        end
    end

    if not canMake then
        return DoNotification(src, 'You don\'t have all the required ingredients.', 'error')
    end

    for _, ingredient in pairs(food.remove) do
        RemoveItem(Player, ingredient.ing, ingredient.amount)
    end
    TriggerClientEvent(food.event, src)
    SetTimeout(Config.CookDuration, function() 
        AddItem(Player, itemName, 1) 
    end)
end)

-- lib.callback.register('randol_burgershot2:server:removeConsumable', function(source, item, slot)
--     local src = source
--     local Player = GetPlayer(src)
--     RemoveItemFromSlot(Player, item, 1, slot)
-- end)
