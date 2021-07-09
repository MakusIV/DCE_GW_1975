--To check oob_ground for threats and rate and store them in a table for later mission plannning
--Initiated by Main_NextMission.lua
------------------------------------------------------------------------------------------------------- 
-- Miguel Fichier Revision M34.k
------------------------------------------------------------------------------------------------------- 

-- miguel21 modification M34.k change freq EWR + custom FrequenceRadio (k: utilise les indicatifs WEST pour EWR)
-- Miguel21 modification M28.b : helicoptere see all SAM
-- Miguel21 modification  M07.g : EWR toujours affich� dans le briefing + 07g ajout des SAM et Boat dans la chaine de detection

-- miguel21 modification M34.f custom FrequenceRadio
CreatePlageFrequency()																--trouve une plage de frequence commune si c'est possible

--table to store ground/sea threats
groundthreats = {
	blue = {																		--blue threats (to red)
	},
	red = {																			--red threats (to blue)
	}
}

local callsign_west = {
		JTAC_EWR = {
			[1] = "Axeman",	
			[2] = "Darknight",
			[3] = "Warrior",
			[4] = "Pointer",	
			[5] = "Eyeball",	
			[6] = "Moonbeam",	
			[7] = "Whiplash",	
			[8] = "Finger",	
			[9] = "Pinpoint",	
			[10] = "Ferret",	
			[11] = "Shaba",	
			[12] = "Playboy",	
			[13] = "Hammer",	
			[14] = "Jaguar",	
			[15] = "Deathstar",	
			[16] = "Anvil",	
			[17] = "Firefly",	
			[18] = "Mantis",	
			[19] = "Badger",
			}
	}
	
--function to check if a unit is a threat, assign threat values and add to threats table
local function AddThreat(unit, side, hide)											--unput is side and unit-table from oob_ground	-- Miguel21 modification M28.b : helicoptere see all SAM (on ajoute Hide)							

local threatentry = {}


	if unit.type == "Vulcan" then
		threatentry = {
			type = unit.type,
			class = "AAA",
			level = 1,																--threat level: 1 = low, 2 = medium, 3 = high
			SEAD_offset = 0,														--number of SEAD sorties required to offset threat
			x = unit.x,																--position x-coordinate
			y = unit.y,																--position y-coordinate
			range = 1500,															--range of threat
			night = false,															--night capable
			elevation = 3,															--sensor elevation above ground
			min_alt = 0,															--minimal threat altitute
			max_alt = 1500,															--maximal threat altitude
		}
-- table.insert(groundthreats[side], threatentry)									-- Miguel21 modification M28.b : helicoptere see all SAM (insertion se fera plus bas avec hide)
		
	elseif unit.type == "ZSU-23-4 Shilka" then
		threatentry = {
			type = unit.type,
			class = "AAA",
			level = 1,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 2000,
			night = true,
			elevation = 3.5,
			min_alt = 0,
			max_alt = 2000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Gepard" then
		threatentry = {
			type = unit.type,
			class = "AAA",
			level = 1,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 4000,
			night = true,
			elevation = 4,
			min_alt = 0,
			max_alt = 3500,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "M1097 Avenger" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 3000,
			night = true,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "M48 Chaparral" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 4000,
			night = false,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "M6 Linebacker" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 3000,
			night = true,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Stinger manpad" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 3000,
			night = false,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "SA-18 Igla-S manpad" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 3500,
			night = false,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Strela-1 9P31" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 2500,
			night = false,
			elevation = 3,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "Strela-10M3" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 3500,
			night = false,
			elevation = 3.5,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "2S6 Tunguska" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 5,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 8000,
			night = true,
			elevation = 3.5,
			min_alt = 0,
			max_alt = 6500,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "rapier_fsa_blindfire_radar" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 5,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 10000,
			night = true,
			elevation = 2.5,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "rapier_fsa_optical_tracker_unit" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 5,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 8500,
			night = false,
			elevation = 1.5,
			min_alt = 0,
			max_alt = 3600,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "Roland ADS" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 5,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 8500,
			night = true,
			elevation = 4,
			min_alt = 0,
			max_alt = 8000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Hawk tr" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 46000,
			night = true,
			elevation = 3,
			min_alt = 0,
			max_alt = 22000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Patriot str" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 92000,
			night = true,
			elevation = 6,
			min_alt = 0,
			max_alt = 32000,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "SNR_75V" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 5,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 45000,
			night = true,
			elevation = 3,
			min_alt = 50,
			max_alt = 20000,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "snr s-125 tr" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 6,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 23000,
			night = true,
			elevation = 3,
			min_alt = 50,
			max_alt = 20000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Kub 1S91 str" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 35000,
			night = true,
			elevation = 6,
			min_alt = 0,
			max_alt = 10000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Osa 9A33 ln" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 15000,
			night = true,
			elevation = 5.5,
			min_alt = 0,
			max_alt = 7000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "SA-11 Buk SR 9S18M1" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 39000,
			night = true,
			elevation = 7,
			min_alt = 0,
			max_alt = 24000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Tor 9A331" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 16000,
			night = true,
			elevation = 5,
			min_alt = 0,
			max_alt = 8000,
		}
-- table.insert(groundthreats[side], threatentry)
			
	elseif unit.type == "S-300PS 40B6M tr" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 90000,
			night = true,
			elevation = 27.5,
			min_alt = 0,
			max_alt = 29000,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "052B" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 50000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 25000,
		}
