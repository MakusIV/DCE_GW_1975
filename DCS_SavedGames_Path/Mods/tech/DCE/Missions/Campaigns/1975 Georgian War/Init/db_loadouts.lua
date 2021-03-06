--Loadouts database
-------------------------------------------------------------------------------------------------------
------PB0_CEF -------------------Loadout OB----------------------------------
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
			capability = 10,											--Number, how good is the aircraft with this loadout. The higher the better
			firepower = 10,												--Number, how much firepower has this loadout. The higher the better
			vCruise = 225,												--Number, cruise speed in m/s
			vAttack = 280,												--Number, attack speed in m/s
			hCruise = 6000,												--Number, cruise altitude in m
			hAttack = 100,												--Number, attack altitude in m
			standoff = 5000,											--Number, attack distance from target in m. Determines attack waypoint distance for A-G with missiles (for Bombss use nil) and engage distance for A-A tasks
			tStation = 1200,											--Number, seconds the aircraft can remain on station. Only used by CAP, AWACS and Refuelling tasks
			LDSD = true,												--Boolean, aircraft is Look-Down/Shoot-Down capable. Only used by CAP and Intercept tasks
			self_escort = false,										--Boolean, aircraft can defend itself against fighters. Only used by A-G tasks
			sortie_rate = 6,											--Number, average amount of sorties that aircraft flies per day
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

--[[ 
	
la valutazione sull'idoneit?? di un aereo a svolgere una missione ?? effettuata  considerando i seguenti parametri:

targetlist.target.firepower.min: rappresenta il valore minimo dei num.missili/bombe lanciati da tutti gli aerei impegnati sul quel target)
unit.lodaout.firepower: rappresenta il valore  della capacit?? di tutti i num.missili/bombe montati sull'aereo e utilizzabili sul target elencato nel task

(in ATO_Generator ?? presente la riga target.firepower.min <= aircraft_available * unit_loadouts[l].firepower)

Il calcolo degli aerei necessari per una missione ?? fatto con:
local aircraft_requested = target.firepower.max / unit_loadouts[l].firepower

capability F-14A: intercept=10, sweep=5, cap=5, escort=5, strike=5
capability AJS37: strike=5, antiship=7
capability F-5E: intercept=1, sweep=3, cap=3, escort=5, strike=3, antiship=1
capability F-4E: intercept=5, sweep=5, cap=5, escort=5, strike=4, antiship=1, sead=10


capability Mig-21Bis: intercept=7, sweep=5, cap=5, escort=5, strike=3, antiship=1
capability Mig-25MLD: intercept=10, sweep=7, cap=10, escort=5
capability Mig-19: intercept=3, sweep=2, cap=3, escort=3, strike=1, antiship=1
capability L-39A: intercept=5, sweep=5, cap=5, escort=5, strike=3, antiship=1
capability Su-24M: strike=3, antiship=nil, sead=3
capability Su-17: strike=3, antiship=3, sead=5
capability Mig-27K: strike=3, antiship=3, sead=5
capability Mig-23: intercept=7, sweep=7, cap=7, escort=7, strike=3, antiship=1


-- F-14A, Mig-21, Mig-23, F-5E Fighter
-- L-39A, F-4E, AJS37, Mig-27, Su-17,  Fighter bomber
-- Tu-22M, B-52H, Su-24 Bomber

-- strike fighter capability: 1-3
-- strike fighter firepower: 1*weapon firepower

-- strike fighter/bomber capability: 5-7
-- strike fighter/bomber firepower: 1.7*weapon firepower

-- strike bomber capability: >9
-- strike bomber firepower: 2.5*weapon firepower


-- weapon firepower
-- m/71, mk-82, fab-250=1-3-5, 
-- m/75, mk-83, fab 500, KAB 500, GBU-10=3-5-8(9), 
-- mk-84, mk-20(CBU), BK90 (CBU)=5-7-10(11),
-- fab-1500 = 7-9-12(13)
-- rockets=2-4-6, 
-- ASM=3-5-7 

]]

