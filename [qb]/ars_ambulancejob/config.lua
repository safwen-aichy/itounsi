lib.locale()

Config                         = {}

Config.Debug                   = false

Config.ClothingScript          = 'illenium-appearance' -- 'illenium-appearance', 'fivem-appearance' ,'core' or false -- to disable
Config.EmsJobs                 = { "ambulance", "ems" }
Config.RespawnTime             = 10                    -- in minutes
Config.UseInterDistressSystem  = true
Config.WaitTimeForNewCall      = 3                     -- minutes

Config.ReviveCommand           = "revive"
Config.ReviveAreaCommand       = "revivearea"
Config.HealCommand             = "heal"
Config.HealAreaCommand         = "healarea"
Config.ReviveAllCommand        = "reviveall"

Config.AdminGroup              = "group.admin"

Config.MedicBagProp            = "xm_prop_x17_bag_med_01a"
Config.MedicBagItem            = "medicalbag"

Config.HelpCommand             = "911"
Config.RemoveItemsOnRespawn    = true

Config.BaseInjuryReward        = 0 -- changes if the injury value is higher then 1
Config.ReviveReward            = 0

Config.ParamedicTreatmentPrice = 500
Config.AllowAlways             = true
Config.RespawnMoney            = 1500     -- false if you want it to work only when there are only medics online

Config.AmbulanceStretchers     = 2           -- how many stretchers should an ambunalce have
Config.ConsumeItemPerUse       = 10          -- every time you use an item it gets used by 10%

Config.TimeToWaitForCommand    = 2           -- when player dies he needs to wait 2 minutes to do the ambulance command
Config.NpcReviveCommand        = "ambulance" -- this will work only when there are no medics online

Config.UsePedToDepositVehicle  = false       -- if false the vehicle will instantly despawns
Config.ExtraEffects            = true        -- false >> disables the screen shake and the black and white screen

Config.EmsVehicles             = {           -- vehicles that have access to the props (cones and ecc..)
	'ambulance',
	'ambulance2',
}

Config.DeathAnimations         = {
	["car"] = {
		dict = "veh@low@front_ps@idle_duck",
		clip = "sit"
	},
	["normal"] = {
		dict = "dead",
		clip = "dead_a"
	},
	["revive"] = {
		dict = "get_up@directional@movement@from_knees@action",
		clip = "getup_r_0"
	}
}