-- table.insert(groundthreats[side], threatentry)
	
	elseif unit.type == "052C" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 150000,
			night = true,
			elevation = 25,
			min_alt = 0,
			max_alt = 30000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "054A" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 60000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 25000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "MOLNIYA" then
		threatentry = {
			type = unit.type,
			class = "AAA",
			level = 3,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 2000,
			night = true,
			elevation = 10,
			min_alt = 0,
			max_alt = 1500,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "ALBATROS" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 15000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 5000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "REZKY" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 1,
			x = unit.x,
			y = unit.y,
			range = 15000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 5000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "KUZNECOW" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 16000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 6000,
		}
-- table.insert(groundthreats[side], threatentry)
			
	elseif unit.type == "NEUSTRASH" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 8,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 16000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 6000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "MOSCOW" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 90000,
			night = true,
			elevation = 25,
			min_alt = 0,
			max_alt = 27000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "PIOTR" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 145000,
			night = true,
			elevation = 30,
			min_alt = 0,
			max_alt = 27000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "PERRY" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 7,
			SEAD_offset = 2,
			x = unit.x,
			y = unit.y,
			range = 90000,
			night = true,
			elevation = 20,
			min_alt = 0,
			max_alt = 30000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "TICONDEROG" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 10,
			SEAD_offset = 4,
			x = unit.x,
			y = unit.y,
			range = 100000,
			night = true,
			elevation = 25,
			min_alt = 0,
			max_alt = 30000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "Stennis" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 6,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 27000,
			night = true,
			elevation = 30,
			min_alt = 0,
			max_alt = 15000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "VINSON" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 6,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 27000,
			night = true,
			elevation = 30,
			min_alt = 0,
			max_alt = 15000,
		}
-- table.insert(groundthreats[side], threatentry)
		
	elseif unit.type == "LHA_Tarawa" then
		threatentry = {
			type = unit.type,
			class = "SAM",
			level = 6,
			SEAD_offset = 0,
			x = unit.x,
			y = unit.y,
			range = 27000,
			night = true,
			elevation = 30,
			min_alt = 0,
			max_alt = 15000,
		}
-- table.insert(groundthreats[side], threatentry)
	
	end

	-- Miguel21 modification M28.b : helicoptere see all SAM
	if threatentry and threatentry.type then 
		threatentry.hidden = hide
		table.insert(groundthreats[side], threatentry)
	end
	
end


--table to store ewr
ewr = {
	blue = {																		--blue EWR
	},
	red = {																			--red EWR
	}
}

--GCI table to store EWR radars (and later AWACS and interceptors)
GCI = {
	EWR = {
		["blue"] = {},
		["red"] = {},
	},
	Interceptor = {
		["blue"] = {
			base = {},
			assigned = {},
		},
		["red"] = {
			base = {},
			assigned = {},
		},
	},
	Flag = 500,
}

