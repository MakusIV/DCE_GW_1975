--Order of Battle - Aircraft/Helicopter
--organized in units (squadrons/regiments) containing a number of aircraft
--Campaign Version-V20.00
--[[ Unit Entry Example ----------------------------------------------------------------------------

[1] = {
	inactive = true,								--true if unit is not active
	player = true,									--true for player unit
	name = "527 TFS",								--unit name
	type = "F-5E-3",								--aircraft type
	helicopter = true,								--true for helicopter units
	country = "USA",								--unit country
	livery = {"USAF Euro Camo"},					--unit livery
	base = "Groom Lake AFB",						--unit base
	skill = "Random",								--unit skill
	tasks = {										--list of eligible unit tasks. Note: task names do not necessary match DCS tasks)
		["AWACS"] = true,
		["Anti-ship Strike"] = true,
		["CAP"] = true,
		["Fighter Sweep"] = true,
		["Intercept"] = true,
		["Reconnaissance"] = true,
		["Refueling"] = true,
		["Strike"] = true,							--Generic air-ground task (replaces "Ground Attack", "CAS" and "Pinpoint Strike")
		["Transport"] = true,
		["Escort"] = true,							--Support task: Fighter escort for package
		["SEAD"] = true,							--Support task: SEAD escort for package
		["Escort Jammer"] = true,					--Support task: Single airraft in center of package for defensive jamming
		["Flare Illumination"] = true,				--Support task: Illuminate target with flares for package
		["Laser Illumination"] = true,				--Support task: Lase target for package
		["Stand-Off Jammer"] = true,				--Not implemeted yet: On-station jamming
		["Chaff Escort"] = true,					--Not implemented yet: Lay chaff corrdior ahead of package
		["A-FAC"] = true,							--Not implemented yet: Airborne forward air controller
	},
	number = 12,									--number of airframes
},


--- BLUE

Batumi
fighter: 7+20 F-5E (VMFA-157)
fighter/attack: 6+20 F-4E (VMFA-151),
bomber: 5+21 B-52H (69 BS)
transport: 3+7 C-130 (315th Air Division)
refuelling: 3+9 KC135MPRS (171 ARW)

FARP-17th Cavalry
attack/transport: 8+20 UH-1H(R/17th Cavalry)

FARP-6th Cavalry
attack/transport: 8+20 AH-1W(R/6th Cavalry)

Vaziani
fighter: 12+24 MiG-19P (GA 4rd AS), 
bomber/attack: 12+36 MiG-27K (GA 3rd AS), 

Kutaisi
fighter/attack: 6+20 F-4E (58 TFS)
awacs: 3 E-3A (7 ACCS)

Senaki-Kolkhi
fighter: 12+24 MiG-21Bis (GA 7rd AS)
refuelling: 3+9 KC135MPRS (801 ARS)
transport: 6 An-26B GA 5rd TS)

Tbilissi-Lochini
fighter/attack: 12+30 AJS37 (F9)
refuelling: 3+7 KC135MPRS (174 ARW)

Sukhumi
fighter: 12+30 AJS37 (F7)
bomber/attack: 12+36 F-4E (VMFA-159)

CVN-71 Theodore Roosevelt
fighter/attack: 16+30 F-14A-135-GR (VF-101)
awacs: 5+5 E-2C (VAW-125)
refuelling: 5+5 S-3B Tanker (174 ARW)

CVN-74 John C. Stennis
bomber/attack: 12+20 F-14A-135-GR (VF-118/GA)
refuelling: 8 S-3B Tanker (177 ARW)


---- RED

Mozdok
fighter: 12+12 MiG-23MLD (113.IAP), 12 MiG-25PD (790.IAP), 
attack/bomber: 6+24 MiG-27K (117.IAP), 12+12 Su-17M4 (115.IAP)

Beslan
fighter: 12+12 MiG-23MLD (123.IAP), 
fighter/attack: 12+24 MiG-21Bis (37.IAP), 
attack/bomber: 6+24 MiG-27K (127.IAP), 12+12 L-39A (115AS.IAP)
transport: 6 An-26B (3.OSAP)

Nalchik
fighter/attack: 8+24 MiG-21Bis (19.IAP) 
attack/bomber: 6+24 MiG-27K (107.IAP), 6+24 L-39A (111AS.IAP)
awacs: 4 A-50 (2457 SDRLO)
transport: 4+4 Il-76MD (13.OSAP)

