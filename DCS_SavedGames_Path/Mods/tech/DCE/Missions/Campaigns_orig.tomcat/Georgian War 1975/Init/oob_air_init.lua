--Order of Battle - Aircraft/Helicopter
--organized in units (squadrons/regiments) containing a number of aircraft
--Campaign Version-V20.00

-- Miguel Fichier Revision M42
------------------------------------------------------------------------------------------------------- 

-- miguel21 modification M42 : liveryModex ajoute des Skin lié au numero de l avion
-- Miguel21 modification M33.e 	Custom Briefing (e: divers)
-- ATO_G_adjustment02 TASK Coef


--[[ Unit Entry Example ----------------------------------------------------------------------------

[1] = {
	inactive = true,								--true if unit is not active
	player = true,									--true for player unit
	name = "527 TFS",								--unit name
	type = "F-5E-3",								--aircraft type
	helicopter = true,								--true for helicopter units
	country = "USA",								--unit country
	livery = {"USAF Euro Camo"},					--unit livery
	liveryModex = {									--unit livery Modex  (optional)
		[100] = "VF-101 Dark",
		[110] = "VF-101 Grim Reapers Low Vis",
		},
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
	tasksCoef = {									--unit tasks coef (optional)
		["Strike"] = 1,								-- coef normal : = 1
		["SEAD"] = 1,
		["Laser Illumination"] = 1,
		["Intercept"] = 1,
		["CAP"] = 0.2,
		["Escort"] = 3,
		["Fighter Sweep"] = 1,	
	},
	number = 12,									--number of airframes
	refuelable = false,								--aucun affichage de TACAN ou autre Frequence des TANKER dans le briefing
},

]]-----------------------------------------------------------------------------------------------------
oob_air = {
	["blue"] = {											--side 1
		[1] = {
			name = "74th FS",								--unit name
			player = false,									--player unit
			type = "A-10C_2",								--aircraft type
			country = "USA",								--unit country
			livery = {"74th fs moody afb, georgia (ft)"},	--unit livery
			base = "Sharjah Intl",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = false,
				["Escort"] = false,
				["Fighter Sweep"] = false,
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
				["Anti-ship Strike"] = 0.5,
			},
			number = 4,
		},
		[2] = {
			name = "74th FS Res",								--unit name
			inactive = true,
			type = "A-10C_2",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 18,
		},
		[3] = {
			name = "71st FS",								--unit name
			player = false,									--player unit
			type = "M-2000C",								--aircraft type
			country = "United Arab Emirates",								--unit country
			livery = {"UAE Air Force"},					--unit livery
			base = "Al Dhafra AB",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Intercept"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 0.5,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 0.5,
			},
			number = 12,
		},
		[4] = {
			name = "71st FS Res",							--unit name
			inactive = true,
			type = "M-2000C",								--aircraft type
			country = "United Arab Emirates",				--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 18,
		},
		[5] = {
			name = "VFA-106",								--unit name
			player = false,									--player unit
			type = "FA-18C_hornet",							--aircraft type
			country = "USA",								--unit country
			livery = "vfa-106",								--unit livery	livery = "VFA-131",
			liveryModex = {									--unit livery Modex  (optional)
				[200] = "vfa-106 high visibility",
				},
			sidenumber = {200, 215},														 
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["SEAD"] = true,
				["Intercept"] = true,
				["CAP"] = true,
				["Fighter Sweep"] = true,
				["Escort"] = true,
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 0.2,
				["Escort"] = 0.5,
				["Fighter Sweep"] = 0.2,
				["Anti-ship Strike"] = 2,
			},
			number = 16,
		},
		[6] = {
			name = "R/VFA-106",								--unit name
			inactive = true,
			type = "F/A-18C",								--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 28,
		},
		[7] = {
			name = "VAW-125",								--unit name
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			livery = "E-2D Demo",							--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[600] = "VAW-125 Tigertails",
				},
			sidenumber = {600, 603},														 
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 4,
		},
		[8] = {
			name = "R/VAW-125",								--unit name
			inactive = true,
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 8,
		},
		[9] = {
			name = "174 ARW",								--unit name
			type = "S-3B Tanker",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			sidenumber = {700, 705},														 
			base = "CVN-71 Theodore Roosevelt",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 6,
		},
		[10] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "S-3B Tanker",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 10,
		},
		[11] = {
			name = "171 ARW",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Dubai Intl",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[12] = {
			name = "R/171 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 9,
		},		
		-- [19] = {
			-- name = "42 TAS",								--unit name
			-- type = "C-130",									--aircraft type
			-- country = "USA",								--unit country
			-- livery = "US Air Force",						--unit livery
			-- base = "Al Dhafra AB",								--unit base
			-- skill = "Random",								--unit skill
			-- tasks = {										--unit tasks
				-- ["Transport"] = true,
			-- },
			-- number = 2,
		-- },
		[13] = {
			name = "7 ACCS",								--unit name
			type = "E-3A",									--aircraft type
			country = "USA",								--unit country
			livery = "usaf standard",						--unit livery
			base = "Al Maktoum Intl",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 3,
		},
		[14] = {
			name = "VF-101",							--unit name
			player = true,									--player unit
			type = "F-14B",								--aircraft type
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
				["Strike"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 16,
		},
		[15] = {
			name = "R/VF-101",								--unit name
			inactive = true,
			type = "F-14B",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},										--unit tasks
			number = 24,
		},		
		[16] = {
			name = "41 TAS",								--unit name
			type = "CH-47D",								--aircraft type
			helicopter = true,
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "LHA_Nassau",								--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},
		[17] = {
			name = "R/41 TAS",								--unit name
			inactive = true,
			type = "CH-47D",								--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = "High",									--unit skill
			tasks = {},										--unit tasks
			number = 6,
		},
		[18] = {
			name = "VMA 311",								--unit name
			player = false,									--player unit
			type = "AV8BNA",								--aircraft type
			country = "USA",								--unit country
			livery = "vma-311",								--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vma-311d",
				},
			sidenumber = {100, 103},
			base = "LHA_Tarawa",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = false,
			},
			number = 4,
		},
		[19] = {
			name = "VMA 331",								--unit name
			inactive = true,
			type = "AV8BNA",								--aircraft type
			base = "Reserves",								--unit base
			tasks = {										--unit tasks
			},
			number = 30,
		},
		[20] = {
			name = "4eme RHA",								--unit name
			player = false,									--player unit
			type = "SA342M",								--aircraft type
			helicopter = true,
			country = "France",								--unit country
			livery = {"Desert Storm FR Sand"},										--unit livery
			base = "Jazirat al Hamra FARP",								--unit base
			skill = "high",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,				
			},
			number = 6,
		},
		[21] = {
			name = "3eme RHA",								--unit name
			inactive = true,
			type = "SA342M",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 32,
		},
		[22] = {
			name = "2nd Shaheen Squadron",								--unit name
			player = false,									--player unit
			type = "F-16C_50",							--aircraft type
			country = "United Arab Emirates",								--unit country
			livery = "UAE",			--unit livery
			base = "Dubai Intl",							--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Laser Illumination"] = false,
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,	
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 0.2,
				["Anti-ship Strike"] = 1,
			},
			number = 12,
		},
		[23] = {
			name = "2nd Shaheen Squadron Res",				--unit name
			inactive = true,
			type = "F-16C_50",								--aircraft type
			country = "United Arab Emirates",				--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 24,
		},
		[24] = {
			name = "VMFA-312",								--unit name name = "VFA-192",
			player = false,									--player unit
			type = "FA-18C_hornet",							--aircraft type
			country = "USA",								--unit country
			livery = "vmfa-312",							--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[200] = "vmfa-312 high visibility",
				},
			sidenumber = {200, 215},														 
			base = "CVN-74 John C. Stennis",				--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["SEAD"] = true,
				["Intercept"] = true,
				["CAP"] = false,
				["Fighter Sweep"] = false,
				["Escort"] = false,
				["Strike"] = true,
				["Anti-ship Strike"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 0.2,
				["Escort"] = 0.5,
				["Fighter Sweep"] = 0.2,
				["Anti-ship Strike"] = 2,
			},
			number = 16,
		},
		[25] = {
			name = "R/VMFA-312",								--unit name
			inactive = true,
			type = "FA-18C_hornet",							--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 28,
		},
		[26] = {
			name = "VF-143",								--unit name	name = "VF-32",
			player = false,									--player unit
			type = "F-14B",									--aircraft type
			country = "USA",								--unit country
			livery = {"vf-143 pukin dogs low vis", "vf-143 pukin dogs low vis (1995)"},				--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vf-143 pukin dogs cag",
				[110] = "vf-143 pukin dogs low vis (1995)",
				[114] = "vf-143 pukin dogs low vis",
				},
			sidenumber = {100, 115},						--unit range of sidenumbers (optional)
			base = "CVN-74 John C. Stennis",				--unit base
			skill = "High",									--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,
				["Strike"] = false,				
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 16,
		},
		[27] = {
			name = "R/VF-143",								--unit name
			inactive = true,
			type = "F-14B",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 30,
		},
		-- [13] = {
			-- name = "801 ARS",								--unit name
			-- type = "KC-135",								--aircraft type
			-- country = "USA",								--unit country
			-- livery = "Standard USAF",						--unit livery
			-- base = "Nellis AFB",							--unit base
			-- skill = "High",								--unit skill
			-- tasks = {										--unit tasks
				-- ["Refueling"] = true,
			-- },
			-- number = 3,
		-- },
		[28] = {
			name = "175 ARW",								--unit name
			type = "KC-135",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Al Dhafra AB",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[29] = {
			name = "R/175 ARW",								--unit name
			inactive = true,
			type = "KC-135",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 6,
		},
	},
	["red"] = {												--side 2
		[1] = {
			name = "81 TFS",							--unit name
			type = "F-14A-135-GR",								--aircraft type
			country = "Iran",								--unit country
			livery = {"IRIAF Blue-Gray"},				--unit livery
			base = "Lar Airbase",							--unit base
			skill = "High",								--unit skill
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
				["CAP"] = 2,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 4,
		},
		[2] = {
			name = "82 TFS",								--unit name
			inactive = true,
			type = "F-14A-135-GR",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[3] = {
			name = "23 TFS",							--unit name
			type = "F-4E",								--aircraft type
			country = "Iran",							--unit country
			livery = {"IRIAF Asia Minor","IR IRIAF"},						--unit livery
			base = "Bandar Abbas Intl",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["SEAD"] = true,	
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,				
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 4,
		},
		[4] = {
			name = "11 TFS",								--unit name
			inactive = true,
			type = "F-4E",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[5] = {
			name = "91 TFS",								--unit name
			type = "F-4E",								--aircraft type
			country = "Iran",								--unit country
			livery = {"IRIAF Asia Minor","IR IRIAF"},						--unit livery
			base = "Bandar Abbas Intl",						--unit base
			skill = "Random",
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,				
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 4,
		},
		[6] = {
			name = "31 TFS",								--unit name
			inactive = true,
			type = "F-4E",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[7] = {
			name = "41 TFS",								--unit name
			type = "F-5E-3",								--aircraft type
			country = "Iran",						--unit country
			livery = "IR IRIAF Camo",			--unit livery
			base = "Bandar Abbas Intl",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,				
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 4,
		},
		[8] = {
			name = "141 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[9] = {
			name = "72 TFS",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Iran",								--unit country
			livery = "Iranian Air Force",									--unit livery
			base = "Shiraz Intl",						--unit base
			skill = "high",									--unit skill
			tasks = {
				["Strike"] = true,
				["Anti-ship Strike"] = false,				
				["SEAD"] = true,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 6,
		},
		[10] = {
			name = "73 TFS",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = "high",									--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[11] = {
			name = "51 TFS",								--unit name
			type = "MiG-29A",								--aircraft type
			player = false,									--player unit
			country = "Iran",								--unit country
			livery = {"IRIAF blue-grey"},									--unit livery
			base = "Bandar Abbas Intl",								--unit base
			skill = "high",								--unit skill
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
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1.5,
				["Fighter Sweep"] = 1,	
			},
			number = 6,
		},
		[12] = {
			name = "52 TFS",								--unit name
			inactive = true,
			type = "MiG-29A",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[13] = {
			name = "21 TFS",							--unit name
			type = "F-5E-3",							--aircraft type
			country = "Iran",							--unit country
			livery = "IR IRIAF Camo",					--unit livery
			base = "Sirri Island",						--unit base
			skill = "high",								--unit skill
			tasks = {
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
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 6,
		},
		[14] = {
			name = "22 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 22,
		},
		[15] = {
			name = "Tanker sqd",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "Iran",								--unit country
			livery = {"IRIAF"},									--unit livery
			base = "Shiraz Intl",							--unit base
			skill = "High",								--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 4,
		},
		[16] = {
			name = "83 TFS",							--unit name
			type = "F-14A-135-GR",								--aircraft type
			country = "Iran",								--unit country
			livery = {"IRIAF Blue-Gray"},				--unit livery
			base = "Shiraz Intl",							--unit base
			skill = "High",								--unit skill
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
				["Intercept"] = 1,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 4,
		},
		[17] = {
			name = "84 TFS",								--unit name
			inactive = true,
			type = "F-14A-135-GR",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[18] = {
			name = "21-2 TFS",							--unit name
			type = "F-5E-3",							--aircraft type
			country = "Iran",							--unit country
			livery = "IR IRIAF Camo",					--unit livery
			base = "Qeshm Island",						--unit base
			skill = "high",								--unit skill
			tasks = {
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
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 6,
		},
		[19] = {
			name = "22-2 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 22,
		},
		[20] = {
			name = "50 Squadron",								--unit name
			player = false,									--player unit
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Iran",								--unit country
			livery = {"I.R.I.A.A"},									--unit livery
			base = "Al Ima FARP",								--unit base
			skill = "high",								--unit skill
			tasks = {										--unit tasks
				["Escort"] = false,
				["Strike"] = true,
			},
			number = 6,
		},
		[21] = {
			name = "50 Squadron Res",								--unit name
			inactive = true,
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 16,
		},
		[22] = {
			name = "51 Squadron",								--unit name
			player = false,									--player unit
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Iran",								--unit country
			livery = {"I.R.I.A.A"},									--unit livery
			base = "Khasab",								--unit base
			skill = "high",								--unit skill
			tasks = {										--unit tasks
				["Escort"] = false,
				["Strike"] = true,
			},
			number = 2,
		},
		[23] = {
			name = "51 Squadron Res",								--unit name
			inactive = true,
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 16,
		},
		[24] = {
			name = "21-3 TFS",							--unit name
			type = "F-5E-3",							--aircraft type
			country = "Iran",							--unit country
			livery = "IR IRIAF Camo",					--unit livery
			base = "Bandar e Jask airfield",						--unit base
			skill = "high",								--unit skill
			tasks = {
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,
				["Strike"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,	
			},
			number = 10,
		},
		[25] = {
			name = "22-3 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},
		[26] = {
			name = "21-4 TFS",							--unit name
			type = "F-5E-3",							--aircraft type
			country = "Iran",							--unit country
			livery = "IR IRIAF Camo",					--unit livery
			base = "Khasab",						--unit base
			skill = "high",								--unit skill
			tasks = {
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 1,
				["Escort"] = 0.5,
				["Fighter Sweep"] = 0.2,	
			},
			number = 6,
		},
		[27] = {
			name = "22-4 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 22,
		},
		-- [20] = {
			-- name = "AWACS Squadron",								--unit name
			-- type = "A-50",									--aircraft type
			-- country = "Iran",								--unit country
			-- livery = "ADNAN",						--unit livery
			-- base = "Shiraz Intl",							--unit base
			-- skill = "High",								--unit skill
			-- tasks = {										--unit tasks
				-- ["AWACS"] = true,
			-- },
			-- number = 2,
		-- },		
--[[		[20] = {
			name = "71 TAS",								--unit name
			type = "UH-1H",									--aircraft type
			country = "Iran",								--unit country
			livery = "IRIAA 6-4310",									--unit livery
			base = "FARP_Dublin",				--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},
		[21] = {
			name = "R/71 TAS",								--unit name
			inactive = true,
			type = "UH-1H",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 6,
		},		
		[15] = {
			name = "23 TFS",							--unit name
			type = "F-5E-3",							--aircraft type
			country = "Iran",							--unit country
			livery = "IR IRIAF Camo",					--unit livery
			base = "Abu Musa Island Airport",						--unit base
			skill = "high",								--unit skill
			tasks = {
				["Intercept"] = true,
			},
			number = 2,
		},
		[16] = {
			name = "24 TFS",								--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 22,
		},]]--
--[[		[20] = {
			name = "53 TFS",								--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Iran",								--unit country
			livery = "IRIAF - Standard",								--unit livery
			base = "Havadarya",						--unit base
			skill = "high",								--unit skill
			tasks = {
				["Intercept"] = true,
				["CAP"] = true,				
			},
			number = 4,
		},
		[21] = {
			name = "54 TFS",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},		
		[11] = {
			name = "71 TAS",								--unit name
			type = "C-130",									--aircraft type
			country = "Iran",								--unit country
			livery = {""},									--unit livery
			base = "Abu Musa Island Airport",				--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},
		[12] = {
			name = "72 TAS",								--unit name
			type = "C-130",									--aircraft type
			country = "Iran",								--unit country
			livery = {""},									--unit livery
			base = "Havadarya",								--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},]]--		
	},
}

--List of aliases to replace type names in briefing/debriefing
TypeAlias = {
}