--function to add EWR units to EWR table
local function AddEWR(unit, side, freq, call)
	if unit.type == "1L13 EWR" then
		local entry = {
			type = unit.type,
			class = "EWR",
			x = unit.x,
			y = unit.y,
			range = 330000,
			frequency = freq,
			callsign = call,
			elevation = 39,
			min_alt = 0,
			max_alt = 30000,
		}
		table.insert(ewr[side], entry)
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "55G6 EWR" then
		local entry = {
			type = unit.type,
			class = "EWR",
			x = unit.x,
			y = unit.y,
			range = 340000,
			frequency = freq,
			callsign = call,
			elevation = 39,
			min_alt = 50,
			max_alt = 30000,
		}
		table.insert(ewr[side], entry)
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "p-19 s-125 sr" then								--Participe � la chaine de detection
		local entry = {
			type = unit.type,
			class = "EWR",
			x = unit.x,
			y = unit.y,
			range = 160000,
			frequency = freq,
			callsign = call,
			elevation = 6,
			min_alt = 0,
			max_alt = 30000,
		}
		table.insert(ewr[side], entry)
		GCI.EWR[side][unit.name] = true
	
	elseif unit.type == "Dog Ear radar" then								--Participe � la chaine de detection
		local entry = {
			type = unit.type,
			class = "EWR",
			x = unit.x,
			y = unit.y,
			range = 35000,
			frequency = freq,
			callsign = call,
			elevation = 4,
			min_alt = 0,
			max_alt = 20000,
		}
		table.insert(ewr[side], entry)
		GCI.EWR[side][unit.name] = true
	
	--M07.g
	elseif unit.type == "SNR_75V" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "snr s-125 tr" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "S-300PS 40B6M tr" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "Patriot str" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "Hawk tr" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "TICONDEROG" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "Stennis" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "LHA_Tarawa" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "PIOTR" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "MOSCOW" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	elseif unit.type == "KUZNECOW" then										--Participe � la chaine de detection
		GCI.EWR[side][unit.name] = true
		
	end
end


