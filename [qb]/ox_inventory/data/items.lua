return {
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
	['hairspray'] = {
		label = 'Hairspray',
  		description = 'A can of hairspray to restyle your hair',
		weight = 1,
		stack = false,
		close = true,
		consume = 0,
		client = {
			event = 'bostra-hairstyle:client:openMenu'
		}
	},
	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 80000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			decay = true, degrade = 5760,
			notification = 'You ate a delicious burger'
		},
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

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
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

	["phone"] = {
    	label = "Phone",
    	weight = 190,
    	stack = false,
    	consume = 0,
    	client = {
        	export = "lb-phone.UsePhoneItem",
        	remove = function()
            	TriggerEvent("lb-phone:itemRemoved")
        	end,
        	add = function()
            	TriggerEvent("lb-phone:itemAdded")
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
			status = { thirst = 80000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			decay = true, degrade = 5760,
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

	['bank_card'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'bank_card.png',
			event = 'qb-banking:client:useCard'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
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

	["empty_ticket"] = {
		label = "Empty Ticket",
		weight = 2,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "empty_ticket.png",
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

	["payment_terminal"] = {
		label = "Payment Terminal",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "payment_terminal.png",
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
		["lettuce"] = {
		label = "lettuce Raw",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lettuce.png",
		}
	},
		["lettuce_seed"] = {
		label = "lettuce SEED",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lettuce_seed.png",
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

	["lamb_rack"] = {
		label = "Lamb Rack",
		weight = 50,
		stack = true,
		close = true,
		description = "Premium lamb rack",
		client = {
			image = "lamb_rack.png",
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

	["empty_invoice"] = {
		label = "Empty Invoice",
		weight = 3,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "empty_invoice.png",
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

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 100,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["raw_deer_meat"] = {
		label = "Raw Deer Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh raw meat from a deer, needs processing",
		client = {
			image = "raw_deer_meat.png",
		}
	},
		["raw_meat"] = {
		label = "Raw cow Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh raw meat from a cow, needs processing",
		client = {
			image = "raw_meat.png",
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

	["clerk_tablet"] = {
		label = "Clerk Tablet",
		weight = 10,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "clerk_tablet.png",
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

	["invoice"] = {
		label = "Invoice",
		weight = 4,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "invoice.png",
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

	["repairkit"] = {
		label = "Repairkit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
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

	["chicken"] = {
		label = "Alive chicken",
		weight = 200,
		stack = true,
		close = false,
		description = "Alive Chicken",
		client = {
			image = "chicken.png",
		}
	},
		["chicken_raw"] = {
		label = "Raw chicken",
		weight = 200,
		stack = true,
		close = false,
		description = "Raw Chicken",
		client = {
			image = "chicken_raw.png",
		}
	},
	["cooked_chicken"] = {
		label = "Cooked Chicken",
		weight = 200,
		stack = true,
		close = false,
		description = "Cooked Chicken",
		client = {
			image = "cooked_chicken.png",
		}
	},
	["cooked_beef"] = {
		label = "Cooked Beef",
		weight = 200,
		stack = true,
		close = false,
		description = "Cooked Beef",
		client = {
			image = "cooked_beef.png",
		}
	},
	["chicken_bag"] = {
		label = "chicken Bag ",
		weight = 200,
		stack = true,
		close = false,
		description = "Chicken bag",
		client = {
			image = "chicken_bag.png",
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

	["thermal_paper"] = {
		label = "Thermal Paper",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "thermal_paper.png",
		}
	},

	["police_barrier"] = {
		label = "Police Barrier",
		weight = 300,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "police_barrier.png",
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

	["signed_vehicle_sale_agreement"] = {
		label = "Signed Vehicle Sale Agreement",
		weight = 5,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "vehicle_sale_agreement.png",
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

	["ticket"] = {
		label = "Ticket",
		weight = 3,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "ticket.png",
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

	["farm_wheat"] = {
		label = "wheat",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "farm_wheat.png",
		}
	},
		["barley"] = {
		label = "Barley",
		weight = 100,
		stack = true,
		close = true,
		description = "Barley to make beer",
		client = {
			image = "barley.png",
		}
	},
	["barley_seed"] = {
		label = "Barley",
		weight = 25,
		stack = true,
		close = true,
		description = "Barley to make beer",
		client = {
			image = "barley_seed.png",
		}
	},
	["dough"] = {
		label = "dough",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "dough.png",
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

	["grape_seed"] = {
		label = "Grape Seed",
		weight = 25,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "grape_seed.png",
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

	["receipt"] = {
		label = "Receipt",
		weight = 1,
		stack = false,
		close = false,
		description = "",
		client = {
			image = "receipt.png",
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

	["casino_chips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
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

	["butcher_knife"] = {
		label = "Butcher Knife",
		weight = 150,
		stack = true,
		close = true,
		description = "Professional knife for butchering animals",
		decay = true, degrade = 5760,
		client = {
			image = "butcher_knife.png",
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

	["house_key"] = {
		label = "Housing Key",
		weight = 10,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "house_key.png",
		}
	},
	["mayfair_key"] = {
		label = "VIP Room Key",
		weight = 10,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "mayfair_key.png",
		}
	},
	['pliers'] = {
    	label = 'Pliers',
    	weight = 500,
    	stack = true,
    	close = true,
	},
	['insulating_tape'] = {
    	label = 'Insulating Tape',
    	weight = 200,
    	stack = true,
    	close = true,
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

	["processed_deer_meat"] = {
		label = "Processed Venison",
		weight = 100,
		stack = true,
		close = true,
		description = "Quality processed venison, ready for cooking",
		client = {
			image = "processed_deer_meat.png",
		}
	},

	["squeezed_grapes"] = {
		label = "Squeezed grapes",
		weight = 1800,
		stack = true,
		close = false,
		description = "Grape juice",
		client = {
			image = "squeezed_grape.png",
		}
	},
		["yeast"] = {
		label = "yeast",
		weight = 1800,
		stack = true,
		close = false,
		description = "Yeast",
		client = {
			image = "box.png",
		}
	},
	["sugar"] = {
		label = "sugar",
		weight = 1800,
		stack = true,
		close = false,
		description = "Sugar",
		client = {
			image = "sugar.png",
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

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 100,
		stack = true,
		close = false,
		description = "Slaughtered Chicken",
		client = {
			image = "slaughteredchicken.png",
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

	["raw_cow_meat"] = {
		label = "Raw Cow Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh raw meat from a cow, needs processing",
		client = {
			image = "raw_cow_meat.png",
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

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 50,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
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

	["bucket"] = {
		label = "Empty Bucket",
		weight = 25,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "bucket.png",
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

	["raw_pig_meat"] = {
		label = "Raw Pig Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh raw meat from a pig, needs processing",
		client = {
			image = "raw_pig_meat.png",
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

	["milk_bucket"] = {
		label = "Milk",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "milk_bucket.png",
		}
	},
		["bread"] = {
		label = "bread",
		weight = 50,
		stack = true,
		close = true,
		description = "",
		--decay = true, degrade = 5760,
		client = {
			image = "bread.png",
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

	["police_stormram"] = {
		label = "Police Storm Ram",
		weight = 5000,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "police_stormram.png",
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

	["processed_sheep_meat"] = {
		label = "Processed Lamb",
		weight = 100,
		stack = true,
		close = true,
		description = "Quality processed lamb, ready for cooking",
		client = {
			image = "processed_sheep_meat.png",
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

	["mining_stone"] = {
		label = "Mined Stone",
		weight = 50,
		stack = true,
		close = true,
		description = "Mined Stone",
		client = {
			image = "mining_stone.png",
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

	["processed_cow_meat"] = {
		label = "Processed Cow Meat",
		weight = 200,
		stack = true,
		close = true,
		description = "Quality processed beef, ready for cooking",
		client = {
			image = "processed_cow_meat.png",
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

	["watering_can"] = {
		label = "Watering Can",
		weight = 25,
		stack = false,
		close = true,
		description = "watering can",
		client = {
			image = "watering_can.png",
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

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		client = {
			image = "diving_tube.png",
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

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 2000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
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
	-- Custom Mechanic Items (T1GER Mechanic System) - Non-default for ox_inventory

    -- Health Parts
    ['radiator'] = {
        label = 'Radiator',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Radiator',
        client = { image = 'radiator.png' }
    },
    ['fuel_pump'] = {
        label = 'Fuel Pump',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Fuel Pump',
        client = { image = 'fuel_pump.png' }
    },
    ['brakes'] = {
        label = 'Brakes',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Brakes',
        client = { image = 'brakes.png' }
    },
    ['drive_shaft'] = {
        label = 'Drive Shaft',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Drive Shaft',
        client = { image = 'drive_shaft.png' }
    },
    ['alternator'] = {
        label = 'Alternator',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Alternator',
        client = { image = 'alternator.png' }
    },
    ['clutch'] = {
        label = 'Clutch',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Health Part - Clutch',
        client = { image = 'clutch.png' }
    },

    -- Service Parts
    ['oil_filter'] = {
        label = 'Oil + Filter',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Oil + Filter',
        client = { image = 'oil_filter.png' }
    },
    ['air_filter'] = {
        label = 'Air Filter',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Air Filter',
        client = { image = 'air_filter.png' }
    },
    ['fuel_filter'] = {
        label = 'Fuel Filter',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Fuel Filter',
        client = { image = 'fuel_filter.png' }
    },
    ['coolant'] = {
        label = 'Coolant',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Coolant',
        client = { image = 'coolant.png' }
    },
    ['brake_fluid'] = {
        label = 'Brake Fluid',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Brake Fluid',
        client = { image = 'brake_fluid.png' }
    },
    ['steering_fluid'] = {
        label = 'Power Steering Fluid',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Power Steering Fluid',
        client = { image = 'steering_fluid.png' }
    },
    ['transmission_fluid'] = {
        label = 'Transmission Fluid',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Transmission Fluid',
        client = { image = 'transmission_fluid.png' }
    },
    ['spark_plugs'] = {
        label = 'Spark Plugs',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Spark Plugs',
        client = { image = 'spark_plugs.png' }
    },
    ['drive_belt'] = {
        label = 'Drive Belt',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Drive Belt',
        client = { image = 'drive_belt.png' }
    },
    ['flywheel'] = {
        label = 'Flywheel',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Flywheel',
        client = { image = 'flywheel.png' }
    },
    ['tires'] = {
        label = 'Tires',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Service Part - Tires',
        client = { image = 'tires.png' }
    },

    -- Body Parts
    ['part_door'] = {
        label = 'Door Part',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Body Part - Door',
        client = { image = 'part_door.png' }
    },
    ['part_hood'] = {
        label = 'Hood Part',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Body Part - Hood',
        client = { image = 'part_hood.png' }
    },
    ['part_trunk'] = {
        label = 'Trunk Part',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Body Part - Trunk',
        client = { image = 'part_trunk.png' }
    },
    ['part_window'] = {
        label = 'Window Part',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Body Part - Window',
        client = { image = 'part_window.png' }
    },
    ['part_wheel'] = {
        label = 'Wheel Part',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Body Part - Wheel',
        client = { image = 'part_wheel.png' }
    },

    -- Kits & Tools
    ['repairkit_adv'] = {
        label = 'Repair Kit Advanced',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Advanced vehicle repair kit',
        client = { image = 'repairkit_adv.png' }
    },
    ['patchkit'] = {
        label = 'Patch Kit',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Patch Kit for health/service parts',
        client = { image = 'patchkit.png' }
    },
    ['jump_starter'] = {
        label = 'Jump Starter',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Jump Starter for vehicle battery',
        client = { image = 'jump_starter.png' }
    },
    ['tire_repairkit'] = {
        label = 'Tire Repair Kit',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Tire Repair Kit for bursted tires',
        client = { image = 'tire_repairkit.png' }
    },
    ['toolstrolley'] = {
        label = 'Tools Trolley',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Spawn a tools trolley prop',
        client = { image = 'toolstrolley.png' }
    },
    ['enginehoist'] = {
        label = 'Engine Hoist',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Spawn an engine hoist prop',
        client = { image = 'enginehoist.png' }
    },
    ['consign'] = {
        label = 'Consign',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Spawn a consign prop',
        client = { image = 'consign.png' }
    },
    ['roadbarrier'] = {
        label = 'Road Barrier',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Spawn a road barrier prop',
        client = { image = 'roadbarrier.png' }
    },

    -- Extra Materials
	
    ['electric_scrap'] = {
        label = 'Electric Scrap',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Material - Electric Scrap',
        client = { image = 'electric_scrap.png' }
    },
    ['brass'] = {
        label = 'Brass',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Material - Brass',
        client = { image = 'brass.png' }
    },
    ['synthetic_oil'] = {
        label = 'Synthetic Oil',
        weight = 1000,
        stack = true,
        close = true,-- Sparkplugs
		client = { image = 'synthetic_oil.png' }
	},
	["iridium_sparkplugs"] = {
    	label = "Iridium Sparkplugs",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Premium iridium sparkplugs",
    	client = { image = "iridium_sparkplugs.png" }
	},

	["ngk_sparkplugs"] = {
    	label = "NGK Sparkplugs",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "NGK brand sparkplugs",
    	client = { image = "ngk_sparkplugs.png" }
	},

	["stock_sparkplugs"] = {
    	label = "Stock Sparkplugs",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Standard stock sparkplugs",
    	client = { image = "stock_sparkplugs.png" }
	},

-- Brakes
	["ceramic_brakes"] = {
    	label = "Ceramic Brakes",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "High-performance ceramic brakes",
    	client = { image = "ceramic_brakes.png" }
	},

	["carbon_brakes"] = {
    	label = "Carbon Brakes",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Carbon fiber brake system",
    	client = { image = "carbon_brakes.png" }
	},

	["stock_brakes"] = {
    	label = "Stock Brakes",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Standard stock brakes",
    	client = { image = "stock_brakes.png" }
	},

	["race_brakes"] = {
    	label = "Race Brakes",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Professional racing brake system",
    	client = { image = "race_brakes.png" }
	},

-- Turbo
	["turbo_lvl_1"] = {
    	label = "Turbo lvl 1",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Turbo lvl 1",
    	client = { image = "turbo_lvl_1.png" }
	},

	["turbo_lvl_2"] = {
    	label = "Turbo lvl 2",
    	weight = 0,
    	stack = true,
    	close = true,
    	description = "Turbo lvl 2",
    	client = { image = "turbo_lvl_2.png" }
	},

-- Tires
	["drift_tires"] = {
		label = "Drift Tires",
		weight = 0,
		stack = true,
		close = true,
		description = "Specialized drift tires",
		client = { image = "drift_tires.png" }
	},

	["stock_tires"] = {
		label = "Stock Tires",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard stock tires",
		client = { image = "stock_tires.png" }
	},

	["michelin_pilot"] = {
		label = "Michelin Pilot",
		weight = 0,
		stack = true,
		close = true,
		description = "Michelin Pilot performance tires",
		client = { image = "michelin_pilot.png" }
	},

	["toyo_proxes"] = {
		label = "Toyo Proxes",
		weight = 0,
		stack = true,
		close = true,
		description = "Toyo Proxes high-performance tires",
		client = { image = "toyo_proxes.png" }
	},

	-- Engines
	["stock_engine"] = {
		label = "Stock Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard stock engine",
		client = { image = "stock_engine.png" }
	},

	["v8engine"] = {
		label = "V8 Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Powerful V8 engine",
		client = { image = "v8engine.png" }
	},

	["2jzengine"] = {
		label = "2JZ Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Legendary 2JZ engine",
		client = { image = "2jzengine.png" }
	},

	["m297zonda"] = {
		label = "M297 Zonda Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Pagani Zonda M297 engine",
		client = { image = "m297zonda.png" }
	},

	["m158huayra"] = {
		label = "M158 Huayra Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Pagani Huayra M158 engine",
		client = { image = "m158huayra.png" }
	},

	["lambov10"] = {
		label = "Lambo V10 Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Lamborghini V10 engine",
		client = { image = "lambov10.png" }
	},

	["k20a"] = {
		label = "K20A Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Honda K20A engine",
		client = { image = "k20a.png" }
	},

	["gt3flat6"] = {
		label = "GT3 Flat-6 Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "Porsche GT3 Flat-6 engine",
		client = { image = "gt3flat6.png" }
	},

	["gecf6"] = {
		label = "General Electric CF6 Engine",
		weight = 0,
		stack = true,
		close = true,
		description = "General Electric CF6 engine",
		client = { image = "gecf6.png" }
	},

	-- Oil
	["stock_oil"] = {
		label = "Stock Oil",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard engine oil",
		client = { image = "stock_oil.png" }
	},

	["synthetic_oil"] = {
		label = "Synthetic Oil",
		weight = 0,
		stack = true,
		close = true,
		description = 'Material - Synthetic Oil',
        client = { image = 'synthetic_oil.png' }
    },


	["premium_oil"] = {
		label = "Premium Oil",
		weight = 0,
		stack = true,
		close = true,
		description = "Premium grade engine oil",
		client = { image = "premium_oil.png" }
	},

	["racing_oil"] = {
		label = "Racing Oil",
		weight = 0,
		stack = true,
		close = true,
		description = "High-performance racing oil",
		client = { image = "racing_oil.png" }
	},

	-- Suspension
	["stock_suspension"] = {
		label = "Stock Suspension",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard suspension system",
		client = { image = "stock_suspension.png" }
	},

	["sport_suspension"] = {
		label = "Sport Suspension",
		weight = 0,
		stack = true,
		close = true,
		description = "Sport-tuned suspension",
		client = { image = "sport_suspension.png" }
	},

	["coilover_suspension"] = {
		label = "Coilover Suspension",
		weight = 0,
		stack = true,
		close = true,
		description = "Adjustable coilover suspension",
		client = { image = "coilover_suspension.png" }
	},

	["airride_suspension"] = {
		label = "Air Ride Suspension",
		weight = 0,
		stack = true,
		close = true,
		description = "Air ride suspension system",
		client = { image = "airride_suspension.png" }
	},

	-- Transmission
	["stock_transmission"] = {
		label = "Stock Transmission",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard transmission",
		client = { image = "stock_transmission.png" }
	},

	["manual_gearbox_rwd"] = {
		label = "RWD Manual Gearbox",
		weight = 0,
		stack = true,
		close = true,
		description = "Rear-wheel drive manual transmission",
		client = { image = "manual_gearbox_rwd.png" }
	},

	["auto_gearbox_rwd"] = {
		label = "RWD Automatic Gearbox",
		weight = 0,
		stack = true,
		close = true,
		description = "Rear-wheel drive automatic transmission",
		client = { image = "auto_gearbox_rwd.png" }
	},

	["auto_gearbox_awd"] = {
		label = "AWD Automatic Gearbox",
		weight = 0,
		stack = true,
		close = true,
		description = "All-wheel drive automatic transmission",
		client = { image = "auto_gearbox_awd.png" }
	},

	["drag_gearbox"] = {
		label = "Drag Gearbox",
		weight = 0,
		stack = true,
		close = true,
		description = "Specialized drag racing transmission",
		client = { image = "drag_gearbox.png" }
	},

	-- NOS
	["nos"] = {
		label = "NOS",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard nitrous oxide system",
		client = { image = "nos.png" }
	},

	["nos_extreme"] = {
		label = "Extreme NOS",
		weight = 0,
		stack = true,
		close = true,
		description = "High-capacity nitrous oxide system",
		client = { image = "nos_extreme.png" }
	},

	-- Mechanic Tools
	["toolbox"] = {
		label = "Toolbox",
		weight = 0,
		stack = true,
		close = true,
		description = "Standard mechanic toolbox containing basic repair tools",
		client = { image = "toolbox.png" }
	},

	["mechanic_tools"] = {
		label = "Mechanic Tools",
		weight = 0,
		stack = true,
		close = true,
		description = "Professional mechanic tools for vehicle repairs and maintenance",
		client = { image = "mechanic_tools.png" }
	},

	["mechanic_workshop"] = {
		label = "Workshop Equipment",
		weight = 0,
		stack = true,
		close = true,
		description = "Advanced workshop equipment for complex vehicle modifications",
		client = { image = "mechanic_workshop.png" }
	},

	-- Scrap
	["scrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = { image = "metalscrap.png" }
	},

    ['acid'] = {
        label = 'Synthetic Acid',
        weight = 1000,
        stack = true,
        close = true,
        description = 'Material - Synthetic Acid',
        client = { image = 'acid.png' }
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

	["vehicle_sale_agreement"] = {
		label = "Vehicle Sale Agreement",
		weight = 4,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "vehicle_sale_agreement.png",
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

	["ground_meat"] = {
		label = "Ground Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Freshly ground meat",
		client = {
			image = "ground_meat.png",
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

	["raw_sheep_meat"] = {
		label = "Raw Sheep Meat",
		weight = 50,
		stack = true,
		close = true,
		description = "Fresh raw meat from a sheep, needs processing",
		client = {
			image = "raw_sheep_meat.png",
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

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		decay = true, degrade = 5760,
		client = {
			image = "tosti.png",
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

	["raw_wild_meat"] = {
		label = "Raw Wild Meat",
		weight = 100,
		stack = true,
		close = true,
		description = "Fresh raw meat from wild animals, needs processing",
		client = {
			image = "raw_wild_meat.png",
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
	['medicalbag'] = {
    label = 'Medical Bag',
    weight = 220,
    stack = true,
    description = "A comprehensive medical kit for treating injuries and ailments.",
},

['bandage'] = {
    label = 'Bandage',
    weight = 100,
    stack = true,
    description = "A simple bandage used to cover and protect wounds.",
},

['defibrillator'] = {
    label = 'Defibrillator',
    weight = 100,
    stack = true,
    description = "Used for reviving patients.",
},

['tweezers'] = {
    label = 'Tweezers',
    weight = 100,
    stack = true,
    description = "Precision tweezers for safely removing foreign objects, such as bullets, from wounds.",
},

['burncream'] = {
    label = 'Burn Cream',
    weight = 100,
    stack = true,
    description = "Specialized cream for treating and soothing minor burns and skin irritations.",
},

['suturekit'] = {
    label = 'Suture Kit',
    weight = 100,
    stack = true,
    description = "A kit containing surgical tools and materials for stitching and closing wounds.",
},

['icepack'] = {
    label = 'Ice Pack',
    weight = 200,
    stack = true,
    description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
},

['stretcher'] = {
    label = 'Stretcher',
    weight = 200,
    stack = true,
    description = "An ice pack used to reduce swelling and provide relief from pain and inflammation.",
},

['emstablet'] = {
    label = 'Ems tablet',
    weight = 200,
    stack = true,
    client = {
        export = 'ars_ambulancejob.openDistressCalls'
    }
},
['evidence'] = {
	label = 'evidence',
	weight = 20,
	stack = false,
	close = true,
	consume = 0,
	client = {
		export = 'renzu_evidence.useItem',
		disable = { move = true, car = true, combat = true },
		usetime = 1500,
	}
},
['fingerprintkit'] = {
	label = 'Latent Fingerprint Kit ',
	weight = 20,
	stack = true,
	close = true,
	consume = 0,
	client = {
		export = 'renzu_evidence.useItem',
		disable = { move = true, car = true, combat = true },
		usetime = 1500,
	}
},
["burger-sodasyrup"] = {
    label = "Soda Syrup", weight = 125, stack = true, description = "An Ingredient", client = { image = "bs_ingredients_hfcs.png", }
},
["burger-tomato"] = {
    label = "sliced Tomato", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "slicedtomato.png", }
},
["burger-bleeder"] = {
    label = "Touhemi's Special Burger", weight = 250, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_the-bleeder.png", },
    server = { export = 'randol_burgershot.burger-bleeder', },
},
["burger-moneyshot"] = {
    label = "Touhemi's Beef Burger", weight = 300, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_money-shot.png", },
    server = { export = 'randol_burgershot.burger-moneyshot', },
},
["burger-meatfree"] = {
    label = "Touhemi's Meatless Burger", weight = 125, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_meat-free.png", },
    server = { export = 'randol_burgershot.burger-meatfree', },
},
["burger-potato"] = {
    label = "Sliced Potatos", weight = 150, stack = true, close = true, description = "An Ingredient", client = { image = "bs_potato.png", }
},
["burger-mshake"] = {
    label = "Milkshake", weight = 125, stack = true, close = true, description = "Hand-scooped for you!", 
    client = { image = "bs_milkshake.png", },
    server = { export = 'randol_burgershot.burger-mshake', },
},
["burger-lettuce"] = { label = "sliced Lettuce", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "lettuce.png", }
},
["noodles"] = { label = "Noodles", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "noodles.png", }
},
["burger-raw"] = { label = "Raw Patty", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_patty_raw.png", }
},
["burger-heartstopper"] = {
    label = "Heartstopper", weight = 2500, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_the-heart-stopper.png", },
    server = { export = 'randol_burgershot.burger-heartstopper', },
},
["noodles-chicken"] = {
    label = "Chicken Noodles", weight = 2500, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "noodles_bowl.png", },
    server = { export = 'randol_burgershot.burger-heartstopper', },
},
["noodles-beef"] = {
    label = "Beef Noodles", weight = 2500, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "noodles_bowl.png", },
    server = { export = 'randol_burgershot.burger-heartstopper', },
},
["noodles-vegan"] = {
    label = "Vegan Noodles", weight = 2500, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "noodles_bowl.png", },
    server = { export = 'randol_burgershot.burger-heartstopper', },
},
["burger-mshakeformula"] = {
    label = "Milkshake Formula", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_ingredients_icecream.png", }
},
["burger-fries"] = {
    label = "Fries", weight = 125, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_fries.png", },
    server = { export = 'randol_burgershot.burger-fries', },
},
["burger-torpedo"] = {
    label = "Torpedo", weight = 310, stack = true, close = true, description = "It's a food item dude.", 
    client = { image = "bs_torpedo.png", },
    server = { export = 'randol_burgershot.burger-torpedo', },
},
["burger-bun"] = {
    label = "Bun", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "bs_bun.png", }
},
["chicken_legs"] = {
    label = "chicken", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "chicken_legs.png", }
},
["fried-chicken"] = {
    label = "fried chicken", weight = 125, stack = true, close = true, description = "An Ingredient", client = { image = "fried_chicken.png", }
},
["burger-softdrink"] = {
    label = "Soft Drink", weight = 125, stack = true, close = true, description = "An Ice Cold Drink.", 
    client = { image = "bs_softdrink.png", },
    server = { export = 'randol_burgershot.burger-softdrink', },
},
['rentalpapers'] = {
    label = "Rental Papers",
    weight = 0,
    stack = false,
    close = false,
    description = "Rental Papers",
    client = {
        image = "rentalpapers.png",
    },
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
	["boombox"] = {
		label = "Boombox",
		weight = 200,
		stack = false,
		close = true,
		description = "Enjoy the music",
		client = {
			event = 'raven-boombox:useItem'
		}
	},
	['radiocell'] = {
		label = 'AAA Cells',
		weight = 20,
		stack = true,
		allowArmed = true,
		client = {
			image = 'radiocell.png',
			event = 'mm_radio:client:recharge'
		}
	},
	['jammer'] = {
		label = 'Radio Jammer',
		weight = 10000,
		allowArmed = true,
		client = {
			image = 'jammer.png',
			event = 'mm_radio:client:usejammer'
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
	['chemicals'] = {
        label = 'Chemicals',
        weight = 100,
        stack = true,
        close = true,
        description = 'Chemical components.',
        client = {
            image = 'chemicals.png',
        },
    },
    ['cloth'] = {
        label = 'Cloth',
        weight = 100,
        stack = true,
        close = true,
        description = 'Soft material used in medical crafting.',
        client = {
            image = 'cloth.png',
        },
    },
	['metallic_bio_tools'] = {
        label = 'Metallic Bio Tools',
        weight = 100,
        stack = true,
        close = true,
        description = 'Metallic bio tools.',
        client = {
            image = 'metallic_bio_tools.png',
        },
    },

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		decay = true, degrade = 5760,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
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
	

	["mastercard"] = {
		label = "Master Card",
		weight = 0,
		stack = false,
		close = false,
		description = "MasterCard can be used via ATM",
		client = {
			image = "mastercard.png",
		}
	},

	["metal_ore"] = {
    label = "Metal ore",
    weight = 500,
    stack = true,
    close = true,
    description = "metal ore",
    client = {
        image = "metal_ore.png",
    }
},

["iron_ore"] = {
    label = "Iron Ore",
    weight = 500,
    stack = true,
    close = true,
    description = "Iron fragment from mining",
    client = {
        image = "iron_ore.png",
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
        image = "tools.png",
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
}