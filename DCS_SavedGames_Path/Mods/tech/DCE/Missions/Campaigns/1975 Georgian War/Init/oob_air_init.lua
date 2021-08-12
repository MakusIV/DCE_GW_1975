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

]]-----------------------------------------------------------------------------------------------------

oob_air = {

	["blue"] = { --side 1

		[1] = {
			name = "III./JG-8",								--unit name
			player = false,									--player unit
			type = "F-4E",								--aircraft type
			country = "Germany",								--unit country
			livery = {"Germany East"},					--unit livery
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
			number = 4,
		},
		[2] = {
			name = "R/III./JG-8",								--unit name
			type = "F-4E",									--aircraft type
			country = "Germany",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 10,
		},
		[3] = {
			name = "TEF 1st AS",								--unit name
			player = true,									--player unit
			type = "F-5E-3",								--aircraft type
			country = "Turkey",								--unit country
			livery = {"3rd Main Jet Base Group Command, Turkey"},					--unit livery
			base = "Batumi",							--unit base
			skill = "high",									--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
				["Intercept"] = true,
			},
			number = 7,
		},
		[4] = {
			name = "R/TEF 1st AS",								--unit name
			inactive = true,
			type = "F-5E-3",									--aircraft type
			country = "Turkey",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 20,
		},
		[5] = {
			name = "1st THR",								--unit name
			type = "UH-1H",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Turkey",								--unit country
			livery = "Turkish Air Force",									--unit livery
			base = "FARP-1st THR",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 8,
		},
		[6] = {
			name = "R/1st THR",								--unit name
			inactive = true,
			type = "UH-1H",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},
		[7] = {
			name = "2nd THR",								--unit name
			type = "AH-1W",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Turkey",								--unit country
			livery = "Turkey 2",									--unit livery
			base = "FARP-2nd THR",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Strike"] = true,
			},
			number = 8,
		},
		[8] = {
			name = "R/2nd THR",								--unit name
			inactive = true,
			type = "AH-1W",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 20,
		},
		[9] = {
			name = "58 TFS",								--unit name
			player = false,									--player unit
			type = "F-4E",								--aircraft type
			country = "USA",								--unit country
			livery = {""},					--unit livery
			base = "Vaziani",							--unit base
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
		[10] = {
			name = "R/58 TFS",								--unit name
			inactive = true,
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 15,
		},
		[11] = {
			name = "TEF 1st TS",								--unit name
			type = "C-130",									--aircraft type
			country = "Turkey",								--unit country
			livery = "",				--unit livery
			base = "Batumi",						--unit base
			skill = "Random",									--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 3,
		},
		[12] = {
			name = "R/TEF 1st TS",								--unit name
			type = "C-130",									--aircraft type
			country = "Turkey",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 7,
		},

		[13] = {
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
		[14] = {
			name = "R/69 BS",								--unit name
			inactive = true,
			type = "B-52H",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 15,
		},
		[15] = {
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
		[16] = {
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
		[17] = {
			name = "R/171 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 9,
		},
		[18] = {
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
		[19] = {
			name = "R/801 ARS",								--unit name
			inactive = true,
			type = "KC-135",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},
		[20] = {
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
		[21] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},
		[22] = {
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
		[23] = {
			name = "R/VF-101",								--unit name
			inactive = true,
			type = "F-14A-135-GR",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 30,
		},

		[24] = {
			name = "F7",								--unit name
			player = true,									--player unit
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
			name = "F21",								--unit name
			inactive = true,
			type = "AJS37",									--aircraft type
			country = "Sweden",								--unit country
			base = "Reserves",								--unit base
			tasks = {},										--unit tasks
			number = 30,
		},
		[26] = {
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
		[27] = {
			name = "R/VAW-125",								--unit name
			inactive = true,
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 5,
		},
		[28] = {
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
		[29] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "S-3B Tanker",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",							--unit base
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},
		[30] = {
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
			number = 5,
		},
	},

	["red"] = {	--side 2

		[3] = {
			name = "2./14.IAP",							--unit name
			player = false,									--player unit
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",							--unit country
			livery = {""},						--unit livery
			base = "Senaki-Kolkhi",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			number = 16,
		},
		[4] = {
			name = "2./14.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",							--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},


		[1] = {
			name = "1./14.IAP",							--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},									--unit livery
			base = "Mozdok",							--unit base
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
				["CAP"] = 1,
				["Escort"] = 1.5,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[2] = {
			name = "2./14.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[3] = {
			name = "790.IAP",								--unit name
			type = "MiG-25PD",								--aircraft type
			country = "Russia",								--unit country
			livery = "af standard",							--unit livery
			base = "Mozdok",							--unit base
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
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[4] = {
			name = "1./19.IAP",							--unit name
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
		[5] = {
			name = "2./19.IAP",							--unit name
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
			number = 8,
		},
		[6] = {
			name = "3./19.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[7] = {
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
		[8] = {
			name = "2./17.IAP",								--unit name
			inactive = true,
			type = "Su-25T",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[9] = {
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
		[10] = {
			name = "3./31.IAP",								--unit name
			inactive = true,
			type = "Su-27",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[11] = {
			name = "1./41.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = "high",								--unit skill
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
		[12] = {
			name = "R./41.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[13] = {
			name = "2.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {"Aeroflot", "RF Air Force"},			--unit livery
			base = "Sochi-Adler",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},
		[14] = {
			name = "3.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {"Aeroflot", "RF Air Force"},			--unit livery
			base = "Beslan",								--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 1,
		},
		[15] = {
			name = "1./61.IAP",								--unit name
			type = "Tu-22M3",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},			--unit livery
			base = "Maykop-Khanskaya",								--unit base
			skill = "high",								--unit skill
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
		[16] = {
			name = "R./61.IAP",								--unit name
			inactive = true,
			type = "Tu-22M3",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[17] = {
			name = "1./81.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = "high",								--unit skill
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
		[18] = {
			name = "R./81.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = "high",								--unit skill
			tasks = {},									--unit tasks
			number = 18,
		},
		[19] = {
			name = "2457 SDRLO",								--unit name
			type = "A-50",								--aircraft type
			country = "Russia",								--unit country
			sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},			--unit livery
			base = "Nalchik",								--unit base
			skill = "high",								--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 4,
		},

		-------
		[7] = {
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
		[8] = {
			name = "R./107.IAP",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},

		[7] = {
			name = "1./103.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,		
			},
			number = 12,
		},
		[8] = {
			name = "R./103.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},

		[7] = {
			name = "1./105.IAP",								--unit name
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			number = 12,
		},
		[8] = {
			name = "R./105.IAP",								--unit name
			inactive = true,
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},

		[7] = {
			name = "1./111AS.IAP",								--unit name
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			livery = "",								--unit livery
			base = "Nalchik",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,	
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,		
			},
			number = 12,
		},
		[8] = {
			name = "R./111AS.IAP",								--unit name
			inactive = true,
			type = "L-39A",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},

		
		[7] = {
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
		[8] = {
			name = "R./13.OSAP",								--unit name
			inactive = true,
			type = "Il-76MD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},
		
		
		
		[7] = {
			name = "GA 3rd AS",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Georgia",								--unit country
			livery = "af standard",			--unit livery
			base = "Kutaisi",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			number = 12,
		},
		[8] = {
			name = "R/GA 3rd AS",								--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Georgia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},

		[7] = {
			name = "GA 3rd AS",								--unit name
			type = "MiG-19P",								--aircraft type
			country = "Georgia",								--unit country
			livery = "",								--unit livery
			base = "Kutaisi",							--unit base
			skill = "Random",								--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,		
			},
			number = 12,
		},
		[8] = {
			name = "R./GA 3rd AS",								--unit name
			inactive = true,
			type = "MiG-19P",								--aircraft type
			country = "Georgia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},



		[9] = {
			name = "GA 1st TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Anapa-Vityazevo",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[10] = {
			name = "R/GA 1st TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",									--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		[11] = {
			name = "GA 2nd TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[12] = {
			name = "R/GA 2nd TS",								--unit name
			inactive = true,
			type = "An-26B",									--aircraft type
			country = "Russia",							
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
		[13] = { -- no senaki è blue
			name = "GA 3rd TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Senaki-Kolkhi",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[14] = {
			name = "R/GA 3rd TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
		[15] = {
			name = "GA 4th TS",								--unit name
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
		[16] = {
			name = "R/GA 4th TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = "Random",									--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		[17] = {
			name = "GA 5th TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Sochi-Adler",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[18] = {
			name = "R/GA 5th TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
		[19] = {
			name = "GA 6th TS",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Nalchik",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[20] = {
			name = "R/GA 6th TS",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
		[21] = { --- verifica posizione farp
			name = "1st GHR",								--unit name
			type = "Mi-8MT",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "FARP-1st GHR",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 4,
		},
		[22] = {
			name = "R/1st GHR",								--unit name
			inactive = true,
			type = "Mi-8MT",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},
		[23] = { -- verifica posizione farp
			name = "2nd GHR",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "FARP-2nd GHR",						--unit base
			skill = "Random",									--unit skill
			tasks = {
				["Strike"] = true,
			},
			number = 4,
		},
		[24] = {
			name = "R/2nd GHR",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			base = "Reserves",
			skill = "Random",								--unit skill
			tasks = {},									--unit tasks
			number = 12,
		},
	}
}