--find ground threats and EWR in vehicles and ships
for sidename, side in pairs(oob_ground) do									--Iterate through all sides
	for country_n, country in pairs(side) do								--Iterate through all countries
		if country.vehicle then												--If country has vehicles
			for group_n, group in pairs(country.vehicle.group) do			--Iterate through all groups
				-- if group.hidden == false then								--group is not hidden	 --Miguel21 modification M28.b
					for unit_n, unit in pairs(group.units) do				--Iterate through all units
						if unit.dead ~= true then							--If unit is not dead					
							AddThreat(unit, sidename, group.hidden)						--Evaluate unit as threat and add to groundthreats table	 --Miguel21 modification M28.b (ajout hidden)
							
							local ewr_task = false							--group has EWR task
							local ewr_freq = nil							--group has a communications frequency
							local ewr_call = nil							--group has a communications callsign
							for t = 1, #group.route.points[1].task.params.tasks do												--Iterate through WP1 tasks of group
								if group.route.points[1].task.params.tasks[t].id == "EWR" then									--If there is a EWR task
									ewr_task = true																				--set ewr_task true
								end
								
								-- {
									-- ["number"] = 2,
									-- ["auto"] = false,
									-- ["id"] = "EWR",
									-- ["enabled"] = true,
									-- ["params"] = 
									-- {
										-- ["number"] = 1,
										-- ["callname"] = 3,
									-- }, -- end of ["params"]
								-- }, -- end of [2]
								-- camp west, si utilisation des EWR, pour que les indicatifs soient bien pris en compte, l'enregistrement par DCS est comme ci dessus, il n'y a pas de SetCallsign
								if group.route.points[1].task.params.tasks[t].params.callname then							--if group has a callsign set									
									ewr_call = group.route.points[1].task.params.tasks[t].params.callname					--set callname miguel21 modification M07f
									ewr_call = callsign_west.JTAC_EWR[ewr_call]										
								end
								
								if group.route.points[1].task.params.tasks[t].params.action then

									if group.route.points[1].task.params.tasks[t].params.action.id == "SetCallsign" then							--if group has a callsign set
										-- ewr_call = group.route.points[1].task.params.tasks[t].params.action.params.callsign						--set callsign
									
										if group.route.points[1].task.params.tasks[t].params.action.params.callsign then
											ewr_call = group.route.points[1].task.params.tasks[t].params.action.params.callsign						--set callsign

										elseif group.route.points[1].task.params.tasks[t].params.action.params.callname then						-- callname is callsign_west
											ewr_call = group.route.points[1].task.params.tasks[t].params.action.params.callname						--set callname miguel21 modification M07e
											ewr_call = callsign_west.JTAC_EWR[ewr_call]
										end	
									end									
									
									if group.route.points[1].task.params.tasks[t].params.action.id == "SetFrequency" then							--if group has a frequency set
										-- ewr_freq = group.route.points[1].task.params.tasks[t].params.action.params.frequency						--set frequency
										-- ewr_freq = tostring(ewr_freq / 1000000)																	--make a string

										ewr_freq = GetFrequency(sidename, group.name, "EWR")
										group.route.points[1].task.params.tasks[t].params.action.params.frequency = ewr_freq * 1000000				-- miguel21 modification M34 change freq EWR
										
										for Mgroup_n, Mgroup in pairs(mission.coalition[sidename].country[country_n].vehicle.group) do				-- M34.b, verifie si le Num du group OOB, correspond au Num du groupe mission
											-- mission.coalition[sidename].country[country_n].vehicle.group[group_n].route.points[1].task.params.tasks[t].params.action.params.frequency = ewr_freq * 1000000 -- met à jour la table mission qui est déjà en mémoire
											if group.groupId == Mgroup.groupId then
												Mgroup.route.points[1].task.params.tasks[t].params.action.params.frequency = ewr_freq * 1000000 	-- met à jour la table mission qui est déjà en mémoire
											end
										end
										
										ewr_freq = tostring(ewr_freq)
									end
								end
							end

							if ewr_task then
								AddEWR(unit, sidename, ewr_freq, ewr_call)	--Add to EWR table
							end
						end
					end
				--end
			end
		end
		if country.ship then												--If country has ships
			for group_n, group in pairs(country.ship.group) do				--Iterate through all groups
				if group.hidden == false then								--group is not hidden
					for unit_n, unit in pairs(group.units) do				--Iterate through all units
						if unit.dead ~= true then							--If unit is not dead
							AddThreat(unit, sidename)						--Evaluate unit as threat and add to groundthreats table
							AddEWR(unit, sidename)							--Evaluate unit as EWR and add to EWR table
						end
					end
				end
			end
		end
	end
end


--table to store fighter threats (CAP and intercept)
fighterthreats = {
	blue = {},																					--blue threats (to red)
	red = {}																					--red threats (to blue)
}