Mineralnye-Vody
fighter: 12+12 MiG-23MLD (133.IAP), 12 MiG-25PD (793.IAP), 
attack/bomber: 6+24 Su-24M (41.IAP), 12+24 Su-17M4 (135.IAP)
bomber: SU 17, Su 24
transport: 2+4 An-26B (3.OSAP)

Sochi-Adler
transport: 2+4 An-26B (2.OSAP) 

Maykop-Khanskaya
fighter: 12+24 MiG-23MLD (153.IAP) (intercept, escort)
bomber: 8+18 Su-24M (81.IAP), 8+18 Tu-22M3 (61.IAP)
transport: 2+4 An-26B (27.OSAP)

Anapa-Vityazevo
transport: 1+4 An-26B (23.OSAP)

Krasnodar-Center
transport: 2+4 An-26B (25.OSAP)
awacs: 4 A-50 (2457.I SDRLO)

FARP-1st GHR
attack/transport 4+24 Mi-8MT (1st GHR)

FARP-2nd GHR
attack/transport 4+24 Mi-24V (2nd GHR)


---------------------- total ------------------------

blue
fighter:27+32+36+32 = 127
fighter/attack:26+26+32+46 = 130
bomber/attack:48+48+32 = 128
heaavy bomber = 26
awacs:10+3 = 13
refuelling:8+10+10+12 = 40
transport:6+10 = 16
helicopter:28+28 = 56

red
fighter:24+12+24+24+12+36 = 132
fighter/attack:32+36 = 68
bomber/attack:30+24+30+30+30+30+36+36 = 234
heavy bomber: 26 
awacs: = 8
refuelling: = 0
transport: = 6+8+6+6+6+5+6+5+6 = 54
helicopter: = 28+28 = 56



]]-----------------------------------------------------------------------------------------------------