Config.Hospitals = {
	["phillbox"] = {
		paramedic = {
			model = "s_m_m_scientist_01",
			pos = vector4(-435.21, -324.19, 33.91, 157.24),
		},
		bossmenu = {
			pos = vector3(-429.63, -317.93, 34.91),
			min_grade = 5
		},
		zone = {
			pos = vec3(-444.18, -358.29, 34.5),
			size = vec3(200.0, 200.0, 200.0),
		},
		blip = {
			enable = true,
			name = 'Hospital',
			type = 61,
			scale = 1.0,
			color = 2,
			pos = vector3(-452.28, -343.94, 34.36),
		},
		respawn = {
			{
				bedPoint = vector4(-466.99, -291.4, 34.47, 203.0),
				spawnPoint = vector4(-466.06, -290.78, 34.91, 26.23)
			},
			{
				bedPoint = vector4(-463.69, -290.07, 34.47, 203.0),
				spawnPoint = vector4(-462.65, -289.49, 34.91, 21.87)
			},
			{
				bedPoint = vector4(-460.29, -288.67, 34.47, 203.0),
				spawnPoint = vector4(-459.32, -288.11, 34.91, 21.75)
			},
			{
				bedPoint = vector4(-454.92, -286.48, 34.47, 203.0),
				spawnPoint = vector4(-453.84, -286.13, 34.91, 25.47)
			},
			{
				bedPoint = vector4(-451.54, -285.08, 34.47, 203.0),
				spawnPoint = vector4(-450.59, -284.67, 34.91, 20.2)
			},
			{
				bedPoint = vector4(-448.38, -283.77, 34.47, 203.0),
				spawnPoint = vector4(-447.45, -283.33, 34.91, 25.38)
			},
			{
				bedPoint = vector4(-455.11, -278.04, 34.47, 23.0),
				spawnPoint = vector4(-456.15, -278.41, 34.92, 201.79)
			},
			{
				bedPoint = vector4(-459.0, -279.65, 34.47, 23.0),
				spawnPoint = vector4(-459.95, -280.07, 34.91, 203.95)
			},
			{
				bedPoint = vector4(-462.75, -281.23, 34.47, 23.0),
				spawnPoint = vector4(-463.7, -281.56, 34.91, 205.62)
			},
			{
				bedPoint = vector4(-466.51, -282.77, 34.48, 22.21),
				spawnPoint = vector4(-453.84, -286.13, 34.91, 25.47)
			},
			{
				bedPoint = vector4(-469.91, -284.19, 34.47, 23.0),
				spawnPoint = vector4(-470.87, -284.85, 34.91, 204.13)
			},

			-- {
			-- 	bedPoint = vector4(346.96, -590.64, 44.12, 338.0),
			-- 	spawnPoint = vector4(348.84, -583.36, 42.32, 68.24)
			-- },

		},
		stash = {
			['ems_stash_1'] = {
				slots = 50,
				weight = 50, -- kg
				min_grade = 0,
				label = 'Ems stash',
				shared = true, -- false if you want to make everyone has a personal stash
				pos = vector3(-443.92, -309.3, 35.35)
			}
		},
		clothes = {
			enable = true,
			model = 'a_f_m_bevhills_01',
			male = {
				[1] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
				[2] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
			},
			female = {
				[1] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
			},
		},
	},
	["roxwood"] = {
		paramedic = {
			model = "s_m_m_scientist_01",
			pos = vector4(-533.18, 7378.86, 11.84, 320.44),
		},
		bossmenu = {
			pos = vector3(-429.63, -317.93, 34.91),
			min_grade = 5
		},
		zone = {
			pos = vec3(-535.71, 7377.58, 12.84),
			size = vec3(200.0, 200.0, 200.0),
		},
		blip = {
			enable = true,
			name = 'Hospital',
			type = 61,
			scale = 1.0,
			color = 2,
			pos = vector3(-535.71, 7377.58, 12.84),
		},
		respawn = {
			{
				bedPoint = vector4(-555.16, 7384.84, 12.39, 145.48),
				spawnPoint = vector4(-555.98, 7385.62, 12.84, 317.84)
			},
			{
				bedPoint = vector4(-553.03, 7383.18, 12.40, 145.53),
				spawnPoint = vector4(-552.15, 7382.52, 12.84, 322.48)
			},
			{
				bedPoint = vector4(-550.88, 7381.40, 12.39, 141.91),
				spawnPoint = vector4(-550.38, 7380.26, 12.84, 319.91)
			},
			{
				bedPoint = vector4(-550.78, 7390.12, 12.39, 321.91),
				spawnPoint = vector4(-552.11, 7390.35, 12.84, 134.20)
			},
			

			-- {
			-- 	bedPoint = vector4(346.96, -590.64, 44.12, 338.0),
			-- 	spawnPoint = vector4(348.84, -583.36, 42.32, 68.24)
			-- },

		},
		stash = {
			['ems_stash_1'] = {
				slots = 50,
				weight = 50, -- kg
				min_grade = 0,
				label = 'Ems stash',
				shared = true, -- false if you want to make everyone has a personal stash
				pos = vector3(-443.92, -309.3, 35.35)
			}
		},
		clothes = {
			enable = true,
			model = 'a_f_m_bevhills_01',
			male = {
				[1] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
				[2] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
			},
			female = {
				[1] = {
					['mask_1']    = 0,
					['mask_2']    = 0,
					['arms']      = 0,
					['tshirt_1']  = 15,
					['tshirt_2']  = 0,
					['torso_1']   = 86,
					['torso_2']   = 0,
					['bproof_1']  = 0,
					['bproof_2']  = 0,
					['decals_1']  = 0,
					['decals_2']  = 0,
					['chain_1']   = 0,
					['chain_2']   = 0,
					['pants_1']   = 10,
					['pants_2']   = 2,
					['shoes_1']   = 56,
					['shoes_2']   = 0,
					['helmet_1']  = 34,
					['helmet_2']  = 0,
					['glasses_1'] = 34,
					['glasses_2'] = 1,
				},
			},
		},
	},
}


