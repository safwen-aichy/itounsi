config = {}

-- target resource (only one of these can be true)
-------------------------------------------------------
config.qbtarget = false  
config.oxtarget = true  
-------------------------------------------------------


config.pedmodel = 'a_m_m_prolhost_01' -- ped model hash

config.scenario = 'WORLD_HUMAN_CLIPBOARD' -- scenario for ped to play, false to disable

config.locations = {
    ['central'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-727.88, -63.34, 41.75, 111.42),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['tribike3']        = {     -- vehicle model name
                price = 100,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },
             ['panto']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },

        },

        vehiclespawncoords = vector4(-727.58, -69.13, 41.75, 17.6), -- where vehicle spawns when rented

    },
    ['legion'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(204.35, -850.24, 30.63, 340.68),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['tribike3']        = {     -- vehicle model name
                price = 100,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },
             ['panto']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },

        },

        vehiclespawncoords = vector4(204.55, -847.06, 30.51, 344.05), -- where vehicle spawns when rented

    },
    ['paleto'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-34.23, 6531.96, 31.49, 24.93),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
             ['tribike3']        = {     -- vehicle model name
                price = 100,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },
             ['panto']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },

        },

        vehiclespawncoords = vector4(-36.43, 6537.51, 31.49, 139.95), -- where vehicle spawns when rented

    },
    ['RoxwoodMarina'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-283.16, 7082.18, 11.88, 334.93), 
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
             ['tribike3']        = {     -- vehicle model name
                price = 100,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },
             ['panto']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },

        },

        vehiclespawncoords = vector4(-276.56, 7085.30, 11.88, 339.89), -- where vehicle spawns when rented

    },
     ['RoxwooJuniper'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-2905.79, 6117.72, 7.09, 13.44), 
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
             ['tribike3']        = {     -- vehicle model name
                price = 100,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },
             ['panto']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = false,      -- image for menu, false for no image
            },

        },

        vehiclespawncoords = vector4(-2903.52, 6113.01, 7.09, 278.47), -- where vehicle spawns when rented

    },

    -- add as many locations as you'd like with any type of vehicle (air, water, land) follow same format as above
}

