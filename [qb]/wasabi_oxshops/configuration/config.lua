-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for updates?
Config.DrawMarkers = true -- draw markers when nearby?

Config.Shops = {
    ['ambulance'] = { -- Job name
        label = 'Pharmacy',
        blip = {
            enabled = false,
            coords = vec3(-492.39, -340.13, 42.32),
            sprite = 51,
            color = 33,
            scale = 0.7,
            string = 'Pharmacy'
        },
        bossMenu = {
            enabled = false, -- Enable boss menu?
            coords = vec3(-597.07, -1053.40, 22.34), -- Location of boss menu
            string = '[E] - Access Boss Menu', -- Text UI label string
            range = 3.0, -- Distance to allow access/prompt with text UI
        },
        locations = {
            stash = {
                string = '[E] - Access Inventory',
                coords = vec3(-488.09, -340.66, 42.32),
                range = 1.0
            },
            shop = {
                string = '[E] - Access Shop',
                coords = vec3(-492.39, -340.13, 42.32),
                range = 1.0
            }
        }
    },
    ['farmer'] = { -- Job name
        label = 'Town Market Shop',
        blip = {
            enabled = false,
            coords = vec3(22.3, 7849.76, 6.4),
            sprite = 51,
            color = 33,
            scale = 0.7,
            string = 'Shop'
        },
        bossMenu = {
            enabled = false, -- Enable boss menu?
            coords = vec3(-597.07, -1053.40, 22.34), -- Location of boss menu
            string = '[E] - Access Boss Menu', -- Text UI label string
            range = 3.0, -- Distance to allow access/prompt with text UI
        },
        locations = {
            stash = {
                string = '[E] - Access Inventory',
                coords = vec3(19.97, 7848.13, 6.42),
                range = 1.0
            },
            shop = {
                string = '[E] - Access Shop',
                coords = vec3(22.3, 7849.76, 6.4),
                range = 1.0
            }
        }
    },
}