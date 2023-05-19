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
f/a F-5E (VMFA-157): 12 + 36 = 48
f/a F-4E (VMFA-151): 12 + 36 = 48
b B-52H (69 BS): 3 + 15 = 18
t C-130 (315th Air Division): 3 + 7 = 10
r KC135MPRS (171 ARW): 3 + 9 = 12

Kobuleti
f/a F-4E (54 TFS): 12 + 36 = 48
t C-130 (317th Air Division): 3 + 7 = 10

Vaziani
f/a MiG-19P (GA 4rd AS): 12 + 36 = 48
a MiG-27K (GA 3rd AS): 12 + 36 = 48

Kutaisi
f/a F-4E (58 TFS): 12 + 36 = 48
f/a Mirage F1-C: 12 + 24 = 36
aw E-3A (7 ACCS): 3

Senaki-Kolkhi
f/a MiG-21Bis (GA 7rd AS): 12 + 36 = 48
t An-26B (GA 5rd TS): 1 + 4 = 5
r KC135MPRS (801 ARS): 3 + 7 = 10

Tbilissi-Lochini
f/a AJS37 (F9): 12 + 36 = 48
r KC135MPRS (174 ARW): 3 + 7 = 10

Sukhumi
f/a AJS37 (F7): 12 + 36 = 48
f/a F-4E (VMFA-159): 12 + 36 = 48

CVN-71 Theodore Roosevelt
f/a F-14A-135-GR (VF-101): 12 + 36 = 48
aw E-2C (VAW-125): 5 + 5 = 10
r S-3B Tanker (174 ARW):  5 + 5 = 10

CVN-74 John C. Stennis
f/a F-14A-135-GR (VF-118/GA): 12 + 36 = 48
r S-3B Tanker (177 ARW): 8

FARP-KHASHURI
attack/transport: 8+20 UH-1H(17th Cavalry)

FARP-GORI
attack/transport: 8+20 AH-1W(6th Cavalry)

FARP-Ambrolauri
attack/transport: 8+20 Mi-24V(GAH 2rdy)


---- RED

Mozdok
f/a MiG-23MLD (113.IAP): 24 + 36 = 60
f MiG-25PD (790.IAP): 12 + 36 = 48
a MiG-27K (117.IAP): 12 + 36 = 48
a Su-17M4 (115.IAP): 12 + 36 = 48

Beslan
f/a MiG-21Bis (37.IAP):  24 + 36 = 60
f/a MiG-23MLD (123.IAP):  12 + 36 = 48
f MiG-25PD (790.IAP): 12 + 36 = 48
a MiG-27K (127.IAP): 12 + 36 = 48
a L-39C (115AS.IAP): 12 + 36 = 48



Nalchik
f/a MiG-21Bis (19.IAP):  18 + 36 = 52
a MiG-27K (107.IAP): 12 + 36 = 48
aw A-50 (2457 SDRLO): 4
t Il-76MD (13.OSAP): 4 + 4 = 8
a L-39C (111AS.IAP): 12 + 36 = 48

Mineralnye-Vody
f MiG-23MLD (133.IAP): 12 + 36 = 48
f MiG-25PD (793.IAP): 12
b Su-24M (41.IAP): 12 + 36 = 48
a Su-17M4 (135.IAP): 12 + 36 = 48
t An-26B (3.OSAP): 2 + 4 = 6

Sochi-Adler
t An-26B (2.OSAP): 2 + 4 = 6

Maykop-Khanskaya
f MiG-23MLD (153.IAP): 18 + 36 = 48
b Su-24M (81.IAP): 12 + 36 = 48
b Tu-22M3 (61.IAP): 8 + 8 = 16
t 2+4 An-26B (27.OSAP): 1 + 4 = 5

Anapa-Vityazevo
t An-26B (23.OSAP): 1 + 4 = 5

Krasnodar-Center
t An-26B (25.OSAP): 1 + 4 = 5
aw A-50 (2457.I SDRLO): 4
f MiG-23MLD (153.IAP): 18 + 36 = 48

FARP-NOGIR
a/t Mi-8MT (1st GHR): 4 + 24 = 28

