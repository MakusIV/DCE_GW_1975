--
--
------------------------------------------------------------------------------------------------------- 
-- Miguel Fichier Revision M33.d
------------------------------------------------------------------------------------------------------- 
-- Miguel21 modification M33.d VOR + NDB Custom Briefing (d: Divert)

--[[ db_airbases Entry Example ----------------------------------------------------------------------------
	--example for an air base
	['Kerman Airbase'] = {
		x =	454116.78125,
		y = 71096.058594,
		elevation = 1751,
		airdromeId = 18,
		ATC_frequency = "250.300",
		--startup = 300,							-- (secondes) Timing for take-off, generally used for small runways to give time for all aircraft to gather together
		side = "red",								-- side : Required information for the divert
		divert = true,								-- divert : Required information for the divert)
		--VOR = "112.00",							-- optional information
		--NDB = "",									-- optional information
		--TACAN = "97X",							-- TACAN : optional information
		--ILS = "RWY 30R/111.95 RWY 12L/108.55",	-- ILS : optional information
		LimitedParkNb = 3,							-- number of parking spaces available
	},
	--example for an airplane carrier
	['CVN-71 Theodore Roosevelt'] = {                            
		unitname = "CVN-71 Theodore Roosevelt",
		startup = 300,								-- (secondes) Timing for take-off, generally used for small runways to give time for all aircraft to gather together
		ATC_frequency = "255.500",					-- Optional information, if absent, the base_mission frequency will be used.
	},	
	--example for a FARP
	['As Salamah FARP'] = {
		x =	-74348.375716192,
		y = -67705.331836707,
		elevation = 0,
		airdromeId = 837,							--be careful this Id depends on units placements and is helipadID in fact
		helipadId = 837,
		ATC_frequency = "128.600",
		side = "blue",								-- side : Required information for the divert
		divert = false,								-- divert : Required information for the divert)
	},	
	--example for a Virtual Base
	['Reserves'] = {								--dummy airbase to place virtual reserves
		inactive = true,
		x =	9999999999,								--position far away will make all range checks negative
		y = 9999999999,
		elevation = 0,
		airdromeId = nil,							--no id makes sure that no static aircraft are to be placed at this air base
		ATC_frequency = "0",
	},

]]-----------------------------------------------------------------------------------------------------

