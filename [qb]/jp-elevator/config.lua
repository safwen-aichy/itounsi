config = {
    screenFade = true,  -- Set to false to disable the fade in / fade out option
    sound = true, -- Set to false to disable the sound
    fadeDuration = 500, -- Set the time it takes for the fade to complete in ms
    interact = "ox_target", -- Set the target system (ox_target or sleepless_interact)
    targetLabel = "Use elevator",

    elevators = {
        {
            name = "Medical Department", -- Header of the ox_lib UI
            id = "medical_department",
            floors = {
                {
                    label = "Eighth Floor", -- The Button label, in this case the floor name
                    description = "Management & Conference Rooms", -- The Button Description, in this case "main entrance"
                    coords = vector4(-1829.3250, -336.9168, 84.0602, 143.8193), -- The coords that the Player will be teleported to
                    interaction = vector3(-1827.6355, -336.3678, 84.059) -- the coords at which the ox_target interaction will be at
                },
                {
                    label = "Second Floor",
                    description = "Helipad & Offices",
                    coords = vector4(-1835.7006, -339.2256, 58.1577, 142.9318),
                    interaction = vector3(-1834.0868, -338.9583, 58.1577) 
                },
                {
                    label = "First Floor",
                    description = "Treatment Rooms",
                    coords = vector4(-1836.7583, -336.9813, 53.7801, 140.1876),
                    interaction = vector3(-1835.0479, -336.8818, 53.7801) 
                },
                {
                    label = "Ground Floor",
                    description = "Main Entrance",
                    coords = vector4(-1843.4381, -342.1761, 49.4526, 140.3787),
                    interaction = vector3(-1841.7339, -341.6407, 49.4529)
                },
            }
        },
        {
            name = "OOC Building",
            id = "ooc_building",
            floors = {
                {
                    label = "Roof",
                    description = "High above the clouds",
                    coords = vector4(261.0066, -1005.0707, 61.6350, 162.2192),
                    interaction = vec3(261.33670043945,-1004.6335449219,61.713207244873)
                },
                {
                    label = "Entrance",
                    description = "Main Entrance Legion Square",
                    coords = vector4(254.4322, -1013.0776, 29.2696, 75.4000),
                    interaction = vec3(255.7276763916,-1013.4527587891,29.668151855469)
                },
                
            }
        },
        {
            name = "LSPD",
            id = "lspd_building",
            floors = {
                {
                    label = "Main Floor",
                    description = "Main Floor",
                    coords = vector4(524.63, -21.06, 82.74, 329.89),
                    interaction = vec3(523.80, -20.28, 82.74)
                },
                {
                    label = "Garage",
                    description = "Garage",
                    coords = vector4(511.51, 24.25, 69.51, 121.14),
                    interaction = vec3(510.98, 25.12, 69.51)
                },
                {
                    label = "Roof",
                    description = "Roof",
                    coords = vector4(565.58, 4.87, 103.23, 275.17),
                    interaction = vec3(565.60, 6.15, 103.23)
                },
            }
        }
    }
}

return config
