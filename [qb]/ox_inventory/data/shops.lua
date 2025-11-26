return {
	General = {
		name = 'Shop',
		blip = {
			id = 59, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'sandwich', price = 10 },
			{ name = 'water', price = 10 },
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
			vec3(-1227.21, 6928.67, 20.48),
			vec3(-525.57, 7558.55, 6.54),
			vec3(-2775.39, 7035.59, 28.66),
			vec3(1781.15, 2557.74, 45.62)
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 13.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(-1226.7, 6927.57, 20.59), length = 0.6, width = 0.5, heading = 75.1, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(-526.62, 7558.64, 6.59), length = 0.6, width = 0.5, heading = 228.8, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(-2774.98, 7036.49, 28.71), length = 0.6, width = 0.5, heading = 180.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 }
		}
	},

	Liquor = {
		name = 'Liquor Store',
		blip = {
			id = 93, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'water', price = 40 },
			{ name = 'sandwich', price = 40 },
		}, locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-1393.409, -606.624, 30.319)
		}, targets = {
			{ loc = vec3(1134.9, -982.34, 46.41), length = 0.5, width = 0.5, heading = 96.0, minZ = 46.4, maxZ = 46.8, distance = 1.5 },
			{ loc = vec3(-1222.33, -907.82, 12.43), length = 0.6, width = 0.5, heading = 32.7, minZ = 12.3, maxZ = 12.7, distance = 1.5 },
			{ loc = vec3(-1486.67, -378.46, 40.26), length = 0.6, width = 0.5, heading = 133.77, minZ = 40.1, maxZ = 40.5, distance = 1.5 },
			{ loc = vec3(-2967.0, 390.9, 15.14), length = 0.7, width = 0.5, heading = 85.23, minZ = 15.0, maxZ = 15.4, distance = 1.5 },
			{ loc = vec3(1165.95, 2710.20, 38.26), length = 0.6, width = 0.5, heading = 178.84, minZ = 38.1, maxZ = 38.5, distance = 1.5 },
			{ loc = vec3(1393.0, 3605.95, 35.11), length = 0.6, width = 0.6, heading = 200.0, minZ = 35.0, maxZ = 35.4, distance = 1.5 }
		}
	},

	YouTool = {
		name = 'YouTool',
		blip = {
			id = 402, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'lockpick', price = 10 },
			{ name = 'cleaningkit', price = 10 },
			{ name = 'fitbit', price = 10 },
			{ name = 'watering_can', price = 10 },
			{ name = 'radiocell', price = 5}
		}, locations = {
			vec3(2748.0, 3473.0, 54.67)
		}, targets = {
			{
                ped = `a_m_m_farmer_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(2748.0, 3473.0, 54.67),
                heading = 244.2,
            }
		}
	},

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 40 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},
	police = {
		name = 'Police Armory',
		groups = {
			['police'] = 4
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'WEAPON_STUNGUN', price = 26 },
			{ name = 'WEAPON_NIGHTSTICK', price = 5 },
			{ name = 'WEAPON_PISTOL', price = 26 },
			{ name = 'WEAPON_CARBINERIFLE', price = 5 },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 26 },
			{ name = 'ammo-9', price = 5 },
			{ name = 'ammo-rifle', price = 26 },
			{ name = 'ammo-shotgun', price = 5 },
			{ name = 'police_stormram', price = 26 },
			{ name = 'evidence', price = 5 },
			{ name = 'fingerprintkit', price = 26 },
			{ name = 'WEAPON_FLASHLIGHT', price = 5 },
			{ name = 'handcuffs', price = 26 },
			{ name = 'heavyarmor', price = 26 },
			{ name = 'jammer', price = 20},
			{ name = 'radio', price = 23}

		}, locations = {
			vec3(564.09, 7166.69, 3.57)
		}, targets = {
			{
                ped = `ig_fbisuit_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(564.09, 7166.69, 3.57),
                heading = 42.19,
            }
		}
	},
		Farmer = {
		name = 'Farming Supplies',
		groups = {
			['farmer'] = 4
		},
		blip = {
			id = false, -- Plant/tree icon
			colour = 2, -- Green color
			scale = 0.8
		}, 
		inventory = {
			{ name = 'tomato_seed', price = 2 },
			{ name = 'potato_seed', price = 2 },
			{ name = 'wheat_seed', price = 2 },
			{ name = 'lettuce_seed', price = 2 },
			{ name = 'butcher_knife', price = 2 },
			{ name = 'grape_seed', price = 2 },
			{ name = 'barley_seed', price = 2 },
			{ name = 'bucket', price = 2 },
			{ name = 'watering_can', price = 10 }
		}, 
		locations = {
			vec3(19.8, 7861.98, 6.0)
		}, 
		targets = {
			{
                ped = `a_m_m_farmer_01`,
                scenario = 'WORLD_HUMAN_CLIPBOARD',
                loc = vec3(19.8, 7861.98, 5.5),
                heading = 226.46,
            }
		}
	},
	Brewery = {
		name = 'Farming Supplies',
		groups = {
			['brewery'] = 0
		},
		blip = {
			id = false, -- Plant/tree icon
			colour = 2, -- Green color
			scale = 0.8
		}, 
		inventory = {
			--{ name = 'tomato_seed', price = 2 },
			--{ name = 'potato_seed', price = 2 },
			-- name = 'wheat_seed', price = 2 },
			--{ name = 'lettuce_seed', price = 2 },
			--{ name = 'butcher_knife', price = 2 },
			{ name = 'grape_seed', price = 2 },
			{ name = 'barley_seed', price = 2 },
			--{ name = 'bucket', price = 2 },
			{ name = 'watering_can', price = 10 }
		}, 
		locations = {
			vec3(15.45, 7858.85, 6.0)
		}, 
		targets = {
			{
                ped = `a_m_m_farmer_01`,
                scenario = 'WORLD_HUMAN_CLIPBOARD',
                loc = vec3(15.45, 7858.85, 5.5),
                heading = 226.46,
            }
		}
	},
	firefighter = {
		name = 'Firefighter Armory',
		groups = {
			['firefighter'] = 4
		},
		blip = {
			id = 273, colour = 69, scale = 0.5
		}, inventory = {
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 26 },
			{ name = 'radio', price = 5 }

		}, locations = {
			vec3(195.95, -1646.07, 29.8)
		}, targets = {
			{
                ped = `s_m_y_fireman_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vector3(195.95, -1646.07, 28.8),
                heading = 234.94,
            }
		}
	},
	ambulance = {
		name = 'Ambulance Armory',
		groups = {
			['ambulance'] = 5
		},
		blip = {
			id = 61, colour = 2, scale = 0.5
		}, inventory = {
			{ name = 'tweezers', price = 26 },
			{ name = 'suturekit', price = 26 },
			{ name = 'icepack', price = 5 },
			{ name = 'stretcher', price = 26 },
			{ name = 'emstablet', price = 5 },
			{ name = 'radio', price = 26 }

		}, locations = {
			vec3(-501.14, -333.02, 42.32)
		}, targets = {
			{
                ped = `s_m_y_autopsy_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-501.14, -333.02, 41.32),
                heading = 182.73,
            }
		}
	},
	Digitalden = {
		name = 'Digital Den',
		blip = {
			id = 402, colour = 69, scale = 1.3
		}, inventory = {
			{ name = 'phone', price = 10 },
			{ name = 'radio', price = 10},
			{ name = 'radiocell', price = 10},
			{ name = 'boombox', price = 10},
			{ name = 'remotecontrol', price = 10}
		}, locations = {
			vec3(-2925.97, 6243.44, 9.6)
		}, targets = {
			{
                ped = `a_f_y_business_04`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(-2925.97, 6243.44, 8.6),
                heading = 238.98,
            }
		}
	},
	bio = {
		name = 'Bio Company Shop',
		groups = {
			['bio'] = 3
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'cloth', price = 5 },
			{ name = 'chemicals', price = 5 },
			{ name = 'metallic_bio_tools', price = 10 }

		}, locations = {
			vec3(428.06, 7188.20, 4.57)
		}, targets = {
			{
                ped = `mp_f_cocaine_01`,
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                loc = vec3(428.06, 7188.20, 3.57),
                heading = 308.14,
            }
		}
	},
}
