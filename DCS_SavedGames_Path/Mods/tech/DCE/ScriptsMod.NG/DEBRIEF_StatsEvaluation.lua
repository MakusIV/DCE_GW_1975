--To evaluate the DCS debrief.log and update the campaign status files
--Initiated by DEBRIEF_Master.lua
-------------------------------------------------------------------------------------------------------
-- Miguel Fichier Revision  M19.f
------------------------------------------------------------------------------------------------------- 
-- Miguel21 modification M19.f : Repair SAM

-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = LOGGING_LEVEL
log.outfile = LOG_DIR .. "LOG_DEBRIEF_StatEvalutation." .. camp.mission .. ".txt.lua" -- "prova Log.LOG_DEVRIEF_Master"
local local_debug = true -- local debug   
log.debug("Start")
-- =====================  End Marco implementation ==================================

-- ================== Local Function ================================================


--function to add new clients to clientstats
local function AddClient(name)
	log.debug(" - Start AddClient(" .. name .. ")")														
	if clientstats[name] == nil then	
		log.trace(" - AddClient(" .. name .. "): client has no previous stats entry, create a new clientstats table")															--if client has no previous stats entry, create a new one
		clientstats[name] = {
			kills_air = 0,
			kills_ground = 0,
			kills_ship = 0,
			mission = 0,
			crash = 0,
			eject = 0,
			dead = 0,
			score_last = {
				kills_air = 0,
				kills_ground = 0,
				kills_ship = 0,
				mission = 0,
				crash = 0,
				eject = 0,
				dead = 0
			}
		}
	end
	log.debug(" - End AddClient(" .. name .. ")")														
end


--function to check if a kill loss is attributed to the player package
local function AddPackstats(unitname, event)
	log.debug(" - Start AddPackstats(" .. unitname .. ", " .. event .. "): check if a loss is attributed to the player package")														
	
	if packstats[unitname] then
		log.trace("unitname is in packstats, increments packstats[" .. unitname .. "].".. event)																																	--aircraft was part of the package
		if event == "kill_air" then
			packstats[unitname].kills_air = packstats[unitname].kills_air + 1
		elseif event == "kill_ground" then
			packstats[unitname].kills_ground = packstats[unitname].kills_ground + 1
		elseif event == "kill_ship" then
			packstats[unitname].kills_ship = packstats[unitname].kills_ship + 1
		elseif event == "lost" then
			packstats[unitname].lost = packstats[unitname].lost + 1
		end	
	end
	log.debug(" - End AddPackstats(" .. unitname .. ", " .. event .. ")")														
end

-- ==================================================================================




--reset oob_air table last mission stats -----------------------------------------
log.info("Reset oob_air table units last mission stats: kills, lost, damaged and ready")

for side_name,side in pairs(oob_air) do														--iterate through all sides
	log.trace("Start reset unit.score_last: ".. side_name .. "   =======================================================")														
	
	for unit_n,unit in pairs(side) do--iterate through all air units
		log.trace("Reset unit.score_last: ".. side_name .. ", unit_n: " .. unit_n .. " - name: " .. unit.name .. " - type: " .. unit.type .. " - number(qty), lost, damaged, ready: " .. unit.number .. ", " .. unit.roster.lost .. ", " .. unit.roster.damaged .. ", " .. unit.roster.ready)	--iterate through all air units
		unit.score_last = {
			kills_air = 0,
			kills_ground = 0,
			kills_ship = 0,
			lost = 0,
			damaged = 0,
			ready = 0
		}
	end
	log.trace("End reset unit.score_last: ".. side_name .. "   =======================================================")														
end

--reset oob_ground table last mission stats ----------------------------------------
log.info("Reset oob_ground table last mission stat: dead state = false")