Config.BodyParts = {

	-- ["0"] = { id = "hip", label = "Damaged Hipbone", levels = { ["default"] = "Damaged", ["10"] = "Damaged x2", ["20"] = "Damaged x3", ["30"] = "Damaged x3", ["40"] = "Damaged x3", ["50"] = "Damaged x3" } },
	["0"] = { id = "hip", label = "Damaged Hipbone", levels = { ["default"] = "Damaged", ["10"] = "Damaged x2", ["20"] = "Damaged x3", ["30"] = "Damaged x3", ["40"] = "Damaged x3" } }, -- hip bone,
	["10706"] = { id = "rclavicle", label = "Right Clavicle", levels = { ["default"] = "Damaged" } },                                                                                 --right clavicle
	["64729"] = { id = "lclavicle", label = "Left Clavicle", levels = { ["default"] = "Damaged" } },                                                                                  --right clavicle
	["14201"] = { id = "lfoot", label = "Left Foot", levels = { ["default"] = "Damaged" } },                                                                                          -- left foot
	["18905"] = { id = "lhand", label = "Left Hand", levels = { ["default"] = "Damaged" } },                                                                                          -- left hand
	["24816"] = { id = "lbdy", label = "Lower chest", levels = { ["default"] = "Damaged" } },                                                                                         -- lower chest
	["24817"] = { id = "ubdy", label = "Upper Chest", levels = { ["default"] = "Damaged" } },                                                                                         -- Upper chest
	["24818"] = { id = "shoulder", label = "Shoulder", levels = { ["default"] = "Damaged" } },                                                                                        -- shoulder
	["28252"] = { id = "rforearm", label = "Right Forearm", levels = { ["default"] = "Damaged" } },                                                                                   -- right forearm
	["36864"] = { id = "rleg", label = "Right leg", levels = { ["default"] = "Damaged" } },                                                                                           -- right lef
	["39317"] = { id = "neck", label = "Neck", levels = { ["default"] = "Damaged" } },                                                                                                -- neck
	["40269"] = { id = "ruparm", label = "Right Upper Arm", levels = { ["default"] = "Damaged" } },                                                                                   -- right upper arm
	["45509"] = { id = "luparm", label = "Left Upper Arm", levels = { ["default"] = "Damaged" } },                                                                                    -- left upper arm
	["51826"] = { id = "rthigh", label = "Right Thigh", levels = { ["default"] = "Damaged" } },                                                                                       -- right thigh
	["52301"] = { id = "rfoot", label = "Right Foot", levels = { ["default"] = "Damaged" } },                                                                                         -- right foot
	["57005"] = { id = "rhand", label = "Right Hand", levels = { ["default"] = "Damaged" } },                                                                                         -- right hand
	["57597"] = { id = "5lumbar", label = "5th Lumbar vertabra", levels = { ["default"] = "Damaged" } },                                                                              --waist
	["58271"] = { id = "lthigh", label = "Left Thigh", levels = { ["default"] = "Damaged" } },                                                                                        -- left thigh
	["61163"] = { id = "lforearm", label = "Left forearm", levels = { ["default"] = "Damaged" } },                                                                                    -- left forearm
	["63931"] = { id = "lleg", label = "Left Leg", levels = { ["default"] = "Damaged" } },                                                                                            -- left leg
	["31086"] = { id = "head", label = "Head", levels = { ["default"] = "Damaged" } },                                                                                                -- head
}

function Config.SendDistressCall(msg)
	--[--] -- Quasar

	-- TriggerServerEvent('qs-smartphone:server:sendJobAlert', {message = msg, location = GetEntityCoords(PlayerPedId())}, "ambulance")


	--[--] -- GKS
	-- local myPos = GetEntityCoords(PlayerPedId())
	-- local GPS = 'GPS: ' .. myPos.x .. ', ' .. myPos.y

	-- ESX.TriggerServerCallback('gksphone:namenumber', function(Races)
	--     local name = Races[2].firstname .. ' ' .. Races[2].lastname

	--     TriggerServerEvent('gksphone:jbmessage', name, Races[1].phone_number, msg, '', GPS, "ambulance")
	-- end)
end
