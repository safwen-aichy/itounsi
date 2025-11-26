return {
    CookDuration = 5000,
    BlipCoords = vec3(-1194.66, -894.56, 14.0),
    HungerFill = { -- How much they fill your hunger
        ['noodles-chicken'] = {emote = 'burger', amt = math.random(29, 30)},
        ['noodles-beef'] = {emote = 'burger', amt = math.random(24, 25)},
        ['noodles-vegan'] = {emote = 'burger', amt = math.random(48, 54)},
    },
    ThirstFill = { -- How much they fill your thirst.
        ['burger-softdrink'] = {emote = 'bsdrink', amt = math.random(48, 54)},
    },
    Zones = {
        { coords = vec3(-627.44, 6925.67, 24.58), radius = 0.5, icon = 'far fa-clipboard', event = 'randol_burgershot2:client:frontTray', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_4', slots = 10, weight = 75000}, 
        { coords = vec3(-626.25, 6925.72, 24.58), radius = 0.5, icon = 'far fa-clipboard', event = 'randol_burgershot2:client:sideTray', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_5', slots = 10, weight = 75000}, 
        { coords = vec3(-625.27, 6931.45, 24.17), radius = 0.7, icon = 'fa-solid fa-beer-mug-empty', event = 'randol_burgershot2:client:drinkStation', label = 'Make Drinks', job = 'burgershot2'}, 
        { coords = vec3(-623.97, 6927.93, 24.32), radius = 0.9, icon = 'fa-solid fa-burger', event = 'randol_burgershot2:client:cookBurgers', label = 'Make Meal', job = 'burgershot2' }, 
        { coords = vec3(-627.46, 6928.01, 24.32), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'randol_burgershot2:client:friesStation', label = 'Make Noodles', job = 'burgershot2' },
        { coords = vec3(-623.92, 6926.99, 24.32), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'randol_burgershot2:client:meatStation', label = 'Prepare Meat', job = 'burgershot2' },

--{ coords = vec3(-1203.54, -896.38, 13.56), radius = 0.7, icon = 'fa-solid fa-box-open', event = 'randol_burgershot2:client:ingredientStore', label = 'Ingredients', job = 'burgershot', type = 'shop' },
    --    { coords = vec3(-1194.63, -893.39, 13.95), radius = 0.5, icon = 'far fa-clipboard', event = 'randol_burgershot2:client:passThrough', label = 'Big Tray', job = 'burgershot2', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
       -- { coords = vec3(-1196.87, -892.71, 14.16), radius = 0.2, icon = 'far fa-clipboard', event = 'randol_burgershot2:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
        { coords = vec3(-627.35, 6926.77, 24.32), radius = 0.8, icon = 'fa-solid fa-kitchen-set', event = 'randol_burgershot2:client:cuttingStation', label = 'Cut Ingredients', job = 'burgershot2' },
       -- { coords = vec3(-625.45, 6929.98, 24.32), radius = 1.3, icon = 'fa-solid fa-warehouse', event = 'randol_burgershot2:client:storageInventory', label = 'Storage', job = 'burgershot2', type = 'stash', stashLabel = 'BS_Storage', slots = 50, weight = 2000000 },   
    --    { coords = vec3(-1203.19, -895.75, 14.0), radius = 1.3, icon = 'fa-solid fa-warehouse', event = 'randol_burgershot2:client:storageInventoryEmployer', label = 'Storage', job = 'burgershot', type = 'stash', stashLabel = 'employer_Storage', slots = 50, weight = 2000000 },   
    },
      CuttingRecipes = {
        ['noodles'] = {
            requireItem = 'wheat',  -- Raw item needed
            requireAmount = 2,
            giveItem = 'noodles',  -- Processed item given
            giveAmount = 1,
            duration = 5000,  -- 8 seconds
            label = 'Making Noodles'
        },
        ['burger-lettuce'] = {
            requireItem = 'lettuce',
            requireAmount = 1,
            giveItem = 'burger-lettuce',
            giveAmount = 2,
            duration = 5000,  -- 7 seconds
            label = 'Shredding Lettuce'
        },
        ['burger-tomato'] = {
            requireItem = 'tomato',
            requireAmount = 1,
            giveItem = 'burger-tomato',
            giveAmount = 2,  -- One potato makes more fries
            duration = 5000,  -- 10 seconds
            label = 'Cutting Tomatoes'
        },
        ['burger-raw'] = {  -- ✅ ADD THIS RECIPE
            requireItem = 'raw_meat',  -- Raw meat item name
            requireAmount = 1,
            giveItem = 'burger-raw',  -- Output raw patties
            giveAmount = 2,
            duration = 5000,  -- 12 seconds
            label = 'Preparing Beef'
        },
        ['chicken_legs'] = {  -- ✅ ADD THIS RECIPE
            requireItem = 'chicken_raw',  -- Raw meat item name
            requireAmount = 1,
            giveItem = 'chicken_legs',  -- Output raw patties
            giveAmount = 2,
            duration = 5000,  -- 12 seconds
            label = 'Cut Chicken'
        }
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 5,
        items = {
            -- [1] = { name = 'burger-bun', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            -- [2] = { name = 'burger-raw', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            -- [3] = { name = 'burger-tomato', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            -- [4] = { name = 'burger-lettuce', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            -- [5] = { name = 'burger-potato', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            -- [6] = { name = 'burger-mshakeformula', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            -- [7] = { name = 'burger-sodasyrup', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            -- [1] = { name = 'chicken_legs', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            -- [2] = { name = 'tomato', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            -- [3] = { name = 'lettuce', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            -- [4] = { name = 'potato', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            -- [5] = { name = 'bread', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
        }
    },
    Emotes = {
        burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}