for side_name,side in pairs(oob_ground) do --side table(red/blue)											

	for country_n,country in pairs(side) do	--country table (number array)

		if country.vehicle then	--if country has vehicles

			for group_n,group in pairs(country.vehicle.group) do --groups table (number array)
				log.trace("Start reset veihcle unit.dead_last: ".. side_name .. ", country: " .. country.name .. ", group: ".. group.name .. " - id: " .. group.groupId .. " - name: " .. group.name .. "   =======================================================")														

				for unit_n,unit in pairs(group.units) do --units table (number array)	
					log.trace("Reset veihcle unit.dead_last: unit_n: " ..unit_n ..  "-id: " .. unit.unitId .. "-name: " .. unit.name .. "-type: " .. unit.type)														
					unit.dead_last = false --reset unit died in last mission
				end
				log.trace("End reset veihcle unit.dead_last   =======================================================")														
			end			
		end

		if country.static then --if country has static objects

			for group_n,group in pairs(country.static.group) do --groups table (number array)
                log.trace("Start reset static unit.dead_last: ".. side_name .. ", country: " .. country.name .. ", group: ".. group.name .. " - id: " .. group.groupId .. " - name: " .. group.name .. "   =======================================================")														

				for unit_n,unit in pairs(group.units) do --units table (number array)						
					log.trace("Reset static unit.dead_last: unit_n: " ..unit_n ..  "-id: " .. unit.unitId .. "-name: " .. unit.name .. "-type: " .. unit.type)														
					unit.dead_last = false --reset unit died in last mission
				end
				log.trace("End reset static unit.dead_last   =======================================================")														
			end			
		end
		
		if country.ship then																--if country has ships
			
			for group_n,group in pairs(country.ship.group) do								--groups table (number array)
				log.trace("Start reset ship unit.dead_last: ".. side_name .. ", country: " .. country.name .. ", group: ".. group.name .. " - id: " .. group.groupId .. " - name: " .. group.name .. "   =======================================================")														

				for unit_n,unit in pairs(group.units) do									--units table (number array)	
					log.trace("Reset ship unit.dead_last:  unit_n: " ..unit_n ..  "-id: " .. unit.unitId .. "-name: " .. unit.name .. "-type: " .. unit.type)										
					unit.dead_last = false													--reset unit died in last mission
				end
				log.trace("End reset ship unit.dead_last   =======================================================")														
			end			
		end
	end
end

--reset elements in targetlist table
log.info("Reset targetlist element state: dead state = false")

for side_name,side in pairs(targetlist) do	--iterate through targetlist
	
	for target_name,target in pairs(side) do --iterate through targets		
		
		if target.elements and target.elements[1].x then --if the target has subelements and is a scenery object target (element has x coordinate)
			log.trace("Start reset targetlist element.dead_last: ".. side_name .. ", target: " .. target_name .. "   =======================================================")														
			
			for element_n,element in pairs(target.elements) do								--iterate through target elements
				log.trace("Reset element.dead_last: element_n: " .. element_n .. " - element: " .. element.name)														
				element.dead_last = false													--reset element died in last mission
			end
			log.trace("End reset targetlist element.dead_last   =======================================================")																	
		end
	end
end


--reset client last mission stats
log.info("Reset score_last in clientstats table (kills, mission, crash, eject and dead)   =======================================================")														

for client_name, client in pairs(clientstats) do
	log.trace("Actual score for " .. client_name .. ", mission: " .. client.mission .. ", kills air-ground-ship, mission, eject, crash, dead: " .. client.kills_air .. ", " .. client.kills_ground .. ", " .. client.kills_ship .. ", " .. client.eject .. ", " .. client.crash .. ", " .. client.dead)														
	log.trace("Reset score_last for " .. client_name .. ", mission: " .. client.mission .. ", score_last(kills air-ground-ship, mission, eject, crash, dead: " .. client.score_last.kills_air .. ", " .. client.score_last.kills_ground .. ", " .. client.score_last.kills_ship .. ", " .. client.score_last.mission .. ", " .. client.score_last.eject .. ", " .. client.score_last.crash .. ", " .. client.score_last.dead)														
	client.score_last = {
		kills_air = 0,
		kills_ground = 0,
		kills_ship = 0,
		mission = 0,
		crash = 0,
		eject = 0,
		dead = 0
	}
end
log.info("End reset clientstats")	

local client_control = {} --local table to store which client controls which unit
local hit_table = {} --local table to store who was the last hitter to hit a unit
local health_table = {}	--local table to store health of a hit unit
local client_hit_table = {} --local table to store if a client has hit a unit
log.trace("Created local client_control table: to store which client controls which unit")	
log.trace("Created hit_table: to store who was the last hitter to hit a unit")	
log.trace("Created local client_hit_table: table to store if a client has hit a unit")	


--track stats for player package
log.info("Start track stats for player package =======================================================")														
packstats = {}

for role_name, role in pairs(camp.player.pack) do	--iterate through roles in player package

	for flight_n, flight in pairs(role) do 			--iterate through flights

		for n = 1, flight.number do
			local unitname = "Pack " .. camp.player.pack_n .. " - " .. flight.name .. " - " .. flight.task .. " " .. flight_n .. "-" .. n
			log.trace(" create packstats for unitname: " .. unitname)																				
			packstats[unitname] = {
				kills_air = 0,
				kills_ground = 0,
				kills_ship = 0,
				lost = 0,
				friendly_kills_air = 0,
			}
		end
	end