db_airbases = {
	['Kerman Airbase'] = {
		x =	454116.78125,
		y = 71096.058594,
		elevation = 1751,
		airdromeId = 18,
		ATC_frequency = "250.300",
		startup = 300,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "112.00",
		-- NDB = "",
		TACAN = "97X",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 42,
	},
	['Shiraz Intl'] = {
		x =	381101.03125,
		y = -351636.515625,
		elevation = 1487,
		airdromeId = 19,
		ATC_frequency = "250.350",
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "117.80",
		NDB = "205",
		TACAN = "94X",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 119,
	},
	['Jiroft Airport'] = {   
		x =	282607.962896,
		y = 141685.262108,
		elevation = 812,
		airdromeId = 27,
		ATC_frequency = "250.850",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		NDB = "276",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 3,
	},	
	['Lar Airbase'] = {
		x =	168977.578922,
		y = -182359.639734,
		elevation = 803,
		airdromeId = 11,
		ATC_frequency = "250.050",
		startup = 300,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "117.9",
		NDB = "224",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 5,
	},
	['Bandar Abbas Intl'] = {
		x =	115765.878906,
		y = 14257.979004,
		elevation = 5,
		airdromeId = 2,
		ATC_frequency = "251.000",
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "117.20",
		NDB = "250",
		TACAN = "78X",							-- TACAN : optionnel
		ILS = "RWY 21L/109.90",							-- ILS : optionnel
		LimitedParkNb = 50,
	},
	['Havadarya'] = {
		x =	109297.832031,
		y = -6278.723145,
		elevation = 9,
		airdromeId = 9,
		ATC_frequency = "251.300",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		TACAN = "47X",							-- TACAN : optionnel
		ILS = "RWY 08/108.90",							-- ILS : optionnel
		LimitedParkNb = 22,
	},	
	['Qeshm Island'] = {
		x =	64800.714844,
		y = -33383.481445,
		elevation = 5,
		airdromeId = 13,
		ATC_frequency = "250.150",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "117.10",
		NDB = "233",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 12,
	},
	['Lavan Island Airport'] = {   
		x =	75789.741687,
		y = -286801.46313,
		elevation = 23,
		airdromeId = 26,
		ATC_frequency = "250.750",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "116.85",
		NDB = "310",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 3,
	},
	['Kish International Airport'] = {  
		x =	42784.291016,
		y = -225094.046875,
		elevation = 35,
		airdromeId = 24,
		ATC_frequency = "250.650",
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "117.40",
		NDB = "201",
		TACAN = "112X",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 46,
	},
	['Bandar Lengeh'] = {
		x =	41536.408234,
		y = -25722.724609,
		elevation = 23,
		airdromeId = 3,
		ATC_frequency = "251.050",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "114.80",
		NDB = "408",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 5,
	},
	['Tunb Island AFB'] = {
		x =	10515.440918,
		y = -92440.328125,
		elevation = 13,
		airdromeId = 8,
		ATC_frequency = "251.000",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 4,
	},	
	['Tunb Kochak'] = {
		x =	9023.430176,
		y = -109467.078125,
		elevation = 5,
		airdromeId = 16,
		ATC_frequency = "251.000",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		TACAN = "89X",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 2,
	},
	['Khasab'] = {
		x =	-219.726892,
		y = -177.707709,
		elevation = 22,
		airdromeId = 10,
		ATC_frequency = "250.000",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		ILS = "RWY 19/110.30",							-- ILS : optionnel
		LimitedParkNb = 12,
	},
	['Sirri Island'] = {
		x =	-26946.104553,
		y = -170745.015625,
		elevation = 4,
		airdromeId = 15,
		ATC_frequency = "250.250",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "113.75",
		NDB = "300",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 2,
	},
	['Abu Musa Island Airport'] = {
		x =	-31505.274308,
		y = -121335.307759,
		elevation = 5,
		airdromeId = 1,
		ATC_frequency = "250.400",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		NDB = "285",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 8,
	},
	['Sir Abu Nuayr'] = {  
		x =	-103102.871094,
		y = -202973.078125,
		elevation = 8,
		airdromeId = 17,
		ATC_frequency = "250.800",
		startup = 600,
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 4,
	},
	['Ras Al Khaimah'] = {  
		x =	-61624.488064,
		y = -30795.647521,
		elevation = 22,
		airdromeId = 28,
		ATC_frequency = "250.900",
		startup = 600,
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "113.60",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 18,
	},
	['Sharjah Intl'] = {
		x =	-92544.089844,
		y = -73373.601563,
		elevation = 30,
		airdromeId = 14,
		ATC_frequency = "250.200",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		ILS = "RWY 30R/111.95 RWY 12L/108.55",							-- ILS : optionnel
		LimitedParkNb = 47,
	},
	['Dubai Intl'] = {
		x =	-100594.371094,
		y = -88875.371094,
		elevation = 5,
		airdromeId = 5,
		ATC_frequency = "251.150",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		ILS = "RWY 30R/110.90 RWY 30L/111.30 RWY 12L/110.10 RWY 12R/109.50",							-- ILS : optionnel
		LimitedParkNb = 96,
	},
	['Fujairah Intl'] = {
		x =	-117531.972946,
		y = 7939.275818,
		elevation = 31, 
		airdromeId = 7,
		ATC_frequency = "251.250",
		startup = 600,
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "113.80",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		ILS = "RWY 29/111.50",							-- ILS : optionnel
		LimitedParkNb = 4,
	},
	['Al Minhad AB'] = {
		x =	-126013.707153,
		y = -89133.460938,
		elevation = 55,
		airdromeId = 12,
		ATC_frequency = "250.100",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		TACAN = "99X",							-- TACAN : optionnel
		ILS = "RWY 27/110.75 RWY 09/110.70",							-- ILS : optionnel
		LimitedParkNb = 61,
	},
	['Al Maktoum Intl'] = {
		x =	-140127.671875,
		y = -110068.890625,
		elevation = 38,
		airdromeId = 6,
		ATC_frequency = "251.200",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		-- VOR = "",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		ILS = "RWY 30/109.75 RWY 12/111.75",							-- ILS : optionnel
		LimitedParkNb = 58,
	},
	['Al Dhafra AB'] = {
		x =	-211027.78125,
		y = -173240.007813,
		elevation = 16,
		airdromeId = 4,
		ATC_frequency = "251.100",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "114.90",
		-- NDB = "",
		TACAN = "96X",							-- TACAN : optionnel
		ILS = "RWY 128/111.10 RWY 128/108.70 RWY RWY 308/109.10 RWY 308/108.70 RWY",			-- ILS : optionnel
		LimitedParkNb = 251,
	},	
	['Al Ain International Airport'] = {   
		x =	-211058.15625,
		y = -65421.177734,
		elevation = 248,
		airdromeId = 25,
		ATC_frequency = "250.700",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "112.60",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 74,
	},
	['Abu Dhabi International Airport'] = {
		x =	 -188454.53125,
		y =  -162034,
		elevation = 28,
		airdromeId = 22,
		ATC_frequency = "250.550",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "114.25",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 126,
	},
	['Al Bateen Airport'] = {
		x =	 -190943.802017,
		y =  -181931.896756,
		elevation = 4,
		airdromeId = 23,
		ATC_frequency = "250.450",
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "114",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 48,
	},
	['Sas Al Nakheel Airport'] = {             --be careful not fully operationnal
		x =	 -189512.940344,
		y =  -176005.397406,
		elevation = 3,
		airdromeId = 20,
		ATC_frequency = "250.450",
		startup = 600,
		side = "blue",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "128.93",
		-- NDB = "",
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 87,
	},
	['Bandar e Jask airfield'] = {             --be careful not fully operationnal
		x =	 -57253.640625,
		y =  156185.265625,
		elevation = 8,
		airdromeId = 21,
		ATC_frequency = "250.500",
		startup = 600,
		side = "red",							-- side : info obligatoire
		divert = true,							-- divert : info obligatoire (pour l instant)
		VOR = "116.30",
		-- NDB = "",
		TACAN = "110X",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 2,
	},
	['CVN-74 John C. Stennis'] = {                            
		unitname = "CVN-74 John C. Stennis",
		startup = 300,
		LimitedParkNb  = 10,
		side = "blue",							-- side : info obligatoire
		ATC_frequency = "255.255",				--si ATC_frequency non present, on utilise la freq de base_mission
	},
	['CVN-71 Theodore Roosevelt'] = {                            
		unitname = "CVN-71 Theodore Roosevelt",
		startup = 300,
		side = "blue",							-- side : info obligatoire
		-- ATC_frequency = "255.500",			--si ATC_frequency non present, on utilise la freq de base_mission
		LimitedParkNb  = 9, 
	},	
	['LHA_Tarawa'] = {
		unitname = "LHA_Tarawa",
		startup = 300,
		side = "blue",							-- side : info obligatoire
		ATC_frequency = "250.255",				--si ATC_frequency non present, on utilise la freq de base_mission
		LimitedParkNb  = 4,
	},
	['LHA_Nassau'] = {
		unitname = "LHA_Nassau",
		startup = 300,
		side = "blue",							-- side : info obligatoire
		ATC_frequency = "243.000",				--si ATC_frequency non present, on utilise la freq de base_mission	
		LimitedParkNb  = 4,
	},
	['Al Ima FARP'] = {                            ----Crisis in PG campaigns only
		x =	-24720.872961233,
		y = 17485.114619878,
		elevation = 0,
		airdromeId = 1345,	--be careful this Id depends on units placements and is helipadID in fact
		helipadId = 1345,
		ATC_frequency = "128.500",
		side = "red",							-- side : info obligatoire
		divert = false,							-- divert : info obligatoire (pour l instant)
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 4,
	},
	['Jazirat al Hamra FARP'] = {        ----Crisis in PG campaigns only
		x =	-52316.710452899,
		y = -43324.847012614,
		elevation = 0,
		airdromeId = 837,	--be careful this Id depends on units placements and is helipadID in fact
		helipadId = 837,
		ATC_frequency = "243.000",
		side = "blue",							-- side : info obligatoire
		divert = false,							-- divert : info obligatoire (pour l instant)
		-- TACAN = "",							-- TACAN : optionnel
		-- ILS = "",							-- ILS : optionnel
		LimitedParkNb = 4,
	},
	-- ['FARP_Dublin'] = {
		-- x =	-31022.039393941,
		-- y = -122995.27024236,
		-- elevation = 12,
		-- airdromeId = 520,	--be careful this Id depends on units placements and is helipadID in fact
		-- ATC_frequency = "127.700",
	-- },
	-- ['FARP_Moscow'] = {
		-- x =	-27476.648084292,
		-- y = -170572.10615715,
		-- elevation = 6,
		-- airdromeId = 521,	--be careful this Id depends on units placements and is helipadID in fact
		-- ATC_frequency = "127.800",
	-- },	
	['Reserves'] = {						--dummy airbase to place virtual reserves
		inactive = true,
		x =	9999999999,						--position far away will make all range checks negative
		y = 9999999999,
		elevation = 0,
		airdromeId = nil,					--no id makes sure that no static aircraft are to be placed at this air base
		ATC_frequency = "251.0000",
	},
	-- ['AB test 01'] = {
		-- x =	-150127.671875,
		-- y = -110068.890625,
		-- elevation = 38,
		-- airdromeId = 6,
		-- ATC_frequency = "251.100",
		-- side = "blue",							-- side : info obligatoire
		-- divert = true,							-- divert : info obligatoire (pour l instant)
		-- TACAN = "78X",							-- TACAN : optionnel
		-- ILS =  "RWY 27/110.75 RWY 09/110.70",	-- ILS : optionnel
	-- },
	-- ['AB test 02'] = {
		-- x =	-140127.671875,
		-- y = -120068.890625,
		-- elevation = 38,
		-- airdromeId = 6,
		-- ATC_frequency = "251.250",
		-- side = "blue",							-- side : info obligatoire
		-- divert = true,							-- divert : info obligatoire (pour l instant)
		-- -- TACAN = "78X",							-- TACAN : optionnel
		-- -- ILS =  "RWY 27/110.75 RWY 09/110.70",	-- ILS : optionnel
	-- },
	-- ['AB test 03'] = {
		-- x =	-145127.671875,
		-- y = -115068.890625,
		-- elevation = 38,
		-- airdromeId = 6,
		-- ATC_frequency = "251.500",
		-- side = "blue",							-- side : info obligatoire
		-- divert = true,							-- divert : info obligatoire (pour l instant)
		-- TACAN = "47X",							-- TACAN : optionnel
		-- ILS =  "RWY 08/108.90",					-- ILS : optionnel
	-- },
	-- ['AB test 04'] = {
		-- x =	-130127.671875,
		-- y = -100068.890625,
		-- elevation = 38,
		-- airdromeId = 6,
		-- ATC_frequency = "251.750",
		-- side = "red",							-- side : info obligatoire
		-- divert = true,							-- divert : info obligatoire (pour l instant)
		-- -- TACAN = "78X",							-- TACAN : optionnel
		-- ILS =  "RWY 09/111.50",					-- ILS : optionnel
	-- },
}
	