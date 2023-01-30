--To create the Air Tasking Order
--Initiated by Main_NextMission.lua
------------------------------------------------------------------------------------------------------- 
-- Miguel Fichier Revision M38.e
------------------------------------------------------------------------------------------------------- 

-- ATO_G_adjustment03.b support équitable entre escadron
-- ATO_G_adjustment02 TASK Coef
-- ATO_G_adjustment01 escort mandatory or not
-- ATO_G_Debug05 interdit l'escorte avion/helico
-- ATO_G_Debug04.b correction targetName
-- ATO_G_Debug03 mauvaise insertion dans la base
-- ATO_G debug02b haut score
-- ATO_G_debug01 Fin de campagne

-- miguel21 modification M43 assignation des numeros de parking du type C08 
-- miguel21 modification M42 : liveryModex
-- miguel21 modification M38.e Check and Help CampaignMaker (e: loadout Task?)
-- Miguel21 modification M16.b : SpawnAir B1b & B-52 need BaseAirStart = true in db_aibase
-- Modif Miguel21 M13.e Performance Scripting
														-- Modif Miguel21 M12 Loadout option false
-- Miguel21 modification M11.z : Multiplayer			(z: debug MP avec 1 Plane)(y: interdit l'escorte avion/helico) (x: EscorteTot-max) (w: choix EscorteMax) (v: interdit Strike sans escorte)(u: reserve avion Escorte) (t: different Type possible/task)
														-- Miguel21 modification M10 : un maximum d'avion sur Porte Aeronef
-- Miguel21 modification M06 : helicoptere playable

if not versionDCE then versionDCE = {} end
versionDCE["ATO_Generator.lua"] = "1.15.52"

-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = "warn" --LOGGING_LEVEL -- watch: info generate a very big log
log.outfile = LOG_DIR .. "LOG_ATO_Generator." .. camp.mission .. ".log" 
local local_debug = true -- local debug   
log.debug("Start")
-- =====================  End Marco implementation ==================================


for side,unit in pairs(oob_air) do																								--iterate through all sides	
-- db_loadouts = {
	-- ["AV8BNA"] = {
		-- ["Anti-ship Strike"] = {

	for n = 1, #unit do			
		for task,task_bool in pairs(unit[n].tasks) do			
			if task_bool then			
				if db_loadouts[unit[n].type] then					
					if db_loadouts[unit[n].type][task] then						
					else
						print(unit[n].type.." "..task.." not found in db_loadouts")
					end
				else
					print(unit[n].type.." not found in db_loadouts")
				end
			end
		end
	end
end

function round(num)
local dec = 2
  local mult = 10^(dec or 0)
  return math.floor(num * mult + 0.5) / mult
end

--status report counters
local status_counter_sorties = 0
local status_counter_escorts = 0
local status_counter_ATO = 0


--to track what caused lack of playable sortie for the player
playability_criterium = {}
function TrackPlayability(player_unit, criterium)																				--function that tracks whether a playability criterium has been met
	if player_unit == true then																									--unit in question is playable by player
		playability_criterium[criterium] = true																					--set playability criterium to be met
	end
end

--table to hold availability of aircraft
if camp.aircraft_availability == nil then
	camp.aircraft_availability = {}
end
aircraft_availability = camp.aircraft_availability																				--link to table for easier reference

--table to store draft sorties (all valid unit/task/loadout/target combinations)
draft_sorties = {
	blue = {},
	red = {}
}

multiPlaneSet = {}
for k=1, Multi.NbGroup do
	if not multiPlaneSet[Multi.Group[k].PlaneType] then multiPlaneSet[Multi.Group[k].PlaneType] = {} end	
	-- multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task] = true
	
	if not multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task] then multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task] = {} end
	if not multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task]["NbPlane"] then multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task]["NbPlane"] = 0 end
	multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task].NbPlane = Multi.Group[k].NbPlane + multiPlaneSet[Multi.Group[k].PlaneType][Multi.Group[k].task].NbPlane
end