end
log.info("End track stats for player package =======================================================")														


--prepare client stats
log.info("Start prepare client stats =======================================================")														

for e = 1, #events do																					--iterate through all events
	if events[e].initiatorPilotName then		--event is by a client
		AddClient(events[e].initiatorPilotName) --check if exist clientstats table if not create one new
		client_control[events[e].initiator] = events[e].initiatorPilotName --store which unit name (initiator) is controlled by client (initiatorPilotName)
		log.trace("Event: " .. events[e].type .. " is by a client player: " .. events[e].initiatorPilotName .. ", store which unit name (initiator) is controlled by cliend (initiatorPilotName):" )
		log.trace("client_control[" .. events[e].initiator .. "] = " .. events[e].initiatorPilotName)
	end
end
log.info("End prepare client stats =======================================================")														

--evaluate log events
log.info("Start evaluate log events =====================================================")														

for e = 1, #events do	
	--review all events for stats updates
	if events[e].type == "hit" then																		--hit events		
		hit_table[events[e].target] = events[e].initiator												--store who hits a target (subsequent hits overwrite previous hits)
		health_table[events[e].target] = events[e].health												--store health of the target
		client_hit_table[events[e].target] = client_control[events[e].initiator]						--store client name that has hit a unit (stores nil  if hitter is not a client)				
		log.trace("event["..e.."] = hit, store hit in tables - events[e].target: " .. events[e].target)																
		
		if hit_table[events[e].target] then
			log.trace("hit_table[" .. events[e].target .."] = " .. hit_table[events[e].target])																
		end	

		if health_table[events[e].target] then
			log.trace("health_table[" .. events[e].target .."] = " .. health_table[events[e].target])																
		end	

		if client_hit_table[events[e].target] then
			log.info("client (player) had an event hit: hit this target: " .. events[e].target)
			log.trace("client_hit_table[" .. events[e].target .."] = " .. client_hit_table[events[e].target])																
		end	
		
		
	elseif events[e].type == "crash" then
		log.trace("event["..e.."] = crash. Iterated oob_air for search initiator air unit in oob_air for storing stats")																
		--oob loss update for crashed aircraft
		local crash_side																				--local variable to store the side of the crashed aircraft
		
		for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
			
			for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
				
				if string.find(events[e].initiator, " " .. killer_unit.name .. " ", 1, true) then		--if the crashed aircraft name is part of air unit name
					log.info("found event.initiator in oob_air - event.initiator included in killer_unit.name (".. events[e].initiator .. ", " .. killer_unit.name)	
					crash_side = killer_side_name														--store side of the crashed aircraft
					killer_unit.roster.lost = killer_unit.roster.lost + 1								--increase loss counter of air unit
					killer_unit.score_last.lost = killer_unit.score_last.lost + 1						--increase loss counter for this mission of air unit
					
					if killer_unit.roster.ready > 0 then 
						killer_unit.roster.ready = killer_unit.roster.ready - 1								--decrease number of ready aircraft of air unit
					end

					if killer_unit.score_last.ready > 0 then 
						killer_unit.score_last.ready = killer_unit.score_last.ready - 1 --era +1 errore?    --decrease number of ready aircraft for this mission of air unit
					end
					log.trace("event["..e.."].initiator = oob_air killer_unit.name = " .. killer_unit.name .. "increments killer_unit.roster.lost and killer_unit.score_last.lost (" .. killer_unit.roster.lost .. ", " .. killer_unit.score_last.lost .. ") - decrease killer_unit.roster.ready and killer_unit.score_last.ready (" .. killer_unit.roster.ready .. ", " ..  killer_unit.score_last.ready .. ")")
					AddPackstats(events[e].initiator, "lost")											--check if loss was in player package					
			
					--client stats for crashes
					if client_control[events[e].initiator] then --if crashed aircraft is a client
						log.info("client (player) had an event crash")											
						clientstats[client_control[events[e].initiator]].crash = clientstats[client_control[events[e].initiator]].crash + 1	--store crash for client
						clientstats[client_control[events[e].initiator]].score_last.crash =  1			--store crash for client
						log.trace("update crash in clientstats: clientstats[" .. client_control[events[e].initiator] .. "].crash = " .. clientstats[client_control[events[e].initiator]].crash .. ", clientstats[" .. client_control[events[e].initiator]"].score_last.crash = " .. clientstats[client_control[events[e].initiator]].score_last.crash)
					end
					log.trace("crashed aircraft name is part of air unit name -> break from looping unit")		
					break -- exit from the loop because the crashed aircraft name is part of air unit name. No more store stats for other unit??
				end
			end
		end
		
		log.debug("iterate oob_air for kill update for crashed aircraft (if crashed aircraft have kill")																
		--oob kill update for crashed aircraft
		-- nota Old_Boy: questa iterazione è già presente sopra (255). Valutare se possibil inserire
		-- il codice interno nelle iterazioni suddette.
		for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
			
			for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
				
				if hit_table[events[e].initiator] ~= nil then											--check if the crashed aircraft has a hit entry
					log.trace("crashed air unit have hit in hit_table - hit_table[" .. events[e].initiator .. "] = " .. hit_table[events[e].initiator])
					
					if string.find(hit_table[events[e].initiator], " " .. killer_unit.name .. " ", 1, true) then			--if the hitting unit is part of air unit name
						log.trace("hitting unit is part of crashed air unit - hit_table[" .. events[e].initiator .. "] == " .. killer_unit.name)
						
						if crash_side ~= killer_side_name then --make sure that hitting unit and crashed aircraft are not on same side (friendly fire is not awarded as kill)
							log.debug("hitting unit have different side of the crashed air unit - crash_side: " .. crash_side .. " ~= killer_side_name: " .. killer_side_name)
							killer_unit.score.kills_air = killer_unit.score.kills_air + 1				--award air kill to air unit
							killer_unit.score_last.kills_air = killer_unit.score_last.kills_air + 1		--increase kill counter for this mission of air unit						
							log.trace("store stats for killer unit - killer_unit.name = " .. killer_unit.name .. "update killer_unit.score.kills_air and killer_unit.score_last.kills_air (" .. killer_unit.score.kills_air .. ", " .. killer_unit.score_last.kills_air .. ") - decrease killer_unit.roster.ready and killer_unit.score_last.ready (" .. killer_unit.roster.ready .. ", " ..  killer_unit.score_last.ready .. ")")
							AddPackstats(hit_table[events[e].initiator], "kill_air")					--check if kill was in player package							
							
							--client stats for kills
							if client_hit_table[events[e].initiator] then								--if crashed aircraft was hit by a client
								log.info("crashed aircraft was hit by a client (player)")											
								clientstats[client_hit_table[events[e].initiator]].kills_air = clientstats[client_hit_table[events[e].initiator]].kills_air + 1	--award air kill to client.
								clientstats[client_hit_table[events[e].initiator]].score_last.kills_air = clientstats[client_hit_table[events[e].initiator]].score_last.kills_air + 1
								log.trace("store hit in clientstats: clientstats[" .. client_hit_table[events[e].initiator] .. "].kills_air = " .. clientstats[client_hit_table[events[e].initiator]].kills_air .. ", clientstats[" .. client_hit_table[events[e].initiator]"].score_last.kills_air = " .. clientstats[client_control[events[e].initiator]].score_last.kills_air)
							end
							break
						
						elseif client_hit_table[events[e].initiator] then --client's friendly air kill								--if crashed aircraft was hit by a client
							-- implements new stats
							log.debug("crashed aircraft was hit by a client (player) and have both same side - crash_side: " .. crash_side .. " ~= killer_side_name: " .. killer_side_name)
							clientstats[client_hit_table[events[e].initiator]].friendly_kills_air = clientstats[client_hit_table[events[e].initiator]].friendly_kills_air + 1	--award air kill to client
							clientstats[client_hit_table[events[e].initiator]].score_last.friendly_kills_air = clientstats[client_hit_table[events[e].initiator]].score_last.friendly_kills_air + 1						 
							log.trace("store hit in clientstats: clientstats[" .. client_hit_table[events[e].initiator] .. "].friendly_kills_air = " .. clientstats[client_hit_table[events[e].initiator]].friendly_kills_air .. ", clientstats[" .. client_hit_table[events[e].initiator]"].score_last.friendly_kills_air = " .. clientstats[client_control[events[e].initiator]].score_last.friendly_kills_air)
						end
					end
				end
			end
		end		
		hit_table[events[e].initiator] = nil															--once kills for the dead aircraft are awarded, remove it from the hit_table. The aircraft remaining in the hit_table after completed log evaluation are only damaged.
		log.debug("once kills for the dead aircraft are awarded, remove it from the hit_table. The aircraft remaining in the hit_table after completed log evaluation are only damaged - hit_table[" .. events[e].initiator .. "] = nil")
			
	elseif events[e].type == "eject" then
		--client stats for ejections
		if client_control[events[e].initiator] then														--if ejected pilot is a client
			log.info("client (player) had an event eject")	
			clientstats[client_control[events[e].initiator]].eject = clientstats[client_control[events[e].initiator]].eject + 1	--store ejection for client
			clientstats[client_control[events[e].initiator]].score_last.eject =  1						--store eject for client
			log.trace("update eject in clientstats: clientstats[" .. client_control[events[e].initiator] .. "].eject = " .. clientstats[client_control[events[e].initiator]].eject .. ", clientstats[" .. client_control[events[e].initiator]"].score_last.eject = " .. clientstats[client_control[events[e].initiator]].score_last.eject)
		end
		
	elseif events[e].type == "pilot dead" then
		--client stats for dead pilots
		if client_control[events[e].initiator] then																	--if dead pilot is a client
			log.info("client (player) had an event pilot dead")	
			clientstats[client_control[events[e].initiator]].dead = clientstats[client_control[events[e].initiator]].dead + 1	--store death for client
			clientstats[client_control[events[e].initiator]].score_last.dead =  1						--store dead pilot for client
			log.trace("update eject in clientstats: clientstats[" .. client_control[events[e].initiator] .. "].dead = " .. clientstats[client_control[events[e].initiator]].dead .. ", clientstats[" .. client_control[events[e].initiator]"].score_last.score_last.dead = " .. clientstats[client_control[events[e].initiator]].score_last.dead)
		end
		
	elseif events[e].type == "takeoff" then
		--client stats for flown missions
		if client_control[events[e].initiator] then														--if take off is by a client
			log.info("client (player) had an event takeoff")	
			
			if clientstats[client_control[events[e].initiator]].score_last.mission == 0 then			--client has no take off logged yet for this mission
				clientstats[client_control[events[e].initiator]].mission = clientstats[client_control[events[e].initiator]].mission + 1	--increase flown mission number
				clientstats[client_control[events[e].initiator]].score_last.mission = 1					--store mission for client
				log.trace("if first takeoff, update mission in clientstats: clientstats[" .. client_control[events[e].initiator] .. "].mission = " .. clientstats[client_control[events[e].initiator]].mission .. ", clientstats[" .. client_control[events[e].initiator]"].score_last.score_last.dead = " .. clientstats[client_control[events[e].initiator]].score_last.mission)
			end
		end
		
	elseif events[e].type == "dead" then
		--ground/naval/static loss events																--iterate through all the sub-tables of the oob_ground files and try to find the matching unitId of the dead unit (vehicle/ship/static)
		for side_name,side in pairs(oob_ground) do														--side table(red/blue)											
			for country_n,country in pairs(side) do														--country table (number array)
				if country.vehicle then																	--if country has vehicles
					for group_n,group in pairs(country.vehicle.group) do								--groups table (number array)
						for unit_n,unit in pairs(group.units) do										--units table (number array)					
							if unit.unitId == tonumber(events[e].initiatorMissionID) then				--check if unitId matches initiatorMissionID (string, needs to be converted to number)
								unit.dead = true														--mark unit as dead in oob_ground
								unit.dead_last = true													--mark unit as died in last mission
								unit.CheckDay = camp.day                            -- ajoute la date de destruction		 Miguel21 modification M19 : Repair SAM	
								
								--award ground kill to air unit
								if hit_table[events[e].initiator] ~= nil then														--check if dead vehicle has a hit entry
									for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
										for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
											if string.find(hit_table[events[e].initiator], " " .. killer_unit.name .. " ", 1, true) then	--if the hitting unit is part of air unit name
												if side_name ~= killer_side_name then												--make sure that hitting unit is not on same side as dead unit (friendly fire gives no kills)
													killer_unit.score.kills_ground = killer_unit.score.kills_ground + 1				--award ground kill to air unit
													killer_unit.score_last.kills_ground = killer_unit.score_last.kills_ground + 1
													AddPackstats(hit_table[events[e].initiator], "kill_ground")						--check if kill was in player package
													
													--award ground kill to client
													if client_hit_table[events[e].initiator] then									--if dead vehicle was hit by a client
														clientstats[client_hit_table[events[e].initiator]].kills_ground = clientstats[client_hit_table[events[e].initiator]].kills_ground + 1							--award gound kill to client
														clientstats[client_hit_table[events[e].initiator]].score_last.kills_ground = clientstats[client_hit_table[events[e].initiator]].score_last.kills_ground + 1		--award ground kill to client
													end
												end
												break
											end
										end
									end
									hit_table[events[e].initiator] = nil							--after kills are assigned, remove hit unit from hit_table
								end
								break
							end
						end
					end
				end
				if country.ship then																--if country has ships
					for group_n,group in pairs(country.ship.group) do								--groups table (number array)
						for unit_n,unit in pairs(group.units) do									--units table (number array)
							if unit.unitId == tonumber(events[e].initiatorMissionID) then			--check if unitId matches initiatorMissionID (string, needs to be converted to number)
								unit.dead = true													--mark unit as dead in oob_ground
								unit.dead_last = true												--mark unit as died in last mission
								unit.CheckDay = camp.day                            -- ajoute la date de destruction		 Miguel21 modification M19 : Repair SAM	
								camp.ShipHealth[unit.name] = 0										--mark unit has 0 health for briefing/debriefing
								camp.ShipDamagedLast[unit.name] = true								--mark ship took damage in last mission for briefing/debriefing
								
								--award ship kill to air unit
								if hit_table[events[e].initiator] ~= nil then														--check if dead ship has a hit entry
									for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
										for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
											if string.find(hit_table[events[e].initiator], " " .. killer_unit.name .. " ", 1, true) then	--if the hitting unit is part of air unit name
												if side_name ~= killer_side_name then												--make sure that hitting unit is not on same side as dead unit (friendly fire gives no kills)
													killer_unit.score.kills_ship = killer_unit.score.kills_ship + 1					--award ship kill to air unit
													killer_unit.score_last.kills_ship = killer_unit.score_last.kills_ship + 1
													AddPackstats(hit_table[events[e].initiator], "kill_ship")						--check if kill was in player package
													
													--award ship kill to client
													if client_hit_table[events[e].initiator] then									--if dead ship was hit by a client
														clientstats[client_hit_table[events[e].initiator]].kills_ship = clientstats[client_hit_table[events[e].initiator]].kills_ship + 1							--award ship kill to client
														clientstats[client_hit_table[events[e].initiator]].score_last.kills_ship = clientstats[client_hit_table[events[e].initiator]].score_last.kills_ship + 1		--award ship kill to client
													end
												end
												break
											end
										end
									end
									hit_table[events[e].initiator] = nil							--after kills are assigned, remove hit unit from hit_table
								end
								break
							end
						end
					end
				end
				if country.static then																--if country has static objects
					for group_n,group in pairs(country.static.group) do								--groups table (number array)
						for unit_n,unit in pairs(group.units) do									--units table (number array)
							if unit.unitId == tonumber(events[e].initiatorMissionID) then			--check if unitId matches initiatorMissionID (string, needs to be converted to number)
								if unit.dead ~= true then											--unit is not yet dead (some static objects that are spawned in a destroyed state are logged dead at mission start, these must be excluded here)
									group.dead = true												--mark group as dead in oob_ground (static objects can be set as group.dead and spawned in a destroyed state)
									if group.linkOffset then										--static unit was linked to a carrier
										group.linkOffset = false									--unlink  dead static from carrier
										group.x = 2000000
										group.y = 2000000
										group.units[1].x = 2000000
										group.units[1].y = 2000000
										group.route.points[1].x = 2000000
										group.route.points[1].y = 2000000
									end
									group.hidden = true												--hide dead static object
									unit.dead = true												--mark unit as dead in oob_ground (this is for the targetlist)
									unit.dead_last = true											--mark unit as died in last mission
									unit.CheckDay = camp.day                            -- ajoute la date de destruction		 Miguel21 modification M19 : Repair SAM	
									
									--award ground kill to air unit
									if hit_table[events[e].initiator] ~= nil then														--check if dead static has a hit entry
										for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
											for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
												if string.find(hit_table[events[e].initiator], " " .. killer_unit.name .. " ", 1, true) then	--if the hitting unit is part of air unit name
													if side_name ~= killer_side_name then												--make sure that hitting unit is not on same side as dead unit (friendly fire gives no kills)
														killer_unit.score.kills_ground = killer_unit.score.kills_ground + 1				--award ground kill to air unit
														killer_unit.score_last.kills_ground = killer_unit.score_last.kills_ground + 1
														AddPackstats(hit_table[events[e].initiator], "kill_ground")						--check if kill was in player package
														
														--award ground kill to client
														if client_hit_table[events[e].initiator] then									--if dead static was hit by a client
															clientstats[client_hit_table[events[e].initiator]].kills_ground = clientstats[client_hit_table[events[e].initiator]].kills_ground + 1							--award ground kill to client
															clientstats[client_hit_table[events[e].initiator]].score_last.kills_ground = clientstats[client_hit_table[events[e].initiator]].score_last.kills_ground + 1		--award ground kill to client
														end
													end
													break
												end
											end
										end
										hit_table[events[e].initiator] = nil						--after kills are assigned, remove hit unit from hit_table
									end
									break
								end
							end
						end
					end
				end
			end
		end
	end
