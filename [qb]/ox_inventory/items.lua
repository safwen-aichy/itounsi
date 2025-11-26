{
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},
	

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500
		}
	},
	['clerk_tablet'] = {
    	label = 'Clerk Tablet',
    	weight = 10,
    	stack = true
	},
	['vehicle_sale_agreement'] = {
    	label = 'Sale Agreement',
    	weight = 4,
    	stack = true
	},
	['signed_vehicle_sale_agreement'] = {
    	label = 'Signed Sale Agreement',
    	weight = 4,
    	stack = false
	},
	['empty_invoice'] = {
    	label = 'Empty Invoice',
    	weight = 3,
    	stack = true
	},
	['invoice'] = {
    	label = 'Invoice',
    	weight = 4,
    	stack = false
	},
	['empty_ticket'] = {
    	label = 'Empty Ticket',
    	weight = 2,
    	stack = true
	},
	['ticket'] = {
    	label = 'Ticket',
    	weight = 3,
    	stack = false
	},
	['payment_terminal'] = {
    	label = 'Payment Terminal',
    	weight = 10,
    	stack = false
	},
	['thermal_paper'] = {
    	label = 'Thermal Paper',
    	weight = 1,
    	stack = false
	},
	['receipt'] = {
    	label = 'Receipt',
    	weight = 1,
    	stack = false
	},

	['house_key'] = {
    	label = 'Housing Key',
    	weight = 10,
    	stack = false,
    	close = true
	},
	['lockpick'] = {
    	label = 'Lockpick',
    	weight = 800,
    	stack = true,
    	close = true
	},
	['police_barrier'] = {
    	label = 'Police Barrier',
    	weight = 300,
    	stack = true,
    	close = true
	},
	['police_stormram'] = {
    	label = 'Police Storm Ram',
    	weight = 5000,
    	stack = true,
    	close = true
	},






	['black_money'] = {
		label = 'Dirty Money'
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		}
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["canofcorn"] = {
		label = "Can Of Corn",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "canofcorn.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["corn_seed"] = {
		label = "Corn Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corn_seed.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["mining_ironfragment"] = {
		label = "Iron Fragment",
		weight = 500,
		stack = true,
		close = true,
		description = "Iron fragment from mining",
		client = {
			image = "mining_ironfragment.png",
		}
	},

	["carrot"] = {
		label = "Carrot",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "carrot.png",
		}
	},

	["grapejuice6"] = {
		label = "Grape Juice 6PK",
		weight = 1800,
		stack = true,
		close = false,
		description = "Case of six bottles of grape juice",
		client = {
			image = "box.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["corncob"] = {
		label = "Corn Cob",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corncob.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["raw_beef"] = {
		label = "Raw Beef",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_beef.png",
		}
	},

	["farm_potato"] = {
		label = "Potato",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_potato.png",
		}
	},

	["pickle_raw"] = {
		label = "Pickle Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pickle_raw.png",
		}
	},

	["sheep_wool"] = {
		label = "Sheep Wool",
		weight = 300,
		stack = true,
		close = true,
		description = "Fresh wool from a sheep",
		client = {
			image = "sheep_wool.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["processed_deer_meat"] = {
		label = "Processed Venison",
		weight = 300,
		stack = true,
		close = true,
		description = "Quality processed venison, ready for cooking",
		client = {
			image = "processed_deer_meat.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["finescale"] = {
		label = "finescale",
		weight = 500,
		stack = true,
		close = false,
		description = "Small scale for precise weighing.",
		client = {
			image = "finescale.png",
		}
	},

	["joint"] = {
		label = "Joint",
		weight = 300,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you",
		client = {
			image = "joint.png",
		}
	},

	["tomato"] = {
		label = "Tomato",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["mining_goldnugget"] = {
		label = "Golden Nugget",
		weight = 500,
		stack = true,
		close = true,
		description = "Golden nugget from mining",
		client = {
			image = "mining_goldnugget.png",
		}
	},

	["ground_meat"] = {
		label = "Ground Meat",
		weight = 300,
		stack = true,
		close = true,
		description = "Freshly ground meat",
		client = {
			image = "ground_meat.png",
		}
	},

	["farm_coffee_seeds"] = {
		label = "Coffee Seeds",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_coffee_seeds.png",
		}
	},

	["raw_ham"] = {
		label = "Raw Ham",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_ham.png",
		}
	},

	["cocaine_seed"] = {
		label = "Cocaine Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cocaine_seed.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["processed_pig_meat"] = {
		label = "Processed Pork",
		weight = 350,
		stack = true,
		close = true,
		description = "Quality processed pork, ready for cooking",
		client = {
			image = "processed_pig_meat.png",
		}
	},

	["mining_pickaxe"] = {
		label = "Mining Pickaxe",
		weight = 500,
		stack = false,
		close = true,
		decay = true, degrade = 560,
		description = "Classic's pickaxe for mining",
		client = {
			image = "mining_pickaxe.png",
		}
	},

	["coca_leaf"] = {
		label = "coca_leaf",
		weight = 150,
		stack = true,
		close = true,
		description = "Cocaine leaf used to process some cool stuff",
		client = {
			image = "cocaleaf.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["vacuum_sealer"] = {
		label = "Vacuum Sealer",
		weight = 1000,
		stack = true,
		close = true,
		description = "Machine for vacuum sealing meat packages",
		client = {
			image = "vacuum_sealer.png",
		}
	},

	["lamb_rack"] = {
		label = "Lamb Rack",
		weight = 320,
		stack = true,
		close = true,
		description = "Premium lamb rack",
		client = {
			image = "lamb_rack.png",
		}
	},

	["weed"] = {
		label = "Weed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed.png",
		}
	},

	["cocaine_raw"] = {
		label = "Cocaine Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cocaine_raw.png",
		}
	},

	["butcher_knife"] = {
		label = "Butcher Knife",
		weight = 150,
		stack = true,
		close = true,
		description = "Professional knife for butchering animals",
		client = {
			image = "butcher_knife.png",
		}
	},

	["metal"] = {
		label = "Metal",
		weight = 1,
		stack = true,
		close = true,
		description = "Metal",
		client = {
			image = "metal.png",
		}
	},

	["hydrochloric_acid"] = {
		label = "Hydrochloric Acid",
		weight = 1500,
		stack = true,
		close = true,
		description = "Chemicals, handle with care!",
		client = {
			image = "hydrochloric_acid.png",
		}
	},

	["farm_oranges"] = {
		label = "Oranges",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_oranges.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = true,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["tomato_raw"] = {
		label = "Tomato Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato_raw.png",
		}
	},

	["mining_pan"] = {
		label = "Washing Pan",
		weight = 500,
		stack = false,
		close = true,
		description = "Classic's washing pan",
		client = {
			image = "mining_pan.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["farm_apples"] = {
		label = "Apples",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_apples.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["lsa"] = {
		label = "LSA",
		weight = 500,
		stack = true,
		close = false,
		description = "Almost ready to party...",
		client = {
			image = "lsa.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["mining_ironbar"] = {
		label = "Iron Bar",
		weight = 500,
		stack = true,
		close = true,
		description = "Iron Bar",
		client = {
			image = "mining_ironbar.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["emsbag"] = {
		label = "emsbag",
		weight = 150,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emsbag.png",
		}
	},

	["garden_pitcher"] = {
		label = "Garden Pitcher",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "garden_pitcher.png",
		}
	},

	["potato"] = {
		label = "Potato",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "potato.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["healing_pill_lv2"] = {
		label = "Healing Pill (Level 2)",
		weight = 100,
		stack = true,
		close = true,
		description = "Restores a little health and armor",
		client = {
			image = "healing_pill_lv2.png",
		}
	},

	["heroin_seed"] = {
		label = "Heroin Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "heroin_seed.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 500,
		stack = false,
		close = true,
		description = "News Camera | Property of Weazel News",
		client = {
			image = "newscam.png",
		}
	},

	["wheat_seed"] = {
		label = "Wheat Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "wheat_seed.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["hunting_license"] = {
		label = "Hunting License",
		weight = 0,
		stack = false,
		close = true,
		description = "Hunting License",
		client = {
			image = "hunting_license.png",
		}
	},

	["wet_weed"] = {
		label = "Moist Weed",
		weight = 3000,
		stack = true,
		close = false,
		description = "Wet weed that needs to be treated!",
		client = {
			image = "wet_weed.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visacard.png",
		}
	},

	["raw_cow_meat"] = {
		label = "Raw Cow Meat",
		weight = 500,
		stack = true,
		close = true,
		description = "Fresh raw meat from a cow, needs processing",
		client = {
			image = "raw_cow_meat.png",
		}
	},

	["pig_leather"] = {
		label = "Pig Skin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pig_leather.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["pickle"] = {
		label = "Pickle",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pickle.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["hunting_knife"] = {
		label = "Hunting Knife",
		weight = 120,
		stack = true,
		close = true,
		description = "Sharp knife for hunting and field dressing",
		client = {
			image = "hunting_knife.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["wheat_raw"] = {
		label = "Wheat Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "wheat_raw.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["tomato_seed"] = {
		label = "Tomato Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomato_seed.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["carrot_raw"] = {
		label = "Carrot Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "carrot_raw.png",
		}
	},

	["sodium_hydroxide"] = {
		label = "Sodium Hydroxide",
		weight = 1500,
		stack = true,
		close = true,
		description = "Chemicals, handle with care!",
		client = {
			image = "sodium_hydroxide.png",
		}
	},

	["beef_steak"] = {
		label = "Beef Steak",
		weight = 350,
		stack = true,
		close = true,
		description = "Premium cut of beef steak",
		client = {
			image = "beef_steak.png",
		}
	},

	["farm_milk"] = {
		label = "Milk",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_milk.png",
		}
	},

	["mining_stone"] = {
		label = "Mined Stone",
		weight = 500,
		stack = true,
		close = true,
		description = "Mined Stone",
		client = {
			image = "mining_stone.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["newstape"] = {
		label = "Video Tape",
		weight = 100,
		stack = false,
		close = true,
		description = "Empty Video Tape",
		client = {
			image = "videotape.png",
		}
	},

	["riot_shield"] = {
		label = "Riot Shield",
		weight = 5000,
		stack = false,
		close = true,
		description = "Protective police riot shield.",
		client = {
			image = "riot_shield.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["wine24"] = {
		label = "Wine 24PK",
		weight = 7200,
		stack = true,
		close = false,
		description = "Heavy box of 24 fresh wine",
		client = {
			image = "pallet-of-boxes.png",
		}
	},

	["raw_deer_meat"] = {
		label = "Raw Deer Meat",
		weight = 350,
		stack = true,
		close = true,
		description = "Fresh raw meat from a deer, needs processing",
		client = {
			image = "raw_deer_meat.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["broken_pills"] = {
		label = "Broken Pills",
		weight = 100,
		stack = true,
		close = true,
		description = "Crushed or broken pills, used to make street mixes.",
		client = {
			image = "broken_pills.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["mining_copperfragment"] = {
		label = "Copper Fragment",
		weight = 500,
		stack = true,
		close = true,
		description = "Copper fragment from mining",
		client = {
			image = "mining_copperfragment.png",
		}
	},

	["pumpkinpiebox"] = {
		label = "Box of Pie",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pumpkinpiebox.png",
		}
	},

	["thionyl_chloride"] = {
		label = "Thionyl Chloride",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "thionyl_chloride.png",
		}
	},

	["farm_juice_apple"] = {
		label = "Apple Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_juice_apple.png",
		}
	},

	["cleaver"] = {
		label = "Cleaver",
		weight = 200,
		stack = true,
		close = true,
		description = "Heavy knife for chopping meat",
		client = {
			image = "cleaver.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 500,
		stack = true,
		close = false,
		description = "Really addictive stimulant...",
		client = {
			image = "meth.png",
		}
	},

	["sausages"] = {
		label = "Sausages",
		weight = 250,
		stack = true,
		close = true,
		description = "Freshly made sausages",
		client = {
			image = "sausages.png",
		}
	},

	["cooked_ham"] = {
		label = "Cooked Ham",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_ham.png",
		}
	},

	["farm_strawberries"] = {
		label = "Strawberries",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_strawberries.png",
		}
	},

	["broccoli_raw"] = {
		label = "Broccoli Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "broccoli_raw.png",
		}
	},

	["slicedpie"] = {
		label = "Slice of Pie",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "slicedpie.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["wine6"] = {
		label = "Wine 6PK",
		weight = 1800,
		stack = true,
		close = false,
		description = "Six pack of fresh wine",
		client = {
			image = "box.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["rope"] = {
		label = "Rope",
		weight = 1,
		stack = true,
		close = true,
		description = "Rope",
		client = {
			image = "rope.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["wheat"] = {
		label = "Wheat",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "wheat.png",
		}
	},

	["processed_sheep_meat"] = {
		label = "Processed Lamb",
		weight = 350,
		stack = true,
		close = true,
		description = "Quality processed lamb, ready for cooking",
		client = {
			image = "processed_sheep_meat.png",
		}
	},

	["soybeans"] = {
		label = "Soy Beans",
		weight = 10,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "soybeans.png",
		}
	},

	["gasmask"] = {
		label = "Gas Mask",
		weight = 900,
		stack = false,
		close = false,
		description = "Gas Mask yetlbes",
		client = {
			image = "gasmask.png",
		}
	},

	["farm_potato_seeds"] = {
		label = "Potato Seeds",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_potato_seeds.png",
		}
	},

	["corn_raw"] = {
		label = "Raw Corn",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corn_raw.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["hotsauce"] = {
		label = "Hot Sauce",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hotsauce.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["milkbucket"] = {
		label = "Milk Bucket",
		weight = 75,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milkbucket.png",
		}
	},

	["methkey"] = {
		label = "Key A",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with \"Walter\" Engraved on the Back...",
		client = {
			image = "keya.png",
		}
	},

	["raw_pork"] = {
		label = "Raw Pork",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_pork.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "twerks_candy.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		client = {
			image = "diving_tube.png",
		}
	},

	["pickle_seed"] = {
		label = "Pickle Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pickle_seed.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 100,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["raw_pig_meat"] = {
		label = "Raw Pig Meat",
		weight = 450,
		stack = true,
		close = true,
		description = "Fresh raw meat from a pig, needs processing",
		client = {
			image = "raw_pig_meat.png",
		}
	},

	["meat_package"] = {
		label = "Meat Packaging",
		weight = 50,
		stack = true,
		close = true,
		description = "Packaging materials for meat",
		client = {
			image = "meat_package.png",
		}
	},

	["watering_can"] = {
		label = "Watering Can",
		weight = 25,
		stack = false,
		close = true,
		description = "watering can",
		client = {
			image = "watering_can_full.png",
		}
	},

	["coke"] = {
		label = "coke",
		weight = 300,
		stack = true,
		close = true,
		description = "Ahhh this what a good leaf gives you",
		client = {
			image = "coke.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "grapejuice.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["sulfuric_acid"] = {
		label = "Sulfuric Acid",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "sulfuric_acid.png",
		}
	},

	["chillypepper"] = {
		label = "Chilly Pepper",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "chillypepper.png",
		}
	},

	["beef"] = {
		label = "Beef",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "beef.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = true,
		close = true,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["apple_juice"] = {
		label = "Apple Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple_juice.png",
		}
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
		description = "Wood",
		client = {
			image = "wood.png",
		}
	},

	["farming_hoe"] = {
		label = "Hoe.",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farming_hoe.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["potato_seed"] = {
		label = "Potato Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "potato_seed.png",
		}
	},

	["farm_wheat"] = {
		label = "wheat",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_coffee.png",
		}
	},

	["chemicalvapor"] = {
		label = "Chemical Vapors",
		weight = 1500,
		stack = true,
		close = false,
		description = "High Pressure Chemical Vapors, Explosive!",
		client = {
			image = "chemicalvapor.png",
		}
	},

	["venison_steak"] = {
		label = "Venison Steak",
		weight = 280,
		stack = true,
		close = true,
		description = "Lean venison steak",
		client = {
			image = "venison_steak.png",
		}
	},

	["processed_cow_meat"] = {
		label = "Processed Cow Meat",
		weight = 400,
		stack = true,
		close = true,
		description = "Quality processed beef, ready for cooking",
		client = {
			image = "processed_cow_meat.png",
		}
	},

	["broccoli"] = {
		label = "Broccoli",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "broccoli.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["alive_chicken"] = {
		label = "Alive chicken",
		weight = 2000,
		stack = true,
		close = false,
		description = "Alive Chicken",
		client = {
			image = "alive_chicken.png",
		}
	},

	["poppyresin"] = {
		label = "Poppy resin",
		weight = 2000,
		stack = true,
		close = false,
		description = "It sticks to your fingers when you handle it.",
		client = {
			image = "poppyresin.png",
		}
	},

	["raw_sausage"] = {
		label = "Raw Sausage",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_sausage.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 1000,
		stack = false,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["mining_copperbar"] = {
		label = "Copper Bar",
		weight = 500,
		stack = true,
		close = true,
		description = "Copper Bar",
		client = {
			image = "mining_copperbar.png",
		}
	},

	["heroin"] = {
		label = "Heroin",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "heroin.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["cocaine"] = {
		label = "Cocaine",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cocaine.png",
		}
	},

	["tomatopaste"] = {
		label = "tomato Paste",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "tomatopaste.png",
		}
	},

	["chemicals"] = {
		label = "Chemicals",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care...",
		client = {
			image = "chemicals.png",
		}
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 500,
		stack = true,
		close = true,
		description = "Some fine smelling buds.",
		client = {
			image = "marijuana.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 1000,
		stack = false,
		close = true,
		description = "News Microphone | Property of Weazel News",
		client = {
			image = "newsmic.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["weed_seed"] = {
		label = "Weed Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["greenpepper"] = {
		label = "Green Pepper",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "greenpepper.png",
		}
	},

	["remotecontrol"] = {
		label = "Remote control",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh, will you watch tv?",
		client = {
			image = "remotecontrol.png",
		}
	},

	["grapes"] = {
		label = "Grapes",
		weight = 15,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "grapes.png",
		}
	},

	["packagedchicken"] = {
		label = "Packaged chicken",
		weight = 2000,
		stack = true,
		close = false,
		description = "Packaged Chicken",
		client = {
			image = "packaged_chicken.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["deer_antlers"] = {
		label = "Deer Antlers",
		weight = 200,
		stack = true,
		close = true,
		description = "Antlers from a deer",
		client = {
			image = "deer_antlers.png",
		}
	},

	["sheriff_badge"] = {
		label = "Sheriff Badge",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "sheriff_badge.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["cooked_sausage"] = {
		label = "Cooked Sausage",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_sausage.png",
		}
	},

	["broccoli_seed"] = {
		label = "Broccoli Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "broccoli_seed.png",
		}
	},

	["mining_washedstone"] = {
		label = "Washed Stone",
		weight = 500,
		stack = true,
		close = true,
		description = "Wasted Stone",
		client = {
			image = "mining_washedstone.png",
		}
	},

	["corn"] = {
		label = "Corn",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "corn.png",
		}
	},

	["shovel"] = {
		label = "Shovel",
		weight = 1,
		stack = true,
		close = true,
		description = "Shovel",
		client = {
			image = "shovel.png",
		}
	},

	["cokebaggy"] = {
		label = "Coke Baggy",
		weight = 250,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Empty evidence bag to put evidence in.",
		client = {
			image = "evidence.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["cow_hide"] = {
		label = "Cow Hide",
		weight = 700,
		stack = true,
		close = true,
		description = "Tanned hide from a cow",
		client = {
			image = "cow_hide.png",
		}
	},

	["garden_shovel"] = {
		label = "Garden Shovel",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "garden_shovel.png",
		}
	},

	["cooked_pork"] = {
		label = "Cooked Pork",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_pork.png",
		}
	},

	["weed_og-kush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["liquidmix"] = {
		label = "Liquid Chem Mix",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "liquidmix.png",
		}
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 2000,
		stack = true,
		close = false,
		description = "Slaughtered Chicken",
		client = {
			image = "slaughteredchicken.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["cooked_bacon"] = {
		label = "Cooked Bacon",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cooked_bacon.png",
		}
	},

	["hacking_usb"] = {
		label = "Hacking Usb",
		weight = 10,
		stack = true,
		close = true,
		description = "Laptop used for hacking",
		client = {
			image = "usb.png",
		}
	},

	["fenta syrup"] = {
		label = "fenta syrup",
		weight = 100,
		stack = true,
		close = true,
		description = "fenta syrup",
		client = {
			image = "fenta_syrup.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["fib_badge"] = {
		label = "FIB Badge",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "fib_badge.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["emptycowbucket"] = {
		label = "Empty Bucket",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emptybucket.png",
		}
	},

	["hacking_laptop"] = {
		label = "Hacking Laptop",
		weight = 10,
		stack = true,
		close = true,
		description = "Laptop used for hacking",
		client = {
			image = "laptop.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["10kgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["dashcam"] = {
		label = "Dashcam",
		weight = 500,
		stack = false,
		close = true,
		description = "Dashcam for authorized vehicle only",
		client = {
			image = "dashcam.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["heroin_raw"] = {
		label = "Heroin Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "heroin_raw.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["farm_juice_orange"] = {
		label = "Orange Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_juice_orange.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["pork_chops"] = {
		label = "Pork Chops",
		weight = 300,
		stack = true,
		close = true,
		description = "Fresh pork chops",
		client = {
			image = "pork_chops.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["lsd"] = {
		label = "LSD",
		weight = 500,
		stack = true,
		close = false,
		description = "Lets get this party started!",
		client = {
			image = "lsd.png",
		}
	},

	["bodycam"] = {
		label = "Bodycam",
		weight = 500,
		stack = false,
		close = true,
		description = "Bodycam for authorized personnel only",
		client = {
			image = "bodycam.png",
		}
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 2500,
		stack = true,
		close = true,
		description = "Uncured cannabis",
		client = {
			image = "cannabis.png",
		}
	},

	["raw_sheep_meat"] = {
		label = "Raw Sheep Meat",
		weight = 400,
		stack = true,
		close = true,
		description = "Fresh raw meat from a sheep, needs processing",
		client = {
			image = "raw_sheep_meat.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["rawpumpkin"] = {
		label = "Raw Pumpkin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_pumpkin.png",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["police_badge"] = {
		label = "Police Badge",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "police_badge.png",
		}
	},

	["raw_bacon"] = {
		label = "Raw Bacon",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "raw_bacon.png",
		}
	},

	["potato_raw"] = {
		label = "Potato Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "potato_raw.png",
		}
	},

	["grapejuice24"] = {
		label = "Grape Juice 24PK",
		weight = 7200,
		stack = true,
		close = false,
		description = "Crate of 24 bottles of grape juice",
		client = {
			image = "pallet-of-boxes.png",
		}
	},

	["apple"] = {
		label = "Apple",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "apple.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["healing_pill_lv3"] = {
		label = "Healing Pill (Level 3)",
		weight = 100,
		stack = true,
		close = true,
		description = "Restores a little health and armor",
		client = {
			image = "healing_pill_lv3.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "id_card.png",
		}
	},

	["raw_wild_meat"] = {
		label = "Raw Wild Meat",
		weight = 300,
		stack = true,
		close = true,
		description = "Fresh raw meat from wild animals, needs processing",
		client = {
			image = "raw_wild_meat.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["wine12"] = {
		label = "Wine 12PK",
		weight = 3600,
		stack = true,
		close = false,
		description = "Large Case of 12 fresh wine",
		client = {
			image = "shipping-crate.png",
		}
	},

	["cow_leather"] = {
		label = "Cow Skin",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cow_leather.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["farm_juice_strawberries"] = {
		label = "Strawberries Juice",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_juice_strawberries.png",
		}
	},

	["pig_skin"] = {
		label = "Pig Skin",
		weight = 600,
		stack = true,
		close = true,
		description = "Tanned skin from a pig",
		client = {
			image = "pig_skin.png",
		}
	},

	["fire_mask"] = {
		label = "Firefighter Mask",
		weight = 250,
		stack = true,
		close = true,
		description = "A mask to help breathe around fire.",
		client = {
			image = "fire_mask.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["grapejuice12"] = {
		label = "Grape Juice 12PK",
		weight = 3600,
		stack = true,
		close = false,
		description = "Long case of 12 bottles of grape juice",
		client = {
			image = "shipping-crate",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["methtray"] = {
		label = "Meth Tray",
		weight = 200,
		stack = true,
		close = false,
		description = "make some meth",
		client = {
			image = "meth_tray.png",
		}
	},

	["boat_license"] = {
		label = "Boat License",
		weight = 10,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "boat_license.png",
		}
	},

	["trimming_scissors"] = {
		label = "trimming_scissors",
		weight = 100,
		stack = true,
		close = false,
		description = "Scissors for cutting leaves.",
		client = {
			image = "trimming_scissors.png",
		}
	},

	["cocainekey"] = {
		label = "Coke Lab Key",
		weight = 500,
		stack = true,
		close = false,
		description = "Key used to enter a secret location.",
		client = {
			image = "cocainekey.png",
		}
	},

	["mining_goldbar"] = {
		label = "Gold Bar",
		weight = 500,
		stack = true,
		close = true,
		description = "Gold Bar",
		client = {
			image = "mining_goldbar.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["weed_white-widow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["healing_pill_lv1"] = {
		label = "Healing Pill (Level 1)",
		weight = 100,
		stack = true,
		close = true,
		description = "Restores a little health and armor",
		client = {
			image = "healing_pill_lv1.png",
		}
	},

	["unknown_evidence_bag"] = {
		label = "Unknown Evidence Bag",
		weight = 100,
		stack = false,
		close = true,
		description = "Unknown evidence need to analyze at the lab.",
		client = {
			image = "evidence.png",
		}
	},

	["weed_raw"] = {
		label = "Weed Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_raw.png",
		}
	},

	["weedkey"] = {
		label = "Key C",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with a \"Seed\" Engraved on the Back...",
		client = {
			image = "keyc.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["carrot_seed"] = {
		label = "Carrot Seed",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "carrot_seed.png",
		}
	},

	["processed_wild_meat"] = {
		label = "Processed Wild Meat",
		weight = 250,
		stack = true,
		close = true,
		description = "Quality processed wild meat, ready for cooking",
		client = {
			image = "processed_wild_meat.png",
		}
	},

	["bakingsoda"] = {
		label = "bakingsoda",
		weight = 250,
		stack = true,
		close = true,
		description = "Common powder, used in processing.",
		client = {
			image = "bakingsoda.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["milk"] = {
		label = "Milk",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milk.png",
		}
	},
["metal_ore"] = {
    label = "Metal ore",
    weight = 500,
    stack = true,
    close = true,
    description = "iron ore",
    client = {
        image = "iron_ore.png",
    }
},

["iron_ore"] = {
    label = "Iron Ore",
    weight = 500,
    stack = true,
    close = true,
    description = "Iron fragment from mining",
    client = {
        image = "mining_ironfragment.png",
    }
},

["metal_plates"] = {
    label = "metal plates",
    weight = 500,
    stack = true,
    close = true,
    description = "metal plates",
    client = {
        image = "metal_plates.png",
    }
},

["iron_plates"] = {
    label = "iron plates",
    weight = 500,
    stack = true,
    close = true,
    description = "iron plates",
    client = {
        image = "iron_plates.png",
    }
},

["tools"] = {
    label = "tools",
    weight = 500,
    stack = true,
    close = true,
    description = "Tools",
    client = {
        image = "Tools.png",
    }
},

["screws"] = {
    label = "screws",
    weight = 500,
    stack = true,
    close = true,
    description = "Screws",
    client = {
        image = "screws.png",
    }
},

}