--find AWACS, CAP and interceptors in aircraft units and populate ewr/fighterthreats table
for side,unit in pairs(oob_air) do																--iterate through all sides
	for n = 1, #unit do																			--iterate through all units
		if unit[n].inactive ~= true and unit[n].roster.ready > 0 and db_airbases[unit[n].base] and db_airbases[unit[n].base].inactive ~= true and db_airbases[unit[n].base].x and db_airbases[unit[n].base].y then		--if unit is active and has ready aircraft and its airbase is active
			for task,task_bool in pairs(unit[n].tasks) do										--iterate through all tasks of unit
				if task_bool and db_loadouts[unit[n].type][task] then							--task is true and db_loadouts has such tasks
					for loadout_name, loadout in pairs(db_loadouts[unit[n].type][task]) do		--iterate through all loadout.descriptions for a given aircraft type
						if (daytime == "day" and loadout.day) or (daytime == "night" and loadout.night) or (daytime == "night-day" and (loadout.day or loadout.night)) or (daytime == "day-night" and (loadout.day or loadout.night)) then	--loadout works for current time of day
							if loadout.country == nil or loadout.country == unit[n].country then	--loadout is country unspecific or applies to unit country
								if task == "AWACS" then												--if loadout is AWACS
									local entry = {													--define fighterthreats table entry
										name = unit[n].name,										--unit name
										class = "AWACS",											--class
										x = db_airbases[unit[n].base].x,							--unit homebase position
										y = db_airbases[unit[n].base].y,
										level = 0,
										range = loadout.range + 600000,								--AWACS surveilance radius = AWACS mission range + radar range,
										elevation = 30000,
										min_alt = 0,
										max_alt = 30000,
									}
									
									table.insert(ewr[side], entry)
								elseif task == "CAP" then											--if loadout is CAP
									local entry = {													--define fighterthreats table entry
										name = unit[n].name,										--unit name
										class = "CAP",												--class
										x = db_airbases[unit[n].base].x,							--unit homebase position
										y = db_airbases[unit[n].base].y,
										level = loadout.capability * loadout.firepower * (unit[n].roster.ready / 3),		--total unit threat is capability * firepower * one third of ready aircraft
										range = loadout.range,										--Fighter action radius
										LDSD = loadout.LDSD,										--Look Down/Shoot Down
									}
									
									table.insert(fighterthreats[side], entry)
								elseif task == "Intercept" then										--if loadout is Intercept
									local entry = {													--define fighterthreats table entry
										name = unit[n].name,										--unit name
										class = "Intercept",										--class
										x = db_airbases[unit[n].base].x,							--unit homebase position
										y = db_airbases[unit[n].base].y,
										level = loadout.capability * loadout.firepower * (unit[n].roster.ready / 3),		--total unit threat is capability * firepower * one third of ready aircraft
										range = loadout.range,										--Fighter action radius
									}
									
									table.insert(fighterthreats[side], entry)
								end
							end
						end
					end
				end
			end
		end
	end
end

-- _affiche(fighterthreats, "ATO_TE fighterthreats")
--add avoidance zones to threattable
for zone_n,zone in pairs(mission.triggers.zones) do												--iterate through all trigger zones
	if string.find(zone.name, "AvoidanceZone") then												--zone is named as avoidance zone
	
		local threatentry = {																	--define threattable entry
			type = "TriggerZone",
			class = "AvoidanceZone",
			level = 1000,
			SEAD_offset = 0,
			x = zone.x,
			y = zone.y,
			range = zone.radius,
			night = true,
			elevation = 20000,
		}

		if string.find(zone.name, "Blue") then													--Blue avoidance zone is a threat to blue
			if string.find(zone.name, "Low") then												--Low level
				threatentry.min_alt = 0
				threatentry.max_alt = 3000
				table.insert(groundthreats.red, threatentry)
			elseif string.find(zone.name, "High") then											--High level
				threatentry.min_alt = 3000
				threatentry.max_alt = 30000
				table.insert(groundthreats.red, threatentry)
			else																				--Low and high level
				threatentry.min_alt = 0
				threatentry.max_alt = 30000
				table.insert(groundthreats.red, threatentry)
			end
		elseif string.find(zone.name, "Red") then												--Red avoidance zone is a threat to red
			if string.find(zone.name, "Low") then												--Low level
				threatentry.min_alt = 0
				threatentry.max_alt = 3000
				table.insert(groundthreats.blue, threatentry)
			elseif string.find(zone.name, "High") then											--High level
				threatentry.min_alt = 3000
				threatentry.max_alt = 30000
				table.insert(groundthreats.blue, threatentry)
			else																				--Low and high level
				threatentry.min_alt = 0
				threatentry.max_alt = 30000
				table.insert(groundthreats.blue, threatentry)
			end
		else																					--Undefined avoidance zone is a threat to red and blue
			if string.find(zone.name, "Low") then												--Low level
				threatentry.min_alt = 0
				threatentry.max_alt = 3000
				table.insert(groundthreats.red, threatentry)
				table.insert(groundthreats.blue, threatentry)
			elseif string.find(zone.name, "High") then											--High level
				threatentry.min_alt = 3000
				threatentry.max_alt = 30000
				table.insert(groundthreats.red, threatentry)
				table.insert(groundthreats.blue, threatentry)
			else																				--Low and high level
				threatentry.min_alt = 0
				threatentry.max_alt = 30000
				table.insert(groundthreats.red, threatentry)
				table.insert(groundthreats.blue, threatentry)
			end
		end
	end
end