end
log.info("End evaluate log events =======================================================")														
	
log.info("Start evaluate log damaged aircraft in oob_air table ==========================")														
--log damaged aircraft in oob_air
for hit_unit,hitter in pairs(hit_table) do	--iterate through all remaining entries in the hit_table (all destroyed aircraft are removed meanwhile, damaged remain)
	
	for side_name,side in pairs(oob_air) do --iterate through all sides
		
		for unit_n,unit in pairs(side) do	--iterate through all air units
			
			if string.find(hit_unit, " " .. unit.name .. " ", 1, true) then					--if hit unit is part of air unit name
				log.info("found hit unit in oob_air - hit_unit included in unit.name of oob_air table(".. hit_unit .. ", " .. unit.name .. ")")	

				if health_table[hit_unit] and health_table[hit_unit] > 50 then				--if health of hit unit is bigger than 50%
					unit.roster.damaged = unit.roster.damaged + 1							--increase counter for damaged aircraft total
					unit.score_last.damaged = unit.score_last.damaged + 1					--increase counter for damaged aircraft in last mission
					log.trace("healt_table[" .. hit_unit .. "] = " .. health_table[hit_unit] .. " > 50 hit unit was damaged, store stats for hit unit - update unit.roster.damaged, unit.score_last.damaged (" .. unit.roster.damaged .. ", " .. unit.score_last.damaged)
				
				elseif health_table[hit_unit] then-- modified by Old_Boy																		--if health of hit unit is lower than 50%, the aircraft is written off
					unit.roster.lost = unit.roster.lost + 1									--increase counter for lost aircraft total
					unit.score_last.lost = unit.score_last.lost + 1							--increase counter for lost aircraft in last mission
					log.trace("healt_table[" .. hit_unit .. "] = " .. health_table[hit_unit] .. " <= 50, hit unit was destroyed store stats for hit unit - update unit.roster.lost, unit.score_last.lost (" .. unit.roster.lost .. ", " .. unit.score_last.lost .. ")")
										
					log.info("update oob ground kill for written off aircraft")	
					--oob ground kill update for written off aircraft
					for killer_side_name,killer_side in pairs(oob_air) do -- forse errore: oob_ground??	--iterate through all sides
						
						for killer_unit_n,killer_unit in pairs(killer_side) do --iterate through all air units
							
							if string.find(hitter, " " .. killer_unit.name .. " ", 1, true) then --if the hitter unit is part of air unit name
								log.info("found hit unit in oob_air - hit_unit included in unit.name of oob_air table (" .. hit_unit .. ", " .. killer_unit.name .. ")")	
								
								if side_name ~= killer_side_name then --make sure that killer unit and hit aircraft are not on same side (friendly fire is not awarded as kill)
									log.trace("hit unit have different side of oob_air unit - hit unit side, oob_air unit side: " .. side_name .. ", " .. killer_side_name)
									-- FORSE SONO GLI AEREI PARCHEGGIATI. FORSE ERRORE: QUESTE STATS DOVREBBERO ESSERE AIR_KILL E NON GROUND_KILL: ITERAZIONE SU OOB_AIR E VERIFICA DIFFERENTE SIDE PORTEBBERO INDICARE CHE L'ERRORE E' NELL'AGGIORNARE LE GORUND_STATS INVECE CHE LE AIR_STATS
									-- killer_unit.score.kills_ground = killer_unit.score.kills_ground + 1				--award ground kill to air unit
									-- killer_unit.score_last.kills_ground = killer_unit.score_last.kills_ground + 1	--increase kill counter for this mission of air unit
									killer_unit.score.kills_air = killer_unit.score.kills_air + 1				--award air kill to air unit
									killer_unit.score_last.kills_air = killer_unit.score_last.kills_air + 1	--increase air kill counter for this mission of air unit
									log.trace("store stats for oob_air unit (killer)- update killer_unit.score.kills_ground, unit.score_last.damaged (" .. killer_unit.score.kills_ground .. ", " .. killer_unit.score_last.kills_ground .. ")")
									log.trace("FORSE SONO GLI AEREI PARCHEGGIATI. ATTENZIONE FORSE ERRORE- VERIFICA hitter: " .. hitter .. ", killer_unit.name: " .. killer_unit.name .. ". Se non è una unit ground forse è presente un errore ")
									AddPackstats(hitter, "kill_ground")												--check if kill was in player package
									
									--client stats for kills
									if client_hit_table[hit_unit] then												--if hitter was a client
										log.info("hitter was a client (player): " .. client_hit_table[hit_unit] .. ", hit_unit: " .. hit_unit)
										clientstats[client_hit_table[hit_unit]].kills_ground = clientstats[client_hit_table[hit_unit]].kills_ground + 1								--award ground kill to client
										clientstats[client_hit_table[hit_unit]].score_last.kills_ground = clientstats[client_hit_table[hit_unit]].score_last.kills_ground + 1
										log.trace("store client ground stats - update clientstats[" .. client_hit_table[hit_unit] .. "].kills_ground: " .. clientstats[client_hit_table[hit_unit]].kills_ground .. ", clientstats[" .. client_hit_table[hit_unit] .. "].score_last.kills_ground: " .. clientstats[client_hit_table[hit_unit]].score_last.kills_ground)
									end
									break
								end
	 						end
						end
					end					
				end
				
				if unit.roster.ready > 0 then
					unit.roster.ready = unit.roster.ready - 1--decrease number of ready aircraft of air unit
				end

				if unit.score_last.ready > 0 then
					unit.score_last.ready = unit.score_last.ready - 1 -- MODIFIED BY Old_Boy --decrease number of ready aircraft for this mission of air unit
				end				
				log.trace("store stat for hit unit.name: " .. unit.name .. ", unit.roster.ready: " .. unit.roster.ready .. ", unit.score_last.ready(this mission): " .. unit.score_last.ready)
			end
		end
	end
