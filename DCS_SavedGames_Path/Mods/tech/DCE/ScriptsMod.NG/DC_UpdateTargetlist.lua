--To update the targetlist (target position, alive precentage)
--Initiated by MAIN_NextMission.lua
------------------------------------------------------------------------------------------------------- 
-- Old_Boy revision OB1
-------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB1: implements logging code and little(very) optimization
-- Old_Boy rev. OB0: implements supply line sistems (logistics)
-- Miguel21 modification M38 : Debug Name of TargetList 
-- Miguel21 M26 destroys targets if below a certain value
-- Miguel21 modification M19.e : Repair GROUND

-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = "debug" --LOGGING_LEVEL (variabile globale)
log.outfile = LOG_DIR .. "LOG_DC_UpdateTargetlist." .. camp.mission .. ".log" 
local local_debug = true -- local debug   
log.debug("Start")
-- =====================  End Marco implementation ==================================


GroundTarget = {																				--count total and alive ground targets for each side
	["red"] = {
		total = 0,
		alive = 0,
	},
	["blue"] = {
		total = 0,
		alive = 0,
	},
}

-- Miguel21 modification M38 : Debug Name of TargetList 
local function checkBug(name, origine, category) -- check SPACE char anomaly in DCS name strings format

	if Debug.checkTargetName2Space then
		local i, j = string.find(name, "  ")
		if i then
			print("DC_UT "..origine.." "..category..", ATTENTION: Name whith Double Space: "..name)
		end
	end

	if Debug.checkTargetName then
		if string.sub(name, -1) == " " then print("DC_UT "..origine.." "..category..", ATTENTION: Name ending with a space|"..name.."|") end
		if string.sub(name, 1,1) == " " then print("DC_UT "..origine.." "..category..", ATTENTION: Name beginning with a space|"..name.."|") end
	end
end 

