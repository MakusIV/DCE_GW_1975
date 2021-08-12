--Loadouts database
-------------------------------------------------------------------------------------------------------
----OB----
--[[ Loadout Entry Example ----------------------------------------------------------------------------

["MiG-21Bis"] = {														--String, aircraft type
	["Strike"] = {														--String, task
		["Custom Loadout Name"] = {										--String, custom loadout name
			support = {													--Table, list of tasks that can support this loadout (nil = is never added, true = is added when available)
				["Escort"] = true,										--Fighter escort
				["SEAD"] = true,										--SEAD	escort
				["Escort Jammer"] = true,								--Jammer escort
				["Flare Illumination"] = true,							--Target area flare illumination (mandatory support for loadout to be eligible)
				["Laser Illumination"] = true,							--Target laser illumination (mandatory support for loadout to be eligible)
			},
			attributes = {												--Array, custom loadout attributes. Only used by A-G tasks. Any target attribute must be matched in this array for the loadout to be eligible for the target.
				[1] = "Anti-tank",										--String, custom attribute to be matched for target attribute
				[2] = "Stand-off Missile",								--String, custom attribute to be matched for target attribute
			},
			weaponType = "Bombs",										--String, type of ordinance of loadout. Only used by A-G taks. Options: "Cannon", "Rockets", "Bombs", "Guided bombs", "ASM". A-G weapon types cannot be mixed.
			expend = "All",												--String, quantity of wapons expended per attack. Only used by A-G tasks. Options: "Auto", "All", "Half", "Two".
			day = true,													--Boolean, loadout is day capable
			night = true,												--Boolean, loadout is night capable
			adverseWeather = true,										--Boolean, loadout is adverse weather capable
			range = 900000,												--Number, range radius in meters
			capability = 1,											--Number, how good is the aircraft with this loadout. The higher the better
			firepower = 1,												--Number, how much firepower has this loadout. The higher the better
			vCruise = 225,												--Number, cruise speed in m/s
			vAttack = 280,												--Number, attack speed in m/s
			hCruise = 6000,												--Number, cruise altitude in m
			hAttack = 100,												--Number, attack altitude in m
			standoff = 5000,											--Number, attack distance from target in m. Determines attack waypoint distance for A-G with missiles (for Bombss use nil) and engage distance for A-A tasks
			tStation = 1200,											--Number, seconds the aircraft can remain on station. Only used by CAP, AWACS and Refuelling tasks
			LDSD = true,												--Boolean, aircraft is Look-Down/Shoot-Down capable. Only used by CAP and Intercept tasks
			--- self_escort = false,										--Boolean, aircraft can defend itself against fighters. Only used by A-G tasks
			sortie_rate = 2,											--Number, average amount of sorties that aircraft flies per day
			stores = {													--Table, loadout table for DCS
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{R-60M 2L}",
					},
					[2] = 
					{
						["CLSID"] = "{R-3R}",
					},
					[3] = 
					{
						["CLSID"] = "{PTB_800_MIG21}",
					},
					[4] = 
					{
						["CLSID"] = "{R-3R}",
					},
					[5] = 
					{
						["CLSID"] = "{R-60M 2R}",
					},
					[6] = 
					{
						["CLSID"] = "{ASO-2}",
					},
				},
				["fuel"] = 2280,
				["flare"] = 32,
				["ammo_type"] = 1,
				["chaff"] = 32,
				["gun"] = 100,
			},
		},
	},
},

]]-----------------------------------------------------------------------------------------------------