db_loadouts = {

    -- Nato

	["E-3A"] = { -- 1975 (primo volo), 1977 (entrata in servizio)
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
				--self_escort = false,
				sortie_rate = 1.2,
				stores = {
					["pylons"] =
					{
					}, -- --end of ["pylons"]
					["fuel"] = "65000",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},

	["E-2C"] = {  --- 1973 (in servizio)
		["AWACS"] = {
			["Default"] = {
				attributes = {},
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
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
					}, -- --end of ["pylons"]
					["fuel"] = "65000",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},

	["F-14A-135-GR"] = { --1970 (primo volo) 1974 (entrata in servizio),
		["Intercept"] = {
			["TF-Old-AIM-54A-MK60*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 8,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				self_escort = false,
				sortie_rate = 12,
				stores = {
					["pylons"] = {
						[10] = {
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
							["num"] = 10,
						},
						[9] = {
							["CLSID"] = "{SHOULDER AIM-7MH}",
							["num"] = 9,
						},
						[8] = {
							["CLSID"] = "{F14-300gal}",
							["num"] = 8,
						},
						[7] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 7,
						},
						[6] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 5,
						},
						[4] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 4,
						},
						[3] = {
							["CLSID"] = "{F14-300gal}",
							["num"] = 3,
						},
						[2] = {
							["CLSID"] = "{SHOULDER AIM-7MH}",
							["num"] = 2,
						},
						[1] = {
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
							["num"] = 1,
						},
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft =
					{
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				----preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		----fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				----preset TACAN channel
					["LGB1000"] = 1,
					},
			},
		},
		["CAP"] = {
			["TF-Old-AIM-54A-MK60*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 8,
				vCruise = 213.83333333333,
				vAttack = 213.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 3600,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[10] = {
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
							["num"] = 10,
						},
						[9] = {
							["CLSID"] = "{SHOULDER AIM-7MH}",
							["num"] = 9,
						},
						[8] = {
							["CLSID"] = "{F14-300gal}",
							["num"] = 8,
						},
						[7] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 7,
						},
						[6] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 5,
						},
						[4] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 4,
						},
						[3] = {
							["CLSID"] = "{F14-300gal}",
							["num"] = 3,
						},
						[2] = {
							["CLSID"] = "{SHOULDER AIM-7MH}",
							["num"] = 2,
						},
						[1] = {
							["CLSID"] = "{LAU-138 wtip - AIM-9M}",
							["num"] = 1,
						},
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft =
				{
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				----preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		----fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				----preset TACAN channel
					["LGB1000"] = 1,
				},
			},
		},
		["Escort"] = {
			["TF-Old-AIM-54A-MK60*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 8,
				vCruise = 255.83333333333,
				standoff = 80300,
				tStation = 7200,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
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
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 7,
						},
						[6] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 5,
						},
						[4] = {
							["CLSID"] = "{AIM_54A_Mk60}",
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
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				----preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		----fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				----preset TACAN channel
					["LGB1000"] = 1,
				},
			},
		},
		["Fighter Sweep"] = {
			["TF-Old-AIM-54A-MK60*4, AIM-7M*2, AIM-9M*2, XT*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 8,
				vCruise = 255.83333333333,
				vAttack = 315.83333333333,
				hCruise = 9753.6,
				hAttack = 9753.6,
				standoff = 100300,
				tStation = 7200,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
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
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 7,
						},
						[6] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 5,
						},
						[4] = {
							["CLSID"] = "{AIM_54A_Mk60}",
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
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				--preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		--fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				--preset TACAN channel
					["LGB1000"] = 1,
				},
			},
		},
		["Strike"] = {
			--[[ --Note:Lantirn 1987
			["Strike TF GBU-12*4, AIM-9M*2, AIM-7M*1, Lantirn, FT*2"] = { -- lantirn 1980 (sviluppo)  1987 (in servizio) NO
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 245.83333333333,
				vAttack = 300.5,
				hCruise = 7486.4,
				hAttack = 6572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
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
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				--preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		--fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				--preset TACAN channel
					["LGB1000"] = 1,
				},-- lantirn 1980 (sviluppo)  1987 (in servizio) NO SOSTITUIRE CON MKxx e Rockets
			},
			["Strike TF GBU-16*4, AIM-9M*2, AIM-7M*1,Lantirn, FT*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 245.83333333333,
				vAttack = 300.5,
				hCruise = 7486.4,
				hAttack = 6572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
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
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				--preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		--fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				--preset TACAN channel
					["LGB1000"] = 1,
				}, -- lantirn 1980 (sviluppo)  1987 (in servizio) NO
			},			
			["Strike TF GBU-10*2, AIM-54C,*2AIM-9M*2, AIM-7M*1,Lantirn, FT*2"] = { 
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = false,
				range = 650000,
				capability = 1,
				firepower = 1,
				vCruise = 245.83333333333,
				vAttack = 300.5,
				hCruise = 7486.4,
				hAttack = 6572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
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
							["CLSID"] = "{BRU-32 GBU-10}",
							["num"] = 7,
						},
						[4] = {
							["CLSID"] = "{BRU-32 GBU-10}",
							["num"] = 4,
						},
						[6] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 5,
						},
					}, ----end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				--preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		--fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				--preset TACAN channel
					["LGB1000"] = 1,
				},
			},
			]]
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
				capability = 3,
				firepower = 1,
				vCruise = 250,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 3,
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
					}, -- --end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
						["LGB100"] = 6,
						["M61BURST"] = 0,
						["IlsChannel"] = 11,				-- --preset ILS channel
						["LGB1"] = 8,
						["KY28Key"] = 1,
						["TacanBand"] = 0,
						["ALE39Loadout"] = 3,
						["UseLAU138"] = true,
						["LGB10"] = 8,
						["INSAlignmentStored"] = true,		-- --fast alignment, remember to modify also the value: "startup_time_player" in this file
						["TacanChannel"] = 37,				-- --preset TACAN channel
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
				capability = 3,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 3,
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
							["CLSID"] = "{AIM_54A_Mk60}",
							["num"] = 7,
						},
						[4] = {
							["CLSID"] = "{AIM_54A_Mk60}",
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
					}, -- --end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
						["LGB100"] = 6,
						["M61BURST"] = 0,
						["IlsChannel"] = 11,				-- --preset ILS channel
						["LGB1"] = 8,
						["KY28Key"] = 1,
						["TacanBand"] = 0,
						["ALE39Loadout"] = 3,
						["UseLAU138"] = true,
						["LGB10"] = 8,
						["INSAlignmentStored"] = true,		-- --fast alignment, remember to modify also the value: "startup_time_player" in this file
						["TacanChannel"] = 37,				-- --preset TACAN channel
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
				capability = 3,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 3,
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
					}, -- --end of ["pylons"]
					["fuel"] = "7348",
					["flare"] = 60,
					["chaff"] = 140,
					["gun"] = 100,
				},
				AddPropAircraft = {
					["LGB100"] = 6,
					["M61BURST"] = 0,
					["IlsChannel"] = 11,				-- --preset ILS channel
					["LGB1"] = 8,
					["KY28Key"] = 1,
					["TacanBand"] = 0,
					["ALE39Loadout"] = 3,
					["UseLAU138"] = true,
					["LGB10"] = 8,
					["INSAlignmentStored"] = true,		-- --fast alignment, remember to modify also the value: "startup_time_player" in this file
					["TacanChannel"] = 37,				-- --preset TACAN channel
					["LGB1000"] = 1,
				},
			},
		},
	},

	["KC-135"] = { --1957 (entrata in servizio)
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
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] =
					{
					}, ----end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},

	["KC135MPRS"] = { --1957 (entrata in servizio)
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
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] =
					{
					}, ----end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},

	["AJS37"] = {-- 1971 (entrata in servizio)
		["Anti-ship Strike"] = {
			["Antiship - RB 15F*2 - RB-74J*2 - RB-24J*2 - FT"] = {--RB-15 dal 1985
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 7,
				vCruise = 250.83333333333,
				vAttack = 215.5,
				hCruise = 3500,
				hAttack = 1000,
				standoff = 35000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[4] = {
							["CLSID"] = "{VIGGEN_X-TANK}",
							["num"] = 4,
						},
						[7] = {
							["CLSID"] = "{Robot24J}",
							["num"] = 7,
						},
						[1] = {
							["CLSID"] = "{Robot24J}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{Rb15}",
							["num"] = 6,
						},
						[2] = {
							["CLSID"] = "{Rb15}",
							["num"] = 2,
						},
						[5] = {
							["CLSID"] = "{Robot74}",
							["num"] = 5,
						},
						[3] = {
							["CLSID"] = "{Robot74}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 4476,
					["flare"] = 36,
					["chaff"] = 105,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["CAS - Bomb M/71*8 - ECM*2 - RB-24J*2 - FT"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 1,
				vCruise = 250.83333333333,
				vAttack = 350.5,
				hCruise = 500,
				hAttack = 300,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
				["pylons"] = {
					[4] = {
						["CLSID"] = "{VIGGEN_X-TANK}",
						["num"] = 4,
					},
					[7] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 7,
					},
					[1] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 1,
					},
					[6] = {
						["CLSID"] = "{U22A}",
						["num"] = 6,
					},
					[2] = {
						["CLSID"] = "{KB}",
						["num"] = 2,
					},
					[5] = {
						["CLSID"] = "{M71BOMB}",
						["num"] = 5,
					},
					[3] = {
						["CLSID"] = "{M71BOMB}",
						["num"] = 3,
					},
				}, ----end of ["pylons"]
				["fuel"] = 4476,
				["flare"] = 36,
				["chaff"] = 105,
				["gun"] = 100,
				},
			},
			["CAS - Bomb M/71 chute*8 - ECM*2 - RB-24J*2 - FT"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 1,
				vCruise = 250.83333333333,
				vAttack = 350.5,
				hCruise = 500,
				hAttack = 200,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
				["pylons"] = {
					[4] = {
						["CLSID"] = "{VIGGEN_X-TANK}",
						["num"] = 4,
					},
					[7] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 7,
					},
					[1] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 1,
					},
					[6] = {
						["CLSID"] = "{U22A}",
						["num"] = 6,
					},
					[2] = {
						["CLSID"] = "{KB}",
						["num"] = 2,
					},
					[5] = {
						["CLSID"] = "{M71BOMBD}",
						["num"] = 5,
					},
					[3] = {
						["CLSID"] = "{M71BOMBD}",
						["num"] = 3,
					},
				}, ----end of ["pylons"]
				["fuel"] = 4476,
				["flare"] = 36,
				["chaff"] = 105,
				["gun"] = 100,
				},
			},
			["CAS - RB-75T*2 - ECM*2 - RB-24J*2 - FT"] = {
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
				capability = 7,
				firepower = 5,
				vCruise = 250.83333333333,
				vAttack = 350.5,
				hCruise = 6000,
				hAttack = 5572,
				standoff = 6000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
				["pylons"] = {
					[4] = {
						["CLSID"] = "{VIGGEN_X-TANK}",
						["num"] = 4,
					},
					[7] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 7,
					},
					[1] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 1,
					},
					[6] = {
						["CLSID"] = "{U22A}",
						["num"] = 6,
					},
					[2] = {
						["CLSID"] = "{KB}",
						["num"] = 2,
					},
					[5] = {
						["CLSID"] = "{RB75T}",
						["num"] = 5,
					},
					[3] = {
						["CLSID"] = "{RB75T}",
						["num"] = 3,
					},
				}, ----end of ["pylons"]
				["fuel"] = 4476,
				["flare"] = 36,
				["chaff"] = 105,
				["gun"] = 100,
				},
			},
			["CAS - BK90 (MJ1)*2 - ECM*2 - RB-24J*2 - XT"] = {
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
				capability = 7,
				firepower = 7,
				vCruise = 250.83333333333,
				vAttack = 350.5,
				hCruise = 100,
				hAttack = 200,
				standoff = 9000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
				["pylons"] = {
					[2] = {
						["CLSID"] = "{KB}",
						["num"] = 2,
					},
					[6] = {
						["CLSID"] = "{U22A}",
						["num"] = 6,
					},
					[4] = {
						["CLSID"] = "{VIGGEN_X-TANK}",
						["num"] = 4,
					},
					[5] = {
						["CLSID"] = "{BK90}",
						["num"] = 5,
					},
					[3] = {
						["CLSID"] = "{BK90}",
						["num"] = 3,
					},
					[7] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 7,
					},
					[1] = {
						["CLSID"] = "{Robot24J}",
						["num"] = 1,
					},
				}, ----end of ["pylons"]
				["fuel"] = 4476,
				["flare"] = 36,
				["chaff"] = 105,
				["gun"] = 100,
				},
			},
			["ASM AGM-65A-B TV Guided Rb-24 Fuel"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM", "Structure"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 3,
				vCruise = 250.83333333333,
				vAttack = 350.5,
				hCruise = 1000,
				hAttack = 1000,
				standoff = 9000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{Robot24}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{RB75B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{RB75}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{VIGGEN_X-TANK}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{RB75}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{RB75B}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{Robot24}",
						}, -- end of [7]
					},
					["fuel"] = 4476,
					["flare"] = 72,
					["chaff"] = 210,
					["gun"] = 100,
				},
			},
		},
	},

	["B-52H"] = { --1952 (primo volo) 1955 (entrata in servizio)
		["Strike"] = {
			["Strike Mk-84*18"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 10,
				firepower = 30,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 8315.2,
				hAttack = 8315.2,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1.5,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{696CFFC4-0BDE-42A8-BE4B-0BE3D9DD723C}",
						}, --end of [1]
						[3] =
						{
							["CLSID"] = "{696CFFC4-0BDE-42A8-BE4B-0BE3D9DD723C}",
						}, --end of [3]
					}, ----end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
				},
			},
			["Strike Mk-20 Cluster Bombs "] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "SAM", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 10,
				firepower = 30,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 8315.2,
				hAttack = 8315.2,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1.3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{4CD2BB0F-5493-44EF-A927-9760350F7BA1}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{4CD2BB0F-5493-44EF-A927-9760350F7BA1}",
						}, -- end of [3]
					}, ----end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
				},
			},
			--[[
			["Strike TF  AGM-86C*20"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"Base", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 10,
				firepower = 1.5,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 8315.2,
				hAttack = 8315.2,
				standoff = 130000,
				ingress = 50000,
				egress = 10000,
				MaxAttackOffset = 60,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] = {
							["CLSID"] = "{8DCAF3A3-7FCF-41B8-BB88-58DEDA878EDE}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
							["num"] = 3,
						},
						[1] = {
							["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
							["num"] = 1,
						},
					}, ----end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
					},
				},
		},
		]]
		--[[
			["Strike TF medium  AGM-86C*20"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"Base", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 10,
				firepower = 1.5,
				vCruise = 231.25,
				vAttack = 256.94444444444,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = 130000,
				ingress = 50000,
				egress = 10000,
				MaxAttackOffset = 60,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] = {
							["CLSID"] = "{8DCAF3A3-7FCF-41B8-BB88-58DEDA878EDE}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
							["num"] = 3,
						},
						[1] = {
							["CLSID"] = "{45447F82-01B5-4029-A572-9AAD28AF0275}",
							["num"] = 1,
						},
					}, ----end of ["pylons"]
					["fuel"] = "141135",
					["flare"] = 192,
					["chaff"] = 1125,
					["gun"] = 100,
			},
		]]
		},
	},

	["S-3B Tanker"] = { --1972 (primo volo) 1974 (entrata in servizio)
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

	["F-5E-3"] = {--1959 (primo volo) 1972 (entrata in servizio)
		["Strike"] = {
			["GTA CAS1/STRIKE Mk-82SE*4,AIM-9P*2,Fuel 275"] = {
				minscore = 0.1,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = true,
				range = 360000,
				capability = 3,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 2486.4,
				hAttack = 2572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
						[1] = {
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
							["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{Mk82SNAKEYE}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{Mk82SNAKEYE}",
							["num"] = 3,
						},
						[4] = {
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
							["num"] = 4,
						},
						[5] = {
							["CLSID"] = "{Mk82SNAKEYE}",
							["num"] = 5,
						},
						[6] = {
							["CLSID"] = "{Mk82SNAKEYE}",
							["num"] = 6,
						},
						[7] = {
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
							["num"] = 7,
						}, -- --end of [7]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["GTA CAS2/STRIKE CBU-52B*4,AIM-9P*2,Fuel 275"] = {
				minscore = 0.1,
				support = {
					["Escort"] = false,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 3,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 2876.8,
				hAttack = 2572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
						[1] = {
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
							["num"] = 1,
					},
						[4] = {
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
							["num"] = 4,
					},
						[7] = {
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
							["num"] = 7,
					},
						[5] = {
							["CLSID"] = "{CBU-52B}",
							["num"] = 5,
					},
						[3] = {
							["CLSID"] = "{CBU-52B}",
							["num"] = 3,
					},
						[6] = {
							["CLSID"] = "{CBU-52B}",
							["num"] = 6,
					},
						[2] = {
							["CLSID"] = "{CBU-52B}",
							["num"] = 2,
						},
						}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["MR, Mk-82*4, AIM-9P*2, Fuel_275*1"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 3,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
						[5] =
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- --end of [5]
						[6] =
						{
							["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["SR, Mk-82*5, AIM-9P*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 130000,
				capability = 3,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 4876.8,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{MER-5E_MK82x5}",
						}, -- --end of [4]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["OCA, Mk-83*2, AIM-9P*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 3,
				firepower = 3,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 3048,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[3] =
						{
							["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
						[5] =
						{
							["CLSID"] = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}",
						}, -- --end of [5]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["Mk-84*1, AIM-9P*2"] = {
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
				capability = 3,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						}, -- --end of [4]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
			["MR, CBU-52*4, AIM-9P*2, Fuel_275*1"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "SAM", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 3,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 4572,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{CBU-52B}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{CBU-52B}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
						[5] =
						{
							["CLSID"] = "{CBU-52B}",
						}, -- --end of [5]
						[6] =
						{
							["CLSID"] = "{CBU-52B}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
					}, -- --end of ["pylons"]
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
		["Intercept"] = {
			["Day, AIM-9P*2, Fuel"] = {
				attributes = {},
				day = true,
				night = false,
				adverseWeather = false,
				range = 350000,
				capability = 1,
				firepower = 1,
				LDSD = false,
				sortie_rate = 12,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
					}, -- --end of ["pylons"]
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
				capability = 3,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 36000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			}
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
				capability = 5,
				firepower = 1,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 28000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
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
				capability = 3,
				firepower = 1,
				vCruise = 215.83333333333,
				vAttack = 215.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 27000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [1]
						[7] =
						{
							["CLSID"] = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}",
						}, -- --end of [7]
						[4] =
						{
							["CLSID"] = "{0395076D-2F77-4420-9D33-087A4398130B}",
						}, -- --end of [4]
					},
					["fuel"] = 2046,
					["flare"] = 15,
					["ammo_type"] = 1,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
	},	

	["F-4E"] = {--1958 (primo volo) 1960 (entrata in servizio)
		["Intercept"] = {
			["GTA AIR/AIR AIM-9*4,AIM-7*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 400000,
				capability = 5,
				firepower = 5,
				-- vCruise = nil,
				-- vAttack = nil,
				-- hCruise = nil,
				-- hAttack = nil,
				-- standoff = nil,
				-- tStation = nil,
				LDSD = true,
				-- --self_escort = true,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
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
					},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["AIM-7E*4, AIM-9P*4, Fuel*2"] = {
				attributes = {},
				day = true,
				night = true,
				adverseWeather = true,
				range = 350000,
				capability = 5,
				firepower = 5,
				LDSD = false,
				sortie_rate = 12,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{AIM-7E}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{AIM-7E}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{AIM-7E}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{AIM-7E}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["AIM-9P*4, AIM-7M*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 5,
				firepower = 7,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["GTA AIR/AIR AIM-9*4,AIM-7*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 5,
				vCruise = 255.83333333333,
				-- vAttack = 265.83333333333,
				-- hCruise = 9753.6,
				-- hAttack = 9753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
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
					},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Day, AIM-9P*4, AIM-7M*4, Fuel*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 360000,
				capability = 5,
				firepower = 5,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 28000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Night, AIM-9P*4, AIM-7M*4, Fuel*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 5,
				firepower = 5,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 28000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["GTA AIR/AIR AIM-9*4,AIM-7*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 5,
				vCruise = 255.83333333333,
				vAttack = 265.83333333333,
				hCruise = 2753.6,
				hAttack = 2753.6,
				standoff = 46300,
				tStation = nil,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
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
					},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["AIM-9P*4, AIM-7M*4, Fuel*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 360000,
				capability = 5,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 215.83333333333,
				hCruise = 7011,
				hAttack = 7011,
				standoff = 37000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["GTA AIR/AIR Medium AIM-9*4,AIM-7*4"] = {
				attributes = {"medium"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 450000,
				capability = 5,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 4000,
				hAttack = 4000,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
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
					},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["GTA AIR/AIR Low AIM-9*4,AIM-7*4"] = {
				attributes = {"low"},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 450000,
				capability = 5,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 2000,
				hAttack = 2000,
				standoff = 36000,
				tStation = 1800,
				LDSD = true,
				--self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
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
					},
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAP, AIM-9P*4, AIM-7M*4, Fuel*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 200000,
				capability = 5,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 246.66666666667,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 55500,
				tStation = 7200,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["GTA CAS1 AGM-65K*4,AIM-7*2,Fuel*2,ECM"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
					weaponType = "ASM",
					expend = "Auto",
					day = true,
					night = false,
					adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 3486.4,
				hAttack = 2572,
				standoff = 2000,
				tStation = nil,
				LDSD = true,
				--self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = {
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
							["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB28}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
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
						[8] = {
							["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB27}",
							["num"] = 8,
						},
						[9] = {
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
							["num"] = 9,
						},
						}, -- --end of ["pylons"]
							["fuel"] = "4864",
							["flare"] = 30,
							["chaff"] = 60,
							["gun"] = 100,
						},
			},
			["GTA strike Mk-82*6,AIM-7*2,Fuel*2,ECM"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"SAM", "soft", "Parked Aircraft", "Structure", "SAM"},
					weaponType = "Bombs",
					expend = "All",
					day = true,
					night = false,
					adverseWeather = false,
				range = 500000,
				capability = 6,
				firepower = 3,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 3486.4,
				hAttack = 2572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = {
						["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
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
						[8] = {
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
							["num"] = 8,
						},
						[9] = {
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
							["num"] = 9,
						},
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["GTA CAS2 Mk20*6,AIM-7*2,Fuel*2,ECM"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 6,
				firepower = 7,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 3486.4,
				hAttack = 2572,
				standoff = nil,
				tStation = nil,
				LDSD = true,
				--self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = {
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
							["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{B83CB620-5BBE-4BEA-910C-EB605A327EF9}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
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
						[8] = {
							["CLSID"] = "{B83CB620-5BBE-4BEA-910C-EB605A327EF9}",
							["num"] = 8,
						},
						[9] = {
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
							["num"] = 9,
						},
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Mk-82*6, AIM-7M*3, ECM*1, Fuel*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "SAM", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 6,
				firepower = 3,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 3,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Mk-82*12, AIM-7M*3, ECM*1, Fuel*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "SAM", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 6,
				firepower = 6,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{60CC734F-0AFA-4E2E-82B8-93B941AB11CF}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Mk-84*2 AIM-7*2 ECM"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"hard", "Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 6,
				firepower = 7,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] = 
						{
							["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						}, -- end of [1]
						[3] = 
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[9] = 
						{
							["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}",
						}, -- end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["GBU-10*2, AIM-7M*3, ECM*1, Fuel*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,	
					["Laser Illumination"] = true,				
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Guided bombs",
				expend = "All",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 6,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 6096,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},			
			["ASN AGM-65D*4 AIM-7E ECM Fuel"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "SAM", "Bridge"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = false,
				adverseWeather = false,
				range = 360000,
				capability = 6,
				firepower = 5,
				vCruise = 215.83333333333,
				vAttack = 277.5,
				hCruise = 4876.8,
				hAttack = 4572,
				standoff = 11000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB28}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{D7670BC7-881B-4094-906C-73879CF7EB27}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["SEAD"] = {
			["Day, AGM-45*2, AIM-7M*3, ECM*1, Fuel*2"] = {
				attributes = {},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = false,
				adverseWeather = true,
				range = 360000,
				capability = 10,
				firepower = 5,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Night, AGM-45*2, AIM-7M*3, ECM*1, Fuel*2"] = {
				attributes = {},
				weaponType = "ASM",
				expend = "Auto",
				day = false,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 10,
				firepower = 5,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] =
					{
						[1] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [1]
						[2] =
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- --end of [2]
						[3] =
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- --end of [3]
						[4] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [4]
						[6] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [6]
						[7] =
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- --end of [7]
						[8] =
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- --end of [8]
						[9] =
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- --end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["ASM SEAD AGM45*4 AIM-7E EMC Fuel"] = {
				attributes = {},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 360000,
				capability = 10,
				firepower = 5,
				vCruise = 270,
				vAttack = 270,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] =
					{
						[1] = 
						{
							["CLSID"] = "{AGM_45A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6D21ECEA-F85B-4E8D-9D51-31DC9B8AA4EF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{AIM-7E}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{8B9E3FD0-F034-4A07-B6CE-C269884CC71B}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{AIM-7E}",
						}, -- end of [6]
						[8] = 
						{
							["CLSID"] = "{3E6B632D-65EB-44D2-9501-1C2D04515405}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{AGM_45A}",
						}, -- end of [9]
					}, -- --end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
	},

	["C-130"] = {--1954 (primo volo) 1957 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 500000,
				capability = 1,
				firepower = 1,
				vCruise = 154.16666666667,
				vAttack = 154.16666666667,
				hCruise = 2572,
				hAttack = 2572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
					}, -- --end of ["pylons"]
					["fuel"] = "20830",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				},
			},
		},
	},

	["UH-1H"] = {--? (primo volo) 1956 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 1,
				vCruise = 40,
				vAttack = 40,
				hCruise = 500,
				hAttack = 500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] =
					{
					}, -- --end of ["pylons"]
					["fuel"] = "631",
					["flare"] = 60,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Rockets Hydra-70*14 Minigun"] = {
				minscore = 0.3,
				support = {
						["Escort"] = false,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 40000,
				capability = 6,
				firepower = 4,
				vCruise = 55,
				vAttack = 55,
				hCruise = 50,
				hAttack = 50,
				standoff = 4000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {
					[1] = 
					{
						["CLSID"] = "M134_L",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "XM158_MK5",
					}, -- end of [2]
					[5] = 
					{
						["CLSID"] = "XM158_MK5",
					}, -- end of [5]
					[6] = 
					{
						["CLSID"] = "M134_R",
					}, -- end of [6]
				}, -- --end of ["pylons"]
                ["fuel"] = "631",
				["flare"] = 60,
				["chaff"] = 0,
				["gun"] = 100,
				},
			},
		},
	},

	["AH-1W"] = {--1967 (primo volo) 1973 (entrata in servizio)
		["Strike"] = {
			["Rockets Hard Hydra-70*28"] = {
				minscore = 0.3,
				support = {
						["Escort"] = false,
						["SEAD"] = false,
					},
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 40000,
				capability = 6,
				firepower = 4,
				vCruise = 55,
				vAttack = 55,
				hCruise = 50,
				hAttack = 50,
				standoff = 4000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {
					[1] = 
					{
						["CLSID"] = "M260_HYDRA",
					}, -- end of [1]
					[2] = 
					{
						["CLSID"] = "M260_HYDRA",
					}, -- end of [2]
					[3] = 
					{
						["CLSID"] = "M260_HYDRA",
					}, -- end of [3]
					[4] = 
					{
						["CLSID"] = "M260_HYDRA",
					}, -- end of [4]
				}, -- --end of ["pylons"]
                ["fuel"] = 1163,
                ["flare"] = 30,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
			["ASM AGM-114*8"] = {
				minscore = 0.3,
				support = {
						["Escort"] = false,
						["SEAD"] = false,
					},
				attributes = {"soft", "SAM", "Structure"},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 40000,
				capability = 6,
				firepower = 8,
				vCruise = 55,
				vAttack = 55,
				hCruise = 50,
				hAttack = 50,
				standoff = 4000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
				["pylons"] = {
					[1] = 
					{
						["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
					}, -- end of [1]
					[4] = 
					{
						["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
					}, -- end of [4]
				}, -- --end of ["pylons"]
                ["fuel"] = 1250,
                ["flare"] = 30,
                ["chaff"] = 30,
                ["gun"] = 100,
				},
			},
		},
	},




    -- URSS

	["Tu-22M3"] = { --1969 (primo volo) 1972 (entrata in servizio)
		["Strike"] = {
			["BAI FAB-500*33 FAB -250*36"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge", "hard"},
				weaponType = "Bombs",
				expend = "All",
				attackType = nil,
				day = false,
				night = true,
				adverseWeather = false,
				range = 900000,
				capability = 15,
				firepower = 30,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{AD5E5863-08FC-4283-B92C-162E2B2BD3FF}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
						}, -- end of [5]
					},
					["fuel"] = "50000",
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				},
			},
		},
		["Anti-ship Strike"] = {
			["Antiship  Kh-22N*3"] = { --1962
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "Auto",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 15,
				firepower = 30,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 200000,
				ingress = 50000,
				egress = 10000,
				MaxAttackOffset = 60,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = {
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
						}, --end of [8]
	       			}, ----end of ["pylons"]
					["fuel"] = "50000",
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				},
			},
			["Antiship  Kh-22N"] = { --1962
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 15,
				firepower = 15,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 200000,
				ingress = 50000,
				egress = 10000,
				MaxAttackOffset = 60,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[3] = 
						{
							["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
						}, -- end of [3]
	       			}, ----end of ["pylons"]
					["fuel"] = "50000",
					["flare"] = 48,
					["chaff"] = 48,
					["gun"] = 100,
				},
			},
		},
	},

	["Su-24MR"] = {--1967 (primo volo) 1974 (entrata in servizio)
		["Reconnaissance"] = {
			["Reco TANGAZH,ETHER,R-60M*2,Fuel*2"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 5,
				firepower = 1,
				vCruise = 250,
				vAttack = 350,
				hCruise = 10096,
				hAttack = 10096,
				standoff = nil,
				tStation = 2000,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = {
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
							["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
							["num"] = 2,
						},
						[5] = {
							["CLSID"] = "{0519A262-0AB6-11d6-9193-00A0249B6F00}",
							["num"] = 5,
						},
						[7] = {
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
							["num"] = 7,
						},
						[8] = {
							["CLSID"] = "{0519A261-0AB6-11d6-9193-00A0249B6F00}",
							["num"] = 8,
						}, --end of [8]
	        		}, ----end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["Reco"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 5,
				firepower = 1,
				vCruise = 250,
				vAttack = 350,
				hCruise = 10096,
				hAttack = 10096,
				standoff = nil,
				tStation = 2000,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "{0519A262-0AB6-11d6-9193-00A0249B6F00}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{0519A261-0AB6-11d6-9193-00A0249B6F00}",
						}, -- end of [8]
	        		}, ----end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
		},
		--[[
		["AWACS"] = {
			["Default"] = {
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 10,
				firepower = 1,
				vCruise = 250,
				vAttack = 350,
				hCruise = 10096,
				hAttack = 10096,
				standoff = nil,
				tStation = 36000,
				LDSD = false,
				self_escort = false,
				sortie_rate = 12,
				stores = {
					["pylons"] = {
						[1] = {
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
							["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
							["num"] = 2,
						},
						[5] = {
							["CLSID"] = "{0519A262-0AB6-11d6-9193-00A0249B6F00}",
							["num"] = 5,
						},
						[7] = {
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
							["num"] = 7,
						},
						[8] = {
							["CLSID"] = "{0519A261-0AB6-11d6-9193-00A0249B6F00}",
							["num"] = 8,
						}, --end of [8]
	        		}, ----end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},			
		},
		]]
	},

	["Su-24M"] = {--1967 (primo volo) 1974 (entrata in servizio)
		["Anti-ship Strike"] = {
			--[[
			["Antiship, R-60M*4, Kh-59M*2, Fuel"] = { -- kh 59 1980
				minscore = 0.5,
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
				capability = 5,
				firepower = 10,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = 40000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, ----end of [1]
						[2] =
						{
							["CLSID"] = "{40AB87E8-BEFB-4D85-90D9-B2753ACF9514}",
						}, --end of [2]
						[5] =
						{
							["CLSID"] = "{16602053-4A12-40A2-B214-AB60D481B20E}",
						}, --end of [5]
						[7] =
						{
							["CLSID"] = "{40AB87E8-BEFB-4D85-90D9-B2753ACF9514}",
						}, --end of [7]
						[8] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [8]
	        		}, ----end of ["pylons"]
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			]]
		},
		["SEAD"] = {
			["SEAD  Kh58*2_R60*4_L-081"] = { --kh 58  1978
				attributes = {},
				weaponType = "ASM",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 10,
				firepower = 7,
				vCruise = 330,
				vAttack = 450,
				hCruise = 8000,
				hAttack = 8000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
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
						}, ----end of ["pylons"]
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
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = false,
				range = 900000,
				capability = 3,
				firepower = 1,
				vCruise = 270,
				vAttack = 300,
				hCruise = 7096,
				hAttack = 7096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
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
			["CAS Fab100*30"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 5,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{F99BEC1A-869D-4AC7-9730-FBA0E3B1F5FC}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{F99BEC1A-869D-4AC7-9730-FBA0E3B1F5FC}",
						}, -- end of [2]
						[4] = 
						{
							["CLSID"] = "{F99BEC1A-869D-4AC7-9730-FBA0E3B1F5FC}",
						}, -- end of [4]
						[7] = 
						{
							["CLSID"] = "{F99BEC1A-869D-4AC7-9730-FBA0E3B1F5FC}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F99BEC1A-869D-4AC7-9730-FBA0E3B1F5FC}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS Rockets B-8*6"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 6,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["BAI Fab1500*2 R-60*4"] = {
				minscore = 0.6,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 12,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40AA4ABE-D6EB-4CD6-AEFE-A1A0477B24AB}",
						}, -- end of [2]
						[7] = 
						{
							["CLSID"] = "{40AA4ABE-D6EB-4CD6-AEFE-A1A0477B24AB}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["BAI Fab250*8"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 7,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["BAI Fab250*4 R-60M*4"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 5,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS Fab-500*2 UB-13*4"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Structure", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 9,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 6096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS S24*6"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 6,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS S25*2 Fuel*3"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 6,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
						}, -- end of [2]
						[5] = 
						{
							["CLSID"] = "{16602053-4A12-40A2-B214-AB60D481B20E}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{7D7EC917-05F6-49D4-8045-61FC587DD019}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS S25*6"] = {
				minscore = 0.5,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 6,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [3]
						[6] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS Fab-250*4 UB-32*4"] = {
				minscore = 0.5,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 6,
				vCruise = 250,
				vAttack = 300,
				hCruise = 6096,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [8]
					},
					["fuel"] = "11700",
					["flare"] = 96,
					["chaff"] = 96,
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
				attributes = {"Structure", "Bridge", "hard"},
				weaponType = "Guided bombs",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 9,
				firepower = 10,
				vCruise = 250,
				vAttack = 300,
				hCruise = 7096,
				hAttack = 7096,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
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
		},
	},

	["Mi-8MT"] = {--1961 (primo volo) 1967 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 1,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[8] = {
						["CLSID"] = "PKT_7_62",
						["num"] = 8,
						},
						[7] = {
						["CLSID"] = "KORD_12_7",
						["num"] = 7,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1929",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["CAS Rockets"] = {
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = 
						{
							["CLSID"] = "GUV_YakB_GSHP",
						}, -- end of [5]
						[2] = 
						{
							["CLSID"] = "GUV_YakB_GSHP",
						}, -- end of [2]
						[4] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [4]
						[3] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [3]
					}, ----end of ["pylons"]
					["fuel"] = "1929",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Bombs"] = {
				attributes = {"soft", "SAM", "Structure"},
				weaponType = "Bombs",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 7,
				firepower = 9,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FB3CE165-BF07-4979-887C-92B87F13276B}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "1929",
					["flare"] = 128,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},

	["Mi-24V"] = {--1969 (primo volo) 1972 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 1,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = {
						["CLSID"] = "{B919B0F4-7C25-455E-9A02-CEA51DB895E3}",
						["num"] = 1,
						},
						[2] = {
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
							["num"] = 2,
						},
						[5] = {
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
							["num"] = 5,
						},
						[6] = {
							["CLSID"] = "{B919B0F4-7C25-455E-9A02-CEA51DB895E3}",
							["num"] = 6,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1704",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["CAS Rockets"] = {
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "Auto",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 4,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [5]
					}, ----end of ["pylons"]
					["fuel"] = "1704",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Rockets Hard S-13*10"] = {
				attributes = {"soft", "hard", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 4,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[3] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
						}, -- end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "1414",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Rockets Soft S-5KO*128"] = {
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 4,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [5]
					}, ----end of ["pylons"]
					["fuel"] = "1363",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Rockets S-8KOM*40"] = {
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 4,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[3] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}",
						}, -- end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "1704",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Cannon Soft UPK-23*4 9M114*4"] = {
				attributes = {"soft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 6,
				firepower = 2,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{B919B0F4-7C25-455E-9A02-CEA51DB895E3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{B919B0F4-7C25-455E-9A02-CEA51DB895E3}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "1704",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},

	["A-50"] = { -- 1978 (primo volo) 1984 (entrata in servizio) SI in quanto in DCS non esiste un'altro AWACS per l'USSR
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
				sortie_rate = 1.2,
				stores = {
					["pylons"] =
					{
					}, ----end of ["pylons"]
					["fuel"] = "70000",
					["flare"] = 192,
					["chaff"] = 192,
					["gun"] = 100,
				},
			},
		}, -- 1978
	},

	["An-26B"] = {--1969 (primo volo) 1973 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 1,
				vCruise = 200.16666666667,
				vAttack = 200.16666666667,
				hCruise = 3500,
				hAttack = 3500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
					}, ----end of ["pylons"]
					["fuel"] = "5500",
					["flare"] = 384,
					["chaff"] = 384,
					["gun"] = 100,
				},
			},
		},
	},

	["MiG-21Bis"] = {--1955 (primo volo) 1959 (entrata in servizio) inserire Kh-66, S-24 e/o S-21
		["Anti-ship Strike"] = {
			["Antiship IPW R-3R*1, R-3S*1, FT800L, S-24B*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
					["Laser Illumination"] = false,
				},
				attributes = {"ship"},
				weaponType = "Rockets",
				expend = "Auto",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 2,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{S-24B}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{S-24B}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Antiship Strike - R-3R*1, R-3S*1, FT800L, FAB-500*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
					["Laser Illumination"] = false,
				},
				attributes = {"ship"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5000,
				hAttack = 5000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["ASM -Kh66*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 4,
				vCruise = 200,
				vAttack = 250,
				hCruise = 6500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{R-13M1}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{Kh-66_Grom}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{Kh-66_Grom}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-13M1}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
		},
		["Intercept"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 600000,
				capability = 10,
				firepower = 5,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 12,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 600000,
				capability = 8,
				firepower = 5,
				vCruise = 200,
				vAttack = 220,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 20000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 5,
				vCruise = 200,
				vAttack = 350,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 10000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 8,
				firepower = 5,
				vCruise = 200,
				vAttack = 250,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-250*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{R-3R}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-100*8"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 300000,
				capability = 3,
				firepower = 1,
				vCruise = 250,
				vAttack = 300,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{FAB-100-4}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{R-3R}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{FAB-100-4}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-500*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Bridge", "hard", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, UB16UM*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{UB-16_S5M}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{UB-16_S5M}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, S-24B*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "Structure"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{S-24B}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{S-24B}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["CAS Cluster Bombs Soft BL-755*2 RBK-250*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 5,
				vCruise = 200,
				vAttack = 250,
				hCruise = 6500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{08164777-5E9C-4B08-B48E-5AA7AFB246E2}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{08164777-5E9C-4B08-B48E-5AA7AFB246E2}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
			["CAS Rockets S-5M*32 S-24*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 6500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{UB-16_S5M}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{S-24B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{S-24B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{UB-16_S5M}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
			["BAI ASM -Kh66*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Structure", "SAM"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 6500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{R-13M1}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{Kh-66_Grom}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{PTB_800_MIG21}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{Kh-66_Grom}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{R-13M1}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{ASO-2}",
						}, -- end of [6]
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 40,
					["chaff"] = 18,
					["gun"] = 100,
				},
			},
		},
	},

	["Su-17M4"] = {--1967 (primo volo) 1972 (entrata in servizio)
		["Anti-ship Strike"] = {
			["IPW - AntishipStrike - FAB 500 M62*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
				},
				attributes = {"ship"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 5,
				firepower = 9,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[8] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 8,
						},
						[1] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 6,
						},
						[3] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {			
			["IPW - Strike - FAB 500 M62*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "Structure", "Bridge", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 8,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[8] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 8,
						},
						[1] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 6,
						},
						[3] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},
			["CAS Bombs FAB-250*16 R-60M*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 5,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{3E35F8C1-052D-11d6-9191-00A0249B6F00}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{3E35F8C1-052D-11d6-9191-00A0249B6F00}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
			["CAS Bombs FAB-500*6 R-60M*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge", "hard"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 9,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
			["IPW - Strike - RBK-500 PTAB-10-5*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 11,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[8] = {
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
							["num"] = 8,
						},
						[1] = {
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
							["num"] = 6,
						},
						[3] = {
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["IPW - Strike - S-13*25"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = flase,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 6,
				vCruise = 200,
				vAttack = 280,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[8] = {
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
							["num"] = 8,
						},
						[1] = {
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
							["num"] = 6,
						},
						[3] = {
							["CLSID"] = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["IPW - Strike - S-24B*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 6,
				vCruise = 200,
				vAttack = 280,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[8] = {
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
							["num"] = 8,
						},
						[1] = {
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
							["num"] = 1,
						},
						[6] = {
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
							["num"] = 6,
						},
						[3] = {
							["CLSID"] = "{3858707D-F5D5-4bbb-BDD8-ABB0530EBC7C}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Rockets S-25*4 R-60M*2 Fuel*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"hard", "Structure"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 6,
				vCruise = 200,
				vAttack = 280,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Rockets UB-32*4 R-60M*2 Fuel*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"hard", "Structure"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 6,
				vCruise = 200,
				vAttack = 280,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Rockets B-8*4 R-60M*2 Fuel*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 6,
				vCruise = 200,
				vAttack = 280,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = 3770,
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
			["CAS Bombs FAB-100*24 R-60M*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 5,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{5A1AC2B4-CA4B-4D09-A1AF-AC52FBC4B60B}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS ASM Kh-25ML-MPR R-60M*2 Fuel*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge", "SAM"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 7,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{292960BB-6518-41AC-BADA-210D65D5073C}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{292960BB-6518-41AC-BADA-210D65D5073C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{6DADF342-D4BA-4D8A-B081-BA928C4AF86D}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["SEAD"] = {
			["ASM SEAD Kh-25MPU*4 R-60M*2 Fuel*2"] = {
				minscore = 0.3,				
				attributes = {},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 9,
				firepower = 7,
				vCruise = 200,
				vAttack = 280,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{E86C5AA5-6D49-4F00-AD2E-79A62D6DDE26}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{E86C5AA5-6D49-4F00-AD2E-79A62D6DDE26}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E86C5AA5-6D49-4F00-AD2E-79A62D6DDE26}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E86C5AA5-6D49-4F00-AD2E-79A62D6DDE26}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "3770",
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				},
			},

		},
	},

	["MiG-27K"] = {--1970 (primo volo) 1975 (entrata in servizio) -- Bombe?
		["Anti-ship Strike"] = {
			["GA Kh-25MPL*2 R-60M*2 Fuel"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{79D73885-0801-45a9-917F-C90FE1CE3DFC}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{79D73885-0801-45a9-917F-C90FE1CE3DFC}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {			
			["GA Kh-25MPR*2 R-60M*2 Fuel"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
				},
				attributes = {"soft", "SAM", "Structure"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{292960BB-6518-41AC-BADA-210D65D5073C}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{292960BB-6518-41AC-BADA-210D65D5073C}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["GA Kh-25MPL*2 R-60M*2 Fuel"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "SAM", "Structure"},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{79D73885-0801-45a9-917F-C90FE1CE3DFC}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{79D73885-0801-45a9-917F-C90FE1CE3DFC}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["BAI Laser KAB-500LG R-60M*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
						["Laser Illumination"] = true,
					},
				attributes = {"hard", "Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Heavy Cluster RBK-500-255 R-60M*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 7,
				vCruise = 250,
				vAttack = 300,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Light Cluster RBK-500-250 R-60M*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 7,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 1500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{7AEC222D-C523-425e-B714-719C0D1EB14D}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{RBK_250_275_AO_1SCH}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{RBK_250_275_AO_1SCH}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{7AEC222D-C523-425e-B714-719C0D1EB14D}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},					
			["BAI Bombs Structure"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"hard", "Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 7,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 3,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{BA565F89-2373-4A84-9502-A0E017D3A44A}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["CAS Heavy Cluster KMGU-96r R-60M*2 Fuel"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 7,
				vCruise = 300,
				vAttack = 400,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{96A7F676-F956-404A-AD04-F33FB2C74881}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{96A7F676-F956-404A-AD04-F33FB2C74884}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},	
			["BAI Fab-250*6 R-60M*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "SAM", "Parked Aircraft"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 4,
				vCruise = 300,
				vAttack = 400,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{E659C4BE-2CD8-4472-8C08-3F28ACB61A8A}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},	
			["BAI Fab-500*2 Fab-250*2 R-60M*2 Fuel"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"hard", "Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 300,
				vAttack = 400,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Heavy Rockets CAS B-8*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"hard", "Parked Aircraft", "SAM", "Structure"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 1500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[3] = {
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [3]
						[2] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [2]
						[7] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
						}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Rockets CAS UB-32*4"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 7,
				firepower = 5,
				vCruise = 250,
				vAttack = 350,
				hCruise = 5500,
				hAttack = 1500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
					[3] = 
					{
						["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
					}, -- end of [3]
					[2] = 
					{
						["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
					}, -- end of [2]
					[7] = 
					{
						["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
					}, -- end of [7]
					[8] = 
					{
						["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
					}, -- end of [8]
					}, -- end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["SEAD"] = {
			["Mig-27K SEAD Kh-25MPU*2 R-60M*2 Fuel"] = {
				minscore = 0.3,				
				attributes = {},
				weaponType = "ASM",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 500000,
				capability = 10,
				firepower = 7,
				vCruise = 300,
				vAttack = 400,
				hCruise = 5500,
				hAttack = 2000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 10,
				stores = {
					["pylons"] = {
						[2] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [3]
						[5] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}",
						}, -- end of [8]
					}, ----end of ["pylons"]
					["fuel"] = "4500",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},

		},
	},

	["MiG-23MLD"] = {--1967 (primo volo) 1970 (entrata in servizio)
		["Intercept"] = {
			["R-24R*2, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 7,
				firepower = 3,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
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
				capability = 7,
				firepower = 3,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["R-24R*2, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
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
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["R-24R*2, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
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
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["R-24R*2, R-60M*4, Fuel"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 200000,
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[2] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
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
				capability = 7,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 7000,
				hAttack = 8000,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
						[2] =
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, --end of [4]
						[5] =
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, --end of [5]
						[6] =
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, --end of [6]
					}, ----end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["Strike FAB500*4, FT"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge", "hard"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 300000,
				capability = 3,
				firepower = 4,
				vCruise = 250,
				vAttack = 350,
				hCruise = 6000,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[4] = {
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[6] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 5,
						},
						[3] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 3,
						},
					},
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
			["Strike FAB500*2, R-60*4, FT"] = {
				minscore = 0.5,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 300000,
				capability = 3,
				firepower = 3,
				vCruise = 250,
				vAttack = 350,
				hCruise = 6000,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[4] = {
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[6] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 6,
						},
						[5] = {
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
							["num"] = 5,
						},
						[3] = {
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
							["num"] = 3,
						},
					},
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
	},

	["MiG-25PD"] = {--1964 (primo volo) 1970 (entrata in servizio)
		["Intercept"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 400000,
				capability = 10,
				firepower = 5,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [4]
					}, ----end of ["pylons"]
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
				range = 400000,
				capability = 10,
				firepower = 5,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
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
				range = 600000,
				capability = 7,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [4]
					}, ----end of ["pylons"]
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
				capability = 7,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
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
				capability = 10,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = 3600,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [4]
					}, ----end of ["pylons"]
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
				capability = 10,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = 3600,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
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
				range = 600000,
				capability = 5,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = 3600,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [4]
					}, ----end of ["pylons"]
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
				capability = 5,
				firepower = 5,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
						}, --end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
		},
	},

	["MiG-25RBT"] = {--1964 (primo volo) 1970 (entrata in servizio)
		["Reconnaissance"] = {
			["R-40R*4"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 600000,
				capability = 5,
				firepower = 1,
				vCruise = 600,
				vAttack = 700,
				hCruise = 12000,
				hAttack = 12000,
				standoff = 25000,
				tStation = nil,
				LDSD = true,
				self_escort = true,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[1] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [1]
						[2] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [2]
						[3] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [3]
						[4] =
						{
							["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
						}, --end of [4]
					}, ----end of ["pylons"]
					["fuel"] = "15245",
					["flare"] = 64,
					["chaff"] = 64,
					["gun"] = 100,
				},
			},
		},
		["AWACS"] = {
			["Default"] = {
				support = {
					["Escort"] = false,
					["SEAD"] = false,
				},
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 10,
				firepower = 1,
				vCruise = 250,
				vAttack = 350,
				hCruise = 10096,
				hAttack = 10096,
				standoff = nil,
				tStation = 36000,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[4] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [4]
					}, -- end of ["pylons"]					
					["fuel"] = "15245",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},

	["MiG-19P"] = {--1953 (primo volo) 1955 (entrata in servizio)
		["Intercept"] = {
			["Intercept IPW - Intercept - K-13A*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 150000,
				capability = 3,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
					},
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
					["MissileToneVolume"] = 5,
					["NAV_Initial_Hdg"] = 0,
					["ADF_Selected_Frequency"] = 1,
					["ADF_NEAR_Frequency"] = 303,
					["ADF_FAR_Frequency"] = 625,
					["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
			["Intercept  IPW K-13A*2, PTB-760*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 250000,
				capability = 3,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
					},
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
					["MissileToneVolume"] = 5,
					["NAV_Initial_Hdg"] = 0,
					["ADF_Selected_Frequency"] = 1,
					["ADF_NEAR_Frequency"] = 303,
					["ADF_FAR_Frequency"] = 625,
					["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
		},
		["CAP"] = {
			["CAP IPW K-13A*2, PTB-760*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 450000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 213.86666666667,
				hCruise = 7096,
				hAttack = 7096,
				standoff = 3000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
					},
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
								["MissileToneVolume"] = 5,
								["NAV_Initial_Hdg"] = 0,
								["ADF_Selected_Frequency"] = 1,
								["ADF_NEAR_Frequency"] = 303,
								["ADF_FAR_Frequency"] = 625,
								["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
		},
		["Escort"] = {
			[" Escort IPW K-13A*2, PTB-760*2"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 450000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 346.66666666667,
				hCruise = 7096,
				hAttack = 7096,
				standoff = 3000,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
					},
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
							["MissileToneVolume"] = 5,
							["NAV_Initial_Hdg"] = 0,
							["ADF_Selected_Frequency"] = 1,
							["ADF_NEAR_Frequency"] = 303,
							["ADF_FAR_Frequency"] = 625,
							["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
		},
		["Fighter Sweep"] = {
			["Fighter Sweep TF-Old-LR-AIM-9M*2,AIM7MH*4,FT*3"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 450000,
				capability = 2,
				firepower = 1,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5000,
				hAttack = 5000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
					},
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] =
																				{
																						["MissileToneVolume"] = 5,
																						["NAV_Initial_Hdg"] = 0,
																						["ADF_Selected_Frequency"] = 1,
																						["ADF_NEAR_Frequency"] = 303,
																						["ADF_FAR_Frequency"] = 625,
																						["MountSIRENA"] = true,
																				}, --end of ["AddPropAircraft"]
				},
		},
		["Anti-ship Strike"] = {
			["IPW - Strike - K-13A*2, FAB-250*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
					["Laser Illumination"] = false,
				},
				attributes = {"ship"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5000,
				hAttack = 5000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 2,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
																						["MissileToneVolume"] = 5,
																						["NAV_Initial_Hdg"] = 0,
																						["ADF_Selected_Frequency"] = 1,
																						["ADF_NEAR_Frequency"] = 303,
																						["ADF_FAR_Frequency"] = 625,
																						["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
			["Antiship IPW - Strike SR - K-13A*2, ORO-57K*4"] = {
					minscore = 0.3,
					support = {
						["Escort"] = true,
						["SEAD"] = false,
						["Laser Illumination"] = false,
					},
					attributes = {"ship"},
					weaponType = "Rockets",
					expend = "Auto",
					attackType = "Dive",
					day = true,
					night = false,
					adverseWeather = false,
					range = 650000,
					capability = 3,
					firepower = 1,
					vCruise = 200,
					vAttack = 300.5,
					hCruise = 5486.4,
					hAttack = 4572,
					standoff = nil,
					tStation = nil,
					LDSD = false,
					self_escort = false,
					sortie_rate = 1,
					stores = {
						["pylons"] = {
							[6] = {
								["CLSID"] = "{K-13A}",
								["num"] = 6,
							},
							[1] = {
								["CLSID"] = "{K-13A}",
								["num"] = 1,
							},
							[5] = {
								["CLSID"] = "{ORO57K_S5M_HEFRAG}",
								["num"] = 5,
							},
							[2] = {
								["CLSID"] = "{ORO57K_S5M_HEFRAG}",
								["num"] = 2,
							},
							[4] = {
								["CLSID"] = "{ORO57K_S5M_HEFRAG}",
								["num"] = 4,
							},
							[3] = {
								["CLSID"] = "{ORO57K_S5M_HEFRAG}",
								["num"] = 3,
							},
						}, ----end of ["pylons"]
						["fuel"] = "1800",
						["flare"] = 0,
						["chaff"] = 0,
						["gun"] = 100,
					},
					["AddPropAircraft"] = {
						["MissileToneVolume"] = 5,
						["NAV_Initial_Hdg"] = 0,
						["ADF_Selected_Frequency"] = 1,
						["ADF_NEAR_Frequency"] = 303,
						["ADF_FAR_Frequency"] = 625,
						["MountSIRENA"] = true,
					}, --end of ["AddPropAircraft"]
				},
		},
		["Strike"] = {
			["IPW - Strike - K-13A*2, FAB-250*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 2,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
						["MissileToneVolume"] = 5,
						["NAV_Initial_Hdg"] = 0,
						["ADF_Selected_Frequency"] = 1,
						["ADF_NEAR_Frequency"] = 303,
						["ADF_FAR_Frequency"] = 625,
						["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
			["IPW - Strike SR - K-13A*2, ORO-57K*4"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Rockets",
				expend = "Auto",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 4,
						},
						[3] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
						["MissileToneVolume"] = 5,
						["NAV_Initial_Hdg"] = 0,
						["ADF_Selected_Frequency"] = 1,
						["ADF_NEAR_Frequency"] = 303,
						["ADF_FAR_Frequency"] = 625,
						["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
			["IPW - Strike - K-13A*2, PTB-760*2, FAB-250*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft", "Structure"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
						[5] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 2,
						},
					}, ----end of ["pylons"]
					["fuel"] = "1800",
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
						["MissileToneVolume"] = 5,
						["NAV_Initial_Hdg"] = 0,
						["ADF_Selected_Frequency"] = 1,
						["ADF_NEAR_Frequency"] = 303,
						["ADF_FAR_Frequency"] = 625,
						["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
			["IPW - Strike - K-13A*2, PTB-760*2, ORO-57K*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = true,
				},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Rockets",
				expend = "Auto",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 300.5,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[6] = {
							["CLSID"] = "{K-13A}",
							["num"] = 6,
						},
						[1] = {
							["CLSID"] = "{K-13A}",
							["num"] = 1,
						},
						[5] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "PTB760_MIG19",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 4,
						},
						[3] = {
							["CLSID"] = "{ORO57K_S5M_HEFRAG}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 1800,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
				["AddPropAircraft"] = {
						["MissileToneVolume"] = 5,
						["NAV_Initial_Hdg"] = 0,
						["ADF_Selected_Frequency"] = 1,
						["ADF_NEAR_Frequency"] = 303,
						["ADF_FAR_Frequency"] = 625,
						["MountSIRENA"] = true,
				}, --end of ["AddPropAircraft"]
			},
		},
	},

	["Il-76MD"] = {--1971 (primo volo) 1974 (entrata in servizio)
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = true,
				range = 500000,
				capability = 10,
				firepower = 1,
				vCruise = 154.16666666667,
				vAttack = 154.16666666667,
				hCruise = 3500,
				hAttack = 3500,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				--self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
					{
					}, -- --end of ["pylons"]
					["fuel"] = 40000,
                    ["flare"] = 96,
                    ["chaff"] = 96,
                    ["gun"] = 100,
				},
			},
		},
	},

	["L-39A"] = {--1968 (primo volo) 1971 (entrata in servizio)
		["Anti-ship Strike"] = {
			["Antiship IPW R-3R*1, R-3S*1, FT800L, S-24B*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
					["Laser Illumination"] = false,
				},
				attributes = {"ship"},
				weaponType = "Rockets",
				expend = "Auto",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 2,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5486.4,
				hAttack = 4572,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{S-24B}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{S-24B}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Antiship Strike - R-3R*1, R-3S*1, FT800L, FAB-500*2"] = {
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
					["Laser Illumination"] = false,
				},
				attributes = {"ship"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 650000,
				capability = 3,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5000,
				hAttack = 5000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 1,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Intercept"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 600000,
				capability =3,
				firepower = 1,
				vCruise = nil,
				vAttack = nil,
				hCruise = nil,
				hAttack = nil,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 2,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["CAP"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 600000,
				capability = 3,
				firepower = 1,
				vCruise = 200,
				vAttack = 220,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 20000,
				tStation = 1800,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Escort"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 1,
				vCruise = 200,
				vAttack = 350,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 10000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Fighter Sweep"] = {
			["IPW R-3R*2, R-3S*2, FT800L"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 1,
				vCruise = 200,
				vAttack = 250,
				hCruise = 7500,
				hAttack = 5500,
				standoff = 20000,
				tStation = nil,
				LDSD = false,
				self_escort = true,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3R}",
							["num"] = 5,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[4] = {
							["CLSID"] = "{R-3S}",
							["num"] = 4,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
		["Strike"] = {
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-250*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{R-3R}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-100*8"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 300000,
				capability = 5,
				firepower = 3,
				vCruise = 250,
				vAttack = 300,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{FAB-100-4}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{R-3S}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{R-3R}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{FAB-100-4}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, FAB-500*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = true,
					},
				attributes = {"Structure", "Bridge", "hard"},
				weaponType = "Bombs",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 3,
				vCruise = 200,
				vAttack = 250,
				hCruise = 5500,
				hAttack = 4000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 4,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, UB16UM*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft", "SAM"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 2,
				vCruise = 200,
				vAttack = 250,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{UB-16_S5M}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{UB-16_S5M}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
			["IPW - Strike - R-3R*1, R-3S*1, FT800L, S-24B*2"] = {
				minscore = 0.3,
				support = {
						["Escort"] = true,
						["SEAD"] = false,
					},
				attributes = {"soft", "Parked Aircraft"},
				weaponType = "Rockets",
				expend = "All",
				attackType = "Dive",
				day = true,
				night = false,
				adverseWeather = false,
				range = 700000,
				capability = 5,
				firepower = 2,
				vCruise = 200,
				vAttack = 250,
				hCruise = 1500,
				hAttack = 1000,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[5] = {
							["CLSID"] = "{R-3S}",
							["num"] = 5,
						},
						[2] = {
							["CLSID"] = "{S-24B}",
							["num"] = 2,
						},
						[4] = {
							["CLSID"] = "{S-24B}",
							["num"] = 4,
						},
						[1] = {
							["CLSID"] = "{R-3R}",
							["num"] = 1,
						},
						[3] = {
							["CLSID"] = "{PTB_800_MIG21}",
							["num"] = 3,
						},
					}, ----end of ["pylons"]
					["fuel"] = 2280,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},

    -- Not valid

    -- Nato
	--[[
    ["SH-60B"] = {--? (primo volo) 1984 (entrata in servizio) NO
		["CAP"] = {
			["ASW Patrol"] = {
				attributes = {"Seahawk"},
				day = true,
				night = true,
				adverseWeather = true,
				range = 100000,
				capability = 0,
				firepower = 1,
				vCruise = 59.7222,
				vAttack = 40.2778,
				hCruise = 304.8,
				hAttack = 91.44,
				tStation = 7200,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] = {}, --end of [1]
					}, ----end of ["pylons"]
					["fuel"] = "1100",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				},
			},
		},
	},

    ["B-1B"] = { --1974 (primo volo) 1986 (entrata in servizio) NO
		["Strike"] = {
			["Strike TF AGM-154*12"] = { --1998
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"Structure", "SAM"},
				weaponType = "ASM",
				expend = "Auto",
				attackType = nil,
				day = false,
				night = true,
				adverseWeather = true,
				range = 1000000,
				capability = 10,
				firepower = 1.5,
				vCruise = 250.25,
				vAttack = 356.94444444444,
				hCruise = 7315.2,
				hAttack = 7315.2,
				standoff = 43000,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
						[1] = {
						["CLSID"] = "{AABA1A14-78A1-4E85-94DD-463CF75BD9E4}",
						["num"] = 1,
						},
						[2] = {
						["CLSID"] = "{AABA1A14-78A1-4E85-94DD-463CF75BD9E4}",
						["num"] = 2,
						},
						[3] = {
						["CLSID"] = "{AABA1A14-78A1-4E85-94DD-463CF75BD9E4}",
						["num"] = 3,
						},
					},
					["fuel"] = "88450",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				},
			},
		},
	},

	]]
	-- UH-60 --1974 (primo volo) 1978 (entrata in servizio) NO
	-- SA-342 Gazelle (1978-2000 (sistemi d'arma)?)

    --URSS
	--[[
    ["Mi-26"] = {--1977 (primo volo) 1983 (entrata in servizio) NO
		["Transport"] = {
			["Default"] = {
				attributes = {},
				weaponType = nil,
				expend = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 500000,
				capability = 5,
				firepower = 10,
				vCruise = 100,
				vAttack = 100,
				hCruise = 100,
				hAttack = 100,
				standoff = nil,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] = {
					}, ----end of ["pylons"]
					["fuel"] = "9600",
					["flare"] = 192,
					["chaff"] = 0,
					["gun"] = 100,
				},
			},
		},
	},

    ["Tu-142"] = {--1975 (primo volo) 1980 (entrata in servizio) NO
		["Anti-ship Strike"] = {
			["Antiship Kh-35*6"] = { --2003
				minscore = 0.3,
				support = {
					["Escort"] = true,
					["SEAD"] = false,
				},
				attributes = {"ship"},
				weaponType = "ASM",
				expend = "All",
				attackType = nil,
				day = true,
				night = true,
				adverseWeather = true,
				range = 900000,
				capability = 10,
				firepower = 1,
				vCruise = 220,
				vAttack = 250,
				hCruise = 10096,
				hAttack = 10096,
				standoff = 110000,
				ingress = 50000,
				egress = 10000,
				MaxAttackOffset = 60,
				tStation = nil,
				LDSD = false,
				self_escort = false,
				sortie_rate = 6,
				stores = {
					["pylons"] =
	                {
						[1] = {
							["CLSID"] = "{C42EE4C3-355C-4B83-8B22-B39430B8F4AE}",
							["num"] = 1,
						},
	        }, ----end of ["pylons"]
					["fuel"] = "60000",
	        ["flare"] = 48,
	        ["chaff"] = 48,
	        ["gun"] = 100,
				},
			},
		},
	},
	]]

}