local function searchMasterCoord(country_group) -- search Master in oob_ground and returns his coordinate
	local nameFunction = "function searchMasterCoord(country_group): "    
    log.debug("Start " .. nameFunction)	
	log.debug(nameFunction .. "#country_group: " .. #country_group)	
	-- watch break instruction
	for group_n,group in ipairs(country_group) do					--go through groups
		log.trace(nameFunction .. "group.name: " .. group.name)

		if group.name == master then
			log.trace(nameFunction .. "group.name == master (" .. master .. "): copy coord x,y: " .. group.x .. ", " .. group.y .. " and breaks iteration")
			master_x = group.x
			master_y = group.y
			break -- breaks because master founds!?

		else
			log.trace(nameFunction .. "group.name != master (" .. master .. "): iterate in group.units")
			
			for unit_n,unit in ipairs(group.units) do
				log.trace(nameFunction .. "unit.name: " .. unit.name)				

				if unit.name == master then
					log.trace(nameFunction .. "unit.name == master (" .. master .. "): set master_x, master_y with unit x,y: " .. unit.x .. ", " .. unit.y .. " and breaks iteration")
					master_x = unit.x
					master_y = unit.y					
					break-- breaks because master founds!?
				end
			end
		end
	end
	log.debug("End " .. nameFunction .. "return master_x, master_y")	
	
	return master_x, master_y
end

local function evalBigBox(country_group) --evalutate greater box
	local nameFunction = "function evalBigBox(country_group): "    
	log.debug("Start " .. nameFunction)	
	-- watch the local box.min_x, box.max_x, box.min_y, box.max_y
	for group_n,group in ipairs(country_group) do				--go through groups
		log.trace(nameFunction .. "group.name: " .. group.name)

		if group.x < box.min_x then
			log.trace(nameFunction .. "group.x < box.min_x -> box.min_x = group.x = " .. group.x)
			box.min_x = group.x
		end

		if group.x  > box.max_x then
			log.trace(nameFunction .. "group.x > box.max_x -> box.max_x = group.x = " .. group.x)
			box.max_x = group.x
		end

		if group.y <box.min_y then
			log.trace(nameFunction .. "group.y < box.min_y -> box.min_y = group.y = " .. group.y)
			box.min_y = group.y
		end

		if group.y  > box.max_y then
			log.trace(nameFunction .. "group.y > box.max_y -> box.max_y = group.y = " .. group.y)
			box.max_y = group.y
		end

	end
	log.debug("End " .. nameFunction)
	return
end

local function sumAliveDeadPerc(unit, target, number) --summatory for media calculus 
	local nameFunction = "function sumAliveDeadPerc(unit, target, number): "    
	log.debug("Start " .. nameFunction)		
	local itemName
	local element

	if type(number) == 'number' and unit == nil and target ~= nil then		
		itemName = "target.element[" .. number .. "]"
		element = target.elements[number]
		log.trace(nameFunction .. "setting for target.element[" .. number .. "]")

	elseif unit ~= nil and target ~= nil and type(number) == "string" then
		itemName = "unit_n: " .. number .. ", unit.name: " .. unit.name  
		element = unit	
		log.trace(nameFunction .. "setting for unit")

	else
		log.warning(nameFunction .. "Anomaly! type(unit) = " .. type(unit) .. ", type(number) = " .. type(number) .. "type(target) = " .. type(target))
	end

	if element.dead then --target.elements[e].dead then									--Unit is dead
		log.trace(nameFunction .. itemName .. " is dead, Actual alive percentage = " .. target.alive)
		target.alive = target.alive - 100 / #target.elements		--reduce target alive percentage		
		log.trace(nameFunction .. "updated alive percentage = " .. target.alive)								
	end
	
	if element.dead_last then
		log.trace(nameFunction .. itemName .. " last mission is dead. Actual died percentage in last mission(.dead_last) = " .. target.dead_last)
		target.dead_last = target.dead_last + 100 / #target.elements	--add target died in last mission percentage
		log.trace(nameFunction .. "add died in last mission in died percentage in last mission = " .. target.dead_last)
	end
	log.debug("End " .. nameFunction)		

end

local function searchTargetInGroup(group, target) -- update group and targetlist statistic
	local nameFunction = "function searchTargetInGroup(group, target): "    
	log.debug("Start " .. nameFunction)		
	local break_loop = false

	if group.name == target.name then							--if the target is found in group table
		log.trace(nameFunction .. "target.name: " .. target.name .. " is found in group table")
		target.foundOobGround = true

		if group.probability and group.probability < 1 then		--if group probability of spawn is less than 100%
			log.trace(nameFunction .. "group probability of spawn is less than 100%")
			target.ATO = false									--remove target to ATO
		end
		log.trace(nameFunction .. "target: define dummy value for alive% and coordinate and Iterate all group's units")
		target.alive = 100										--Introduce percentage of alive target elements
		target.groupId = group.groupId							--store target group ID
		target.x = group.x										--add x coordinate of target
		target.y = group.y										--add y coordinate of target
		target.elements = {}									--add elements table
		target.dead_last = 0									--Introduce percentage of elements that died in last mission (for debriefing)
											
		for unit_n, unit in pairs(group.units) do				--Iterate through all units of group
			target.elements[unit_n] = {							--add new element
				name = unit.name,								--store unit name
				dead = unit.dead,								--store unit status
				dead_last = unit.dead_last,						--store unit dead_last
				CheckDay = unit.CheckDay						-- M19 ajoute la date destruction/ravito pour les futurs check de ravitaillement
			}
			log.trace(nameFunction .. "Create target.elements[" .. unit_n .."] for unit_n: " .. unit_n .. ", unit.name: " .. unit.name)
		end

		for unit_n, unit in pairs(group.units) do						--Iterate through all units of group
			sumAliveDeadPerc(unit, target, tostring(unit_n))
		end
		target.alive = math.floor(target.alive)
		target.dead_last = math.floor(target.dead_last)
		log.trace(nameFunction .. "media calculus: target.alive = " .. target.alive .. ",  target.dead_last = " .. target.dead_last)
		break_loop = true				
	end
	log.debug("End " .. nameFunction)
	return break_loop
end


-- box = {
	-- ["min_x"] = 9999999,
	-- ["min_y"] = 9999999,
	-- ["max_x"] = -9999999,
	-- ["max_y"] = -9999999,
-- }
box = {	--caucasus
	["min_x"] = -488954,
	["min_y"] = 199450,
	["max_x"] = 62058,
	["max_y"] = 942610,
 }

--box = {	--gulf
--	["min_x"] = -289090,
--	["min_y"] = -840909,
--	["max_x"] = 790909,
--	["max_y"] = 377272,
--}

-- ==== DEFINE BIGBOX ====

-- define a box (min_x, max_x, min_y, max_y) to include more greater ground group 
log.debug("define a box (min_x, max_x, min_y, max_y) to include more greater ground group. Actual box(" .. box.min_x .. ", " .. box.max_x .. ", " .. box.min_y .. ", " .. box.max_y .. ").  Iterate for oob_ground items")	

for coal_name,coal in pairs(oob_ground) do										--go through sides(red/blue)	
	
	for country_n,country in ipairs(coal) do									--go through countries
		log.trace("country: " .. country.name)

		if country.vehicle then													--country has vehicles
			log.trace("country: " .. country.name .. " has vehicle, evalutation box")
			evalBigBox(country.vehicle)			
		end
	
		if country.ship then													--country has ships
			log.trace("country: " .. country.name .. " has ship, evalutation box")
			evalBigBox(country.ship.group)
		end
	end
end
log.debug("updated box(" .. box.min_x .. ", " .. box.max_x .. ", " .. box.min_y .. ", " .. box.max_y .. ")")	

-- define a box (min_x, max_x, min_y, max_y) to include more greater base  
log.debug("define a box (min_x, max_x, min_y, max_y) to include more greater base. Actual box(" .. box.min_x .. ", " .. box.max_x .. ", " .. box.min_y .. ", " .. box.max_y .. ").  Iterate for db_airbase items")	

for base_name,base in pairs(db_airbases) do
	
	if base.x and base.x ~= 9999999999 then 
		log.trace("exist base.x: " .. base.x )

		if base.x < box.min_x then
			log.trace("base.x < box.min_x - > box.min_x = base.x" .. base.x)
			box.min_x = base.x
		end

		if base.x  > box.max_x then
			log.trace("base.x > box.max_x - > box.max_x = base.x" .. base.x)
			box.max_x = base.x
		end
	end
	
	if base.y and base.y ~= 9999999999 then 
		log.trace("exist base.y: " .. base.y)

		if base.y <box. min_y then
			log.trace("base.y < box.min_y - > box.min_y = base.y" .. base.y)
			box.min_y = base.y
		end

		if base.y  > box.max_y then
			log.trace("base.y > box.max_y - > box.max_y = base.y" .. base.y)
			box.max_y = base.y
		end
	end
end
log.debug("updated box(" .. box.min_x .. ", " .. box.max_x .. ", " .. box.min_y .. ", " .. box.max_y .. ")")	


--==== UPDATING TARGET COORDINATE AND CALCULATE TARGET STATISTICS====

-- _affiche(box, "DC_UT box")
log.info("Updating target coordinate. Iterate targetlist")	

for side_name, side in pairs(targetlist) do													--Iterate through all side
	
	for target_name, target in pairs(side) do												--Iterat through all targets		
		checkBug(target_name, "targetlist", "name")
		
		if target.name then 
			checkBug(target_name, "targetlist", "target.name")
		end
		
		target.ATO = true																	--add target to ATO boolean
		target.alive = nil																	--clear target alive value
			
		local targetside = "red"															--variable which side the target is on
		
		if side_name == "red" then
			targetside = "blue"
		end
		
		log.trace("target_name: " .. target_name)	
		
		-- target position by refpoint (string value or table of string quindi un'etichetta che probabilmente viene utilizzata come chiave in una tabella di coordinate)
		if target.refpoint then																--target coordinates are referenced by a refpoint
			log.trace("target has refpoints")
			
			if Refpoint then																--global Refpoint is not available when UpdateTargelist is called by DEBRIEF_Master. In this case updating the target coordinates can be ignored as this is not needed for debriefing.
				
				log.trace("global Refpoint is available. Updating coordinate")
				
				if type(target.refpoint) == "table" then									--multiple refpoints
					log.trace("multiple refpoints")
					target.MultiPoints = {}
					
					for n = 1, #target.refpoint do
						target.MultiPoints[n] = {}
						target.MultiPoints[n].x = Refpoint[target.refpoint[n]].x			--get x-coordinate
						target.MultiPoints[n].y = Refpoint[target.refpoint[n]].y			--get y-coordinate
						log.trace("target.MultiPoints[" .. n .. "].x = " .. target.MultiPoints[n].x .. ", target.MultiPoints[" .. n .. "].y = " .. target.MultiPoints[n].y)
					end
					target.x = target.MultiPoints[1].x										--for targets with multiple points use first point as target coordinates (proforma only, not needed for tasks with multiple points)
					target.y = target.MultiPoints[1].y
					log.debug("target x, y for target.Multipoints: " .. target.x .. ", " .. target.y)

				else
					log.trace("single refpoints. target.refpoint: " .. target.refpoint)											--only a single refpoint
					target.x = Refpoint[target.refpoint].x									--get x-coordinate
					target.y = Refpoint[target.refpoint].y									--get y-coordinate
					log.debug("target x, y for target single refpoints: " .. target.x .. ", " .. target.y)
				end

				if target.x == nil or target.y == nil then
					print("DC_UpdateTargetlist Error: Refpoint '" .. target.refpoint .. "' of target '" .. target.name .. "' not found!")
					log.error("DC_UpdateTargetlist Error: Refpoint '" .. target.refpoint .. "' of target '" .. target.name .. "' not found!")
				end
			end
			log.info("Global Refpoint is not available -> UpdateTargelist is called by DEBRIEF_Master")
		end

		--target position slaved to group/unit
		if target.slaved then																--target coordinates are slaved relative to a group/unit
			log.debug("target coordinates are slaved relative to a group/unit")
			local master = target.slaved[1]
			local bearing = target.slaved[2]
			local distance = target.slaved[3]
			log.trace("master: " .. tostring(master) .. ", bearing: " .. tostring(bearing) .. ", distance: " .. tostring(distance))
			local master_x
			local master_y
			
			
			log.debug("find either master group or units (vehicle or ship) and get master  x-y coordinates. Iterate in oob_ground")
			--find either master group or units (vehicle or ship) and get master  x-y coordinates
			for coal_name,coal in pairs(oob_ground) do										--go through sides(red/blue)	

				for country_n,country in ipairs(coal) do									--go through countries
					log.trace("country_n: " .. country_n .. ", country.name: " .. country.name)

					if country.vehicle then													--country has vehicles
						log.trace("country_n: " .. country_n .. ", country.name: " .. country.name .. " has vehicle, update master coordinate")
						master_x, master_y = searchMasterCoord(country.vehicle)						
					end
				
					if country.ship then													--country has ships
						log.debug("country_n: " .. country_n .. ", country.name: " .. country.name .. " has ship, update master coordinate")
						master_x, master_y = searchMasterCoord(country.ship)											
					end
				end
			end
			
			if master_x and master_y then													--a master was found				
				target.x = master_x + math.cos(math.rad(bearing)) * distance				--update target position relative to master position
				target.y = master_y + math.sin(math.rad(bearing)) * distance				--update target position relative to master position
				log.debug("master_x: " .. master_x .. ", master_y: " .. master_y .. " -> master was updated. Update target position relative to master position, target.x = " .. target.x .. ", target.y = " .. target.y )				

			else																			--no master was found
				print("DC_UpdateTargetlist Error target position slaved to group/unit : Master '" .. master .. "' of target '" ..  "' not found!")
				log.error("DC_UpdateTargetlist Error target position slaved to group/unit : Master '" .. master .. "' of target '" ..  "' not found!")
			end
		end
	
		if target.task == "Strike" then														
			log.debug("target.task == Strike . Evalutate new target coordinate from media calculus of coordinate live elements")

			if target.class == nil then														--For scenery object targets
				log.trace("scenery object targets, define dummy value for calculus alive% and coordinate")
				target.alive = 100															--Introduce percentage of alive target elements
				target.x = 0																--Introduce x coordinate for target
				target.y = 0																--Introduce y coordinate for target
				target.dead_last = 0														--Introduce percentage of elements that died in last mission (for debriefing)
				
				-- evalutate new target coordinate from media calculus of coordinate live elements
				for e = 1, #target.elements do												--Iterate through elements of target
					target.x = target.x + target.elements[e].x								--Sum x coordinates of all elements (for calculate media)
					target.y = target.y + target.elements[e].y								--Sum y coordinates of all elements (for calculate media)
					log.trace("sum coordinate for media calculus: target.element[" .. e .. "] - sum.target.x = " .. target.x .. ", sum.target.y = " .. target.y .. ". Update dead, dead_last and alive property")					
					sumAliveDeadPerc(nil, target, e)					
				end
				target.alive = math.floor(target.alive)
				target.dead_last = math.floor(target.dead_last)
				target.x = target.x / #target.elements										--target x coordinate is average x coordinate of all elements
				target.y = target.y / #target.elements										--target y coordinate is average y coordinate of all elements
				log.trace("media coordinate calculus for target.alive = " .. target.alive .. " and target.dead_last = " .. target.dead_last .. ": target.x = " .. target.x .. ",  target.y = " .. target.y)

			elseif target.class == "vehicle" then											--target consist of vehcles
				log.debug("vehicle target class. Iterate in oob_ground through countries and classes for search group")

				for country_n, country in pairs(oob_ground[targetside]) do					--iterate through countries

					for classname, class in pairs(country) do								--iterate through classes in country 

						if classname == "vehicle" or classname == "ship" then				--for vehicles or ships
							log.debug("classname of targets is vehicle or ship. Iterate through groups in country.vehcile.group or country.ship.group table to update dead, dead_last, alive property and calculus media coordiante for items of group and targetlist")

							for group_n, group in pairs(class.group) do						--iterate through groups in country.vehcile.group or country.ship.group table

								checkBug(group.name, "base_mission", "vehicle")

								if searchTargetInGroup(group, target) then -- update dead, dead_last, alive property and calculus media coordiante for items of group and targetlist 
									break
								end																
							end
						end
					end
				end

				if not target.foundOobGround then 
					print("DC_UT vehicle/ship error Not Found "..target_name) 
					log.error("DC_UT vehicle/ship error Not Found "..target_name)
				end

			elseif target.class == "static" then											--target consists of static objects
				log.debug("static targets class. Iterate in oob_ground through countries and classes")
				log.debug("static target: define dummy value for alive% and coordinate and Iterate all group's elements of oob_ground")
				target.alive = 100															--Introduce percentage of alive target elements
				target.x = 0																--Introduce x coordinate for target
				target.y = 0																--Introduce y coordinate for target
				target.dead_last = 0														--Introduce percentage of elements that died in last mission (for debriefing)
				
				for country_n, country in pairs(oob_ground[targetside]) do					--iterate through countries
					
					if country.static then													--country has static objects
						
						for group_n, group in pairs(country.static.group) do				--iterate through groups in country.static.group table
							
							for e = 1, #target.elements do									--Iterate through elements of target						
								checkBug(group.name, "base_mission", "static")
								log.trace("evaluate target.elements[" .. e .. "].name: " .. target.elements[e].name .. " to update dead, dead_last, alive property and calculus media coordiante for items of group and tragetlist")
														
								if group.name == target.elements[e].name then				--if the target element is found in group table									
									target.x = target.x + group.x							--Sum x coordinates of all elements
									target.y = target.y + group.y							--Sum y coordinates of all elements
									target.elements[e].groupId = group.groupId				--store target element group ID
									target.elements[e].dead = group.units[1].dead			--store unit status
									target.elements[e].dead_last = group.units[1].dead_last			--store unit status
									log.trace("group.name == target.elements[" .. e .. "].name: " .. group.name .. ". Summmatory for media calculus - sum.target.x = " .. target.x .. ", sum.target.y = " .. target.y)
									log.trace("store in target.elements[" .. e .. "].name: " .. group.name .. " groupId: " .. group.groupId .. ", group.units[1].dead: " .. tostring(group.units[1].dead) .. "group.units[1].dead_last: " .. tostring(group.units[1].dead_last))									
									-- comparePos = group
									target.foundOobGround = true
									target.elements[e].foundOobGround = true									
									sumAliveDeadPerc(nil, target, e)						 -- Update dead, dead_last and alive property
									log.trace("updated dead, dead_last, alive property and calculus media coordiante for items of group and target")
									break
								end
							end
						end

					end
				end
				
				for e = 1, #target.elements do
						
					if not target.elements[e].foundOobGround then
						 print("DC_UT Static ERROR Not Found "..target.elements[e].name) 
						 log.error("DC_UT Static ERROR Not Found "..target.elements[e].name)
					end
				end
				
				target.alive = math.floor(target.alive)
				target.dead_last = math.floor(target.dead_last)
				target.x = target.x / #target.elements										--target x coordinate is average x coordinate of all elements
				target.y = target.y / #target.elements										--target y coordinate is average y coordinate of all elements
				log.trace("media calculus: target.alive = " .. target.alive .. ",  target.dead_last = " .. target.dead_last .. ", target.x = " .. target.x .. ", target.y = " .. target.y .. "target x,y are average coordiante of all elements")
				
				if not target.foundOobGround then
					print("DC_UT Static ERROR Not Found "..target_name) 
					log.error("DC_UT Static ERROR Not Found "..target_name)
				end
				
				-- local dist = math.ceil(GetDistance(target,comparePos)) / 1000
				-- if dist > 10 then
					-- print("DC_UT static error Nb element Or name Or No Static "..target_name.. " Distance entre les elements: "..dist.." Km")
				-- end
				-- local comparePos
			
			elseif target.class == "airbase" then											--target consists of aircraft on ground
				log.trace("airbase targets class. Iterate in oob_air")
				target.ATO = false															--remove target from ATO (gets reverted further down if there are ready planes at target airbase)
				
				for n = 1, #oob_air[targetside] do											--iterate through enemy aviation units
					checkBug(oob_air[targetside][n].base, "oob_air", "airbase")
					
					if oob_air[targetside][n].base == target.name then						--aviation unit is on target base
						log.trace("aviation unit is on target base, airbase name: " .. target.name)
						
						if db_airbases[target.name] then									--if the target airbase has an entry in db_airbases table
							target.foundOobGround = true
							log.trace("target airbase has an entry in db_airbases table, db_airbases[" .. target.name .. "]")
							
							if oob_air[targetside][n].roster.ready > 0 then					--aviation unit has ready aircraft
								log.trace("aviation unit has ready aircraft ->  oob_air[targetside][n].roster.ready > 0 (" ..  oob_air[targetside][n].roster.ready .. ")")
								target.ATO = true											--add target to ATO
								target.unit = {												--add entry for aviation unit at target airbase
									name = oob_air[targetside][n].name,						--name of aviation unit at target airbase
									type = oob_air[targetside][n].type,						--type of aircraft at target airbase
									number = oob_air[targetside][n].roster.ready,			--ready aircraft of aviation unit at target airbase									
								}
								log.trace("add entry for aviation unit at target airbase, name = " .. target.unit.name .. ", type: " .. target.unit.type .. ", number: " .. target.unit.number)
								target.x = db_airbases[target.name].x						--add x coordinate of target
								target.y = db_airbases[target.name].y						--add y coordinate of target
								log.trace("target.x: " .. target.x .. ", target.y: " .. target.y)
							end
						end
					end
				end
				
				if not target.foundOobGround then
					print("DC_UT airbase error Not Found "..target_name)
					log.error("DC_UT airbase error Not Found "..target_name)
				end
			end
		
		elseif target.task == "Anti-ship Strike" then										--For ship group targets
			log.trace("target.task == Anti-ship Strike . Evalutate new target coordinate from media calculus of coordinate live elements. Iterate in oob_ground through countries and groups")
			
			for country_n, country in pairs(oob_ground[targetside]) do						--iterate through countries
				
				if country.ship then
					log.trace("country: " .. country.name .. " have ship. Iterate in country.groups.ship. Iterate through groups in country.vehcile.group or country.ship.group table to update dead, dead_last, alive property and calculus media coordiante for items of group and targetlist")

					for group_n, group in pairs(country.ship.group) do						--Iterate through groups in country.ship.group table
						checkBug(group.name, "base_mission", "Ship")
						
						if searchTargetInGroup(group, target) then
							break
						end						
					end
				end
			end
			
			if not target.foundOobGround then
				print("DC_UT Anti-ship Strike error Not Found "..target_name) 
				log.error("DC_UT Anti-ship Strike error Not Found "..target_name)
			end
			
		elseif target.task == "Transport" or target.task == "Nothing" then					--For transport or ferry tasks
			log.trace("target.task == Transport or Nothing. Evalutate new target coordinate from media calculus of coordinate live elements")
			target.x = db_airbases[target.destination].x
			target.y = db_airbases[target.destination].y
			log.trace("Assign target coordinate from db_airbases[ target.destination = " .. target.destination .. " ], target.x: " .. target.x .. " target.y: " .. target.y)
		end
				
		if target.alive then																--target has an alive value (is a ground target)
				-- Miguel21 modification M26  destroys targets if below a certain value
			if target.alive <= campMod.KillTargetValue and target.alive > 0 then					--if target alive is lower than 0 (due to rounding errors)
				
				if Debug.AfficheSol then  
					print("DC_UT target.name target.alive < 20 "..target_name.." "..tostring(target.alive)) 
					log.debug("DC_UT target.name target.alive < 20 "..target_name.." "..tostring(target.alive))
				end
				log.trace("target.alive < 20 (" .. target.alive .. ") killTarget")
				KillTarget(target_name, target.name)															--set target alive 0
				target.alive = 0
				
				if target.elements then 						
					log.trace("target.elements exist, iterate for all elements")
					
					for element_n,element in pairs(target.elements) do
						
						if not element.dead then
							log.trace("element isn't dead: kill element")
							KillTarget(element.name, target_name)
						end
					end
				end
			end
		
			if target.alive <= 0 then														--if target alive is lower than 0 (due to rounding errors)
				log.trace("target.alive <= 0 (" .. target.alive .. " set to 0 and traget.ATO = false")
				target.alive = 0	
				target.ATO = false														--set target alive 0
			end
						
			
			if target.inactive ~= true then													--target is active
				GroundTarget[side_name].total = GroundTarget[side_name].total + 1			--count the number of all ground targets for each side
				log.trace("actual count number of active ground target for side: " .. side_name.. ": " .. GroundTarget[side_name].total)
			
				if target.alive > 0 then													--target is not destroyed
					GroundTarget[side_name].alive = GroundTarget[side_name].alive + 1		--count the number of all alive ground targets for each side
					log.trace("actual count number of alive ground active target for side: " .. side_name.. ": " .. GroundTarget[side_name].alive)
				end
			end
		end
	end

	if Debug.AfficheSol then 
		print()
		print("DC_UT GroundTarget "..side_name.." "..GroundTarget[side_name].total.." Alive: "..GroundTarget[side_name].alive)
		log.debug("DC_UT GroundTarget "..side_name.." "..GroundTarget[side_name].total.." Alive: "..GroundTarget[side_name].alive)
	end
	
	if GroundTarget[side_name].total > 0 then		
		GroundTarget[side_name].percent = math.ceil(100 / GroundTarget[side_name].total * GroundTarget[side_name].alive)	--calculate percentage of alive ground targets per side
		log.trace("side_name: " .. side_name .. "total number of active ground target > 0 (" .. GroundTarget[side_name].total .. "), " .. "percentage of active ground target: " .. GroundTarget[side_name].percent)
		
		if Debug.AfficheSol then  
			print("DC_UT GroundTarget "..side_name.." percent "..GroundTarget[side_name].percent) 
			log.debug("DC_UT GroundTarget "..side_name.." percent "..GroundTarget[side_name].percent) 
		end
	end
end
-- ============================================================					
-- Last point for coding logger functionality by Old_Boy ------		
-- ============================================================		