-- _affiche(multiPlaneSet, "ATO_G multiPlaneSet")
-- _affiche(Multi, "ATO_G Multi")
--creat draft sorties
for side,unit in pairs(oob_air) do																								--iterate through all sides
	
	--determine enemy side
	local enemy																													--determine enemy side (opposite of unit side)
	if side == "blue" then
		enemy = "red"
	else
		enemy = "blue"
	end

	for n = 1, #unit do																											--iterate through all units
		if unit[n].inactive ~= true then																						--if unit is active
			TrackPlayability(unit[n].player, "active_unit")																		--track playabilty criterium has been met

			if db_airbases[unit[n].base] and db_airbases[unit[n].base].inactive ~= true and db_airbases[unit[n].base].x and db_airbases[unit[n].base].y then	--base exists and is active and has a position value (carrier that exists)
				TrackPlayability(unit[n].player, "base")																		--track playabilty criterium has been met
				
				if unit[n].roster.ready > 0 then																				--has ready aircraft
					TrackPlayability(unit[n].player, "ready_aircraft")															--track playabilty criterium has been met
					
					if aircraft_availability[unit[n].name] == nil then															--unit has no aircraft availability entry yet
						aircraft_availability[unit[n].name] = {}																--make an aircraft availability entry for this unit
					end
					
					if aircraft_availability[unit[n].name].unavailable == nil then												--unit has no unavailable table yet
						if unit[n].unavailable then																				--there are preset unavailabilities in oob_air
							aircraft_availability[unit[n].name].unavailable = unit[n].unavailable								--use this as initial unavailability
						else
							aircraft_availability[unit[n].name].unavailable = {}												--create an empty unavailable table
						end
					end
					
					--serviceable aircraft
					local aircraft_serviceable = 0																				--serviceable aircraft of unit
					local serviceability = 0.8																					--defaults unit serviceability rating
					if unit[n].serviceability then																				--if serviceability for unit is defined
						serviceability = unit[n].serviceability																	--use it instead
					end
					for s = 1, unit[n].roster.ready do																			--iterate through ready aircraft
						if math.random(1, 100) <= serviceability * 100 then														--default 80% chance that it is mission ready
							aircraft_serviceable = aircraft_serviceable + 1														--sum serviceable aircraft
						end
					end
					aircraft_availability[unit[n].name].ready = unit[n].roster.ready											--store ready aircraft un availability table
					aircraft_availability[unit[n].name].serviceable = aircraft_serviceable										--store serviceable aircraft in availability table
					
					--unavailable aircraft
					local current_time = (camp.day - 1) * 86400 + camp.time														--current absolute campaign time
					local u_entry = 0
					for u = #aircraft_availability[unit[n].name].unavailable, 1, -1 do											--iterate backwards through unavailable aircraft from this unit
						u_entry = u_entry + 1
						if u_entry <= unit[n].roster.ready then																	--for each unavailable entry that is within the amounty of ready aircraft of unit
							if current_time > aircraft_availability[unit[n].name].unavailable[u] then							--check absolute campaign time is past unvailable time for this entry
								table.remove(aircraft_availability[unit[n].name].unavailable, u)								--remove this entry
							end
						else																									--for each unavailable entry that is beyond the amount of ready aircraft of unit (due to losses in last mission)
							table.remove(aircraft_availability[unit[n].name].unavailable, u)									--remove this entry
						end
					end

					local aircraft_available = unit[n].roster.ready - #aircraft_availability[unit[n].name].unavailable			--number of available aircraft
					if aircraft_serviceable < aircraft_available then
						aircraft_available = aircraft_serviceable
					end
					aircraft_availability[unit[n].name].available = aircraft_available											--store available aircraft in availability table
					aircraft_availability[unit[n].name].assigned = 0
					aircraft_availability[unit[n].name].unassigned = aircraft_available											--store unassigned aircraft in availability table

					
					if aircraft_available > 0 then																				--unit has available aircraft
						TrackPlayability(unit[n].player, "available_aircraft")													--track playabilty criterium has been met
						
						for task,task_bool in pairs(unit[n].tasks) do																		--iterate through all tasks of unit		
							if task_bool and task ~= "SEAD" and task ~= "Escort" and task ~= "Escort Jammer" and task ~= "Flare Illumination" and task ~= "Laser Illumination" then		--task is true and is no support task
								
								--get possible loadouts
								local unit_loadouts = {}																					--table to hold all loadouts for this aircraft type and task
								if db_loadouts[unit[n].type][task] then																		--db_loadouts table has loadouts for this task
									for loadout_name, ltable in pairs(db_loadouts[unit[n].type][task]) do									--iterate through all loadouts for the aircraft type and task
										if ltable.country == nil or ltable.country == unit[n].country then									--loadout is country unspecific or applies to unit country
											ltable.name = loadout_name																		--store loadout name
											-- table.insert(unit_loadouts, ltable)																--add loadout to local table
											unit_loadouts[#unit_loadouts+1] = ltable
										end
									end
								end
								
								for l = 1, #unit_loadouts do																				--iterate through all available loadouts				
									
									--get possible Time on Target
									local tot_from = 0																						--earliest Time on Target for this loadout
									local tot_to = 0																						--latest Time on target for this loadout
									if unit_loadouts[l].day and unit_loadouts[l].night then													--loadout is day and night capable
										tot_from = 0																						--from mission start
										tot_to = camp.mission_duration																		--to mission end
										if task == "Intercept" then																			--for interceptors, tot_to is not limitted by mission duration
											tot_to = 999999
										end
									elseif unit_loadouts[l].day then																		--loadout is day capable
										if daytime == "night-day" then
											tot_from = camp.dawn - camp.time																--from dawn
											tot_to = camp.mission_duration																	--to mission end
											if task == "Intercept" then																		--for interceptors, tot_to is not limitted by mission duration
												tot_to = camp.dusk - camp.time
											end
										elseif daytime == "day" then
											tot_from = 0																					--from missiom start
											tot_to = camp.mission_duration																	--to mission end
											if task == "Intercept" then																		--for interceptors, tot_to is not limitted by mission duration
												tot_to = camp.dusk - camp.time
											end
										elseif daytime == "day-night" then
											tot_from = 0																					--from mission start
											tot_to = camp.dusk - camp.time																	--to dusk
										end
									elseif unit_loadouts[l].night then																		--loadout is night capable
										if daytime == "day-night" then
											tot_from = camp.dusk - camp.time																--from dusk
											tot_to = camp.mission_duration																	--to mission end
											if task == "Intercept" then																		--for interceptors, tot_to is not limitted by mission duration
												tot_to = camp.dawn - camp.time
											end
										elseif daytime == "night" then
											tot_from = 0																					--from mission start
											tot_to = camp.mission_duration																	--to mission end
											if task == "Intercept" then																		--for interceptors, tot_to is not limitted by mission duration
												tot_to = camp.dawn - camp.time
											end
										elseif daytime == "night-day" then
											tot_from = 0																					--from mission start
											tot_to = camp.dawn - camp.time																	--to dawn
										end
									end
									
									if tot_to < 0 then
										tot_to = tot_to + 86400
									end
									if tot_from < 0 then
										tot_from = tot_from + 86400
									end
									
									if tot_from ~= 0 or tot_to ~= 0 then																	--loadout has an eligible time on target
										
										if tot_from == 0 then																				--player is only allowed to start at mission start
											TrackPlayability(unit[n].player, "tot")															--track playabilty criterium has been met
										end
										
										
										i_timmer01 = 0
										for target_side_name, target_side in pairs(targetlist) do											--iterate through sides in targetlist				
											i_timmer01 = i_timmer01 +1
											if side == target_side_name then --if the target is hostile
												
												
												-- debug code
												for target_name, target in pairs(target_side) do
													local attr = "attr: "
													local xcoord, ycoord

													if target.slaved then
														attr = attr .. "slaved"	
													end													

													if target.x then 
														xcoord = tostring(target.x )
													else
														xcoord = "not x"
													end

													if target.y then 
														ycoord = tostring(target.y )
													else
														ycoord = "not y"
													end		
													
													if ycoord == "not y" or xcoord == "not x" then											
														log.info("target: " .. target_name .. ", task: " .. target.task .. ", side: " .. side .. " - coord: ".. xcoord .. ", " .. ycoord)																
														log.info("attributes: " .. attr)																
													end
												end
												-- end debug code

												for target_name, target in pairs(target_side) do
													log.info("target: " .. target_name .. ", side: " .. side)													
													
													if target.x ~= nil and target.y ~= nil then
														log.info("target coord: ".. target.x .. ", " .. target.y)													
													end

													if target.inactive ~= true and target.ATO then											--if target is active and should be added to ATO
														if target.task == task then															--if target is valid for aircaft-loadout
															
															MultiPlayerOveRide = false
															if Multi.Target and Multi.Target[side] == target_name  then
																MultiPlayerOveRide = true
															end
															
															--check target/loadout attributes
															local loadout_eligible = true																					--boolean if loadout matches any target attributes (default true, because target might have no attributes)
															
															if target.attributes[1] then																					--target has attributes
																loadout_eligible = false
																for target_attribute_number, target_attribute in ipairs(target.attributes) do								--Iterate through target attributes
																	for loadout_attribute_number, loadout_attribute in ipairs(unit_loadouts[l].attributes) do				--Iterate through loadout attributes
																		if target_attribute == loadout_attribute then														--if match is found
																			loadout_eligible = true																			--set variable true
																			break																							--break the loadout attributes iteration
																		end
																	end
																end
															end
															
															if loadout_eligible then	
															--continue if loadout is eligible
																if (task == "Intercept" and target.base == unit[n].base) or (task == "Transport" and target.base == unit[n].base) or (task == "Nothing" and target.base == unit[n].base) or (task ~= "Intercept" and task ~= "Transport" and task ~= "Nothing") then	--intercept and transport missions are only assigned to units of a certain base as per targetlist	
																	TrackPlayability(unit[n].player, "target")																							--track playabilty criterium has been met
																
																	if target.firepower.min <= aircraft_available * unit_loadouts[l].firepower or MultiPlayerOveRide then				--enough aircraft are available to satisfy minimum firepower requirement of target	
																		TrackPlayability(unit[n].player, "target_firepower")																			--track playabilty criterium has been met
																	
																		--check weather
																		local weather_eligible = true
																		
																		if mission.weather["clouds"]["density"] > 8 then																				--overcast clouds
																			local cloud_base = mission.weather["clouds"]["base"]
																			local cloud_top = mission.weather["clouds"]["base"] + mission.weather["clouds"]["thickness"]
																			
																			if db_airbases[unit[n].base].elevation + 333 > cloud_base then																--cloud base is less than 1000 ft above airbase elevation
																			
																				if unit_loadouts[l].adverseWeather == false then																		--loadout is not adverse weather capable
																					weather_eligible = false																							--not eligible for this weather
																				end
																			
																			else
																			
																				if unit_loadouts[l].hCruise and unit_loadouts[l].hCruise > cloud_base and unit_loadouts[l].hCruise < cloud_top then			--cruise alt is in the clouds
																			
																					if unit_loadouts[l].adverseWeather == false then																	--loadout is not adverse weather capable
																						weather_eligible = false																						--not eligible for this weather
																					end
																			
																				elseif unit_loadouts[l].hAttack and unit_loadouts[l].hAttack > cloud_base and unit_loadouts[l].hAttack < cloud_top then		--attack alt is in the clouds
																					
																					if unit_loadouts[l].adverseWeather == false then																	--loadout is not adverse weather capable
																						weather_eligible = false																						--not eligible for this weather
																					end
																				end
																				
																				if task == "Strike" or task == "Anti-ship Strike" or task == "Reconnaissance" then										--extra requirement for A-G tasks
																					if unit_loadouts[l].hAttack > cloud_base then																		--attack alt is above cloud base
																						if unit_loadouts[l].adverseWeather == false then																--loadout is not adverse weather capable
																							weather_eligible = false																					--not eligible for this weather
																						end
																					end
																				end	
																			end
																		end
																		
																		if mission.weather["enable_fog"] == true then															--fog
																			
																			if db_airbases[unit[n].base].elevation < mission.weather["fog"]["thickness"] then					--base elevation in fog
																				
																				if mission.weather["fog"]["visibility"] < 5000 then												--less than 5000m visibility
																					
																					if unit_loadouts[l].adverseWeather == false then											--loadout is not adverse weather capable
																						weather_eligible = false																--not eligible for this weather
																					end
																				end
																			end
																		end
																		
																		if weather_eligible then																				--continue of this loadout is eligible for weather
																			TrackPlayability(unit[n].player, "weather")															--track playabilty criterium has been met
																			
																			--get airbase position
																			local airbasePoint = {																				--get the x-y coordinates of the airbase where the unit is located
																				x = db_airbases[unit[n].base].x,
																				y = db_airbases[unit[n].base].y,
																				h = db_airbases[unit[n].base].elevation,
																				BaseAirStart = db_airbases[unit[n].base].BaseAirStart
																			}
																			
																			local multipack = 1
																			
																			if target.firepower.packmax and unit_loadouts[l].MaxAttackOffset then								--target has a requirement for multiple packages and loadout is multipack capable (defined maximum attack offset)
																				multipack = target.firepower.packmax															--create draft sorties for this target for the requested amount of packages
																			end
																			
																			for r = 1, multipack do																				--repeat draft sortie generation for the requirement amount of packages (may create different routes each time)
																				
																				--determine route variants depending on daytime
																				local variant
																			
																				if daytime == "day" then
																					variant = 1
																			
																				elseif daytime == "night" then
																					variant = 2
																			
																				elseif daytime == "night-day" then
																					variant = 3
																			
																				elseif daytime == "day-night" then
																					variant = 4
																				end
																			
																				while variant > 0 do
																					i_timmer01 = i_timmer01 +1
																					
																					if i_timmer01 >= 10  then io.write(".") i_timmer01 = 0 end
																					--determine route
																					status_counter_sorties = status_counter_sorties + 1													--status report
																					local route = {}
																					
																					if task == "Intercept" then																			--intercept task only get a stub route
																						route = {
																							[1] = {
																								['y'] = airbasePoint.y,
																								['x'] = airbasePoint.x,
																								['alt'] = 0,
																								['id'] = 'Intercept',
																							},
																							threats = {
																								SEAD_offset = 0,
																								ground_total = 0.5,
																								air_total = 0.5
																							},
																							['lenght'] = target.radius * 2,																--interception task radius *2 because below it is compared with range *2
																						}
																					
																					else		
																						-- QUI BUG target.y nil
																						log.info("B r: " .. r .. ", variant: " .. variant)						
																						log.info("B base: " .. unit[n].base .. "airbasePoint: " .. airbasePoint.x .. ", " .. airbasePoint.x)																--all other tasks than intercept
																						log.info("B target: " .. target_name .. ", targetpoint: ".. target.x .. ", " .. target.y)
																						local ToTarget = GetDistance(airbasePoint, target)											--direct distance to target
																						log.info("C target: " .. target_name .. ", targetpoint: ".. target.x .. ", " .. target.y)
																						
																						if ToTarget <= unit_loadouts[l].range and (unit_loadouts[l].minrange == nil or ToTarget * 1.5 > unit_loadouts[l].minrange) then	--basic feasibility check of range before performance intensive route calculations are done
																							if variant == 1 or variant == 4 then
																								route = GetRoute(airbasePoint, target, unit_loadouts[l], enemy, task, "day", r, multipack, unit[n].helicopter)			--get the best route to this target at day-- Miguel21 modification M06 : helicoptere playable(ajout variable helico pour generer une route )
																							elseif variant == 2 or variant == 3 then																
																								route = GetRoute(airbasePoint, target, unit_loadouts[l], enemy, task, "night", r, multipack, unit[n].helicopter)		--get the best route to this target at night-- Miguel21 modification M06 : helicoptere playable
																							end
																						end
																						log.info("D target: " .. target_name .. ", targetpoint: ".. target.x .. ", " .. target.y)
																					end
																					log.info("E r: " .. r .. ", variant: " .. variant)						
																					log.info("E base: " .. unit[n].base .. "airbasePoint: " .. airbasePoint.x .. ", " .. airbasePoint.x)																--all other tasks than intercept
																					log.info("E target: " .. target_name)

																					if target.x ~= nil and target.y ~= nil then
																						log.info("target coord: ".. target.x .. ", " .. target.y)													
																					end
																					
																					if route.lenght and route.lenght <= unit_loadouts[l].range * 2 and (unit_loadouts[l].minrange == nil or route.lenght > unit_loadouts[l].minrange * 2) then		--if sortie route lenght is within range of aircraft-loadout
																						TrackPlayability(unit[n].player, "target_range")												--track playabilty criterium has been met
																						
																						--determine number of aircraft needed for sortie
																						local aircraft_requested = target.firepower.max / unit_loadouts[l].firepower					--how many aircraft are needed to satisfy the maximum firepower requirement of the target
																						local flights_requested	
																						
																						if task == "CAP" or task == "AWACS" or task == "Refueling" then									--multiple flights are required to continously cover a station for the duration of the mission
																							flights_requested = math.ceil((tot_to - tot_from) / unit_loadouts[l].tStation) + 1			--how many flights are needed to keep continous coverage of station, plus 1 for on station before mission start
																							aircraft_requested = aircraft_requested * flights_requested									--total number of requested aircraft is number of aircraft needed to statisfy firepower requirement of station * number of flights needed for continous coverage
																						end
																						
																						if task == "AWACS" or task == "Refueling" or task == "Transport" or task == "Nothing" or task == "Reconnaissance" then
																							aircraft_requested = math.ceil(aircraft_requested)											--round up
																						
																						elseif unit[n].type == "S-3B" or unit[n].type == "F-117A" or unit[n].type == "B-1B" or unit[n].type == "B-52H" or unit[n].type == "Tu-22M3" or unit[n].type == "Tu-95MS" or unit[n].type == "Tu-142" or unit[n].type == "Tu-160" or unit[n].type == "MiG-25RBT" then
																							aircraft_requested = math.ceil(aircraft_requested)											--round up
																						
																						else
																							--aircraft_requested = math.ceil(aircraft_requested / 2) * 2								--round up to an even number
																							aircraft_requested = math.ceil(aircraft_requested)											--round up
																						end
																						local aircraft_assign
																				
																						if aircraft_requested > aircraft_available then													--if more aircraft are requested than are available from this unit
																							aircraft_assign = aircraft_available														--assign all available aircraft
																				
																						else																							--enough available aircraft to satisfy requested aircraft
																							aircraft_assign = aircraft_requested														--assign all requested aicraft
																						end
																						
																						-- miguel21 modification M11.o multiplayer
																						if multiPlaneSet then
																				
																							if multiPlaneSet[unit[n].type]  and multiPlaneSet[unit[n].type][task] then	--and task ~= "CAP" and task ~= "Intercept"																							
																								--M11.z
																								if aircraft_assign < multiPlaneSet[unit[n].type][task].NbPlane then
																									aircraft_assign = multiPlaneSet[unit[n].type][task].NbPlane
																								end
																							end
																						end
																				
																						--self escort
																						if unit_loadouts[l].self_escort then															--if the loadout is capable of self-escort
																							route.threats.air_total = route.threats.air_total / 2										--reduce the fighter threat by half
																							if route.threats.air_total < 0.5 then
																								route.threats.air_total = 0.5
																							end
																						end
																						
																						--build sortie entry
																						repeat																							--for tasks with station repeat to make entries for lesser amount of aircraft, repeat once for everything else
																							
																							local draft_sorties_entry = {
																								name = unit[n].name,
																								playable = unit[n].player,
																								type = unit[n].type,
																								helicopter = unit[n].helicopter,
																								number = aircraft_assign,
																								flights = flights_requested,
																								country = unit[n].country,
																								livery = unit[n].livery,
																								sidenumber = unit[n].sidenumber,
																								liveryModex = unit[n].liveryModex,
																								base = unit[n].base,
																								airdromeId = db_airbases[unit[n].base].airdromeId,
																								parking_id = unit[n].parking_id,
																								skill = unit[n].skill,
																								task = task,
																								loadout = unit_loadouts[l],
																								target = deepcopy(target),
																								target_name = target_name,
																								route = route,
																								tot_from = tot_from,
																								tot_to = tot_to,
																								support = {
																									["Escort"] = {},
																									["SEAD"] = {},
																									["Escort Jammer"] = {},
																									["Flare Illumination"] = {},
																									["Laser Illumination"] = {},
																									},
																								multipack = multipack,
																								threatsGround = route.threats.ground_total,
																								threatsAir = route.threats.air_total,
																								id = "id"..#draft_sorties[side]+1,
																								rejected = {},
																							}
																							draft_sorties_entry.target.TitleName =  target_name													-- ATO_G_Debug04 correction targetName
																							
																							--score the sortie
																							local route_threat = route.threats.ground_total + route.threats.air_total						--combine route ground and air threat
																				
																							if task == "CAP" or task == "Intercept" then
																								draft_sorties_entry.score = unit_loadouts[l].capability * target.priority					--route threat does not matter for CAP and intercept
																				
																							else
																								draft_sorties_entry.score = unit_loadouts[l].capability * target.priority / route_threat	--calculate the score to measure the importance of the sortie
																							end
																							local reduce_score = 0																		--factor to reduce score for station missions with less aircraft than required to cover station
																							
																							if task == "CAP" then																		--station tasks with flights of 2
																								reduce_score = flights_requested - aircraft_assign / math.ceil(target.firepower.max / unit_loadouts[l].firepower) --increase factor by one for each flight that is missing
																							
																							elseif task == "AWACS" or task == "Refueling"  then											--station tasks with flights of 1
																								reduce_score = flights_requested - aircraft_assign										--increase factor by one for each flight that is missing
																							end
																							draft_sorties_entry.score = draft_sorties_entry.score - reduce_score * 0.01					--reduce score slighthly for station missions with less aircraft than required to cover station
																							
																							--ATO_G_adjustment02
																							if unit[n].tasksCoef and unit[n].tasksCoef[task] then
																								draft_sorties_entry.score = draft_sorties_entry.score * unit[n].tasksCoef[task]																						
																							end
																							
																							-- miguel21 modification M11.q multiplayer
																							if multiPlaneSet then
																				
																								if multiPlaneSet[unit[n].type] and  multiPlaneSet[unit[n].type][task]  then  --and task ~= "CAP" and task ~= "Intercept"
																				
																									if Multi.Target and Multi.Target[side] then
																				
																										if MultiPlayerOveRide then 	
																											draft_sorties_entry.score = draft_sorties_entry.score * 50000
																											-- print("ATO_G Type: "..unit[n].type.." AfterScore: "..draft_sorties_entry.score.." target_name: "..target_name)
																										end
																									else
																									draft_sorties_entry.score = draft_sorties_entry.score * 10								-- augmente le score pour avoir plus de chance d'avoir l'avion dispo	
																				
																									if draft_sorties_entry.score < 200 then draft_sorties_entry.score = draft_sorties_entry.score + 150 end
																									end
																								end	
																							end			
																							--insert sortie entry into draft_sorties table sorted by score (highest first)
																							if #draft_sorties[side] == 0 then															--if draft_sorties table is empty
																								-- table.insert(draft_sorties[side], draft_sorties_entry)
																								draft_sorties[side][#draft_sorties[side]+1] = draft_sorties_entry
																				
																							else
																								for d = 1, #draft_sorties[side] do														--iterate through draft_sorties
																				
																									if draft_sorties_entry.score > draft_sorties[side][d].score then					--score is bigger than current table entry
																										-- table.insert(draft_sorties[side], d, draft_sorties_entry)						--insert at current position in table
																										draft_sorties[side][#draft_sorties[side]+1] = draft_sorties_entry
																										break
																				
																									elseif draft_sorties_entry.score == draft_sorties[side][d].score then				--score is same as current table entry
																										local sum = 1
																				
																										for s = d + 1, #draft_sorties[side] do											--iterate through subsequent table entries
																				
																											if draft_sorties_entry.score == draft_sorties[side][s].score then			--if these entries also have the same score
																												sum = sum + 1															--sum them
																				
																											else
																												break
																											end
																										end
																										table.insert(draft_sorties[side], d + math.random(0, sum), draft_sorties_entry)	--insert random position position in table
																										-- draft_sorties[side][d + math.random(0, sum)] = draft_sorties_entry
																										break
																				
																									elseif d == #draft_sorties[side] then												--if end of table is reached
																										-- draft_sorties_entry["id"] = "id"..#draft_sorties[side]+1
																										draft_sorties[side][#draft_sorties[side]+1] = draft_sorties_entry
																									end
																								end
																							end
																				
																							if task == "CAP" or task == "AWACS" or task == "Refueling"  then
																								aircraft_assign = aircraft_assign - 1													--make additional draft sortie for lesser amount of aircraft
																				
																							else
																								aircraft_assign = 0																		--do not make additional draft sorties
																							end
																						until aircraft_assign <= 0																		--stop making more draft sorties
																						
																						--print("ATO Generating Sortie (" .. status_counter_sorties .. ") - Complete")	--DEBUG
																					end
																					
																					variant = variant - 2																			--determines if while-loop does another route variant depending on daytime
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

print("-")
print("ATO Generating Sortie (" .. status_counter_sorties .. ") - Complete")

-- Modif Miguel21 M13 Performance Scripting	
-- ATO_G_debug02b haut score

-- local sorties_str = TableSerialization(draft_sorties["blue"], 0)
-- local sorties_File = io.open("Debug/BEFORE_sorties_str_R.lua", "w")										--open targetlist file
-- sorties_File:write(sorties_str)																		--save new data
-- sorties_File:close()

	local shuffled = {}
	for i, v in ipairs(oob_air["blue"]) do
		local pos = math.random(1, #shuffled+1)
		table.insert(shuffled, pos, v)
	end
	oob_air["blue"] = shuffled

	shuffled = {}
	for i, v in ipairs(oob_air["red"]) do
		local pos = math.random(1, #shuffled+1)
		table.insert(shuffled, pos, v)
	end
	oob_air["red"] = shuffled


	table.sort(draft_sorties["blue"], function(a,b) return a.score > b.score  end)
	table.sort(draft_sorties["red"], function(a,b) return a.score > b.score  end)
	
	
-- local sorties_str = TableSerialization(draft_sorties["blue"], 0)
-- local sorties_File = io.open("Debug/AFTER_sorties_str_R.lua", "w")										--open targetlist file
-- sorties_File:write(sorties_str)																		--save new data
-- sorties_File:close()


-- if Debug.Generator.affiche then	
	-- local di = 1 
	-- for draft_n, draft in pairs(draft_sorties["blue"]) do	
		-- if  di < Debug.Generator.nb  then		--if  di < Debug.Generator.nb and string.find(draft.task, "Strike") then
			-- print(	"N� " .. draft_n..
					-- " /Id/ " ..tostring(draft.id)..
					-- " /Nb/ " ..draft.number..
					-- " /Type/ "..draft.type..
					-- " /threatsGround/ "..round(draft.threatsGround)..
					-- " /threatsAir/ "..round(draft.threatsAir)..
					-- " /Score/ " ..round(draft.score)..
					-- " /Task/ "..draft.task..
					-- " /Target/ "..draft.target_name
					-- )
			-- di = di +1
		-- end
	-- end
	-- print()	
-- end

-- if Debug.Generator.affiche then	
	-- local di = 1 
	-- for draft_n, draft in pairs(draft_sorties["red"]) do	
		-- if  di < Debug.Generator.nb or draft.name == "GA 2nd AS" then
			-- print(	"N� " .. draft_n..
					-- " /Id/ " ..tostring(draft.id)..
					-- " /Nb/ " ..draft.number..
					-- " /Type/ "..draft.type..
					-- " /threatsGround/ "..round(draft.threatsGround)..
					-- " /threatsAir/ "..round(draft.threatsAir)..
					-- " /Score/ " ..round(draft.score)..
					-- " /Task/ "..draft.task..
					-- " /Target/ "..draft.target_name
					-- )
			-- di = di +1
		-- end
	-- end
	-- print()	
	-- print()	
	-- print()	
-- end


	-- table.sort(oob_air["blue"], function(a,b) return a.number > b.number  end)
	-- table.sort(oob_air["red"], function(a,b) return a.number > b.number  end)
	
-- shuffled = {}
-- for i, v in ipairs(oob_air["blue"]) do
	-- local pos = math.random(1, #shuffled+1)
	-- table.insert(shuffled, pos, v)
-- end
-- oob_air["blue"] = shuffled

-- shuffled = {}
-- for i, v in ipairs(oob_air["red"]) do
	-- local pos = math.random(1, #shuffled+1)
	-- table.insert(shuffled, pos, v)
-- end
-- oob_air["red"] = shuffled

	-- local camp_str = "oob_air = " .. TableSerialization(oob_air, 0)						--make a string
	-- local campFile = io.open("Debug/shuffled_ATO_Generator.lua", "w")										--open targetlist file
	-- campFile:write(camp_str)																		--save new data
	-- campFile:close()
	



--create additional draft sorties with support flights assigned
local wk = 1							
i_timmer02 = 0

--inversion des 2 boucles draft_sortie en premier, oob_air ensuite, pour homogeniser les chances de sortie de tous les escadrons support
for sideS, draftT in pairs(draft_sorties) do		
	for draft_n, draft in pairs(draft_sorties[sideS]) do													--iterate through all draft sorties beginning with the highest scored

		--determine enemy side
		local enemy																						--determine enemy side (opposite of unit side)
		if side == "blue" then
			enemy = "red"
		else
			enemy = "blue"
		end
		
		
		
		local shuffled = {}
		for i, v in ipairs(oob_air["blue"]) do
			local pos = math.random(1, #shuffled+1)
			table.insert(shuffled, pos, v)
		end
		oob_air["blue"] = shuffled

		shuffled = {}
		for i, v in ipairs(oob_air["red"]) do
			local pos = math.random(1, #shuffled+1)
			table.insert(shuffled, pos, v)
		end
		oob_air["red"] = shuffled		
		
		for side,unit in pairs(oob_air) do																	--iterate through all sides
						
			local NbTotalSupport = {}
			for n = 1, #unit do																				--iterate through all units
				if side == sideS and unit[n].inactive ~= true and db_airbases[unit[n].base] and db_airbases[unit[n].base].inactive ~= true and aircraft_availability[unit[n].name] and aircraft_availability[unit[n].name].available > 0  and db_airbases[unit[n].base].x and db_airbases[unit[n].base].y then	--if unit is active, its base is active and has available aircraft -- ATO_G_debug01 Fin de campagne
					
					for task,task_bool in pairs(unit[n].tasks) do											--iterate through all tasks of unit
						local temp_draft_sorties = {}														--temporary table to hold additional draft sorties with escorts assigned
						if (task == "SEAD" or task == "Escort" or task == "Escort Jammer" or task == "Flare Illumination" or task == "Laser Illumination") and task_bool then	--task is a support task and is true
							--get possible loadouts
							local unit_loadouts = {}														--table to hold all loadouts for this aircraft type and task
							for loadout_name, ltable in pairs(db_loadouts[unit[n].type][task]) do			--iterate through all loadouts for the aircraft type and task
								ltable.name = loadout_name
								-- table.insert(unit_loadouts, ltable)											--add loadout to local table
								unit_loadouts[#unit_loadouts+1] = ltable
							end
							
							for l = 1, #unit_loadouts do													--iterate through all available loadouts				
								-- print("ATO_G__ "..tostring(l))
								--get possible Time on Target
								local tot_from = 0															--earliest Time on Target for this loadout
								local tot_to = 0															--latest Time on target for this loadout
								if unit_loadouts[l].day and unit_loadouts[l].night then						--loadout is day and night capable
									tot_from = 0															--from mission start
									tot_to = camp.mission_duration											--to mission end
								elseif unit_loadouts[l].day then											--loadout is day capable
									if daytime == "night-day" then
										tot_from = camp.dawn - camp.time									--from dawn
										tot_to = camp.mission_duration										--to mission end
									elseif daytime == "day" then
										tot_from = 0														--from missiom start
										tot_to = camp.mission_duration										--to mission end
									elseif daytime == "day-night" then
										tot_from = 0														--from mission start
										tot_to = camp.dusk - camp.time										--to dusk
									end
								elseif unit_loadouts[l].night then											--loadout is night capable
									if daytime == "day-night" then
										tot_from = camp.dusk - camp.time									--from dusk
										tot_to = camp.mission_duration										--to mission end
									elseif daytime == "night" then
										tot_from = 0														--from mission start
										tot_to = camp.mission_duration										--to mission end
									elseif daytime == "night-day" then
										tot_from = 0														--from mission start
										tot_to = camp.dawn - camp.time										--to dawn
									end
								end

								if tot_from ~= 0 or tot_to ~= 0 then										--loadout has an eligible time on target
									
									local _NbTotalSupport = 0
										
									if not draft.support[task]["NbTotalSupport"] then draft.support[task]["NbTotalSupport"] = 0 end
									-- if not draft.support[task]["escort_max"] then draft.support[task]["escort_max"] = campMod.Setting_Generation.limit_escort end
									if not draft.support[task]["escort_max"] then draft.support[task]["escort_max"] = 999 end
									local MP_Game = false
									if multiPlaneSet then
										if multiPlaneSet[unit[n].type]  and multiPlaneSet[unit[n].type][task] then	--and task ~= "CAP" and task ~= "Intercept"
											if Multi.Target and Multi.Target[side] and Multi.Target[side] == draft.target_name then	
												MP_Game = true
											end
										end
									end
									
									-- print("ATO_G draft_sortiesName "..draft.name.." "..draft.type)
									i_timmer02 = i_timmer02 +1
									if draft.loadout.support and draft.loadout.support[task]
										and ( (tonumber(draft.support[task]["NbTotalSupport"]) < tonumber(draft.support[task]["escort_max"])) or MP_Game ) then
										
										local support_requirement = false
										if task == "SEAD" then
											if draft.route.threats.SEAD_offset > 0 then												--draft sortie has a SEAD offset requirement
												support_requirement = true
											end
										elseif task == "Escort" then
											if draft.route.threats.air_total > 0.5 then												--draft sortie has an air threat
												support_requirement = true
											end
										elseif task == "Escort Jammer" then
											if draft.route.threats.SEAD_offset > 0 or draft.route.threats.air_total > 0.5 then		--draft sortie has either a SEAD offest requirement or an air threat
												support_requirement = true
											end
										elseif task == "Flare Illumination" or task == "Laser Illumination"then
											support_requirement = true
										end
											
										if support_requirement or MP_Game then																	--go ahead with this support task

											if (unit_loadouts[l].day and draft.loadout.day) or (unit_loadouts[l].night and draft.loadout.night) then	--support can join package at either day or night
												TrackPlayability(unit[n].player, "tot")															--track playabilty criterium has been met
											
												if unit_loadouts[l].vCruise >= draft.loadout.vCruise then										--support has a cruise speed equal or higher than main body
													TrackPlayability(unit[n].player, "target")													--track playabilty criterium has been met
													-- io.write("ATO_G passeBB ")
													--check weather
													local weather_eligible = true
													if mission.weather["clouds"]["density"] > 8 then											--overcast clouds
														local cloud_base = mission.weather["clouds"]["base"]
														local cloud_top = mission.weather["clouds"]["base"] + mission.weather["clouds"]["thickness"]
														if db_airbases[unit[n].base].elevation + 333 > cloud_base then							--cloud base is less than 1000 ft above airbase elevation
															if unit_loadouts[l].adverseWeather == false then									--loadout is not adverse weather capable
																weather_eligible = false														--not eligible for this weather
															end
														else
															if draft.loadout.hCruise > cloud_base and draft.loadout.hCruise < cloud_top then	--cruise alt is in the clouds
																if unit_loadouts[l].adverseWeather == false then								--loadout is not adverse weather capable
																	weather_eligible = false													--not eligible for this weather
																end
															elseif draft.loadout.hAttack > cloud_base and draft.loadout.hAttack < cloud_top then	--attack alt is in the clouds
																if unit_loadouts[l].adverseWeather == false then								--loadout is not adverse weather capable
																	weather_eligible = false													--not eligible for this weather
																end
															end
														end
													end
													if mission.weather["enable_fog"] == true then												--fog
														if db_airbases[unit[n].base].elevation < mission.weather["fog"]["thickness"] then		--base elevation in fog
															if mission.weather["fog"]["visibility"] < 5000 then									--less than 5000m visibility
																if unit_loadouts[l].adverseWeather == false then								--loadout is not adverse weather capable
																	weather_eligible = false													--not eligible for this weather
																end
															end
														end
													end
													
													if weather_eligible then																	--continue of this loadout is eligible for weather
														TrackPlayability(unit[n].player, "weather")												--track playabilty criterium has been met								
														--get airbase position
														local airbasePoint = {																	--get the x-y coordinates of the airbase where the unit is located
															x = db_airbases[unit[n].base].x,
															y = db_airbases[unit[n].base].y
														}												
														
														local route = GetEscortRoute(airbasePoint, draft.route)									--get the route to escort this sortie
														if route.lenght <= unit_loadouts[l].range * 2 and (unit_loadouts[l].minrange == nil or route.lenght > unit_loadouts[l].minrange * 2) then		--escort route lenght is within range capability of loadout
															TrackPlayability(unit[n].player, "target_range")									--track playabilty criterium has been met
															
															--determine number of escorts
															local escort_num = 0
															local escort_max = 0
															
															if draft.support[task]["escort_max"] ~= 999 then
																escort_max = draft.support[task]["escort_max"]
															else
																escort_max = 0
															end														
															
															if task == "SEAD" then
																escort_num = draft.route.threats.SEAD_offset / unit_loadouts[l].capability		--capability determines amount of offset per aircraft
																escort_num = math.ceil(escort_num / 2) * 2										--round up requested escorts to even number
															elseif task == "Escort" then
																if draft.support[task]["escort_max"] ~= 999 then
																	escort_num = draft.support[task]["escort_max"] - draft.support[task]["NbTotalSupport"]	-- Miguel21 modification M11.x : Multiplayer	(x: EscorteTot-max)
																else
															
																	local escort_offset_level = unit_loadouts[l].capability * unit_loadouts[l].firepower	--threat level that each fighter escort can offset
																	escort_num = (draft.route.threats.air_total - 0.5) / escort_offset_level		--number of escorts needed to offset total air threat (-0.5 because that is no air threat)
																	
																	if escort_num > draft.number * 3 then											--when more escorts 3 times escorts than escorted aircraft
																		escort_num = draft.number * 3												--limit escort number to 3 times escorted aircraft
																	end
																	if escort_num > campMod.Setting_Generation.limit_escort then
																		escort_num = campMod.Setting_Generation.limit_escort
																	end

																	escort_num = math.ceil(escort_num / 2) * 2										--round up requested escorts to even number
																	
																	if escort_num > escort_max then
																		escort_max = escort_num
																	end	
																end
															elseif task == "Escort Jammer" then
																escort_num = 1																	--escort jamming by single aircraft
															elseif task == "Flare Illumination" then
																escort_num = 1																	--flare illumination by single aircraft
															elseif task == "Laser Illumination" then
																escort_num = 1																	--laser illumination by single aircraft
															end
															
															if escort_num > aircraft_availability[unit[n].name].available then					--if more escorts are requested than available
																escort_num = aircraft_availability[unit[n].name].available						--reduce requested escorts to number of available escorts
																escort_num = math.floor(escort_num / 2) * 2										--round down to even number
															end
															
															if MP_Game	then
																escort_num = multiPlaneSet[unit[n].type][task].NbPlane
															end
															
															-- ATO_G_Debug05 interdit l'escorte avion/helico
															if draft.helicopter then
																if not  unit[n].helicopter	then
																	escort_num = 0
																end
															end
															
															local wi = 1
															if escort_num > 0  then																--repeat to make multiple new sorties with various even number of escorts (from all requested down to 2)
																
																TrackPlayability(unit[n].player, "target_firepower")							--track playabilty criterium has been met
																
																if not draft.support[task] then
																	draft.support[task] = {}
																end
																if not draft.support[task][unit[n].type] then
																	draft.support[task][unit[n].type] = {}
																end		
																
																--add escort table to sortie															
																draft.support[task]["NbTotalSupport"] = draft.support[task]["NbTotalSupport"] + escort_num
																draft.support[task]["escort_max"] = escort_max
																
																draft.support[task][unit[n].type] = {
																	id = draft.id.."-"..wi.."-"..wk,
																	name = unit[n].name,
																	playable = unit[n].player,
																	type = unit[n].type,
																	helicopter = unit[n].helicopter,											-- Miguel21 modification M06 : helicoptere playable
																	number = escort_num,
																	country = unit[n].country,
																	livery = unit[n].livery,
																	sidenumber = unit[n].sidenumber,
																	liveryModex = unit[n].liveryModex,
																	base = unit[n].base,
																	airdromeId = db_airbases[unit[n].base].airdromeId,
																	parking_id = unit[n].parking_id,
																	skill = unit[n].skill,
																	task = task,
																	loadout = unit_loadouts[l],
																	route = route,
																	target = deepcopy(draft.target),
																	target_name = draft.target_name,
																	tot_from = draft.tot_from,
																	tot_to = draft.tot_to,
																	rejected = {},
																}

																--recalculate threat level for sortie adjusted by number of escort
																local route_threat_recalc = 0.5														--recalculated route threat with escort in place (0.5 == no threat)
																if task == "SEAD" then
																	local escort_offset = escort_num * unit_loadouts[l].capability					--number of available SEAD to offset threats
																	for k,v in pairs(draft.route.threats.ground) do									--iterate through route ground threats
																		if v.offset > 0 then														--if threat can be offset by SEAD
																			if escort_offset >= v.offset then										--some SEAD aircraft remain to offset the threat
																				escort_offset = escort_offset - v.offset							--use these SEAD aircraft to offset and ignore the therat
																			else																	--no SEAD aircraft remain unassignedd
																				route_threat_recalc = route_threat_recalc + v.level					--sum route ground threat levels
																			end
																		else																		--threat cannot be offset by SEAD
																			route_threat_recalc = route_threat_recalc + v.level						--sum route ground threat levels
																		end
																	end
																	draft.route.threats.ground_total = route_threat_recalc			--recalculated total route grund threat
																elseif task == "Escort" then
																	local escort_offset_level = unit_loadouts[l].capability * unit_loadouts[l].firepower		--threat level that each fighter escort can offset
																	route_threat_recalc = draft.route.threats.air_total - escort_offset_level * escort_num			--recalculated total route air threat
																	if route_threat_recalc < 0.5 then
																		route_threat_recalc = 0.5
																	end
																	draft.route.threats.air_total = route_threat_recalc
																elseif task == "Escort Jammer" then
	--ADD RECALCULATED THREAT LEVEL WITH ESCORT JAMMERS
																end
															
																local route_threat = draft.route.threats.ground_total + draft.route.threats.air_total		--combine adjusted ground and air threat levels (1 equald no threat)
																draft.score = draft.loadout.capability * draft.target.priority / route_threat		--calculate the score to measure the importance of the sortie		

																--ATO_G_adjustment02
																if unit[n].tasksCoef and unit[n].tasksCoef[task] then
																	draft.score = draft.score * unit[n].tasksCoef[task]															
																end
																
																-- miguel21 modification M11.r multiplayer
																if multiPlaneSet and multiPlaneSet[draft.type] and multiPlaneSet[draft.type][draft.task] then	-- check le type de plane en MAIN Strike
																	if Multi.Target and Multi.Target[side] and Multi.Target[side] == draft.target_name then		--si cible selectionnee et plane et task																		--si cible choisi par joueur
																		if multiPlaneSet[unit[n].type] and multiPlaneSet[unit[n].type][task] then
																			for iTask, _Support in pairs(draft.support) do										--boucle les supports pour trouver tous les vols support et augmenter leur valeur si ils correspondent aux planes demandé
																				if type(_Support) == "table" then	
																					for iPlane, iiSupport in pairs(_Support) do
																						draft.score = draft.score * 2
																						if  type(iiSupport) == table and multiPlaneSet[iiSupport.type] and multiPlaneSet[iiSupport.type][iTask] then
																							draft.score = draft.score + 500
																						end
																					end
																				end	
																			end																																	
																		end
																	
																	else																		--si cible choisi par joueur																		
																		if multiPlaneSet[draft.type] and multiPlaneSet[draft.type][draft.task] then
																				
																			for iTask, _Support in pairs(draft.support) do
																				if type(_Support) == "table" then
																					for iPlane, iiSupport in pairs(_Support) do	
																						draft.score = draft.score * 1.1
																						if  type(iiSupport) == table and multiPlaneSet[iiSupport.type] and multiPlaneSet[iiSupport.type][iTask] then
																							draft.score = draft.score + 10
																						end
																						-- print("ATO_G 02 "..draft.score)
																					end
																				end
																			end																																	
																		end
																		-- draft.score = draft.score * 25								-- augmente le score pour avoir plus de chance d'avoir l'avion dispo					
																		if draft.score < 200 then draft.score = draft.score + 200 end
																	end
																
																end	
																
																--adjust sortie Time on Target
																if tot_from > draft.tot_from then									--if earliest escort Time on Target is later than main body TOT
																	draft.tot_from = tot_from							--make earliest escort TOT the draft sortie earliest TOT 
																end
																if tot_to < draft.tot_to then										--if latest escort Time on Target is sooner than main body TOT
																	draft.tot_to = tot_to								--make latest escort TOT the draft sortie latest TOT
																end

																--status report
																status_counter_escorts = status_counter_escorts + 1
																--print("ATO Assigning Escorts (" .. status_counter_escorts .. ")")	--DEBUG
																
																-- print()
																-- print("ATO_G draft_n "..draft_n
																-- .." Strike: "..draft.type
																-- .." "..task
																-- .." Escorte: "..unit[n].name
																-- .." "..unit[n].type
																-- .." "..draft.target_name
																-- .." NbTotS: "..draft.support[task]["NbTotalSupport"]
																-- .." esctMax: "..draft.support[task]["escort_max"]
																-- )
																-- print()
																
																wi = wi + 1																
															end
														end
													end
												else
													-- print("ATO_G  Refused02 ||:if unit_loadouts[l].vCruise >= draft.loadout.vCruise "..debug.getinfo(1).currentline)
												end
											else
												-- print("ATO_G  Refused02 ||:if (unit_loadouts[l].day and draft.loadout.day) or "..debug.getinfo(1).currentline)
											end
										end
									else
										-- print("ATO_G  Refused02 ||:if draft.loadout.support and draft.loadout.support[task] and "..debug.getinfo(1).currentline)
										-- print("    draft.type"..tostring(draft.type).."[task]?: "..tostring(task).." NbTotalSupport: "..tonumber(draft.support[task]["NbTotalSupport"]).." < "..tonumber(draft.support[task]["escort_max"]).." or "..tostring(MP_Game))
									end
									if i_timmer02 >= 1000  then io.write(".") i_timmer02 = 0 end
									wk = wk +1
								end	
							end
						end
					end
				end
			end
		end
	end
end

print()
print("ATO Assigning Escorts (" .. status_counter_escorts .. ")")	--DEBUG
-- ATO_G_debug02b haut score

	table.sort(draft_sorties["blue"], function(a,b) return a.score > b.score  end)
	table.sort(draft_sorties["red"], function(a,b) return a.score > b.score  end)

	
-- if Debug.Generator.affiche then	
	-- local di = 1 
	-- for draft_n, draft in pairs(draft_sorties["blue"]) do	
		-- if  di < Debug.Generator.nb  then
			
			-- print(	"N° " .. draft_n..
					-- -- " /support/ " ..tostring(draft.support)..
					-- " /Name/ " ..tostring(draft.name)..
					-- " /Nb/ " ..draft.number..
					-- " /Type/ "..draft.type..
					-- " /thrtGrnd/ "..round(draft.threatsGround)..
					-- " /thrtA/ "..round(draft.threatsAir)..
					-- " /Score/ " ..round(draft.score)..
					-- " /NbTotSupt/ " ..tostring(draft.NbTotalSupport)..
					
					-- " /Task/ "..draft.task..
					-- " /Target/ "..draft.target_name
					-- )
			-- di = di +1
			-- for _PlaneTask, PlaneTask in pairs(draft.support) do
				-- -- draft.support[task]["escort_max"] = escort_max
				-- -- if PlaneTask.escort_max then
					-- -- print(tostring(PlaneTask.escort_max))
				-- -- end
				-- for taskName, task in pairs(PlaneTask) do	
				
					-- if type(task) == "table" then	
						-- -- print(	"    ---> Nsupport " .._PlaneTask.." ".. task.escort_max)
						-- print(	"    ---> Nsupport " .._PlaneTask.." ".. taskName..
								-- " /Id/ " ..tostring(task.id)..
								-- " /Nb/ " ..task.number..
								-- " /escort_max/ " ..tostring(PlaneTask.escort_max)..
								-- " /Type/ "..task.type..
								-- " /Task/ "..task.task..
								-- " /NbTotSupt/ " ..tostring(task.NbTotalSupport)..
								-- " /Target/ "..task.target_name
								-- )
					-- end
				-- end
			-- end
		-- end
	-- end
	-- print()	
-- end

	
-- if Debug.Generator.affiche then	
	-- local di = 1 
	-- for draft_n, draft in pairs(draft_sorties["red"]) do	
		-- if  di < Debug.Generator.nb or draft.name == "GA 2nd AS" then
			-- print(	"N° " .. draft_n..
					-- -- " /support/ " ..tostring(draft.support)..
					-- " /Id/ " ..tostring(draft.id)..
					-- " /Nb/ " ..draft.number..
					-- " /Type/ "..draft.type..
					-- " /threatsGround/ "..round(draft.threatsGround)..
					-- " /threatsAir/ "..round(draft.threatsAir)..
					-- " /Score/ " ..round(draft.score)..
					-- " /Task/ "..draft.task..
					-- " /Target/ "..tostring(draft.target_name)
					-- )
			-- di = di +1
			-- for _PlaneTask, PlaneTask in pairs(draft.support) do
				-- for taskName, task in pairs(PlaneTask) do	
					-- if type(task) == "table" then	
						-- print(	"    ---> Nsupport " .._PlaneTask.." ".. taskName..
								-- " /Id/ " ..tostring(task.id)..
								-- " /Nb/ " ..task.number..
								-- " /escort_max/ " ..tostring(PlaneTask.escort_max)..
								-- " /Type/ "..task.type..
								-- " /Task/ "..task.task..
								-- " /NbTotSupt/ " ..tostring(task.NbTotalSupport)..
								-- " /Target/ "..task.target_name
								-- )
					-- end
				-- end
			-- end
		-- end
	-- end
	-- print()	
	-- print()	
	-- print()	
-- end



--table to store the final ATO
ATO = {
	blue = {},
	red = {}
}


--assign draft sorties to ATO and build packages/flights
for side, draft in pairs(draft_sorties) do																		--iterate through all sides
	for n = 1, #draft do																						--iterate through all draft sorties beginning with the highest scored	
		if draft[n].loadout.minscore == nil or draft[n].loadout.minscore <= draft[n].score then					--draft sortie has no minimum score requirement or minimum score requirement is satisified		

			if draft[n].multipack == nil or draft[n].multipack > 0 then												--target does not have a requirment for a specific number of packages, or still needs more packages		

				if draft[n].target.firepower.max > 0 and draft[n].target.firepower.max >= draft[n].target.firepower.min then	--the target of this draft sortie must have a need for firepower above the minimum firepower threshold	
					local available = aircraft_availability[draft[n].name].unassigned											--shortcut for available aircraft for this draft sortie					

					if available * draft[n].loadout.firepower >= draft[n].target.firepower.min and draft[n].number * draft[n].loadout.firepower >= draft[n].target.firepower.min then	--enough aircraft are available to satisfy minimum firepower requirement for target						

						if draft[n].target.firepower.packmin == nil or available * draft[n].loadout.firepower >= (draft[n].target.firepower.packmin - 1) * draft[n].target.firepower.max + draft[n].target.firepower.min then	--if the target has a minimum package number requirement, sufficient aircraft are available from this unit to satisfy it					

							if draft[n].flights == nil or draft[n].number <= available then											--for targets with station time (multiple flights), continue only if sufficient aircraft are availabe. Additional lower scored sorties with less airctaft required will come later 

								--adjust the number of requested aircraft to the number of available aircraft
								if draft[n].number > available then
									draft[n].number = available
								end
								
								--check if there are enough supports available if supports are required		
								local support_available = true							
								
								local need = {}																														--collect the total number of aircraft needed from each unit to complete the package
								need[draft[n].name] = draft[n].number																								--number of main body aircraft 
								local avail = {}																													--collect the maximal number of available aircraft from this unit (biggest number of all tasks)
								avail[draft[n].name] = aircraft_availability[draft[n].name].unassigned								

								for unitname,_ in pairs(need) do
									if need[unitname] > avail[unitname] then																						--more aircraft are needed from this unit across all package tasks than are available
										support_available = false																									--not enough support available
									local TabRejected = {}
										TabRejected["sujet"]  = "AVION SUPPORT INSUFFISANT()support_available if need[unitname] > avail[unitname]"
										TabRejected["cause"] = { [1] =  need[unitname], [2] = avail[unitname], }
										TabRejected["ligne"]  = debug.getinfo(1).currentline														
										table.insert(draft[n]["rejected"], TabRejected)
									end
								end
								
								-- ATO_G_adjustment01 escort mandatory or not
								-- regarde uniquement pour les bombardiers necessitant une escorte
								if campMod.StrikeOnlyWithEscorte and not draft[n].loadout.self_escort then
									if (db_loadouts[draft[n].type]["Anti-ship Strike"] or db_loadouts[draft[n].type]["Strike"])  then	
										local break_loop = false
										for n_squad, squad in pairs(oob_air[side]) do
											if (squad.tasks["Anti-ship Strike"]  or squad.tasks["Strike"] ) and squad.type == draft[n].type then
												local needS = {}																														--collect the total number of aircraft needed from each unit to complete the package
												needS[draft[n].name] = 0																								--number of main body aircraft 
												local availS = {}																													--collect the maximal number of available aircraft from this unit (biggest number of all tasks)
												availS[draft[n].name] = 0
												for _p,_support in pairs(draft[n].support) do																							--iterate through support in draft sortie	
													if 	type(_support) == "table" then	
														for _a,support in pairs(_support) do											
															if 	type(support) == "table" then																
																needS[draft[n].name] =  needS[draft[n].name] + support.number																	--add number of support aircraft from same unit
																availS[draft[n].name] = availS[draft[n].name] + aircraft_availability[support.name].unassigned														
															end
														end
													end
												end

												for unitname,_ in pairs(needS) do
													if needS[unitname] - (needS[unitname] * 0.15) > availS[unitname] then	
													--more aircraft are needed from this unit across all package tasks than are available
														support_available = false																									--not enough support available
															local TabRejected = {}
															TabRejected["sujet"]  = "BOMBARDIER NECESSITANT ESCORTE()support_available if needS[unitname] - (needS[unitname] * 0.15) > availS[unitname]"
															TabRejected["cause"] = { [1] =  needS[unitname] - (needS[unitname] * 0.15), [2] = availS[unitname], }
															TabRejected["ligne"]  = debug.getinfo(1).currentline														
															table.insert(draft[n]["rejected"], TabRejected)
													end
												end
											
											end
										end
									end	
								end
								
								for _p,_support in pairs(draft[n].support) do																							--iterate through support in draft sortie
									if  not support_available and	type(_support) == "table" then	
										for _,support in pairs(_support) do																							--iterate through support in draft sortie
											if 	type(support) == "table" then	
												if support.number > aircraft_availability[support.name].unassigned then															--not enough aircraft available from this unit for this task
													support_available = false																									--not enough support available
														local TabRejected = {}
														TabRejected["sujet"]  = "ILLUMINATION ABSENT()support_available if support.number > aircraft_availability[support.name].unassigned"
														TabRejected["cause"] = { [1] =  support.number, [2] = aircraft_availability[support.name].unassigned, }
														TabRejected["ligne"]  = debug.getinfo(1).currentline														
														table.insert(draft[n]["rejected"], TabRejected)
												end
											end
										end
									end
								end
								
								if  not support_available and draft[n].loadout.support then																									--main body loadout support requirements
									for supporttype, bool in pairs(draft[n].loadout.support) do																		--iterate through support requirements of loadout
										if (supporttype == "Flare Illumination" or supporttype == "Laser Illumination") and bool then								--Flare Illumination and Laser Illumination is a necessary support type. If it is not present in the draft sortie, no package will be created				
											if draft[n].support[supporttype] == nil then																			--if draft sortie has no such support type assigned
												support_available = false																							--necessary support is not available
											
													local TabRejected = {}
													TabRejected["sujet"]  = "ILLUMINATION ABSENT()support_available if draft[n].support[supporttype] == nil"
													TabRejected["cause"] = { [1] =  draft[n].support[supporttype], [2] = "", }
													TabRejected["ligne"]  = debug.getinfo(1).currentline														
													table.insert(draft[n]["rejected"], TabRejected)
											end
										end
									end
								end
								
								
								for _p,_support in pairs(draft[n].support) do																							--iterate through support in draft sortie
									if not support_available and type(_support) == "table" then	
										for _,support in pairs(_support) do																							--iterate through support in draft sortie
											if 	type(support) == "table" then	
												if aircraft_availability[support.name].unassigned <=0 then
													support_available = false
													
														local TabRejected = {}
														TabRejected["sujet"]  = "AVION SUPPORT INSUFFISANT()support_available if aircraft_availability[support.name].unassigned <=0"
														TabRejected["cause"] = { [1] = aircraft_availability[support.name].unassigned, [2] = "", }
														TabRejected["ligne"]  = debug.getinfo(1).currentline														
														table.insert(draft[n]["rejected"], TabRejected)
												end
											end
										end
									end
								end	
									
								-- Miguel21 modification M11.u : Multiplayer	(u: reserve avion Escorte)
								-- interdit aux possible avion d'escorte de tout donner dans CAP ou Intercept
								if (draft[n].task == "CAP" or draft[n].task == "Intercept") and ((db_loadouts[draft[n].type]["Escort"] or db_loadouts[draft[n].type]["SEAD"]) and aircraft_availability[draft[n].name].serviceable > 4) then
									local break_loop = false
									for n_squad, squad in pairs(oob_air[side]) do
										if squad.type == draft[n].type and (squad.tasks["Escort"] or squad.tasks["SEAD"]) then
											if aircraft_availability[draft[n].name].unassigned - draft[n].number <= aircraft_availability[draft[n].name].serviceable/2 then
												support_available = false
													
													local TabRejected = {}
													TabRejected["sujet"]  = "NE DONNE PAS TOUT en CAP ou Intercept ()support_available if aircraft_availability[draft[n].name].unassigned - draft[n].number <= aircraft_availability[draft[n].name].serviceable/2"
													TabRejected["cause"] = { [1] = aircraft_availability[draft[n].name].unassigned - draft[n].number, [2]  = aircraft_availability[draft[n].name].serviceable/2, }
													TabRejected["ligne"]  = debug.getinfo(1).currentline														
													table.insert(draft[n]["rejected"], TabRejected)	
													
												break_loop = true																		
												break
											end
										end
										if break_loop == true then
											break																							
										end
									end
								end
									
									
									
								
								
								if support_available then																		--continue if no support is required or enough support is available to create package
									--add new package to ATO
									local pack_n = #ATO[side]
									ATO[side][pack_n + 1] = {
										["main"] = {},																			--package main body
										["Escort"] = {},																		--Fighter escort
										["SEAD"] = {},																			--SEAD escort
										["Escort Jammer"] = {},																	--jammer escort
										["Flare Illumination"] = {},															--illumination flare
										["Laser Illumination"] = {},															--laser illumination
									}
									pack_n = pack_n + 1
									
									--add flights of 1, 2 or 4 aircraft to package
									local function AddFlight(assign, role, entry)
										local assigned
										while assign > 0 do																		--loop as long as there are aircraft to assign
											if entry.flights then																--for multiple flights with station time (CAP, AWACS, Tanker etc.)
												local flightsize = math.ceil(draft[n].target.firepower.max / draft[n].loadout.firepower)	--how many aircraft should be in each flight
												if assign >= flightsize then													--if there are more aircraft left to assign than the size of one flight
													assigned = flightsize														--assign one full flight
												else																			--if there are less aircraft left to assign than size of one flight
													assigned = assign															--assign whatever is left
												end
												entry.flights = entry.flights - 1												--one less flight to assign
											elseif entry.task == "Transport" or entry.task == "Escort Jammer" or entry.task == "Flare Illumination" or entry.task == "Laser Illumination" then		--for tasks with single aircraft
												assigned = 1																	--assign one aircraft per flight	
											elseif entry.task == "Intercept" then
												if assign >= 2 then																--if more than 2 aircraft are to be assigned
													assigned = 2																--assign flight of 2 aircaft
												else
													assigned = 1																--else assign flight of 1 aicraft
												end
											elseif entry.type == "S-3B" or entry.type == "F-117A" or entry.type == "B-1B" or entry.type == "B-52H" or entry.type == "Tu-22M3" or entry.type == "Tu-95MS" or entry.type == "Tu-142" or entry.type == "Tu-160" or entry.type == "MiG-25RBT" then	--for bombers
												assigned = 1																	--assigne one aircraft per flight
											elseif entry.task == "Reconnaissance" then											--for recon
												if assign == 1 then																--if there is one aircraft left to assign
													assigned = 1																--assigne one aircraft per flight
												elseif assign >= 4 then															--if more than 4 aircraft are to be assigned
													assigned = 4																--assign flight of 4 aircaft
												elseif assign == 3 then															--if more than 3 aircraft are to be assigned
													assigned = 3																--assign flight of 3 aircaft
												else
													assigned = 2																--else assign flight of 2 aicraft
												end
											else																				--for everything else
												if assigned and assign == 1 then												--if there is one aircraft left to assign and there was already a previous flight assigned, stop assigning (do not add leftover single-ships)
													break
												elseif assign >= 4 then															--if more than 4 aircraft are to be assigned
													assigned = 4																--assign flight of 4 aircaft
												else
													assigned = assign															--else assign flight size of what is left
												end
											end

											local flight = {																	--build ATO flight entry
												name = entry.name,
												playable = entry.playable,
												type = entry.type,
												helicopter = entry.helicopter,
												number = assigned,																--number of aircraft in flight
												country = entry.country,
												livery = entry.livery,
												sidenumber = entry.sidenumber,
												liveryModex = entry.liveryModex,
												base = entry.base,
												airdromeId = entry.airdromeId,
												parking_id = entry.parking_id,
												skill = entry.skill,
												task = entry.task,
												loadout = entry.loadout,
												route = {},																		--route is a table and connot be copied as a whole
												target = deepcopy(entry.target),
												target_name = entry.target_name,
												firepower = assigned * entry.loadout.firepower,
												tot_from = entry.tot_from,
												tot_to = entry.tot_to,
											}
											for r = 1, #entry.route do															--make copy of route table
												flight.route[r] = {}
												for k,v in pairs(entry.route[r]) do
													flight.route[r][k] = v
												end
											end
											table.insert(ATO[side][pack_n][role], flight)										--add flight to package role (main, SEAD or escort)											
											
											--store time assigned aircraft are unavailable for future missions
											local operating_hours														--time the unit is operating each day
											if entry.loadout.day and entry.loadout.night then							--day/night loadout
												operating_hours = 86400													--full day in seconds
											elseif entry.loadout.day then												--day loadout
												operating_hours = camp.dusk - camp.dawn									--daytime in seconds
											elseif entry.loadout.night then												--night loadout
												operating_hours = camp.dawn + (86400 - camp.dusk)						--nighttime in seconds
											end
											local time_to_next_mission = operating_hours / entry.loadout.sortie_rate	--time duration until aircraft can do the next mission based on its sortie rate
											if entry.loadout.tStation and #ATO[side][pack_n][role] == 1 then			--for a flight that has a station time and for the first flight in package
												time_to_next_mission = time_to_next_mission - entry.loadout.tStation	--remove station time from time to next mission, because flight could airstart current mission at close to end of its station time
											end
											local current_time = (camp.day - 1) * 86400 + camp.time						--current absolute campaign time
											local unavailable = current_time + time_to_next_mission 					--campaign time until this aircraft unavailable for new mission
											for a = 1, assigned do														--iterate through all assigned aircraft
												if #aircraft_availability[entry.name].unavailable == 0 then
													table.insert(aircraft_availability[entry.name].unavailable, unavailable)						--insert unavailable time into unavailable table of this unit
												else
													for u = 1, #aircraft_availability[entry.name].unavailable do
														if unavailable > aircraft_availability[entry.name].unavailable[u] then
															table.insert(aircraft_availability[entry.name].unavailable, u, unavailable)				--insert unavailable time into unavailable table of this unit sorted from highest to lowest
															break
														elseif u == #aircraft_availability[entry.name].unavailable then
															table.insert(aircraft_availability[entry.name].unavailable, u + 1, unavailable)			--insert unavailable time into unavailable table of this unit sorted from highest to lowest
														end
													end
												end
											end
											
											aircraft_availability[entry.name].assigned = aircraft_availability[entry.name].assigned + assigned
											aircraft_availability[entry.name].unassigned = aircraft_availability[entry.name].unassigned - assigned		--remove assigned aircraft from total number of available aircraft for this unit
											
											assign = assign - assigned															--continue loop until are aircraft are assigned
										
										end
									end
									
									AddFlight(draft[n].number, "main", draft[n])												--add main body flights to package
									for support_name,_support in pairs(draft[n].support) do										--iterate through all package support
										if type(_support) == "table" then	
											for _plane,support in pairs(_support) do
												local number  = 0
												if type(support) == "table" and aircraft_availability[support.name].unassigned >= 2 then
													
													if support.number >= aircraft_availability[support.name].unassigned then number = aircraft_availability[support.name].unassigned end
													if support.number < aircraft_availability[support.name].unassigned then number = support.number end
													
													-- print("ATO_G Zb support_name: "..support_name.." _plane :".._plane.." "..support.name.." |unassigned: "..aircraft_availability[support.name].unassigned.." |number: "..number)
								
													AddFlight(number, support_name, support)										--add support flights to package
												
												end
											end
										end
									end
															
									--remove the firepower applied by package to target from maximum firepower of all other draft sorties to the same target
									local firepower_applied = 0																	--collect the amount of firepower combined by all main body flights of this package
									for f = 1, #ATO[side][pack_n].main do														--iterate through all main body flights
										firepower_applied = firepower_applied + ATO[side][pack_n].main[f].firepower				--sum firepower
									end
									for m = 1, #draft do																		--iterate through all draft sorties again
										if draft[n].target_name == draft[m].target_name then									--if draft sortie with same target as present package is found
											if draft[m].multipack then															--target has a fixed requirement for number of packages 
												draft[m].multipack = draft[m].multipack - 1										--reduce number of packages per one
												if draft[m].target.firepower.packmin then											--target has a fixed requirement for minimal number of packages 
													draft[m].target.firepower.packmin = draft[m].target.firepower.packmin - 1		--reduce number of minimal packages per one
												end
											else																				--target is stricly firepower controlled
												draft[m].target.firepower.max = draft[m].target.firepower.max - firepower_applied	--remove the firepower applied by current package from maximum firepower for this sortie
												draft[m].number = math.ceil(draft[m].number - (firepower_applied / draft[m].loadout.firepower))	--reduce the number of aircraf to be assigned to this sortie as a result of the firepower reduction
											end
										end
									end
									
									--status report
									status_counter_ATO = status_counter_ATO + 1
									--print("ATO Generation (" .. status_counter_ATO .. ")")	--DEBUG
								else
									local TabRejected = {}
									TabRejected["sujet"]  = "SUPPORT IMPOSSIBLE()if support_available"
									TabRejected["cause"] = { [1] = support_available, [2]  = "", }
									TabRejected["ligne"]  = debug.getinfo(1).currentline
									table.insert(draft[n]["rejected"], TabRejected)
								end
							else
								local TabRejected = {}
								TabRejected["sujet"]  = "AVIONS INSUFFISANT()if draft[n].flights == nil or draft[n].number <= available then"
								TabRejected["cause"] = { [1] = draft[n].flights, [2]  = draft[n].number, }
								TabRejected["ligne"]  = debug.getinfo(1).currentline
								table.insert(draft[n]["rejected"], TabRejected)
							end
						else
							--if draft[n].target.firepower.packmin == nil or available * draft[n].loadout.firepower >= (draft[n].target.firepower.packmin - 1) * draft[n].target.firepower.max + draft[n].target.firepower.min
							local TabRejected = {}
							TabRejected["sujet"]  = "FIREPOWER du PACKAGE INSUFFISANT()if  available * draft[n].loadout.firepower >= (draft[n].target.firepower.packmin - 1) * draft[n].target.firepower.max"
							TabRejected["cause"] = { [1] = available * draft[n].loadout.firepower, [2]  = (draft[n].target.firepower.packmin - 1) * draft[n].target.firepower.max, }
							TabRejected["ligne"]  = debug.getinfo(1).currentline
							table.insert(draft[n]["rejected"], TabRejected)
						end
					else
						local TabRejected = {}
						TabRejected["sujet"]  = "AVION DISPONIBLE INSUFFISANT ()if available * draft[n].loadout.firepower >= draft[n].target.firepower.min and draft[n].number * draft[n].loadout.firepower >= draft[n].target.firepower.min"
						TabRejected["cause"] = { [1] = available * draft[n].loadout.firepower, [2]  = draft[n].target.firepower.min, }
						TabRejected["ligne"]  = debug.getinfo(1).currentline
						table.insert(draft[n]["rejected"], TabRejected)
					end
				else
					local TabRejected = {}
					TabRejected["sujet"]  = "FIREPOWER INSUFFISANT (a augmenter dans loadout)if draft[n].target.firepower.max > 0 and draft[n].target.firepower.max >= draft[n].target.firepower.min"
					TabRejected["cause"] = { [1] = draft[n].target.firepower.max, [2]  = draft[n].target.firepower.max, }
					TabRejected["ligne"]  = debug.getinfo(1).currentline
					table.insert(draft[n]["rejected"], TabRejected)
				end
			else
				local TabRejected = {}
				TabRejected["sujet"]  = "MultiPACKAGE A 0 (?)if draft[n].multipack == nil or draft[n].multipack > 0"
				TabRejected["cause"] = { [1] = draft[n].multipack, [2]  = draft[n].multipack, }
				TabRejected["ligne"]  = debug.getinfo(1).currentline
				table.insert(draft[n]["rejected"], TabRejected)
			end
		else 
			local TabRejected = {}
			TabRejected["sujet"]  = "MENACE TROP IMPORTANTE (descendre minscore ou diminuer Menace AA AS) draft[n].loadout.minscore <= draft[n].score"
			TabRejected["cause"] = { [1] = draft[n].loadout.minscore, [2]  = draft[n].score, }
			TabRejected["ligne"]  = debug.getinfo(1).currentline
			table.insert(draft[n]["rejected"], TabRejected)	
		end
	end
end

if Debug.Generator.affiche then	
		
	for side, sorties in pairs(draft_sorties) do	
		local di = 1 
		for draft_n, draft in pairs(sorties) do	
			local NameOK = false
			for _PlaneTask, PlaneTask in pairs(draft.support) do
				for taskName, task in pairs(PlaneTask) do	
					if type(task) == "table" then
						if task.name == "testsquad" then
							NameOK = true
						end
					end
				end
			end	
						
			if  di < Debug.Generator.nb or draft.name == "testsquad" or NameOK  then
				print(	"N° " .. draft_n..
						-- " /support/ " ..tostring(draft.support)..
						" /Id/ " ..tostring(draft.id)..
						" /name/ " ..draft.name..
						" /Nb/ " ..draft.number..
						" /Type/ "..draft.type..
						" /threatsGround/ "..round(draft.threatsGround)..
						" /threatsAir/ "..round(draft.threatsAir)..
						" /Score/ " ..round(draft.score)..
						" /Task/ "..draft.task..
						" /Target/ "..tostring(draft.target_name)
						)
				di = di +1
				for _PlaneTask, PlaneTask in pairs(draft.support) do
					for taskName, task in pairs(PlaneTask) do	
						if type(task) == "table" then	
							print(	"    ---> Nsupport " .._PlaneTask.." ".. taskName..
									" /Id/ " ..tostring(task.id)..
									" /name/ " ..task.name..
									" /Nb/ " ..task.number..
									" /escort_max/ " ..tostring(PlaneTask.escort_max)..
									" /Type/ "..task.type..
									" /Task/ "..task.task..
									" /NbTotSupt/ " ..tostring(task.NbTotalSupport)..
									" /Target/ "..task.target_name
									)
						end
					end
				end
				if draft.rejected then
					for id, _rejected in pairs(draft.rejected) do
						print(	" rejected/ ".._rejected.sujet..
							" / cause " ..tostring(_rejected.cause[1])..
							" "..tostring(_rejected.cause[2])..
							" / ligne " ..tostring(_rejected.ligne)
							)
					end
				end
				print()
			end
		end
		-- print()	
		-- print()	
		-- print()	
	end
	-- print()	
	-- print()	
	-- print()	
end

--complete unit unavailable table with zero entries for unassigned aircraft
for side,unit in pairs(oob_air) do																					--iterate through all sides
	for n = 1, #unit do																								--iterate through all units
		if aircraft_availability[unit[n].name] and aircraft_availability[unit[n].name].unavailable then
			for u = 1, unit[n].roster.ready - #aircraft_availability[unit[n].name].unavailable do					--for all ready aircraft that are not assigned to the ATO			
				table.insert(aircraft_availability[unit[n].name].unavailable, 0)									--insert a zero unavilable entry
			end
		end
	end
end


if Debug.Generator.affiche then	
	
	local camp_str = "ATO = " .. TableSerialization(ATO, 0)						--make a string
	local campFile = io.open("Debug/ATO_ATO_Generator.lua", "w")										--open targetlist file
	campFile:write(camp_str)																		--save new data
	campFile:close()

	local camp_str = "camp = " .. TableSerialization(camp, 0)						--make a string
	local campFile = io.open("Debug/camp_ATO_Generator.lua", "w")										--open targetlist file
	campFile:write(camp_str)																		--save new data
	campFile:close()
end