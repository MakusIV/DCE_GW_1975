-- No more destroying targets below 20% (default) or any other value decided in targetlist neutralization
-- Initiated by Debrief_Master.lua
------------------------------------------------------------------------------------------------------- 

-- Miguel Fichier Revision M26.
------------------------------------------------------------------------------------------------------- 
-- Miguel21 modification M26 : detruit les targets si inférieur à une certaine valeur --destroys targets if below a certain value
-- ------------------------------------------------------------------------------------------------------- 
-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = LOGGING_LEVEL
log.outfile = LOG_DIR .. "LOG_DC_DestroyTarget." .. camp.mission .. ".log" 
local local_debug = true -- local debug   
log.debug("Start")
-- =====================  End Marco implementation ==================================


local function setDead(group_object, group_type)
	log.debug("Start function setDead(group_object, group_type)")	

	for group_n,group in pairs(group_object) do								--groups table (number array)		

		if group.name == Target_Name or group.name == TargetPNamethen then			
			log.trace("group.name (" .. group.name .. ") == Target_Name (" .. Target_Name .. ") or TargetPName (" .. TargetPName .. ")")

			for unit_n,unit in pairs(group.units) do									--units table (number array)
				log.trace("unit.name: " .. unit.name .. ", setting true for unit.dead and unit.dead_last")

				if Debug.AfficheSol then
					 print("DC_DT Kill "..unit.name) 
				end
				
				if group_type == "vehicle" then
					unit.dead = true														--mark unit as dead in oob_ground
					unit.dead_last = true													--mark unit as died in last mission
					-- unit.CheckDay = camp.day  

				elseif group_type == "static" and unit.dead ~= true then											--unit is not yet dead (some static objects that are spawned in a destroyed state are logged dead at mission start, these must be excluded here)					
						unit.dead = true												--mark unit as dead in oob_ground (this is for the targetlist)
						unit.dead_last = true
						group.dead = true												--mark group as dead in oob_ground (static objects can be set as group.dead and spawned in a destroyed state)
						group.hidden = true												--hide dead static object				
					
				elseif group_type == "ship" then 
					unit.dead = true													--mark unit as dead in oob_ground
					unit.dead_last = true												--mark unit as died in last mission
					unit.CheckDay = camp.day                            				-- ajoute la date de destruction    Miguel21 modification M19 : Repair SAM   			
				
				else			
					log.warning("group_type is an unknow type")
					
					if group_type then
						log.warning("group_type: " ..  group_type )
					end
				end
			end
		end
		log.debug("End function setDead(group_object, group_type)")	
	end
end

function KillTarget(Target_Name, TargetPName)
	log.debug("Start function KillTarget(Target_Name, TargetPName)")	

	-- set dead, dead_last true for vehicle, static and ship items in oob_ground
	log.debug("set dead, dead_last true for vehicle, static and ship items in oob_ground. Start iteration in oob_ground")
	for side_name,side in pairs(oob_ground) do														--side table(red/blue)											

		for country_n,country in pairs(side) do														--country table (number array)

			if country.vehicle then																	--if country has vehicles				
				log.trace("country has vehicle")
				setDead(country.vehicle.group, "vehicle")

				--[[for group_n,group in pairs(country.vehicle.group) do								--groups table (number array)

					if group.name == Target_Name or group.name == TargetPName then
						log.trace("group.name (" .. group.name .. ") == Target_Name (" .. Target_Name .. ") or TargetPName (" .. TargetPName .. ")")

						for unit_n,unit in pairs(group.units) do										--units table (number array)					
							log.trace("unit.name: " .. unit.name .. ", settiing true for unit.dead and unit.dead_last")
							
							if Debug.AfficheSol then
								print("DC_DT Kill "..unit.name)
							end
						
							unit.dead = true														--mark unit as dead in oob_ground
							unit.dead_last = true													--mark unit as died in last mission
							-- unit.CheckDay = camp.day  
						end
					end
				end]]
			end

			if country.static then																--if country has static objects	
				log.trace("country has static object")
				setDead(country.static.group, "static")

				--[[for group_n,group in pairs(country.static.group) do								--groups table (number array)

					if group.name == Target_Name or group.name == TargetPNamethen then

						for unit_n,unit in pairs(group.units) do									--units table (number array)

							if Debug.AfficheSol then
								 print("DC_DT Kill "..unit.name) 
							end
							
							if unit.dead ~= true then											--unit is not yet dead (some static objects that are spawned in a destroyed state are logged dead at mission start, these must be excluded here)
								group.dead = true												--mark group as dead in oob_ground (static objects can be set as group.dead and spawned in a destroyed state)
								group.hidden = true												--hide dead static object
								unit.dead = true												--mark unit as dead in oob_ground (this is for the targetlist)
								unit.dead_last = true
							end
						end
					end
				end]]
			end

			if country.ship then																--if country has ships
				log.trace("country has ships")
				setDead(country.ship.group, "ship")

				--[[for group_n,group in pairs(country.ship.group) do								--groups table (number array)

					if group.name == Target_Name or group.name == TargetPName then	

						for unit_n,unit in pairs(group.units) do									--units table (number array)	

							if Debug.AfficheSol then print("DC_DT Kill "..unit.name) end
							
							unit.dead = true													--mark unit as dead in oob_ground
							unit.dead_last = true	
																		--mark unit as died in last mission
							unit.CheckDay = camp.day                            -- ajoute la date de destruction    Miguel21 modification M19 : Repair SAM   
						end
					end
				end]]
			end
		end
	end
	
	-- set dead, dead_last true for vehicle, static and ship items in targetlist
	log.debug("set dead, dead_last true for vehicle, static and ship items in targetlist. Start iteration in targetlist")
	for side_name,side in pairs(targetlist) do											--iterate through targetlist

		for target_name,target in pairs(side) do										--iterate through targets

			if target_name == Target_Name or target_name == TargetPName then	
				log.trace("target_name (" .. target_name .. ") == Target_Name (" .. Target_Name .. ") or TargetPName (" .. TargetPName .. ")")

				if target.elements and target.elements[1].x then 						--if the target has subelements and is a scenery object target (element has x coordinate)

					for element_n,element in pairs(target.elements) do					--iterate through target elements

						if element.dead then											--element was already dead previously
							element.dead_last = false									--mark element as not died in last mission
							log.trace("element_n: " .. element_n .. ", element.dead == true set element.dead_last = false")
						else

							if Debug.AfficheSol then 
								print("DC_DT Kill __SCENERY__ "..element.name) 
							end
							element.dead = true	
							log.trace("element_n: " .. element_n .. ", element.dead == false set element.dead = true")
						end
					end
				end
			end
		end
	end
	log.debug("End function KillTarget(Target_Name, TargetPName)")		
end
-- ============================================================					
-- Last point for coding logger functionality by Old_Boy ------		
-- ============================================================		