oob_air = {

	["blue"] = { --side 1
        -------------- Batumi -------------------------
		[1] = {
			name = "VMFA-151",								--unit name
			player = false,									--player unit
			type = "F-4E",								--aircraft type
			country = "USA",								--unit country
			livery = {""},					--unit livery
			base = "Batumi",							--unit base
			skill = "Random",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			number = 6,
		},
		[2] = {
			name = "R/VMFA-151",								--unit name
			type = "F-4E",									--aircraft type
			country = "Usa",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 20,
		},
		[3] = {
			name = "VMFA-157",								--unit name
			--player = true,									--player unit
			type = "F-5E-3",								--aircraft type
			country = "USA",								--unit country
			livery = {""},					--unit livery
			base = "Batumi",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Intercept"] = true,
			},
			number = 7,
		},
		[4] = {
			name = "R/VMFA-157",								--unit name
			inactive = true,
			type = "F-5E-3",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 20,
		},
		[5] = {
			name = "315th Air Division",								--unit name
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			livery = "",				--unit livery
			base = "Batumi",						--unit base
			skill = "Random",									--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 3,
		},
		[6] = {
			name = "R/315th Air Division",								--unit name
			inactive = true,
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 7,
		},
		[7] = {
			name = "69 BS",									--unit name
			type = "B-52H",									--aircraft type
			country = "USA",								--unit country
			livery = "usaf standard",						--unit livery
			base = "Batumi",								--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
			},
			number = 5,
		},
		[8] = {
			name = "R/69 BS",								--unit name
			inactive = true,
			type = "B-52H",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 21,
		},
		[9] = {
			name = "171 ARW",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Batumi",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[10] = {
			name = "R/171 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 9,
		},		
			------------------ Vaziani ---------------------		
		[11] = {
			name = "GA 3rd AS",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Georgia",								--unit country
			livery = "af standard",			--unit livery
			base = "Vaziani",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			number = 12,
		},
		[12] = {
			name = "R/GA 3rd AS",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Georgia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},
		[13] = {
			name = "GA 4rd AS",								--unit name
			type = "MiG-19P",								--aircraft type
			country = "Georgia",								--unit country
			livery = "",								--unit livery
			base = "Vaziani",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = false, -- no loadout		
			},
			number = 12,
		},
		[14] = {
			name = "R/GA 4rd AS",								--unit name
			inactive = true,
			type = "MiG-19P",								--aircraft type
			country = "Georgia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},		
			----------------------- Kutaisi -------------------------		
		[15] = {
			name = "58 TFS",								--unit name			
			type = "F-4E",								--aircraft type
			country = "USA",								--unit country
			livery = {""},					--unit livery
			base = "Kutaisi",							--unit base
			skill = "Random",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,
				["Strike"] = false,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			number = 6,
		},
		[16] = {
			name = "R/58 TFS",								--unit name
			inactive = true,
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 20,
		},
		[17] = {
			name = "7 ACCS",								--unit name
			type = "E-3A",									--aircraft type
			country = "USA",								--unit country
			livery = "usaf standard",						--unit livery
			base = "Kutaisi",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 3,
		},
			---------------------- Senaki-Kolkhi ----------------------
		[18] = {
			name = "GA 7rd AS",							--unit name
			--player = false,									--player unit
			type = "MiG-21Bis",								--aircraft type
			country = "Georgia",							--unit country
			livery = "",							--unit livery
			base = "Senaki-Kolkhi",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1.5,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[19] = {
			name = "R/GA 7rd AS",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[20] = {
			name = "801 ARS",								--unit name
			type = "KC-135",								--aircraft type
			country = "USA",								--unit country
			livery = "Standard USAF",						--unit livery
			base = "Senaki-Kolkhi",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[21] = {
			name = "R/801 ARS",								--unit name
			inactive = true,
			type = "KC-135",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},		
		[22] = { 
			name = "GA 5rd TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Georgia",								--unit country
			livery = "",									--unit livery
			base = "Senaki-Kolkhi",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[23] = {
			name = "R/GA 5rd TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Georgia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
			--------------------- Tbilissi-Lochini -------------------
		[24] = {
			name = "F9",								--unit name
			--player = true,									--player unit
			type = "AJS37",								--aircraft type
			country = "Sweden",								--unit country
			livery = {"#4 Splinter F7 Skaraborgs Flygflottilj 76"},					--unit livery
			base = "Tbilissi-Lochini",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = false, -- no loadout
				["Escort"] = false, -- no loadout
				["Fighter Sweep"] = false, -- no loadout
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 3,
			},
			number = 12,
		},				
		[25] = {
			name = "F23",								--unit name
			inactive = true,
			type = "AJS37",									--aircraft type
			country = "Sweden",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 30,
		},
		[26] = {
			name = "174 ARW",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Tbilissi-Lochini",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[27] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},
        	-------------------- Sukhumi -------------------------------------
		[28] = {
			name = "VMFA-159",								--unit name
			--player = false,									--player unit
			type = "F-4E",								--aircraft type
			country = "USA",								--unit country
			livery = {""},					--unit livery
			base = "Sukhumi",							--unit base
			skill = "Random",									--unit skill
			tasks = {										--unit tasks				
				["Strike"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			number = 12,
		},
		[29] = {
			name = "R/VMFA-159",								--unit name
			type = "F-4E",									--aircraft type
			country = "Usa",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 36,
		},
		[30] = {
			name = "F7",								--unit name
			--player = true,									--player unit
			type = "AJS37",								--aircraft type
			country = "Sweden",								--unit country
			livery = {"#4 Splinter F7 Skaraborgs Flygflottilj 76"},					--unit livery
			base = "Sukhumi",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = false,
				["Escort"] = false,
				["Fighter Sweep"] = false,	
				["Strike"] = true,
				["Anti-ship Strike"] = true,		
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 3,
			},
			number = 12,
		},				
		[31] = {
			name = "F21",								--unit name
			inactive = true,
			type = "AJS37",									--aircraft type
			country = "Sweden",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 30,
		},
			--------------- CVN-71 Theodore Roosevelt ----------------------
		[32] = {
			name = "VF-101",							--unit name
			player = true,									--player unit
			type = "F-14A-135-GR",								--aircraft type
			country = "USA",								--unit country
			livery = {"vf-101 grim reapers low vis", "vf-101 dark"},				--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vf-101 red",
				[105] = "vf-101 grim reapers low vis",
				[111] = "vf-101 dark",
				},
			sidenumber = {100, 115},
			base = "CVN-71 Theodore Roosevelt",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 2,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 16,
		},
		[33] = {
			name = "R/VF-101",								--unit name
			inactive = true,
			type = "F-14A-135-GR",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 30,
		},
		[34] = {
			name = "VAW-125",								--unit name
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			sidenumber = {600, 609},						--unit range of sidenumbers (optional)
			base = "CVN-71 Theodore Roosevelt",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 5,
		},
		[35] = {
			name = "R/VAW-125",								--unit name
			inactive = true,
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 5,
		},
		[36] = {
			name = "174 ARW",								--unit name
			type = "S-3B Tanker",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			sidenumber = {400, 429},						--unit range of sidenumbers (optional)
			base = "CVN-71 Theodore Roosevelt",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 5,
		},
		[37] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "S-3B Tanker",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},
			------------------ CVN-74 John C. Stennis --------------------
		[38] = {
			name = "VF-118/GA",							--unit name
			--player = true,									--player unit
			type = "F-14A-135-GR",								--aircraft type
			country = "USA",								--unit country
			livery = {"vf-101 grim reapers low vis", "vf-101 dark"},				--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vf-101 red",
				[105] = "vf-101 grim reapers low vis",
				[111] = "vf-101 dark",
				},
			sidenumber = {100, 115},
			base = "CVN-74 John C. Stennis",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks				
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 2,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[39] = {
			name = "R/VF-118/GA",								--unit name
			inactive = true,
			type = "F-14A-135-GR",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},
		[40] = {
			name = "177 ARW",								--unit name
			type = "S-3B Tanker",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			sidenumber = {430, 450},						--unit range of sidenumbers (optional)
			base = "CVN-74 John C. Stennis",							--unit base base = "CVN-74 John C. Stennis",
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 8,
		},	
			---------------- KHASHURI FARP LM84
		[41] = {
			name = "17th Cavalry",								--unit name
			type = "UH-1H",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "KHASHURI FARP LM84",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = false, -- no loadouts for strike!!
			}, 
			number = 8,
		},
		[42] = {
			name = "R/17th Cavalry",								--unit name
			inactive = true,
			type = "UH-1H",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},
			----------------  GORI FARP MM25
		[43] = {
			name = "6th Cavalry",								--unit name
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "GORI FARP MM25",					--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Strike"] = true,
			},
			number = 8,
		},
		[44] = {
			name = "R/6th Cavalry",								--unit name
			inactive = true,
			type = "AH-1W",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},			
		---------------- AMBROLAURI FARP LN41
		[45] = {
			name = "GAH 2rd",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Georgia",								--unit country
			livery = "",									--unit livery
			base = "AMBROLAURI FARP LN41",					--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = false, -- no loadout for strike
			},
			number = 8,
		},
		[46] = {
			name = "R/GAH 2rd",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},			
	},
	["red"] = {	--side 2		
		-------------------- Mozdok ---------------		
		[1] = {
			name = "790.IAP",								--unit name
			type = "MiG-25PD",								--aircraft type
			country = "Russia",								--unit country
			livery = "af standard",							--unit livery
			base = "Mozdok",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[2] = {
			name = "1./117.IAP",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mozdok",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = false,	-- no load out for sead			
			},
			number = 12,
		},
		[3] = {
			name = "R./117.IAP",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[4] = {
			name = "1./113.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mozdok",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,				
			},
			number = 12,
		},
		[5] = {
			name = "R./113.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},
		[6] = {
			name = "1./115.IAP",								--unit name
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mozdok",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			number = 12,
		},
		[7] = {
			name = "R./115.IAP",								--unit name
			inactive = true,
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},		
		-------------------- Beslan ---------------
		[8] = {
			name = "1./37.IAP",							--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",							--unit country
			livery = "",							--unit livery
			base = "Beslan",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1.5,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[9] = {
			name = "R./37.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[10] = {
			name = "1./127.IAP",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Beslan",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = false,	-- no loadout 			
			},
			number = 12,
		},
		[11] = {
			name = "R./127.IAP",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[12] = {
			name = "1./123.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Beslan",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,				
			},
			number = 12,
		},
		[13] = {
			name = "R./123.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},		
		[14] = {
			name = "1./115AS.IAP",								--unit name
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Beslan",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,			
			},
			number = 12,
		},
		[15] = {
			name = "R./115AS.IAP",
			inactive = true,								--unit name
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill		
			tasks = {},									--unit tasks
			number = 12,
		},
		[16] = {
			name = "3.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},			--unit livery
			base = "Beslan",								--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 6,
		},
		---------------------- Nalchik ---------------
		[17] = {
			name = "1./19.IAP",							--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",							--unit country
			livery = "",						--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1.5,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[18] = {
			name = "R./19.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},
		[19] = {
			name = "2457 SDRLO",								--unit name
			type = "A-50",								--aircraft type
			country = "Russia",								--unit country
			sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},			--unit livery
			base = "Nalchik",								--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 4,
		},
		[20] = {
			name = "1./107.IAP",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = false,				
			},
			number = 12,
		},
		[21] = {
			name = "R./107.IAP",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[22] = {
			name = "1./111AS.IAP",								--unit name
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,						
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,			
			},
			number = 12,
		},
		[23] = {
			name = "R./111AS.IAP",								--unit name
			inactive = true,
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[24] = {
			name = "13.OSAP",								--unit name
			type = "Il-76MD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,				
			},
			number = 4,
		},
		[25] = {
			name = "R./13.OSAP",								--unit name
			inactive = true,
			type = "Il-76MD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
		-------------------- Mineralnye-Vody ------
		[26] = {
			name = "793.IAP",								--unit name
			type = "MiG-25PD",								--aircraft type
			country = "Russia",								--unit country
			livery = "af standard",							--unit livery
			base = "Mineralnye-Vody",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									
				["Intercept"] = 2, --unit tasks coef (optional)-- coef normal : = 1
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[27] = {
			name = "1./41.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = "High",								--unit skill
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
				["Laser Illumination"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 1.5,
			},
			number = 8,
		},
		[28] = {
			name = "R./41.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},		
		[29] = {
			name = "1./133.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mineralnye-Vody",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
			},
			number = 12,
		},
		[30] = {
			name = "R./133.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},
		[31] = {
			name = "1./135.IAP",								--unit name
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mineralnye-Vody",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			number = 12,
		},
		[32] = {
			name = "R./135.IAP",								--unit name
			inactive = true,
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[33] = {
			name = "1./29.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 2,
		},
		[34] = {
			name = "R./29.OSAP",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},		
		--------------------- Sochi-Adler --------------
		[35] = {
			name = "2.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},			--unit livery
			base = "Sochi-Adler",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 6,
		},		
		--------------------- Maykop-Khanskaya --------------
		[36] = {
			name = "1./153.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mineralnye-Vody",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,			
			},
			number = 12,
		},
		[37] = {
			name = "R./153.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[38] = {
			name = "1./61.IAP",								--unit name
			type = "Tu-22M3",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},			--unit livery
			base = "Maykop-Khanskaya",								--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 1.5,
			},
			number = 8,
		},
		[39] = {
			name = "R./61.IAP",								--unit name
			inactive = true,
			type = "Tu-22M3",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[40] = {
			name = "1./81.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = "High",								--unit skill
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,

			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 1.5,
			},
			number = 8,
		},
		[41] = {
			name = "R./81.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[42] = {
			name = "27.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[43] = {
			name = "R/27.OSAP",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",									--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		--------------------- Anapa-Vityazevo --------------
		[44] = {
			name = "23.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Anapa-Vityazevo",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 2,
		},
		[45] = {
			name = "R/23.OSAP",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",									--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		--------------------- Krasnodar-Center --------------
		[46] = {
			name = "2457.I SDRLO",								--unit name
			type = "A-50",								--aircraft type
			country = "Russia",								--unit country
			sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},			--unit livery
			base = "Krasnodar-Center",								--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 4,
		},
		[47] = {
			name = "25.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 2,
		},
		[48] = {
			name = "R/25.OSAP",								--unit name
			inactive = true,
			type = "An-26B",									--aircraft type
			country = "Russia",							
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},		
		-------------------- NOGIR FARP MN76
		[49] = { 
			name = "1st GHR",								--unit name
			type = "Mi-8MT",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "NOGIR FARP MN76", 						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = false,--no loadout
			},
			number = 4,
		},
		[50] = {
			name = "R/1st GHR",								--unit name
			inactive = true,
			type = "Mi-8MT",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		-------------------- TSKHINVALI FARP MM27
		[51] = {
			name = "2nd GHR",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "TSKHINVALI FARP MM27",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = false, -- no loadout
			},
			number = 4,
		},
		[52] = {
			name = "R/2nd GHR",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		-------------------- LENIGORI FARP MN76
		[53] = {
			name = "13th GHR",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "LENIGORI FARP MN76",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = false, -- no loadout
			},
			number = 4,
		},
		[54] = {
			name = "R/13th GHR",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		
		------------ post 1975	
		--[[	
		[40] = {
			name = "1./17.IAP",								--unit name
			type = "Su-25T",								--aircraft type
			country = "Russia",								--unit country
			livery = "",						--unit livery
			base = "Mozdok",						--unit base
			skill = "Random",
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[41] = {
			name = "2./17.IAP",								--unit name
			inactive = true,
			type = "Su-25T",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[42] = {
			name = "1./31.IAP",								--unit name
			type = "Su-27",								--aircraft type
			country = "Russia",						--unit country
			livery = "",			--unit livery
			base = "Mineralnye-Vody",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1.5,
			},
			number = 10,
		},
		[43] = {
			name = "3./31.IAP",								--unit name
			inactive = true,
			type = "Su-27",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		]]
	}
}