db_loadouts = {
	["A-10C_2"] = {
		["Anti-ship Strike"] = {
			["CAS-2-Mav*4"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98453}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98452}",
					["num"] = 3,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
		},	
		["Strike"] = {
			["CAS-1-soft-Laser guided Rockets"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{LAU-131x3 - 7 AGR-20 M282}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{LAU-131 - 7 AGR-20 M282}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{LAU-131x3 - 7 AGR-20 M282}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{LAU-131x3 - 7 AGR-20 M282}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{LAU-131x3 - 7 AGR-20 M282}",
					["num"] = 4,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["CAS-2-Mav*4"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98453}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98452}",
					["num"] = 3,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["Strike-1-8*GBU-12"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"ship", "Structure", "soft", "SAM"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
					["num"] = 11,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "BRU-42_3*GBU-12",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "BRU-42_3*GBU-12",
					["num"] = 3,
				},
				[8] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 4,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["Strike-2-GBU-10-GBU-12"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"ship", "Structure"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "{DB434044-F5D0-4F1F-9BA9-B73027E18DD3}",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 3,
				},
				[8] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 4,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
		},
	},	
	["A-10C"] = {
		["Anti-ship Strike"] = {
			["Mav"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 9000,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98453}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98452}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "Fuel_Tank_FT600",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Mav"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = 9000,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98453}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E6A6262A-CA08-4B3D-B030-E1A993B98452}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "Fuel_Tank_FT600",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["Mk-82"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- --- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 3,
				},
				[8] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 7,
				},
				[5] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "Fuel_Tank_FT600",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
				["fuel"] = 3470,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["Mk-84"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 5200,
				hAttack = 5100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "Fuel_Tank_FT600",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["GBU-12"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 6200,
				hAttack = 7100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 3,
				},
				[8] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 7,
				},
				[5] = {
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "Fuel_Tank_FT600",
					["num"] = 6,
				},
				}, -- end of ["pylons"]
				["fuel"] = 4526,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			["GBU-10"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 120,
				vAttack = 125,
				hCruise = 6200,
				hAttack = 7100,
				standoff = 11000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[11] = {
					["CLSID"] = "LAU-105_2*CATM-9M",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "ALQ_184",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 6,
				},
				}, -- end of ["pylons"]
				["fuel"] = 5029,
                ["flare"] = 120,
                ["chaff"] = 240,
                ["gun"] = 100,
				},
			},
			-- ["GBU-38"] = {
			-- minscore = 0.3,
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM", "Bridge"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 130000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 120,
				-- vAttack = 125,
				-- hCruise = 6200,
				-- hAttack = 7100,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = false,
				-- - self_escort = false,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [11] = {
					-- ["CLSID"] = "LAU-105_2*CATM-9M",
					-- ["num"] = 11,
				-- },
				-- [1] = {
					-- ["CLSID"] = "ALQ_184",
					-- ["num"] = 1,
				-- },
				-- [10] = {
					-- ["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					-- ["num"] = 10,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 9,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 3,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 8,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 4,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 7,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 5,
				-- },
				-- [6] = {
					-- ["CLSID"] = "Fuel_Tank_FT600",
					-- ["num"] = 6,
				-- },
				-- }, -- end of ["pylons"]
				-- ["fuel"] = 4526,
                -- ["flare"] = 120,
                -- ["chaff"] = 240,
                -- ["gun"] = 100,
				-- },
			-- },
		},
	},
	["AV8BNA"] = {
		["Anti-ship Strike"] = {
			["Strike Light - AGM65*4 - AA*1 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6000,
				hAttack = 5572,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {				
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{GAU_12_Equalizer}",
					["num"] = 4,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Strike  Light - Mk 82*4 - AA*3 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6000,
				hAttack = 6706,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "{BRU-42_2*Mk-82_RIGHT}",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "{BRU-42_2*Mk-82_LEFT}",
					["num"] = 3,
				},
				[5] = {
					["CLSID"] = "{ALQ_164_RF_Jammer}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
			["Strike Light - AGM65*4 - AA*1 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6000,
				hAttack = 5572,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {				
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{GAU_12_Equalizer}",
					["num"] = 4,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},		
			["Strike Light - Mk 83*2 - AA*3 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6000,
				hAttack = 5572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{ALQ_164_RF_Jammer}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
					["num"] = 3,
				},
			}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},		
			["Strike Light - GBU12*4 - AA*3 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6048,
				hAttack = 6706,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[4] = {
					["CLSID"] = "{GAU_12_Equalizer}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "{BRU-42_2*GBU-12_RIGHT}",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "{BRU-42_2*GBU-12_LEFT}",
					["num"] = 3,
				},
			}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
			["Strike Light - GBU16*2 - AA*3 - AGM122*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge", "Structure"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6048,
				hAttack = 6706,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{AGM_122_SIDEARM}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{AIM-9M-ON-ADAPTER}",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "{GAU_12_Equalizer}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					["num"] = 6,
				},
				[3] = {
					["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					["num"] = 3,
				},
			}, -- end of ["pylons"]
				["fuel"] = 3519,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
		},		
		["SEAD"] = {
			["AIM-122*2, AIM-9 *2, ECM*1"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
				{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[4] = {
					["CLSID"] = "{GAU_12_Equalizer}",
					["num"] = 4,
				},
				[7] = {
					["CLSID"] = "{LAU_7_AGM_122_SIDEARM}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{LAU_7_AGM_122_SIDEARM}",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{ALQ_164_RF_Jammer}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
				["fuel"] = 1408,
				["flare"] = 120,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},	
		},
	},
	["M-2000C"] = {
		["Intercept"] = {
			["Day, MagicII*2, S-530D*2, FT*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 400000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[9] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 9,
					},
					[1] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 1,
					},
					[8] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 8,
					},
					[2] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 2,
					},
					[5] = 
					{
						["CLSID"] = "{M2KC_RPL_522}",
						["num"] = 5,
					},
					[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
					},					
				},
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["Day, MagicII*2, S-530D*2, FT*1"] = {
				attributes = {"Air Forces"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 450000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[9] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 9,
					},
					[1] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 1,
					},
					[8] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 8,
					},
					[2] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 2,
					},
					[5] = 
					{
						["CLSID"] = "{M2KC_RPL_522}",
						["num"] = 5,
					},
					[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
					},					
				},
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["MagicII*2, S-530D*2, FT*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				-- vAttack = 270,
				-- hCruise = 7011,
				-- hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[9] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 9,
					},
					[1] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 1,
					},
					[8] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 8,
					},
					[2] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 2,
					},
					[5] = 
					{
						["CLSID"] = "{M2KC_RPL_522}",
						["num"] = 5,
					},
					[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
					},					
				},
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["MagicII*2, S-530D*2, FT*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[9] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 9,
					},
					[1] = 
					{
						["CLSID"] = "{MMagicII}",
						["num"] = 1,
					},
					[8] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 8,
					},
					[2] = 
					{
						["CLSID"] = "{Matra_S530D}",
						["num"] = 2,
					},
					[5] = 
					{
						["CLSID"] = "{M2KC_RPL_522}",
						["num"] = 5,
					},
					[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
					},					
				},
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			-- ["GBU-16*1, MagicII*2, FT*2"] = {
			-- minscore = 0.3,
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
					-- ["Laser Illumination"] = true,
				-- },
				-- attributes = {"Bridge", "Structure"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = false,
				-- adverseWeather = false,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 7924.8,
				-- hAttack = 7315.2,
				-- standoff = 15000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 10,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{Eclair}",
					-- ["num"] = 10,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{MMagicII}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{MMagicII}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{M2KC_08_RPL541}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{M2KC_02_RPL541}",
					-- ["num"] = 2,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
				-- ["fuel"] = 3165,
				-- ["flare"] = 48,
				-- ["chaff"] = 112,
				-- ["gun"] = 100,
				-- },
			-- },
			-- ["GBU-12*4, MagicII*2, FT*2"] = {
			-- minscore = 0.3,
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
					-- ["Laser Illumination"] = true,
				-- },
				-- attributes = {"Bridge"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = false,
				-- adverseWeather = false,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 7924.8,
				-- hAttack = 7315.2,
				-- standoff = 15000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 10,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{Eclair}",
					-- ["num"] = 10,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{MMagicII}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{MMagicII}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{M2KC_08_RPL541}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{M2KC_02_RPL541}",
					-- ["num"] = 2,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					-- ["num"] = 5,
				-- },
				-- }, -- end of ["pylons"]
				-- ["fuel"] = 3165,
				-- ["flare"] = 48,
				-- ["chaff"] = 112,
				-- ["gun"] = 100,
				-- },
			-- },			
			["MR, Mk-82*4, MagicII*2, FT*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{M2KC_08_RPL541}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{M2KC_02_RPL541}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 6,
				},
				[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
			["SR, Mk-82*8, MagicII*2, FT*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 4876.8,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{M2KC_RAFAUT_MK82}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{M2KC_RAFAUT_MK82}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 6,
				},
				[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
				},
				[5] = {
					["CLSID"] = "{M2KC_RPL_522}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
			["OCA, MR, Mk-82*4, MagicII*2, FT*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 3048,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{M2KC_08_RPL541}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{M2KC_02_RPL541}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 6,
				},
				[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
				},
					}, -- end of ["pylons"]
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
			["Mk-82*4, MagicII*2, FT*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{MMagicII}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{M2KC_08_RPL541}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{M2KC_02_RPL541}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
					["num"] = 6,
				},
				[10] = {
					["CLSID"] = "{Eclair}",
					["num"] = 10,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3165,
				["flare"] = 48,
				["chaff"] = 112,
				["gun"] = 100,
				},
			},
		},
	},
	["F-15C"] = {
		["Intercept"] = {
			["AIM-9M*4, AIM-120B*4, Fuel*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				-- vCruise = 270,
				-- vAttack = 270,
				-- hCruise = 6096,
				-- hAttack = 6096,
				-- standoff = 45000,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [9]
						[11] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = "6103",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["AIM-9M*4, AIM-120B*4, Fuel*3"] = {
				attributes = {"Air Forces"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 215.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 46300,
				tStation = 7200,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [7]
					[8] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [8]
					[9] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [9]
					[10] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [10]					
					[11] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [11]
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 60,
				["chaff"] = 120,
				["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["AIM-9M*4, AIM-120B*4, Fuel*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [7]
					[8] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [8]
					[9] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [9]
					[10] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [10]					
					[11] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [11]
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 60,
				["chaff"] = 120,
				["gun"] = 100,
				},
			},
		},		
		["Fighter Sweep"] = {
			["AIM-9M*4, AIM-120B*4, Fuel*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [7]
					[8] = 
					{
						["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					}, -- end of [8]
					[9] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [9]
					[10] = 
					{
						["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					}, -- end of [10]					
					[11] = 
					{
						["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					}, -- end of [11]
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 60,
				["chaff"] = 120,
				["gun"] = 100,
				},
			},
		},		
	},
	["F-15E"] = {
		["Strike"] = {
			["GBU-10*4, AIM-9M*2, AIM-120B*2, Fuel*2"] = {
			minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
					day = false,
					night = true,
					adverseWeather = false,
					range = 900000,
					capability = 1,
					firepower = 1,
					vCruise = 215.83333333333,
					vAttack = 277.5,
					hCruise = 7315.2,
					hAttack = 7315.2,
					standoff = 15000,
					tStation = nil,
					LDSD = true,
					--- self_escort = false,
					sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [3]
						[11] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [11]
						[7] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [7]
						[18] = 
						{
							["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						}, -- end of [18]
						[17] = 
						{
							["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						}, -- end of [17]
						[19] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [19]
						[9] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [9]
						[13] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [13]
					}, -- end of ["pylons"]
					["fuel"] = "10246",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
			["Strike GBU-38*12, AIM-9M*2, AIM-120B*2, FT*3"] = {
			minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
					attributes = {"soft", "Parked Aircraft", "SAM"},
					weaponType = "Guided bombs",
					expend = "Auto",
					day = false,
					night = true,
					adverseWeather = true,
					range = 900000,
					capability = 1,
					firepower = 1,
					vCruise = 215.83333333333,
					vAttack = 277.5,
					hCruise = 7315.2,
					hAttack = 7315.2,
					standoff = 20000,
					tStation = nil,
					LDSD = true,
					--- self_escort = false,
					sortie_rate = 6,
				stores = {
					["pylons"] = 
				{
				[19] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 19,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[18] = {
					["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					["num"] = 18,
				},
				[17] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 17,
				},
				[2] = {
					["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[13] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 13,
				},
				[7] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 7,
				},
				[11] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 11,
				},
				[9] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 9,
				},
				[12] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 12,
				},
				[16] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 16,
				},
				[15] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 15,
				},
				[8] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 6,
				},
				[14] = {
					["CLSID"] = "{GBU-38}",
					["num"] = 14,
				},
				[10] = {
					["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					["num"] = 10,
				},	
				}, -- end of ["pylons"]
					["fuel"] = "10246",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
			["Strike GBU-31*4, AIM-9M*2, AIM-120B*2, FT*2"] = {
			minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
					day = false,
					night = true,
					adverseWeather = true,
					range = 900000,
					capability = 1,
					firepower = 1,
					vCruise = 215.83333333333,
					vAttack = 277.5,
					hCruise = 7315.2,
					hAttack = 7315.2,
					standoff = 20000,
					tStation = nil,
					LDSD = true,
					--- self_escort = false,
					sortie_rate = 6,
				stores = {
					["pylons"] = 
				{
				[19] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 19,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[18] = {
					["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					["num"] = 18,
				},
				[17] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 17,
				},
				[2] = {
					["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[13] = {
					["CLSID"] = "{GBU-31}",
					["num"] = 13,
				},
				[7] = {
					["CLSID"] = "{GBU-31}",
					["num"] = 7,
				},
				[11] = {
					["CLSID"] = "{GBU-31}",
					["num"] = 11,
				},
				[9] = {
					["CLSID"] = "{GBU-31}",
					["num"] = 9,
				},
				},-- end of ["pylons"]
					["fuel"] = "10246",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
			-- ["Mk-84*4, AIM-9M*2, AIM-120B*2, Fuel*2"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = false,
				-- night = true,
				-- adverseWeather = true,
				-- range = 900000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 6705.6,
				-- hAttack = 5486.4,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 1,
				-- stores = {
					-- ["pylons"] = 
					-- {
						-- [1] = 
						-- {
							-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						-- }, -- end of [1]
						-- [2] = 
						-- {
							-- ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						-- }, -- end of [2]
						-- [3] = 
						-- {
							-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						-- }, -- end of [3]
						-- [11] = 
						-- {
							-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						-- }, -- end of [11]
						-- [7] = 
						-- {
							-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						-- }, -- end of [7]
						-- [18] = 
						-- {
							-- ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						-- }, -- end of [18]
						-- [17] = 
						-- {
							-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						-- }, -- end of [17]
						-- [19] = 
						-- {
							-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						-- }, -- end of [19]
						-- [9] = 
						-- {
							-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						-- }, -- end of [9]
						-- [13] = 
						-- {
							-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						-- }, -- end of [13]
					-- }, -- end of ["pylons"]
					-- ["fuel"] = "10246",
					-- ["flare"] = 60,
					-- ["chaff"] = 120,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["Mk-82*12, AIM-9M*2, AIM-120B*2, Fuel*2"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM", "Structure"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = false,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 6705.6,
				-- hAttack = 5486.4,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 1,
				-- stores = {
					-- ["pylons"] = 
					-- {
						-- [1] = 
						-- {
							-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						-- }, -- end of [1]
						-- [2] = 
						-- {
							-- ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						-- }, -- end of [2]
						-- [3] = 
						-- {
							-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						-- }, -- end of [3]
						-- [7] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [7]
						-- [8] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [8]
						-- [9] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [9]
						-- [11] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [11]
						-- [12] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [12]
						-- [13] = 
						-- {
							-- ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						-- }, -- end of [13]
						-- [18] = 
						-- {
							-- ["CLSID"] = "{E1F29B21-F291-4589-9FD8-3272EEC69506}",
						-- }, -- end of [18]
						-- [19] = 
						-- {
							-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						-- }, -- end of [19]
						-- [17] = 
						-- {
							-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
						-- }, -- end of [17]
					-- }, -- end of ["pylons"]
					-- ["fuel"] = "10246",
					-- ["flare"] = 60,
					-- ["chaff"] = 120,
					-- ["gun"] = 100,
				-- },
			-- },
		},
	},
	["E-2C"] = {
		["AWACS"] = {
			["Default"] = {
				attributes = {"AEW"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 1,
				vCruise = 152.778,
				vAttack = 138.889,
				hCruise = 7315.2,
				hAttack = 7315.2,
				tStation = 14400,
				sortie_rate = 12,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "65000",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},	
	["F-16C_50"] = {
		["Intercept"] = {
			[" AIM-120B*4, AIM-9M*2, FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				-- vCruise = 270,
				-- vAttack = 270,
				-- hCruise = 6096,
				-- hAttack = 6096,
				-- standoff = 45000,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["AIM-120B*4, AIM-9M*2, FT*3"] = {
				attributes = {"Air Forces"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 46300,
				tStation = 7200,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
				{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3249,
				["flare"] = 60,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["AIM-120B*4, AIM-9M*2, FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
				{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				}, -- end of [11]
				}, -- end of ["pylons"]
				["fuel"] = 3249,
				["flare"] = 60,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
		},		
		["Fighter Sweep"] = {
			["AIM-120B*4, AIM-9M*2, FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
				["fuel"] = 3249,
				["flare"] = 60,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},
		},	
		-- ["Laser Illumination"] = {
			-- ["Laser Illumination"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 900000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 270,
				-- vAttack = 300,
				-- hCruise = 7096,
				-- hAttack = 7096,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = false,
				-- --- self_escort = false,
				-- sortie_rate = 4,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 10,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					-- ["num"] = 5,
				-- },
				-- [6] = {
					-- ["CLSID"] = "ALQ_184",
					-- ["num"] = 6,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 4,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 9,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 8,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 2,
				-- },
			-- },	
 				-- ["fuel"] = 3249,
				-- ["flare"] = 60,
				-- ["chaff"] = 60,
				-- ["gun"] = 100,
				-- },
			-- },	
		-- },
		["SEAD"] = {
			["SEAD LR - AGM-88*2, AIM-9M*2, AIM-120B*2, Fuel*3"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				},
				}, -- end of ["pylons"]
 				["fuel"] = 3249,
				["flare"] = 60,
				["chaff"] = 60,
				["gun"] = 100,
				},
			},	
		},
		["Strike"] = {
			["Strike GBU-10*2, AIM-120B*2, AIM-9M*2, FUEL*3, TP"] = {
			minscore = 0.2,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
					day = true,
					night = false,
					adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 7000,
				hAttack = 7100,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 8,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Strike GBU-12*4, AIM-120B*2, AIM-9M*2, FUEL*2, TP"] = {
			minscore = 0.2,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge", "soft", "Parked Aircraft", "SAM"},
					weaponType = "Guided bombs",
					expend = "Auto",
					day = true,
					night = false,
					adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 7000,
				hAttack = 7100,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 8,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{TER_9A_2R*GBU-12}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{TER_9A_2R*GBU-12}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [11]
				}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			-- ["Strike 2*AIM9M, 2*AIM120B, 2*GBU-38, ECM, 2*FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Bridge"},
					-- weaponType = "Guided bombs",
					-- expend = "Auto",
					-- day = true,
					-- night = true,
					-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 7000,
				-- hAttack = 7100,
				-- standoff = 20000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 10,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 9,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 2,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 8,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "ALQ_184",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{CAAC1CFD-6745-416B-AFA4-CB57414856D0}",
					-- ["num"] = 5,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 4,
				-- }, -- end of [10]
					-- }, -- end of ["pylons"]
					-- ["fuel"] = 3249,
					-- ["flare"] = 60,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["Strike 2*AIM9M, 2*AIM120B, 2*GBU-31, ECM, 2*FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure", "Bridge"},
					-- weaponType = "Guided bombs",
					-- expend = "Auto",
					-- day = true,
					-- night = true,
					-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 7000,
				-- hAttack = 7100,
				-- standoff = 20000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 10,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 9,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 2,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 8,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "ALQ_184",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{CAAC1CFD-6745-416B-AFA4-CB57414856D0}",
					-- ["num"] = 5,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					-- ["num"] = 4,
				-- }, -- end of [10]
					-- }, -- end of ["pylons"]
					-- ["fuel"] = 3249,
					-- ["flare"] = 60,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },			
			["Mk-82*6, AIM-120B*2, AIM-9M*2, FUEL*3, Pod"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{TER_9A_3*MK-82}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{TER_9A_3*MK-82}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Mk-84*2, AIM-120B*2, AIM-9M*2, FUEL*3, Pod"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [11]
				}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CBU-97*4, AIM-120B*2, AIM-9M*2, FT*3,pod"] = {
			minscore = 0.4,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{TER_9A_2R*CBU-97}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{TER_9A_2R*CBU-97}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [11]
				}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CBU-87*4, AIM-120B*2, AIM-9M*2, FT*3,pod"] = {
			minscore = 0.4,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
				[8] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "{TER_9A_2R*CBU-87}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{TER_9A_2R*CBU-87}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
					["num"] = 5,
				},
				[11] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 11,
				}, -- end of [11]
				}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},			
		},
	},	
	["F/A-18C"] = {
		["Intercept"] = {
			["AIM-120*6,AIM-9*2,Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 400000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				},
				["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["Day, AIM-120*6,AIM-9*2,Fuel"] = {
				attributes = {"Air Forces"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 450000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},					
				},
				["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["Day, AIM-120*6,AIM-9*2,Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 450000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 266.66666666667,
				-- hCruise = 6096,
				-- hAttack = 6096,
				standoff = 36000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},					
				},
				["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},		
		["Fighter Sweep"] = {
			["Day, AIM-120*6,AIM-9*2,Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 450000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 266.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},					
				},
				["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},		
		["SEAD"] = {
			["AGM-88*4, AIM-9M*2, AIM-120B*1, ECM*1, Fuel*1"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 3,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{1C2B16EB-8EB0-43de-8788-8EBB2D70B8BC}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				}, -- end of ["pylons"]
                ["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
			["AGM-88*2, AIM-9M*2, AIM-120B*1, ECM*1, Fuel*3"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{1C2B16EB-8EB0-43de-8788-8EBB2D70B8BC}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{EFEC8201-B922-11d7-9897-000476191836}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				}, -- end of ["pylons"]
                ["fuel"] = "4900",
                ["flare"] = 15,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},
	},
	["FA-18C_hornet"] = {
		["SEAD"] = {
			-- ["AGM-88C*4, AIM-9M*2, AIM-120B*2, Fuel*1"] = {
				-- attributes = {},
				-- weaponType = "ASM",
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 270,
				-- vAttack = 270,
				-- hCruise = 7096,
				-- hAttack = 7096,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 3,
				-- stores = {
				-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- }, -- end of ["pylons"]
                -- ["fuel"] = "4900",
                -- ["flare"] = 30,
                -- ["chaff"] = 60,
                -- ["gun"] = 100,
				-- },
			-- },
			["LR - AGM-88C*2, AIM-9M*2, AIM-120B*2, Fuel*3"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 7096,
				hAttack = 7096,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
                ["fuel"] = "4900",
                ["flare"] = 30,
                ["chaff"] = 60,
                ["gun"] = 100,
				},
			},
		},
		["Intercept"] = {
			["AIM-120B*4 - AIM-9M*6 - FT"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 400000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{LAU-115 - AIM-120B}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{LAU-115 - AIM-120B}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
			},
				["fuel"] = "4900",
                ["flare"] = 30,
                ["chaff"] = 60,
                ["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			[" AIM-120B*6 - AIM-9M*2 - FT*3"] = {
				attributes = {"CV CAP"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 350000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
			},
				["fuel"] = "4900",
                ["flare"] = 30,
                ["chaff"] = 60,
                ["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			-- [" MR - AIM-120B*4 - AIM-9M*6 - FT"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 255.83333333333,
				-- vAttack = 266.66666666667,
				-- hCruise = 6096,
				-- hAttack = 6096,
				-- standoff = 36000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					-- ["num"] = 2,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{LAU-115 - AIM-120B}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{LAU-115 - AIM-120B}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
			-- },
				-- ["fuel"] = "4900",
                -- ["flare"] = 30,
                -- ["chaff"] = 60,
                -- ["gun"] = 100,
				-- },
			-- },
			[" LR - AIM-120B*6 - AIM-9M*2 - FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 266.66666666667,
				-- hCruise = 6096,
				-- hAttack = 6096,
				standoff = 36000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
			},
				["fuel"] = "4900",
                ["flare"] = 30,
                ["chaff"] = 60,
                ["gun"] = 100,
				},
			},			
		},		
		["Fighter Sweep"] = {
			-- [" MR - AIM-120B*4 - AIM-9M*6 - FT"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 255.83333333333,
				-- vAttack = 266.66666666667,
				-- hCruise = 6096,
				-- hAttack = 6096,
				-- standoff = 36000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "LAU-115_2*LAU-127_AIM-9M",
					-- ["num"] = 2,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{LAU-115 - AIM-120B}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{LAU-115 - AIM-120B}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
			-- },
				-- ["fuel"] = "4900",
                -- ["flare"] = 30,
                -- ["chaff"] = 60,
                -- ["gun"] = 100,
				-- },
			-- },
			[" LR - AIM-120B*6 - AIM-9M*2 - FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 266.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU-115_2*LAU-127_AIM-120B",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
			},
				["fuel"] = "4900",
                ["flare"] = 30,
                ["chaff"] = 60,
                ["gun"] = 100,
				},
			},
		},
		["Anti-ship Strike"] = {
			["Mav AGM-65F*4, AIM-120B*1, AIM-9M*2, Pod, FT"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
					["Laser Illumination"] = false,					
				},
				attributes = {"soft"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = false,
				adverseWeather = false,
				range = 250000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 9000,
				tStation = nil,
				LDSD = true,
				-- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{AAQ-28_LEFT}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			-- ["Mav LR AGM-65F*2 - AIM-120B*2 - AIM-9M*2 - FT*3"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
					-- ["Laser Illumination"] = false,					
				-- },
				-- attributes = {"ship"},
				-- weaponType = "ASM",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 650000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = 9000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 3,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
		["Antiship AGM-84D*2, AIM-9M*2, AIM-120B*2, DP, FT*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
					["Laser Illumination"] = false,					
				},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 50000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{AGM_84D}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{AGM_84D}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[5] = {
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},	
		},	
		["Strike"] = {
			-- ["Strike GBU-38*4, AIM-120B*2, AIM-9M*2, FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{GBU-38}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["Strike LR GBU-38*4, AIM-120B*1, AIM-9M*2, Pod, FT*3"] = {
			-- minscore = 0.3,
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 650000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 7486.4,
				-- hAttack = 7472,
				-- standoff = 20000,
				-- tStation = nil,
				-- LDSD = true,
				-- - self_escort = true,
				-- sortie_rate = 6,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{BRU55_2*GBU-38}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{BRU55_2*GBU-38}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{AAQ-28_LEFT}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["Strike LR GBU-31*2, AIM-120B*1, AIM-9M*2, Pod, FT*3"] = {
			-- minscore = 0.3,
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure", "Bridge"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 650000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 7486.4,
				-- hAttack = 7472,
				-- standoff = 20000,
				-- tStation = nil,
				-- LDSD = true,
				-- - self_escort = true,
				-- sortie_rate = 6,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{AAQ-28_LEFT}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["Strike GBU-31*4, AIM-120B*2, AIM-9M*2, FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure", "Bridge"},
				-- weaponType = "Guided bombs",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{GBU-31}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },			
			-- ["Mav AGM-65F*4, AIM-120B*2, AIM-9M*2, FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
					-- ["Laser Illumination"] = false,					
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM"},
				-- weaponType = "ASM",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = 9000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 3,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "LAU_117_AGM_65F",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			["Strike GBU-12*4, AIM-120B*1, AIM-9M*2, DP,FT*3"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 7486.4,
				hAttack = 7472,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{BRU33_2X_GBU-12}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{BRU33_2X_GBU-12}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{AAQ-28_LEFT}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Strike GBU-16*2, AIM-120B*1, AIM-9M*2, DP,FT*3"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 7486.4,
				hAttack = 7472,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{AAQ-28_LEFT}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},			
			["Mav LR AGM-65F*2 - AIM-120B*1 - AIM-9M*2 - Pod, FT*3"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
					["Laser Illumination"] = false,					
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 9000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[8] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "LAU_117_AGM_65F",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{AAQ-28_LEFT}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},			
			-- ["Mav Laser - AGM-65E*4, AIM-120B*2, AIM-9M*2, FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
					-- ["Laser Illumination"] = true,					
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM", "ship"},
				-- weaponType = "ASM",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = 18000,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}",
					-- ["num"] = 3,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },		
			-- ["SR MK82*10 - AIM-120B*2 - AIM-9M*2"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 5,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 8,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 2,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["MR MK82*8 - AIM-120B*2 - AIM-9M*2 - FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 8,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{BRU33_2X_MK-82}",
					-- ["num"] = 2,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			["LR MK82*4 - AIM-120B*2 - AIM-9M*2 - FT*3"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[8] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 2,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			-- ["SR MK84*5 - AIM-120B*2 - AIM-9M*2"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 250000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 5,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 8,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 2,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["MR MK84*4 - AIM-120B*2 - AIM-9M*2 - FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"Structure"},
				-- weaponType = "Bombs",
				-- expend = "All",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 4572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 8,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					-- ["num"] = 2,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			["LR  MK84*2 - AIM-120B*2 - AIM-9M*2 - FT*3"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[9] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 9,
				},
				[1] = {
					["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					["num"] = 1,
				},
				[6] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					["num"] = 4,
				},
				[8] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{FPU_8A_FUEL_TANK}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
					["num"] = 2,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4900",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			-- ["MR Zuni*32 - - AIM-120B*2 - AIM-9M*2 - FT"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft"},
				-- weaponType = "Rockets",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 350000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 1,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 3,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
			-- ["LR Zuni*16 - AIM-120B*2 - AIM-9M*2 - FT*3"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft"},
				-- weaponType = "Rockets",
				-- expend = "Auto",
				-- day = true,
				-- night = true,
				-- adverseWeather = false,
				-- range = 650000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 300.5,
				-- hCruise = 5486.4,
				-- hAttack = 572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = true,
				-- sortie_rate = 1,
				-- stores = {
					-- ["pylons"] = {
				-- [9] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{BRU33_2*LAU10}",
					-- ["num"] = 2,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 3,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{FPU_8A_FUEL_TANK}",
					-- ["num"] = 5,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4900",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
		},		
	},
	["F-14B"] = {
		["Intercept"] = {
			["AIM-54C-MK47*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 12,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
			AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
		},
		["Iran"] = {
				attributes = {"IRIAF"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
			-- ["Intercept AIM-54C-MK47*6, AIM-9M*2, XT*2"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 1,
				-- stores = {
			-- ["pylons"] = {
				-- [10] = {
					-- ["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					-- ["num"] = 10,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{SHOULDER AIM_54C_Mk47 R}",
					-- ["num"] = 9,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{F14-300gal}",
					-- ["num"] = 8,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{AIM_54C_Mk47}",
					-- ["num"] = 7,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{AIM_54C_Mk47}",
					-- ["num"] = 6,
				-- },
				-- [5] = {
					-- ["CLSID"] = "{AIM_54C_Mk47}",
					-- ["num"] = 5,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{AIM_54C_Mk47}",
					-- ["num"] = 4,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{F14-300gal}",
					-- ["num"] = 3,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{SHOULDER AIM_54C_Mk47 L}",
					-- ["num"] = 2,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					-- ["num"] = 1,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "7348",
					-- ["flare"] = 60,
					-- ["chaff"] = 140,
					-- ["gun"] = 100,
				-- },
				-- AddPropAircraft = 
	-- {
		-- ["LGB100"] = 6,
		-- ["M61BURST"] = 0,
		-- ["IlsChannel"] = 11,				-- preset ILS channel
		-- ["LGB1"] = 8,
		-- ["KY28Key"] = 1,
		-- ["TacanBand"] = 0,
		-- ["ALE39Loadout"] = 3,
		-- ["UseLAU138"] = true,
		-- ["LGB10"] = 8,
		-- ["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		-- ["TacanChannel"] = 37,				-- preset TACAN channel
		-- ["LGB1000"] = 1,
	-- },
			-- },
		},
		["CAP"] = {
			["AIM-54C-MK47*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {"CV CAP"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 213.83333333333,
				vAttack = 213.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 3600,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 12,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Iran"] = {
				attributes = {"IRIAF"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 213.83333333333,
				vAttack = 213.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 3600,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
		},
		["Escort"] = {
			["AIM-54C-MK47*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 5,
				vCruise = 255.83333333333,
				standoff = 80300,
				-- tStation = 7200,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 8,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
		},		
		["Fighter Sweep"] = {
			["AIM-54C-MK47*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 5,
				vCruise = 255.83333333333,
				vAttack = 315.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 7200,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
		},
		["Strike"] = {
			["Strike Mk 82"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- --- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{MAK79_MK82 4}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{MAK79_MK82 4}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{MAK79_MK82 3R}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{MAK79_MK82 3L}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},	
			},
			["Strike Mk 84"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 MK-84}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 MK-84}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike Mk 20"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike GBU-16"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike GBU-12"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
		},		
	},	
	["F-5E-3"] = {
		["Intercept"] = {
			["AIM-9P*2, Fuel_275*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 200000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["Day, AIM-9P*2, Fuel_275*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 270000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["AIM-9P*2, Fuel_275*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				-- vAttack = 270,
				-- hCruise = 6096,
				-- hAttack = 6096,
				standoff = 28000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["AIM-9P*2, Fuel_275*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["MR, Mk-82*4, AIM-9P*2, Fuel_275*1"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["SR, Mk-82*5, AIM-9P*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 4876.8,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{MER-5E_MK82x5}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["OCA, Mk-83*2, AIM-9P*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Parked Aircraft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 3048,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["Mk-84*1, AIM-9P*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
						[4] = 
						{
							["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			--[[["MR, CBU-52*4, AIM-9P*2, Fuel_275*1"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "SA-6"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 4572,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			]]--},
			--[[["SR, CBU-52*4, AIM-9P*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "SA-6", "SR"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 130000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 4572,
				hCruise = 4876.8,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CBU-52B}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			]]--},
		},
	},
	["F-14A-135-GR"] = {
		["Intercept"] = {
			["Iran"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
		},
		["CAP"] = {
			["Iran"] = {
				attributes = {"IRIAF"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 213.83333333333,
				vAttack = 213.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 3600,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
		},
		["Escort"] = {
			["Iran"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 5,
				vCruise = 255.83333333333,
				standoff = 80300,
				-- tStation = 7200,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
		},		
		["Fighter Sweep"] = {
			["Iran"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 213.83333333333,
				vAttack = 213.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 3600,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9L}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7M}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54A_Mk47}",
					["num"] = 4,
				},
				[5] = {
					["CLSID"] = "{BELLY AIM-7M}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
		{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
		},
			},
		},
		["Strike"] = {
			["Strike Mk 82"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- --- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{MAK79_MK82 4}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{MAK79_MK82 4}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{MAK79_MK82 3R}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{MAK79_MK82 3L}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},	
			},
			["Strike Mk 84"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{AIM_54C_Mk47}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 MK-84}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 MK-84}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike Mk 20"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 MK-20}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike GBU-16"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 GBU-16}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
			["Strike GBU-12"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Bridge"},
					weaponType = "Guided bombs",
					expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
				[10] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{LAU-138 wtip - AIM-9M}",
					["num"] = 1,
				},
				[9] = {
					["CLSID"] = "{F14-LANTIRN-TP}",
					["num"] = 9,
				},
				[2] = {
					["CLSID"] = "{SHOULDER AIM-7MH}",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 8,
				},
				[3] = {
					["CLSID"] = "{F14-300gal}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 7,
				},
				[4] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{BRU-32 GBU-12}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = 
	{
		["LGB100"] = 6,
		["M61BURST"] = 0,
		["IlsChannel"] = 11,				-- preset ILS channel
		["LGB1"] = 8,
		["KY28Key"] = 1,
		["TacanBand"] = 0,
		["ALE39Loadout"] = 3,
		["UseLAU138"] = true,
		["LGB10"] = 8,
		["INSAlignmentStored"] = true,		-- fast alignment, remember to modify also the value: "startup_time_player" in this file
		["TacanChannel"] = 37,				-- preset TACAN channel
		["LGB1000"] = 1,
	},
			},
		},		
	},	
	["F-4E"] = {
		["Anti-ship Strike"] = {
			["Anti-Ship Strike AGM-65K*4,AIM-7M*4,Fuel*3"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 10000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
                {
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[8] = {
					["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB27}",
					["num"] = 8,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB28}",
					["num"] = 2,
				},
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
                }, -- end of ["pylons"]	
				["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Intercept"] = {
			["AIM-7M*4,AIM-9*4,Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 400000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
			},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["AIM-9M*4, AIM-7M*4, Fuel*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
			},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},		
		["Fighter Sweep"] = {
			["AIM-9M*4, AIM-7M*4, Fuel*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
			},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["Day, AIM-7M*4,AIM-9M*4,Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 450000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
					["num"] = 8,
				},
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
			},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["SEAD"] = {
			["AGM-45*4, AIM-7M*2, Fuel*1, ECM"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
					[9] = {
						["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						["num"] = 9,
					},
					[1] = {
						["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						["num"] = 1,
					},
					[8] = {
						["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						["num"] = 8,
					},
					[2] = {
						["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						["num"] = 2,
					},
					[5] = {
						["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
						["num"] = 5,
					},
					[7] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 7,
					},
					[6] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 6,
					},
					[4] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 4,
					},
					[3] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 3,
					},
				}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Strike Heavy Mk84*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
					weaponType = "Bombs",
					expend = "All",
					day = true,
					night = false,
					adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
					[8] = {
						["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						["num"] = 8,
					},
					[2] = {
						["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						["num"] = 2,
					},
					[7] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 7,
					},
					[3] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 3,
					},
					[9] = {
						["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						["num"] = 9,
					},
					[6] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 6,
					},
					[4] = {
						["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						["num"] = 4,
					},
					[1] = {
						["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						["num"] = 1,
					},
					[5] = {
						["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
						["num"] = 5,
					},
				}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Mk-82*6, AIM-7M*4, Fuel*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
					["num"] = 8,
				},
				[2] = {
					["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 3,
				},
				[9] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 9,
				},
				[6] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					["num"] = 4,
				},
				[1] = {
					["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					["num"] = 5,
				},
			}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			-- ["Rockets, AIM-7M*4, Fuel*2"] = {
				-- support = {
					-- ["Escort"] = true,
					-- ["SEAD"] = true,
				-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM"},
				-- weaponType = "Rockets",
				-- expend = "All",
				-- day = true,
				-- night = false,
				-- adverseWeather = false,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 277.5,
				-- hCruise = 5486.4,
				-- hAttack = 1572,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = true,
				-- --- self_escort = false,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [5] = {
					-- ["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
					-- ["num"] = 5,
				-- },
				-- [6] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 6,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 4,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 7,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 3,
				-- },
				-- [8] = {
					-- ["CLSID"] = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",
					-- ["num"] = 8,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",
					-- ["num"] = 2,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					-- ["num"] = 9,
				-- },
				-- [1] = {
					-- ["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
					-- ["num"] = 1,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "4864",
					-- ["flare"] = 30,
					-- ["chaff"] = 60,
					-- ["gun"] = 100,
				-- },
			-- },
		},		
	},
	["F-117A"] = {
		["Strike"] = {
			["GBU-27*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "All",
				day = false,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 120,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 8534.4,
				hAttack = 8534.4,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{EF0A9419-01D6-473B-99A3-BEBDB923B14D}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "3840",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["GBU-10*2"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "All",
				day = false,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 120,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 8534.4,
				hAttack = 8534.4,
				standoff = 15000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = "3840",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},
	["B-52H"] = {
		["Strike"] = {
			["Mk-84*18"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = false,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 1,
				firepower = 30,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = 25000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1.5,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{696CFFC4-0BDE-42A8-BE4B-0BE3D9DD723C}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{696CFFC4-0BDE-42A8-BE4B-0BE3D9DD723C}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
				},
			},
			["Strike TF  AGM-84A*8"] = {
			minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = false,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 1,
				firepower = 30,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 8315.2,
				hAttack = 8315.2,
				standoff = 110000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1.5,
				stores = {
					["pylons"] = 
					{
						[2] = {
					["CLSID"] = "{46ACDCF8-5451-4E26-BDDB-E78D5830E93C}",
					["num"] = 2,
					}, -- end of [1]
					}, -- end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
					},
			},	
		},
	},
	["E-3A"] = {
		["AWACS"] = {
			["Default"] = {
				attributes = {"Sentry"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 231.25,
				vAttack = 231.25,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = nil,
				tStation = 36000,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 12,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "65000",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},
	["KC130"] = {
		["Refueling"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 216.66666666667,
				vAttack = 216.66666666667,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = nil,
				tStation = 21600,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
				["fuel"] = 20830,
                ["flare"] = 60,
                ["chaff"] = 120,
                ["gun"] = 100,
				},
			},
		},
	},
	["S-3B Tanker"] = {
		["Refueling"] = {
			["Low Track"] = {
				attributes = {"low"},
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 0.4,
				firepower = 1,
				vCruise = 200,
				vAttack = 150,
				hCruise = 1828.8,
				hAttack = 1828.8,
				tStation = 10800,
				sortie_rate = 12,
				stores = {
					["pylons"] = {},
					["fuel"] = 7813,
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["Medium Track"] = {
				attributes = {"medium"},
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 0.4,
				firepower = 1,
				vCruise = 200,
				vAttack = 150,
				hCruise = 6096,
				hAttack = 6096,
				tStation = 10800,
				sortie_rate = 12,
				stores = {
					["pylons"] = {},
					["fuel"] = 7813,
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
	},	
	["KC-135"] = {
		["Refueling"] = {
			["Default"] = {
				attributes = {"KC135"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 216.66666666667,
				vAttack = 216.66666666667,
				hCruise = 7000,
				hAttack = 7000,
				standoff = nil,
				tStation = 21600,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},
	["KC135MPRS"] = {
		["Refueling"] = {
			["Default"] = {
				attributes = {"KC135MPRS"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 220.66666666667,
				vAttack = 220.66666666667,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = nil,
				tStation = 21600,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},
	["SA342M"] = {
		["Strike"] = {
			["Strike Hot3x4, IR Deflector"] = {
				minscore = 0.1,
				support = {
						["Escort"] = false,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				attackType = "Dive",
				day = true,
				night = true,
				adverseWeather = true,
				range = 80000,
				capability = 1,
				firepower = 1,
				vCruise = 40,
				vAttack = 55,
				hCruise = 200,
				hAttack = 100,
				standoff = 4000,
				tStation = nil,
				LDSD = false,
				-- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[1] = {
					["CLSID"] = "{HOT3D}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{HOT3G}",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "{HOT3D}",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "{HOT3G}",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "{IR_Deflector}",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
                ["fuel"] = 275,
                ["flare"] = 32,
                ["chaff"] = 0,
                ["gun"] = 100,
				},
			},
		},
	},
	["AH-1W"] = {
		["Strike"] = {
			["Strike"] = {
				minscore = 0.3,
					support = {
						["Escort"] = false,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 80000,
				capability = 5,
				firepower = 10,
				vCruise = 55,
				vAttack = 55,
				hCruise = 50,
				hAttack = 50,
				standoff = 4000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = {
				[4] = {
					["CLSID"] = "{3EA17AB0-A805-4D9E-8732-4CE00CB00F17}",
					["num"] = 4,
				},
				[1] = {
					["CLSID"] = "{3EA17AB0-A805-4D9E-8732-4CE00CB00F17}",
					["num"] = 1,
				},
			}, -- end of ["pylons"]
                ["fuel"] = 1250,
                ["flare"] = 30,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},
	},	
	["IL-78M"] = {
		["Refueling"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 226.66666666667,
				vAttack = 226.66666666667,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = nil,
				tStation = 21600,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90000,
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
		},
	},	
	["C-130"] = {
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 154.16666666667,
				vAttack = 154.16666666667,
				hCruise = 4572,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "20830",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},
	["CH-47D"] = {
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 40,
				vAttack = 40,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 5,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "3600",
					["flare"] = 120,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},
	["UH-1H"] = {
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 40,
				vAttack = 40,
				hCruise = 500,
				hAttack = 500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 5,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "631",
					["flare"] = 60,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},
	["MiG-29A"] = {
		["Intercept"] = {
			["R-27R*2, R-60M*4, Fuel*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3380",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["R-27R*2, R-60M*4, Fuel*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 700000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 7011,
				-- hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [7]
				}, -- end of ["pylons"]
				["fuel"] = "3380",
				["flare"] = 30,
				["chaff"] = 30,
				["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["R-27R*2, R-60M*4, Fuel*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 400000,
				capability = 1,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 215.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 27000,
				tStation = 2700,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [7]
				}, -- end of ["pylons"]
				["fuel"] = "3380",
				["flare"] = 30,
				["chaff"] = 30,
				["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["R-27R*2, R-60M*4, Fuel*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 600000,
				capability = 1,
				firepower = 1,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
					}, -- end of [4]
					[5] = 
					{
						["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [6]
					[7] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					}, -- end of [7]
				}, -- end of ["pylons"]
				["fuel"] = "3380",
				["flare"] = 30,
				["chaff"] = 30,
				["gun"] = 100,
				},
			},	
		},		
	},		
	["MiG-25PD"] = {
		["Intercept"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = false,
				-- --- self_escort = true,
				sortie_rate = 1,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
			["R-40R*2, R-40T*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 1,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, -- end of [4]
					}, -- end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
		},
	},
	["Su-27"] = {
		["Intercept"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --- self_escort = true,
				sortie_rate = 3,
				stores = {
				["pylons"] = {
					[1] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						["num"] = 1,
					},
					[2] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 2,
					},
					[3] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 3,
					},
					[4] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 4,
					},
					[5] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 5,
					},
					[6] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 6,
					},
					[7] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 7,
					},
					[8] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 8,
					},
					[9] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 9,
					},
					[10] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						["num"] = 10,
					},
				},	
				["fuel"] = 9400,
				["flare"] = 96,
				["ammo_type"] = 1,
				["chaff"] = 96,
				["gun"] = 100,
				},
			},	
		},	
		["Fighter Sweep"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability =  10,
				firepower = 1,
				vCruise = 255.222,
				vAttack = 265.555,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 45000,
				tStation = 2700,
				LDSD = true,
				--- self_escort = true,
				sortie_rate = 2,
				stores = {
				["pylons"] = {
					[1] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						["num"] = 1,
					},
					[2] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 2,
					},
					[3] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 3,
					},
					[4] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 4,
					},
					[5] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 5,
					},
					[6] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 6,
					},
					[7] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 7,
					},
					[8] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 8,
					},
					[9] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 9,
					},
					[10] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						["num"] = 10,
					},
				},
				["fuel"] = 9400,
				["flare"] = 96,
				["ammo_type"] = 1,
				["chaff"] = 96,
				["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability =  10,
				firepower = 1,
				vCruise = 255.222,
				-- vAttack = 265.555,
				-- hCruise = 7500,
				-- hAttack = 5500,
				standoff = 45000,
				tStation = 2700,
				LDSD = true,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
				["pylons"] = {
					[1] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						["num"] = 1,
					},
					[2] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 2,
					},
					[3] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 3,
					},
					[4] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 4,
					},
					[5] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 5,
					},
					[6] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 6,
					},
					[7] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 7,
					},
					[8] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 8,
					},
					[9] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 9,
					},
					[10] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						["num"] = 10,
					},
				},
				["fuel"] = 9400,
				["flare"] = 96,
				["ammo_type"] = 1,
				["chaff"] = 96,
				["gun"] = 100,
				},
			},
		},		
		["CAP"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 600000,
				capability =  5,
				firepower = 1,
				vCruise = 222.222,
				vAttack = 250.555,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 45000,
				tStation = 3700,
				LDSD = false,
				--- self_escort = true,
				sortie_rate = 3,
				stores = {
				["pylons"] = {
					[1] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						["num"] = 1,
					},
					[2] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 2,
					},
					[3] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 3,
					},
					[4] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 4,
					},
					[5] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 5,
					},
					[6] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 6,
					},
					[7] = {
						["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						["num"] = 7,
					},
					[8] = {
						["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						["num"] = 8,
					},
					[9] = {
						["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 9,
					},
					[10] = {
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						["num"] = 10,
					},
				},
				["fuel"] = 9400,
				["flare"] = 96,
				["ammo_type"] = 1,
				["chaff"] = 96,
				["gun"] = 100,
				},
			},
		},
	},
	["A-50"] = {
		["AWACS"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 231.25,
				vAttack = 231.25,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = nil,
				tStation = 36000,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1.2,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "70000",
                    ["flare"] = 192,
					["chaff"] = 192,
                    ["gun"] = 100,
				},
			},
		},
	},	
	-- ["F-14A"] = {
		-- ["Intercept"] = {
			-- ["AIM-54C*2,AIM-9*2,AIM-7*3, FT*2"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = false,
				-- - self_escort = false,
				-- sortie_rate = 1,
				-- stores = {
			-- ["pylons"] = {
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 2,
				-- },
				-- [11] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 11,
				-- },
				-- [12] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 12,
				-- },
				-- [10] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 10,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 3,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 9,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "7348",
					-- ["flare"] = 15,
					-- ["chaff"] = 30,
					-- ["gun"] = 100,
				-- },
			-- },
		-- },
		-- ["CAP"] = {
			-- ["AIM-54C*2,AIM-9*2,AIM-7*3, FT*2"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 215.83333333333,
				-- vAttack = 215.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				-- standoff = 100300,
				-- tStation = 7200,
				-- LDSD = true,
				-- - self_escort = true,
				-- sortie_rate = 2,
				-- stores = {
			-- ["pylons"] = {
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 2,
				-- },
				-- [11] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 11,
				-- },
				-- [12] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 12,
				-- },
				-- [10] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 10,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 3,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 9,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "7348",
					-- ["flare"] = 15,
					-- ["chaff"] = 30,
					-- ["gun"] = 100,
				-- },
			-- },
		-- },
		-- ["Escort"] = {
			-- ["AIM-54C*2,AIM-9*2,AIM-7*3, FT*2"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				-- standoff = 100300,
				-- tStation = nil,
				-- LDSD = true,
				-- - self_escort = true,
				-- sortie_rate = 1,
				-- stores = {
			-- ["pylons"] = {
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 2,
				-- },
				-- [11] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 11,
				-- },
				-- [12] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 12,
				-- },
				-- [10] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 10,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 3,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 9,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "7348",
					-- ["flare"] = 15,
					-- ["chaff"] = 30,
					-- ["gun"] = 100,
				-- },
			-- },
		-- },		
		-- ["Fighter Sweep"] = {
			-- ["AIM-54C*2,AIM-9*2,AIM-7*3, FT*2"] = {
				-- attributes = {},
				-- weaponType = nil,
				-- expend = nil,
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 500000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				-- standoff = 100300,
				-- tStation = nil,
				-- LDSD = true,
				-- - self_escort = true,
				-- sortie_rate = 1,
				-- stores = {
			-- ["pylons"] = {
				-- [1] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 1,
				-- },
				-- [2] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 2,
				-- },
				-- [11] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 11,
				-- },
				-- [12] = {
					-- ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
					-- ["num"] = 12,
				-- },
				-- [10] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 10,
				-- },
				-- [3] = {
					-- ["CLSID"] = "{82364E69-5564-4043-A866-E13032926C3E}",
					-- ["num"] = 3,
				-- },
				-- [9] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 9,
				-- },
				-- [7] = {
					-- ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
					-- ["num"] = 7,
				-- },
				-- [4] = {
					-- ["CLSID"] = "{7575BA0B-7294-4844-857B-031A144B2595}",
					-- ["num"] = 4,
				-- },
			-- }, -- end of ["pylons"]
					-- ["fuel"] = "7348",
					-- ["flare"] = 15,
					-- ["chaff"] = 30,
					-- ["gun"] = 100,
				-- },
			-- },
		-- },		
	-- },	
	["Tu-22M3"] = {	
		["Anti-ship Strike"] = {
		minscore = 0.3,
			["Antiship  Kh-22N*3"] = {
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 300000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 4,
				stores = {
				["pylons"] = 
                {
					[5] = {
					["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
					["num"] = 5,
					},
					[1] = {
					["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
					["num"] = 1,
					},
					[3] = {
					["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
					["num"] = 3,
					}, -- end of [8]
                }, -- end of ["pylons"]	
				["fuel"] = "50000",
                ["flare"] = 48,
                ["chaff"] = 48,
                ["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Strike 500 kg*33"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = false,
				night = true,
				adverseWeather = false,
				range = 1000000,
				capability = 1,
				firepower = 40,
				vCruise = 250,
				vAttack = 400,
				hCruise = 8000,
				hAttack = 8000,
				standoff = 25000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
			["pylons"] = {
				[3] = {
					["CLSID"] = "{AD5E5863-08FC-4283-B92C-162E2B2BD3FF}",
					["num"] = 3,
				},
			},	
				["fuel"] = "50000",
                ["flare"] = 48,
                ["chaff"] = 48,
                ["gun"] = 100,
				},
			},	
		},	
	},		
	["Su-24M"] = {
		["Anti-ship Strike"] = {
			["Antiship, R-60M*4, Kh-59M*2, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 40000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = 
                {
					[1] = 
					{
						["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "{40AB87E8-BEFB-4D85-90D9-B2753ACF9514}",
					}, -- end of [2]
					[5] = 
					{
						["CLSID"] = "{16602053-4A12-40A2-B214-AB60D481B20E}",
					}, -- end of [5]
					[7] = 
					{
						["CLSID"] = "{40AB87E8-BEFB-4D85-90D9-B2753ACF9514}",
					}, -- end of [7]
					[8] = 
					{
						["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
					}, -- end of [8]
                }, -- end of ["pylons"]	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},
		},		
		["SEAD"] = {
			["SEAD  Kh58*2_R60*4_L-081"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 80000,
				capability = 1,
				firepower = 1,
				vCruise = 330,
				vAttack = 450,
				hCruise = 8000,
				hAttack = 8000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
			["pylons"] = {
				[1] = {
					["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{FE382A68-8620-4AC0-BDF5-709BFE3977D7}",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{FE382A68-8620-4AC0-BDF5-709BFE3977D7}",
					["num"] = 7,
				},
				[8] = {
					["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
					["num"] = 8,
				},
				}, -- end of ["pylons"]
 				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},	
		},
		["Laser Illumination"] = {
			["Laser Illumination, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = false,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 270,
				vAttack = 300,
				hCruise = 7096,
				hAttack = 7096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
					["num"] = 2,
				},
			},	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},	
		},
		["Strike"] = {
			["BGL, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
						["Laser Illumination"] = true,
					},
				attributes = {"soft", "Structure"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 7096,
				hAttack = 7096,
				standoff = 15000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 6,
				stores = {
			["pylons"] = {
				[8] = {
					["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
					["num"] = 8,
				},
				[1] = {
					["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "{39821727-F6E2-45B3-B1F0-490CC8921D1E}",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
					["num"] = 2,
				},
			},	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},	
			["Bombs 1, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 5,
					},
					[6] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 6,
					},
					[7] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 8,
					},
				},	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},	
			["Bombs 2, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 5,
					},
					[6] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 6,
					},
					[7] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 8,
					},
				},	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},
			["Bombs 3, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 1,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 10,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 5,
					},
					[6] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 6,
					},
					[7] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						["num"] = 8,
					},
				},	
				["fuel"] = "11700",
                ["flare"] = 96,
                ["chaff"] = 96,
                ["gun"] = 100,
				},
			},
		},		
	},
	["Su-25T"] = {
		["SEAD"] = {
			["ARM, Fuel*2, ECM"] = {
				attributes = {},
				weaponType = "ASM",
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 80000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82D}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 5,
					},
					[6] = 
					{
						["CLSID"] = "{0519A264-0AB6-11d6-9193-00A0249B6F00}",
						["num"] = 6,
					},
					[7] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						["num"] = 8,
					},
					[9] = 
					{
						["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						["num"] = 9,
					},
					[10] = 
					{
						["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
						["num"] = 10,
					},
					[11] = 
					{
						["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82C}",
						["num"] = 11,
					},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},	
		},
		["Strike"] = {
			["Bombs 1, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"SAM", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 3,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 5,
					},
					[7] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 8,
					},
					[9] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 9,
					},
					[10] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 10,
					},
					[11] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 11,
					},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},
			["Bombs 2, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 3,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 5,
					},
					[7] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 8,
					},
					[9] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 9,
					},
					[10] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 10,
					},
					[11] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 11,
					},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},
			["Bombs 3, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 3,
				stores = {
				["pylons"] = 
				{
					[1] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 1,
					},
					[2] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 2,
					},
					[3] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 3,
					},
					[4] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 4,
					},
					[5] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 5,
					},
					[7] = 
					{
						["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						["num"] = 7,
					},
					[8] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 8,
					},
					[9] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 9,
					},
					[10] = 
					{
						["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						["num"] = 10,
					},
					[11] = 
					{
						["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						["num"] = 11,
					},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},
			["BGL, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
						["Laser Illumination"] = true,
					},
				attributes = {"Structure", "soft"},
				weaponType = "Guided bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 800000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 5000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1,
				stores = {
				["pylons"] = {
				[11] = {
					["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					["num"] = 11,
				},
				[10] = {
					["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
					["num"] = 10,
				},
				[1] = {
					["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
					["num"] = 2,
				},
				[6] = {
					["CLSID"] = "{B1EF6B0E-3D91-4047-A7A5-A99E7D8B4A8B}",
					["num"] = 6,
				},
				[9] = {
					["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
					["num"] = 7,
				},
				[5] = {
					["CLSID"] = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}",
					["num"] = 5,
				},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},
			["Standoff, R-60M*4, Fuel"] = {
			minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 800000,
				capability = 1,
				firepower = 1,
				vCruise = 230,
				vAttack = 250,
				hCruise = 500,
				hAttack = 1000,
				standoff = 3000,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
				["pylons"] = {
				[11] = {
					["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					["num"] = 11,
				},
				[1] = {
					["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
					["num"] = 1,
				},
				[10] = {
					["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
					["num"] = 10,
				},
				[2] = {
					["CLSID"] = "{CBC29BFE-3D24-4C64-B81D-941239D12249}",
					["num"] = 2,
				},
				[9] = {
					["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
					["num"] = 9,
				},
				[3] = {
					["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "{B1EF6B0E-3D91-4047-A7A5-A99E7D8B4A8B}",
					["num"] = 6,
				},
				[8] = {
					["CLSID"] = "{F789E86A-EE2E-4E6B-B81E-D5E5F903B6ED}",
					["num"] = 8,
				},
				[4] = {
					["CLSID"] = "{F789E86A-EE2E-4E6B-B81E-D5E5F903B6ED}",
					["num"] = 4,
				},
				}, -- end of ["pylons"]
                ["fuel"] = "3790",
                ["flare"] = 128,
                ["chaff"] = 128,
                ["gun"] = 100,
				},
			},
			-- ["Rockets, R-60M*4, Fuel"] = {
					-- support = {
						-- ["Escort"] = true,
						-- ["SEAD"] = true,
					-- },
				-- attributes = {"soft", "Parked Aircraft", "SAM"},
				-- weaponType = "Rockets",
				-- expend = "All",
				-- day = true,
				-- night = true,
				-- adverseWeather = true,
				-- range = 800000,
				-- capability = 1,
				-- firepower = 1,
				-- vCruise = 230,
				-- vAttack = 250,
				-- hCruise = 500,
				-- hAttack = 100,
				-- standoff = nil,
				-- tStation = nil,
				-- LDSD = false,
				-- --- self_escort = false,
				-- sortie_rate = 2,
				-- stores = {
				-- ["pylons"] = 
				-- {
					-- [1] = 
					-- {
						-- ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						-- ["num"] = 1,
					-- },
					-- [2] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 2,
					-- },
					-- [3] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 3,
					-- },
					-- [4] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 4,
					-- },
					-- [5] = 
					-- {
						-- ["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						-- ["num"] = 5,
					-- },
					-- [7] = 
					-- {
						-- ["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						-- ["num"] = 7,
					-- },
					-- [8] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 8,
					-- },
					-- [9] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 9,
					-- },
					-- [10] = 
					-- {
						-- ["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						-- ["num"] = 10,
					-- },
					-- [11] = 
					-- {
						-- ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						-- ["num"] = 11,
					-- },
				-- }, -- end of ["pylons"]
                -- ["fuel"] = "3790",
                -- ["flare"] = 128,
                -- ["chaff"] = 128,
                -- ["gun"] = 100,
				-- },
			-- },
		},		
	},
	["An-26B"] = {
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 154.16666666667,
				vAttack = 154.16666666667,
				hCruise = 3500,
				hAttack = 3500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "5500",
					["flare"] = 384,
					["chaff"] = 384,
					["gun"] = 100,
				},
			},
		},
	},	
	["MiG-23MLD"] = {
		["Intercept"] = {
			["R-24R*2, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 3,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["R-24R*1, R-24T*1, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 3,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
	},
	["MiG-21Bis"] = {
		["Intercept"] = {
			["R-60*4, R-3R*2, Fuel_800*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 1,
				firepower = 1,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 1,
				stores = {
			["pylons"] = {
				[3] = {
					["CLSID"] = "{PTB_490C_MIG21}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{R-3R}",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "{R-3R}",
					["num"] = 4,
				},
				[1] = {
					["CLSID"] = "{R-60 2L}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{R-60 2R}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{ASO-2}",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["R-60*4, R-3R*2, Fuel_450*1"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 300000,
				capability =  10,
				firepower = 1,
				vCruise = 230.222,
				vAttack = 250.555,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 45000,
				tStation = 2700,
				LDSD = false,
				--- self_escort = false,
				sortie_rate = 3,
				stores = {
			["pylons"] = {
				[3] = {
					["CLSID"] = "{PTB_800_MIG21}",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "{R-3R}",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "{R-3R}",
					["num"] = 4,
				},
				[1] = {
					["CLSID"] = "{R-60 2L}",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "{R-60 2R}",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "{ASO-2}",
					["num"] = 6,
				},
			}, -- end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
		},		
	},
}
	