FARP-TSKHINVALI 
a/t Mi-24V (2nd GHR): 4 + 24 = 28

FARP- LENIGORI 
a/t Mi-24V (2nd GHR): 4 + 24 = 28


---------------------- total ------------------------

blue                      red
f:
f/a
a:
b:
hb:
t:
aw:
r:
heli:



]]-----------------------------------------------------------------------------------------------------

oob_air = {

	["blue"] = { --side 1
        -------------- Batumi -------------------------
		[1] = {
			name = "VMFA-151",								--unit name			
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Batumi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,							-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 0.3,
				["Escort"] = 0.3,
				["Fighter Sweep"] = 0.2,	
			},
			number = 12,
		},
		[2] = {
			name = "R/VMFA-151",							--unit name
			inactive = true,
			type = "F-4E",									--aircraft type
			country = "Usa",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[3] = {
			name = "VMFA-157",								--unit name
			--player = true,								--player unit
			type = "F-5E-3",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Batumi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Intercept"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 0.7,
				["Escort"] = 0.5,
				["Fighter Sweep"] = 0.2,	
			},
			number = 12,
		},
		[4] = {
			name = "R/VMFA-157",							--unit name
			inactive = true,
			type = "F-5E-3",								--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 20,
		},
		[5] = {
			name = "315th Air Division",					--unit name
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Batumi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 36,
		},
		[6] = {
			name = "R/315th Air Division",					--unit name
			inactive = true,
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 7,
		},
		[7] = { -- KOBULETI --------------------------------------------------------------------
			name = "69 BS",									--unit name
			type = "B-52H",									--aircraft type
			country = "USA",								--unit country
			livery = "usaf standard",						--unit livery
			base = "Kobuleti",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_bomber, mission_ini.max_skill_blue_bomber),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
			},
			number = 3,
		},
		[8] = {
			name = "R/69 BS",								--unit name
			inactive = true,
			type = "B-52H",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_bomber, mission_ini.max_skill_blue_bomber),			--unit skill
			tasks = {},										--unit tasks
			number = 15,
		},-- END KOBULETI --------------------------------------------------------------------
		[9] = {
			name = "171 ARW",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Batumi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[10] = {
			name = "R/171 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {},										--unit tasks
			number = 9,
		},		
			------------------ Vaziani ---------------------		
		[11] = {
			name = "GA 3rd AS",								--unit name
			type = "MiG-27K",								--aircraft type
			country = "Georgia",							--unit country
			livery = "af standard",							--unit livery
			base = "Vaziani",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,
				["SEAD"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,							-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,				
			},
			number = 12,
		},
		[12] = {
			name = "R/GA 3rd AS",							--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Georgia",							--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[13] = {
			name = "GA 4rd AS",								--unit name
			type = "MiG-19P",								--aircraft type
			country = "Georgia",							--unit country
			livery = "",									--unit livery
			base = "Vaziani",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,		
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 1.5,
				["Escort"] = 2,
				["Fighter Sweep"] = 0.2,	
			},
			number = 12,
		},
		[14] = {
			name = "R/GA 4rd AS",							--unit name
			inactive = true,
			type = "MiG-19P",								--aircraft type
			country = "Georgia",							--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},		
			----------------------- Kutaisi -------------------------		
		[15] = {
			name = "58 TFS",								--unit name			
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Kutaisi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 0.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 0.2,	
			},
			number = 12,
		},
		[16] = {
			name = "R/58 TFS",								--unit name
			inactive = true,
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[17] = {
			name = "7 ACCS",								--unit name
			type = "E-3A",									--aircraft type
			country = "USA",								--unit country
			livery = "usaf standard",						--unit livery
			base = "Kutaisi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_awacs, mission_ini.max_skill_blue_awacs),			--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 3,
		},
			---------------------- Senaki-Kolkhi ----------------------
		[18] = {
			name = "GA 7rd AS",							--unit name
			--player = false,							--player unit
			type = "MiG-21Bis",							--aircraft type
			country = "Georgia",						--unit country
			livery = "",								--unit livery
			base = "Senaki-Kolkhi",						--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {									--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Anti-ship Strike"] = true,
				["Strike"] = true,
			},
			tasksCoef = {								--unit tasks coef (optional)
				["Strike"] = 0.5,							-- coef normal : = 1
				["SEAD"] = 0.2,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1.5,
				["Anti-ship Strike"] = 0.5,
			},
			number = 12,
		},
		[19] = {
			name = "R/GA 7rd AS",						--unit name
			inactive = true,
			type = "MiG-21Bis",							--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},
			----------------------- Soganlug ----------------------------
		[20] = {
			name = "801 ARS",							--unit name
			type = "KC-135",							--aircraft type
			country = "USA",							--unit country
			livery = "Standard USAF",					--unit livery
			base = "Soganlug",						--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {									--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[21] = {
			name = "R/801 ARS",							--unit name
			inactive = true,
			type = "KC-135",							--aircraft type
			country = "USA",							--unit country
			base = "Reserves",							--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {},									--unit tasks
			number = 7,
		},		
			---------------------- Senaki-Kolkhi ----------------------
		[22] = { 
			name = "GA 5rd TS",							--unit name
			type = "An-26B",							--aircraft type
			country = "Georgia",						--unit country
			livery = "",								--unit livery
			base = "Senaki-Kolkhi",						--unit base
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[23] = {
			name = "R/GA 5rd TS",						--unit name
			inactive = true,
			type = "An-26B",							--aircraft type
			country = "Georgia",						--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {},									--unit tasks
			number = 4,
		},
			--------------------- Tbilissi-Lochini -------------------
		[24] = {
			name = "F9",								--unit name
			--player = true,							--player unit
			type = "AJS37",								--aircraft type
			country = "Sweden",							--unit country
			livery = {"#4 Splinter F7 Skaraborgs Flygflottilj 76"},					--unit livery
			base = "Tbilissi-Lochini",					--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {									--unit tasks
				["CAP"] = false, -- no loadout
				["Escort"] = false, -- no loadout
				["Fighter Sweep"] = false, -- no loadout
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {								--unit tasks coef (optional)
				["Strike"] = 1.5,						-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 0.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 0.7,
				["Anti-ship Strike"] = 2,
			},
			number = 12,
		},				
		[25] = {
			name = "R/F9",									--unit name
			inactive = true,
			type = "AJS37",									--aircraft type
			country = "Sweden",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[26] = {
			name = "174 ARW",								--unit name
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Tbilissi-Lochini",						--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 3,
		},
		[27] = {
			name = "R/174 ARW",								--unit name
			inactive = true,
			type = "KC135MPRS",								--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {},										--unit tasks
			number = 7,
		},
        	-------------------- Sukhumi -------------------------------------
		[28] = {
			name = "VMFA-159",								--unit name			
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Sukhumi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 1.3,
				["CAP"] = 1,
				["Escort"] = 1.5,
				["Fighter Sweep"] = 1,	
			},
			number = 12,
		},
		[29] = {
			name = "R/VMFA-159",							--unit name
			type = "F-4E",									--aircraft type
			inactive = true,
			country = "Usa",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[30] = {
			name = "F7",								--unit name
			--player = true,							--player unit
			type = "AJS37",								--aircraft type
			country = "Sweden",							--unit country
			livery = {"#4 Splinter F7 Skaraborgs Flygflottilj 76"},					--unit livery
			base = "Sukhumi",							--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {									--unit tasks
				["CAP"] = false,
				["Escort"] = false,
				["Fighter Sweep"] = false,	
				["Strike"] = true,
				["Anti-ship Strike"] = true,		
			},
			tasksCoef = {								--unit tasks coef (optional)
				["Strike"] = 2,							-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 1,
				["Escort"] = 1,
				["Fighter Sweep"] = 0.5,
				["Anti-ship Strike"] = 2,
			},
			number = 12,
		},				
		[31] = {
			name = "R/F7",									--unit name
			inactive = true,
			type = "AJS37",									--aircraft type
			country = "Sweden",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36
		},
			--------------- CVN-71 Theodore Roosevelt ----------------------
		[32] = {
			name = "VF-101",								--unit name
			player = true,									--player unit
			type = "F-14A-135-GR",							--aircraft type
			country = "USA",								--unit country
			livery = {"vf-101 grim reapers low vis", "vf-101 dark"},				--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vf-101 red",
				[105] = "vf-101 grim reapers low vis",
				[111] = "vf-101 dark",
				},
			sidenumber = {100, 115},
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.7,								-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 1.5,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[33] = {
			name = "R/VF-101",								--unit name
			inactive = true,
			type = "F-14A-135-GR",							--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[34] = {
			name = "VAW-125",								--unit name
			type = "E-2C",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			--sidenumber = {600, 609},						--unit range of sidenumbers (optional)
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_awacs, mission_ini.max_skill_blue_awacs),			--unit skill
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
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_awacs, mission_ini.max_skill_blue_awacs),			--unit skill
			tasks = {},										--unit tasks
			number = 5,
		},
		[36] = {
			name = "VS-27",								--unit name
			type = "S-3B Tanker",							--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			--sidenumber = {400, 429},						--unit range of sidenumbers (optional)
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 5,
		},
		[37] = {
			name = "R/VS-27",								--unit name
			inactive = true,
			type = "S-3B Tanker",							--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {},										--unit tasks
			number = 5,
		},
		[38] = {
			name = "VS-21",									--unit name
			type = "S-3B",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			--sidenumber = {400, 429},						--unit range of sidenumbers (optional)
			base = "CVN-71 Theodore Roosevelt",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,
			},
			number = 12,
		},
		[39] = {
			name = "R/VS-21",								--unit name
			inactive = true,
			type = "S-3B",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
			------------------ CVN-74 John C. Stennis --------------------
		[40] = {
			name = "VF-118/GA",								--unit name
			player = false, 								--player unit
			type = "F-14A-135-GR",							--aircraft type
			country = "USA",								--unit country
			livery = {"vf-101 grim reapers low vis", "vf-101 dark"},				--unit livery
			liveryModex = {									--unit livery Modex  (optional)
				[100] = "vf-101 red",
				[105] = "vf-101 grim reapers low vis",
				[111] = "vf-101 dark",
				},
			sidenumber = {100, 115},
			base = "CVN-74 John C. Stennis",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {										--unit tasks				
				["CAP"] = false,
				["Intercept"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,
				["Strike"] = true,
				["SEAD"] = false,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.3,							-- coef normal : = 1				
				["Intercept"] = 1.7,
			},
			number = 8,
		},
		[41] = {
			name = "R/VF-118/GA",							--unit name
			inactive = true,
			type = "F-14A-135-GR",							--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_fighter, mission_ini.max_skill_blue_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 12,
		},
		[42] = {
			name = "177 ARW",								--unit name
			type = "S-3B Tanker",							--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			sidenumber = {430, 450},						--unit range of sidenumbers (optional)
			base = "CVN-74 John C. Stennis",				--unit base base = "CVN-74 John C. Stennis",
			skill = getSkill(mission_ini.min_skill_blue_refuelling, mission_ini.max_skill_blue_refuelling),			--unit skill
			tasks = {										--unit tasks
				["Refueling"] = true,
			},
			number = 8,
		},	
		[43] = {
			name = "VS-22",									--unit name
			type = "S-3B",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			--sidenumber = {400, 429},						--unit range of sidenumbers (optional)
			base = "CVN-74 John C. Stennis",				--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,
			},
			number = 12,
		},
		[44] = {
			name = "R/VS-22",								--unit name
			inactive = true,
			type = "S-3B",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
			---------------- KHASHURI FARP LM84
		[45] = {
			name = "17th Cavalry",							--unit name
			type = "UH-1H",									--aircraft type
			helicopter = true,								--true for helicopter units
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "KHASHURI FARP LM84",					--unit base
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			}, 
			number = 8,
		},
		[46] = {
			name = "R/17th Cavalry",						--unit name
			inactive = true,
			type = "UH-1H",									--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 20,
		},
			----------------  GORI FARP MM25
		[47] = {
			name = "6th Cavalry",							--unit name
			type = "AH-1W",									--aircraft type
			helicopter = true,								--true for helicopter units
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "GORI FARP MM25",						--unit base
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {
				["Strike"] = true, 
			},
			number = 8,
		},
		[48] = {
			name = "R/6th Cavalry",							--unit name
			inactive = true,
			type = "AH-1W",									--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 20,
		},			
		---------------- AMBROLAURI FARP LN41
		[49] = {
			name = "GAH 2rd",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Georgia",							--unit country
			livery = "",									--unit livery
			base = "AMBROLAURI FARP LN41",					--unit base
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 8,
		},
		[50] = {
			name = "R/GAH 2rd",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_blue_helicopter, mission_ini.max_skill_blue_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 20,
		},
		----------------------- Kobuleti -------------------------		
		[51] = {
			name = "54 TFS",								--unit name			
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Kobuleti",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = false,
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,							-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 1.5,
				["Fighter Sweep"] = 0.2,	
			},
			number = 18,
		},
		[52] = {
			name = "R/54 TFS",								--unit name
			inactive = true,
			type = "F-4E",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},	
		[53] = {
			name = "317th Air Division",					--unit name
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			livery = "",									--unit livery
			base = "Kobuleti",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 3,
		},
		[54] = {
			name = "R/317th Air Division",					--unit name
			inactive = true,
			type = "C-130",									--aircraft type
			country = "USA",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_transport, mission_ini.max_skill_blue_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 7,
		},		

		[55] = { -- kutaisi
			name = "BA 113",								--unit name			
			type = "Mirage-F1C",									--aircraft type
			country = "France",								--unit country
			livery = "",									--unit livery
			base = "Kutaisi",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {										--unit tasks
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Intercept"] = true,
				["Strike"] = true,
				["SEAD"] = false,
				["Anti-ship Strike"] = false,
				["Laser Illumination"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1,
				["Laser Illumination"] = 1,
				["Intercept"] = 2,
				["CAP"] = 2,
				["Escort"] = 2,
				["Fighter Sweep"] = 2,	
			},
			number = 12,
		},
		[56] = {
			name = "R/BA 113",								--unit name
			inactive = true,
			type = "Mirage-F1C",									--aircraft type
			country = "France",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_blue_attacker, mission_ini.max_skill_blue_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 24,
		},
	},
	["red"] = {	--side 2		
		-------------------- Mozdok ---------------		
		[1] = {
			name = "790.IAP",								--unit name
			type = "MiG-25PD",								--aircraft type
			country = "Russia",								--unit country
			livery = "af standard",							--unit livery
			base = "Mozdok",								--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional).
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 0.3,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[2] = {
			name = "117.IAP",							--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mozdok",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,	
				["Anti-ship Strike"] = 1.5,		
			},		
			number = 12,
		},
		[3] = {
			name = "R/117.IAP",							--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[4] = {
			name = "113.IAP",							--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mozdok",								--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = true,				
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 0.3,							-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 1.5,
				["CAP"] = 1.5,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,	
			},
			number = 24,
		},
		[5] = {
			name = "R/113.IAP",							--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},				
		-------------------- Beslan ---------------
		[6] = {
			name = "37.IAP",								--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Beslan",								--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = false,
				["Anti-ship Strike"] = false,			
				["SEAD"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)				
				["Intercept"] = 2,
				["CAP"] = 1.5,
				["Escort"] = 1,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 0.3,			
				["Strike"] = 0.3,							-- coef normal : = 1
				["SEAD"] = 0.3,
				["Laser Illumination"] = 1,
			},
			number = 24,
		},
		[7] = {
			name = "R/37.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},									--unit tasks
			number = 36,
		},
		[8] = {
			name = "127.IAP",							--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Beslan",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Laser Illumination"] = 1,	
				["Anti-ship Strike"] = 1.5,			
			},
			number = 12,
		},
		[9] = {
			name = "R/127.IAP",							--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[10] = {
			name = "123.IAP",							--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Beslan",								--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,				
				["Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 0.5,							-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 0.7,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1.5,	
			},
			number = 12,
		},
		[11] = {
			name = "R/123.IAP",							--unit name
			inactive = true,	
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",	
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,	
		},		
		[12] = {
			name = "115AS.IAP",							--unit name
			type = "L-39C",									--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Beslan",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,				
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,							-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 0.5,
				["Escort"] = 0.5,			
				["Fighter Sweep"] = 0.5,
				["Anti-ship Strike"] = 0.7,			
			},
			number = 12,
		},
		[13] = {
			name = "R/115AS.IAP",
			inactive = true,								--unit name
			type = "L-39C",									--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[14] = {
			name = "3.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},									--unit livery
			base = "Beslan",								--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 6,
		},
		---------------------- Nalchik ---------------
		[15] = {
			name = "19.IAP",								--unit name
			type = "MiG-21Bis",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Nalchik",								--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = false,
				["Escort"] = true,
				["Fighter Sweep"] = false,
				["Strike"] = false,
				["Anti-ship Strike"] = false,			
				["SEAD"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)				
				["Intercept"] = 1.5,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,
				["Anti-ship Strike"] = 0.3,			
				["Strike"] = 0.3,							-- coef normal : = 1
				["SEAD"] = 0.3,
				["Laser Illumination"] = 1,
			},
			number = 18,
		},
		[16] = {
			name = "R/19.IAP",								--unit name
			inactive = true,
			type = "MiG-21Bis",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[17] = {
			name = "2457 SDRLO",							--unit name
			type = "A-50",									--aircraft type
			country = "Russia",								--unit country
			--sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},									--unit livery
			base = "Nalchik",								--unit base
			skill = getSkill(mission_ini.min_skill_red_awacs, mission_ini.max_skill_red_awacs),			--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
			},
			number = 4,
		},
		[18] = {
			name = "107.IAP",							--unit name
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Nalchik",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["SEAD"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.8,							-- coef normal : = 1
				["SEAD"] = 2,
				["Anti-ship Strike"] = 1,
				["Laser Illumination"] = 1,			
			},
			number = 12,
		},
		[19] = {
			name = "R/107.IAP",							--unit name
			inactive = true,
			type = "MiG-27K",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[20] = {
			name = "111AS.IAP",							--unit name
			type = "L-39C",									--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Nalchik",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = false,				
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,							-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 0.5,
				["CAP"] = 0.5,
				["Escort"] = 0.5,			
				["Fighter Sweep"] = 0.5,
				["Anti-ship Strike"] = 0.7,			
			},
			number = 12,
		},
		[21] = {
			name = "R/111AS.IAP",							--unit name
			inactive = true,
			type = "L-39C",									--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[22] = {
			name = "13.OSAP",								--unit name
			type = "Il-76MD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Nalchik",								--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,				
			},
			number = 4,
		},
		[23] = {
			name = "R/13.OSAP",							--unit name
			inactive = true,
			type = "Il-76MD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		-------------------- Mineralnye-Vody ------
		[24] = {
			name = "793.IAP",								--unit name
			type = "MiG-25PD",								--aircraft type
			country = "Russia",								--unit country
			livery = "af standard",							--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = false,
				["Fighter Sweep"] = true,
			},
			tasksCoef = {									
				["Intercept"] = 2, --unit tasks coef (optional)-- coef normal : = 1
				["CAP"] = 1.5,
				["Escort"] = 0.5,
				["Fighter Sweep"] = 1,
			},
			number = 12,
		},
		[25] = {
			name = "41.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
				["Laser Illumination"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.5,								-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,				
				["Anti-ship Strike"] = 1.7,
			},
			number = 12,
		},
		[26] = {
			name = "R/41.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},		
		[27] = {
			name = "133.IAP",							--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = true,
				["Escort"] = true,
				["Fighter Sweep"] = true,
				["Strike"] = false,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 0.5,							-- coef normal : = 1				
				["Intercept"] = 0.5,
				["CAP"] = 1.3,
				["Escort"] = 2,
				["Fighter Sweep"] = 1.5,	
			},
			number = 12,
		},
		[28] = {
			name = "R/133.IAP",							--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[29] = {
			name = "135.IAP",							--unit name
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
				["SEAD"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Anti-ship Strike"] = 1,
				["Laser Illumination"] = 1,				
			},
			number = 12,
		},
		[30] = {
			name = "R/135.IAP",							--unit name
			inactive = true,
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[31] = {
			name = "29.OSAP",							--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Mineralnye-Vody",						--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 2,
		},
		[32] = {
			name = "R/29.OSAP",							--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},		
		--------------------- Sochi-Adler --------------
		[33] = {
			name = "2.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},									--unit livery
			base = "Sochi-Adler",							--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {										--unit tasks
				["Transport"] = true,
			},
			number = 6,
		},		
		--------------------- Maykop-Khanskaya --------------
		[34] = {
			name = "153.IAP",							--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = true,
				["CAP"] = true,
				["Escort"] = true,
				["Strike"] = true,			
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 0.3,							-- coef normal : = 1				
				["Laser Illumination"] = 1,
				["Intercept"] = 1,
				["CAP"] = 1.5,
				["Escort"] = 2,
				["Fighter Sweep"] = 1.3,	
			},
			number = 18,
		},
		[35] = {
			name = "R/153.IAP",							--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[36] = {
			name = "61.IAP",								--unit name
			type = "Tu-22M3",								--aircraft type
			country = "Russia",								--unit country
			livery = {""},									--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = getSkill(mission_ini.min_skill_red_bomber, mission_ini.max_skill_red_bomber),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1				
				["Laser Illumination"] = 1,				
				["Anti-ship Strike"] = 2,
			},
			number = 8,
		},
		[37] = {
			name = "R/61.IAP",								--unit name
			inactive = true,
			type = "Tu-22M3",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_bomber, mission_ini.max_skill_red_bomber),			--unit skill
			tasks = {},										--unit tasks
			number = 8,
		},
		[38] = {
			name = "81.IAP",								--unit name
			type = "Su-24M",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Maykop-Khanskaya",						--unit base
			sskill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {
				["Strike"] = true,
				["SEAD"] = true,
				["Laser Illumination"] = true,
				["Anti-ship Strike"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1.3,							-- coef normal : = 1
				["SEAD"] = 2,
				["Laser Illumination"] = 1,				
				["Anti-ship Strike"] = 1.7,
			},
			number = 12,
		},
		[39] = {
			name = "R/81.IAP",								--unit name
			inactive = true,
			type = "Su-24M",								--aircraft type
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		[40] = {
			name = "27.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Maykop-Khanskaya",						--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 1,
		},
		[41] = {
			name = "R/27.OSAP",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		[42] = {
			name = "115.IAP",							--unit name
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Maykop-Khanskaya",								--unit base
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {										--unit tasks
				["Strike"] = true,
				["Anti-ship Strike"] = true,			
				["SEAD"] = true,
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 2,								-- coef normal : = 1
				["SEAD"] = 1.5,
				["Anti-ship Strike"] = 1,
				["Laser Illumination"] = 1,				
			},
			number = 12,
		},
		[43] = {
			name = "R/115.IAP",							--unit name
			inactive = true,
			type = "Su-17M4",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_attacker, mission_ini.max_skill_red_attacker),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},
		--------------------- Anapa-Vityazevo --------------
		[44] = {
			name = "23.OSAP",								--unit name
			type = "An-26B",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Anapa-Vityazevo",						--unit base
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
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
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		--------------------- Krasnodar-Center --------------
		[46] = {
			name = "2457.I SDRLO",							--unit name
			type = "A-50",									--aircraft type
			country = "Russia",								--unit country
			--sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = "",									--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = getSkill(mission_ini.min_skill_red_awacs, mission_ini.max_skill_red_awacs),			--unit skill
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
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {
				["Transport"] = true,
			},
			number = 2,
		},
		[48] = {
			name = "R/25.OSAP",								--unit name
			inactive = true,
			type = "An-26B",								--aircraft type
			country = "Russia",							
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_transport, mission_ini.max_skill_red_transport),			--unit skill
			tasks = {},										--unit tasks
			number = 4,
		},
		[49] = {
			name = "159.IAP",								--unit name
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {										--unit tasks
				["Intercept"] = false,
				["CAP"] = false,
				["Escort"] = true,
				["Strike"] = false,			
			},
			tasksCoef = {									--unit tasks coef (optional)
				["Strike"] = 1,								-- coef normal : = 1
				["Intercept"] = 1,
				["CAP"] = 1,
				["Escort"] = 2,
				["Fighter Sweep"] = 1,	
			},
			number = 12,
		},
		[50] = {
			name = "R/159.IAP",								--unit name
			inactive = true,
			type = "MiG-23MLD",								--aircraft type
			country = "Russia",								--unit country
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_fighter, mission_ini.max_skill_red_fighter),			--unit skill
			tasks = {},										--unit tasks
			number = 36,
		},		
		-------------------- NOGIR FARP MN76
		[51] = { 
			name = "1st GHR",								--unit name
			type = "Mi-8MT",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "NOGIR FARP MN76", 						--unit base
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 4,
		},
		[52] = {
			name = "R/1st GHR",								--unit name
			inactive = true,
			type = "Mi-8MT",								--aircraft type
			helicopter = true,								--true for helicopter units
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 24,
		},
		-------------------- TSKHINVALI FARP MM27
		[53] = {
			name = "2nd GHR",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "TSKHINVALI FARP MM27",					--unit base
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 4,
		},
		[54] = {
			name = "R/2nd GHR",								--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 24,
		},
		-------------------- LENIGORI FARP MN76
		[55] = {
			name = "13th GHR",								--unit name
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			country = "Russia",								--unit country
			livery = "",									--unit livery
			base = "LENIGORI FARP MM56",					--unit base
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {
				["Transport"] = true,
				["Strike"] = true,
			},
			number = 4,
		},
		[56] = {
			name = "R/13th GHR",							--unit name
			inactive = true,
			type = "Mi-24V",								--aircraft type
			helicopter = true,								--true for helicopter units
			base = "Reserves",
			skill = getSkill(mission_ini.min_skill_red_helicopter, mission_ini.max_skill_red_helicopter),			--unit skill
			tasks = {},										--unit tasks
			number = 24,
		},
		---------------- Integration 		
		[57] = {
			name = "O7 SDRLO",								--unit name
			type = "Su-24MR",								--aircraft type
			country = "Russia",								--unit country
			--sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},			--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = getSkill(mission_ini.min_skill_red_recognition, mission_ini.max_skill_red_recognition),			--unit skill
			tasks = {										--unit tasks				
				["Reconnaissance"] = true,
			},
			number = 5,
		},
		[58] = {
			name = "09 SDRLO",								--unit name
			type = "MiG-25RBT",								--aircraft type
			country = "Russia",								--unit country
			--sidenumber = {800, 805},						--unit range of sidenumbers (optional)
			livery = {""},									--unit livery
			base = "Krasnodar-Center",						--unit base
			skill = getSkill(mission_ini.min_skill_red_recognition, mission_ini.max_skill_red_recognition),			--unit skill
			tasks = {										--unit tasks
				["AWACS"] = true,
				["Reconnaissance"] = true,
			},
			number = 5,
		},

	















		------------ post 1975	
		--[[	
		[40] = {
			name = "17.IAP",								--unit name
			type = "Su-25T",								--aircraft type
			country = "Russia",								--unit country
			livery = "",						--unit livery
			base = "Mozdok",						--unit base
			skill = "High",
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
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		[42] = {
			name = "31.IAP",								--unit name
			type = "Su-27",								--aircraft type
			country = "Russia",						--unit country
			livery = "",			--unit livery
			base = "Mineralnye-Vody",							--unit base
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
				["Fighter Sweep"] = 1.5,
			},
			number = 10,
		},
		[43] = {
			name = "3./31.IAP",								--unit name
			inactive = true,
			type = "Su-27",								--aircraft type
			base = "Reserves",
			skill = "High",								--unit skill
			tasks = {},									--unit tasks
			number = 24,
		},
		]]
	}
}
