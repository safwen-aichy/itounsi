Config = {}

Config.JobName = "firefighter"

-- Duty location
Config.Duty = vector3(197.87, -1639.56, 30.63)

-- Garage (ped + spawn)


-- Armory as shop
Config.Armory = {
    location = vector3(196.13, -1646.0, 29.8),
    label = "Firefighter Armory",
    slots = 20,
    items = {
        { name = "weapon_fireextinguisher", price = 500, amount = 5, info = {}, type = "item", slot = 1 },
        { name = "bandage", price = 50, amount = 20, info = {}, type = "item", slot = 2 },
        { name = "oxygen_mask", price = 300, amount = 5, info = {}, type = "item", slot = 3 },
    }
}

-- Personal stash
Config.Stash = vector3(217.52, -1650.93, 29.8) 
-- Boss menu
Config.BossMenu = vector3(199.23, -1659.97, 34.48)