end

-- ============================================================					
-- Last point for coding logger functionality by Old_Boy ------		
-- ============================================================		

--evaluate destroyed scenery objects
for scen_name,scen in pairs(scen_log) do													--iterate through destroyed scenery objects
	if scen.x and scen.z then																--scenery object has x and z coordinates
		for side_name,side in pairs(targetlist) do											--iterate through targetlist
			for target_name,target in pairs(side) do										--iterate through targets
				if target.elements and target.elements[1].x then							--if the target has subelements and is a scenery object target (element has x coordinate)
					for element_n,element in pairs(target.elements) do						--iterate through target elements
						if math.floor(scen.x) == math.floor(element.x) and math.floor(scen.z) == math.floor(element.y) then		--dead scenery is this element
							if element.dead then											--element was already dead previously
								element.dead_last = false									--mark element as not died in last mission
							else
								element.dead = true											--mark element as dead
								element.dead_last = true									--mark element as died in last mission
								element.CheckDay = camp.day									-- ajoute la date de destruction		 Miguel21 modification M19.f : Repair SAM	
								
								--award ground kill to air unit
								if scen.lasthit ~= nil then																			--check if dead scenery has a hit entry
									for killer_side_name,killer_side in pairs(oob_air) do											--iterate through all sides
										for killer_unit_n,killer_unit in pairs(killer_side) do										--iterate through all air units
											if string.find(scen.lasthit, " " .. killer_unit.name .. " ", 1, true) then				--if the hitting unit is part of air unit name
												if side_name == killer_side_name then												--make sure that hitting unit is hitting a target of his own side (friendly fire gives no kills)
													killer_unit.score.kills_ground = killer_unit.score.kills_ground + 1				--award ground kill to air unit
													killer_unit.score_last.kills_ground = killer_unit.score_last.kills_ground + 1
													AddPackstats(scen.lasthit, "kill_ground")										--check if kill was in player package
													
													--award ground kill to client
													if client_control[scen.lasthit] then											--if dead scenery was hit by a client
														clientstats[client_control[scen.lasthit]].kills_ground = clientstats[client_control[scen.lasthit]].kills_ground + 1							--award ground kill to client
														clientstats[client_control[scen.lasthit]].score_last.kills_ground = clientstats[client_control[scen.lasthit]].score_last.kills_ground + 1	--award ground kill to client
													end
												end
												break
											end
										end
									end
								end
								break
							end
						end
					end
				end
			end
		end
	end
end