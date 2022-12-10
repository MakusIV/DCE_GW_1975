--To update the targetlist (target position, alive precentage)
--Initiated by MAIN_NextMission.lua
------------------------------------------------------------------------------------------------------- 
-- Miguel Fichier Revision  M38
-------------------------------------------------------------------------------------------------------

-- Miguel21 modification M38 : Debug Name of TargetList 
-- Miguel21 M26 destroys targets if below a certain value
-- Miguel21 modification M19.e : Repair GROUND

-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = LOGGING_LEVEL
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
local function checkBug(name, origine, category)

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

-- box = {
	-- ["min_x"] = 9999999,
	-- ["min_y"] = 9999999,
	-- ["max_x"] = -9999999,
	-- ["max_y"] = -9999999,
-- }
-- box = {	--caucasus
	-- ["min_x"] = -488954,
	-- ["min_y"] = 199450,
	-- ["max_x"] = 62058,
	-- ["max_y"] = 942610,
-- }

box = {	--gulf
	["min_x"] = -289090,
	["min_y"] = -840909,
	["max_x"] = 790909,
	["max_y"] = 377272,
}

for coal_name,coal in pairs(oob_ground) do										--go through sides(red/blue)	
	for country_n,country in ipairs(coal) do									--go through countries
		if country.vehicle then													--country has vehicles
			for group_n,group in ipairs(country.vehicle.group) do				--go through groups
				if group.x < box.min_x then
					box.min_x = group.x
				end
				if group.x  > box.max_x then
					box.max_x = group.x
				end
				if group.y <box. min_y then
					box.min_y = group.y
				end
				if group.y  > box.max_y then
					box.max_y = group.y
				end
			end
		end
	
		if country.ship then													--country has ships
			for group_n,group in ipairs(country.ship.group) do					--go through groups
				if group.x < box.min_x then
					box.min_x = group.x
				end
				if group.x  > box.max_x then
					box.max_x = group.x
				end
				if group.y <box. min_y then
					box.min_y = group.y
				end
				if group.y  > box.max_y then
					box.max_y = group.y
				end
			end
		end
	end
end

for base_name,base in pairs(db_airbases) do
	
	if base.x and base.x ~= 9999999999 then 
		if base.x < box.min_x then
			box.min_x = base.x
		end
		if base.x  > box.max_x then
			box.max_x = base.x
		end
	end
	if base.y and base.y ~= 9999999999 then 
		if base.y <box. min_y then
			box.min_y = base.y
		end
		if base.y  > box.max_y then
			box.max_y = base.y
		end
	end
end



-- _affiche(box, "DC_UT box")

for side_name, side in pairs(targetlist) do													--Iterate through all side
	for target_name, target in pairs(side) do												--Iterat through all targets
		
		checkBug(target_name, "targetlist", "name")
		if target.name then checkBug(target_name, "targetlist", "target.name") end
		
		target.ATO = true																	--add target to ATO boolean
		target.alive = nil																	--clear target alive value
			
		local targetside = "red"															--variable which side the target is on
		if side_name == "red" then
			targetside = "blue"
		end
		
		--target position by refpoint 
		if target.refpoint then																--target coordinates are referenced by a refpoint
			if Refpoint then																--global Refpoint is not available when UpdateTargelist is called by DEBRIEF_Master. In this case updating the target coordinates can be ignored as this is not needed for debriefing.
				if type(target.refpoint) == "table" then									--multiple refpoints
					target.MultiPoints = {}
					for n = 1, #target.refpoint do
						target.MultiPoints[n] = {}
						target.MultiPoints[n].x = Refpoint[target.refpoint[n]].x			--get x-coordinate
						target.MultiPoints[n].y = Refpoint[target.refpoint[n]].y			--get y-coordinate
					end
					target.x = target.MultiPoints[1].x										--for targets with multiple points use first point as target coordinates (proforma only, not needed for tasks with multiple points)
					target.y = target.MultiPoints[1].y
				else																		--only a single refoint
					target.x = Refpoint[target.refpoint].x									--get x-coordinate
					target.y = Refpoint[target.refpoint].y									--get y-coordinate
				end
				if target.x == nil or target.y == nil then
					print("DC_UpdateTargetlist Error: Refpoint '" .. target.refpoint .. "' of target '" .. target.name .. "' not found!")
				end
			end
		end

		--target position slaved to group/unit
		if target.slaved then																--target coordinates are slaved relative to a group/unit
			local master = target.slaved[1]
			local bearing = target.slaved[2]
			local distance = target.slaved[3]
			
			local master_x
			local master_y
			
			--find either master group or units (vehicle or ship) and get master  x-y coordinates
			for coal_name,coal in pairs(oob_ground) do										--go through sides(red/blue)	
				for country_n,country in ipairs(coal) do									--go through countries
					if country.vehicle then													--country has vehicles
						for group_n,group in ipairs(country.vehicle.group) do				--go through groups
							if group.name == master then
								master_x = group.x
								master_y = group.y
								break
							else
								for unit_n,unit in ipairs(group.units) do
									if unit.name == master then
										master_x = unit.x
										master_y = unit.y
										break
									end
								end
							end
						end
					end
				
					if country.ship then													--country has ships
						for group_n,group in ipairs(country.ship.group) do					--go through groups
							if group.name == master then
								master_x = group.x
								master_y = group.y
								break
							else
								for unit_n,unit in ipairs(group.units) do
									if unit.name == master then
										master_x = unit.x
										master_y = unit.y
										break
									end
								end
							end
						end
					end
				end
			end
			
			if master_x and master_y then													--a master was found
				target.x = master_x + math.cos(math.rad(bearing)) * distance				--update target position relative to master position
				target.y = master_y + math.sin(math.rad(bearing)) * distance				--update target position relative to master position
			else																			--no master was found
				print("DC_UpdateTargetlist Error target position slaved to group/unit : Master '" .. master .. "' of target '" ..  "' not found!")
			end
		end
	
		if target.task == "Strike" then														
			if target.class == nil then														--For scenery object targets
				target.alive = 100															--Introduce percentage of alive target elements
				target.x = 0																--Introduce x coordinate for target
				target.y = 0																--Introduce y coordinate for target
				target.dead_last = 0														--Introduce percentage of elements that died in last mission (for debriefing)
				for e = 1, #target.elements do												--Iterate through elements of target
					target.x = target.x + target.elements[e].x								--Sum x coordinates of all elements
					target.y = target.y + target.elements[e].y								--Sum y coordinates of all elements
					if target.elements[e].dead then											--if target element is dead		
						target.alive = target.alive - 100 / #target.elements				--reduce target alive percentage	
					end
					if target.elements[e].dead_last then
						target.dead_last = target.dead_last + 100 / #target.elements		--add target died in last mission percentage
					end
				end
				target.alive = math.floor(target.alive)
				target.dead_last = math.floor(target.dead_last)
				target.x = target.x / #target.elements										--target x coordinate is average x coordinate of all elements
				target.y = target.y / #target.elements										--target y coordinate is average y coordinate of all elements
			elseif target.class == "vehicle" then											--target consist of vehciles
				for country_n, country in pairs(oob_ground[targetside]) do					--iterate through countries
					for classname,class in pairs(country) do								--iterate through classes in country 
						if classname == "vehicle" or classname == "ship" then				--for vehicles or ships
							for group_n, group in pairs(class.group) do						--iterate through groups in country.vehcile.group or country.ship.group table
								checkBug(group.name, "base_mission", "vehicle")
								if group.name == target.name then							--if the target is found in group table
									target.foundOobGround = true
									if group.probability and group.probability < 1 then		--if group probability of spawn is less than 100%
										target.ATO = false									--remove target to ATO
									end
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
									end
									for unit_n, unit in pairs(group.units) do						--Iterate through all units of group
										if unit.dead then											--Unit is dead
											target.alive = target.alive - 100 / #target.elements	--reduce target alive percentage	
										end
										if unit.dead_last then
											target.dead_last = target.dead_last + 100 / #target.elements	--add target died in last mission percentage
										end
									end
									target.alive = math.floor(target.alive)
									target.dead_last = math.floor(target.dead_last)
									break
								end
							end
						end
					end
				end
				if not target.foundOobGround then print("DC_UT vehicle/ship error Not Found "..target_name) end
			elseif target.class == "static" then											--target consists of static objects
				target.alive = 100															--Introduce percentage of alive target elements
				target.x = 0																--Introduce x coordinate for target
				target.y = 0																--Introduce y coordinate for target
				target.dead_last = 0														--Introduce percentage of elements that died in last mission (for debriefing)
				for country_n, country in pairs(oob_ground[targetside]) do					--iterate through countries
					if country.static then													--country has static objects
						for group_n, group in pairs(country.static.group) do				--iterate through groups in country.static.group table
							for e = 1, #target.elements do									--Iterate through elements of target						
								checkBug(group.name, "base_mission", "static")
								if group.name == target.elements[e].name then				--if the target element is found in group table
									target.x = target.x + group.x							--Sum x coordinates of all elements
									target.y = target.y + group.y							--Sum y coordinates of all elements
									target.elements[e].groupId = group.groupId				--store target element group ID
									target.elements[e].dead = group.units[1].dead			--store unit status
									target.elements[e].dead_last = group.units[1].dead_last			--store unit status
									
									-- comparePos = group
									target.foundOobGround = true
									target.elements[e].foundOobGround = true
									
									if target.elements[e].dead then									--Unit is dead
										target.alive = target.alive - 100 / #target.elements		--reduce target alive percentage										
									end
									if target.elements[e].dead_last then
										target.dead_last = target.dead_last + 100 / #target.elements	--add target died in last mission percentage
									end
									break
								end
							end
						end

					end
				end
				
				for e = 1, #target.elements do
						if not target.elements[e].foundOobGround then print("DC_UT Static ERROR Not Found "..target.elements[e].name) end
				end
				
				target.alive = math.floor(target.alive)
				target.dead_last = math.floor(target.dead_last)
				target.x = target.x / #target.elements										--target x coordinate is average x coordinate of all elements
				target.y = target.y / #target.elements										--target y coordinate is average y coordinate of all elements
				
				if not target.foundOobGround then print("DC_UT Static ERROR Not Found "..target_name) end
				
				-- local dist = math.ceil(GetDistance(target,comparePos)) / 1000
				-- if dist > 10 then
					-- print("DC_UT static error Nb element Or name Or No Static "..target_name.. " Distance entre les elements: "..dist.." Km")
				-- end
				-- local comparePos
			
			elseif target.class == "airbase" then											--target consists of aircraft on ground
				target.ATO = false															--remove target from ATO (gets reverted further down if there are ready planes at target airbase)
				for n = 1, #oob_air[targetside] do											--iterate through enemy aviation units
					checkBug(oob_air[targetside][n].base, "oob_air", "airbase")
					if oob_air[targetside][n].base == target.name then						--aviation unit is on target base
						if db_airbases[target.name] then									--if the target airbase has an entry in db_airbases table
							target.foundOobGround = true
							if oob_air[targetside][n].roster.ready > 0 then					--aviation unit has ready aircraft
								target.ATO = true											--add target to ATO
								target.unit = {												--add entry for aviation unit at target airbase
									name = oob_air[targetside][n].name,						--name of aviation unit at target airbase
									type = oob_air[targetside][n].type,						--type of aircraft at target airbase
									number = oob_air[targetside][n].roster.ready,			--ready aircraft of aviation unit at target airbase
								}
								target.x = db_airbases[target.name].x						--add x coordinate of target
								target.y = db_airbases[target.name].y						--add y coordinate of target
							end
						end
					end
				end
				if not target.foundOobGround then print("DC_UT airbase error Not Found "..target_name) end
			end
		
		elseif target.task == "Anti-ship Strike" then										--For ship group targets
			for country_n, country in pairs(oob_ground[targetside]) do						--iterate through countries
				if country.ship then
					for group_n, group in pairs(country.ship.group) do						--Iterate through groups in country.ship.group table
						checkBug(group.name, "base_mission", "Ship")
						if group.name == target.name then									--If the target is found in group table
							target.foundOobGround = true
							if group.probability and group.probability < 1 then			--if group probability of spawn is less than 100%
								target.ATO = false										--remove target to ATO
							end
							target.alive = 100											--Introduce percentage of alive target elements
							target.groupId = group.groupId								--store target group ID
							target.x = group.x											--add x coordinate of target
							target.y = group.y											--add y coordinate of target
							target.elements = {}										--add elements table
							target.dead_last = 0										--Introduce percentage of elements that died in last mission (for debriefing)
							for unit_n, unit in pairs(group.units) do					--Iterate through all units of group
								target.elements[unit_n] = {								--add new element
									name = unit.name,									--store unit name
									dead = unit.dead,									--store unit status
									dead_last = unit.dead_last,							--store unit dead_last
									CheckDay = unit.CheckDay							-- M19 ajoute la date destruction/ravito pour les futurs check de ravitaillement
								}
							end
							for unit_n, unit in pairs(group.units) do						--Iterate through all units of group
								if unit.dead then											--Unit is dead
									target.alive = target.alive - 100 / #target.elements	--reduce target alive percentage	
								end
								if unit.dead_last then
									target.dead_last = target.dead_last + 100 / #target.elements	--add target died in last mission percentage
								end
							end
							target.alive = math.floor(target.alive)
							target.dead_last = math.floor(target.dead_last)
							break
						end
					end
				end
			end
			if not target.foundOobGround then print("DC_UT Anti-ship Strike error Not Found "..target_name) end
			
		elseif target.task == "Transport" or target.task == "Nothing" then					--For transport or ferry tasks
			target.x = db_airbases[target.destination].x
			target.y = db_airbases[target.destination].y
		end
				
		if target.alive then																--target has an alive value (is a ground target)
				-- Miguel21 modification M26  destroys targets if below a certain value
				if target.alive <= campMod.KillTargetValue and target.alive > 0 then					--if target alive is lower than 0 (due to rounding errors)
					if Debug.AfficheSol then  print("DC_UT target.name target.alive < 20 "..target_name.." "..tostring(target.alive)) end
					KillTarget(target_name, target.name)															--set target alive 0
					target.alive = 0
					if target.elements then 						
						for element_n,element in pairs(target.elements) do
							if not element.dead then
								KillTarget(element.name, target_name)
							end
						end
					end
				end
			if target.alive < 0 then														--if target alive is lower than 0 (due to rounding errors)
				target.alive = 0															--set target alive 0
			end
			if target.alive == 0 then														--target is destroyed
				target.ATO = false															--remove target from ATO
			end
			
			if target.inactive ~= true then													--target is active
				GroundTarget[side_name].total = GroundTarget[side_name].total + 1			--count the number of all ground targets for each side
				if target.alive > 0 then													--target is not destroyed
					GroundTarget[side_name].alive = GroundTarget[side_name].alive + 1		--count the number of all alive ground targets for each side
				end
			end
		end
	end

	if Debug.AfficheSol then 
		print()
		print("DC_UT GroundTarget "..side_name.." "..GroundTarget[side_name].total.." Alive: "..GroundTarget[side_name].alive)
	end
	
	if GroundTarget[side_name].total > 0 then
		GroundTarget[side_name].percent = math.ceil(100 / GroundTarget[side_name].total * GroundTarget[side_name].alive)	--calculate percentage of alive ground targets per side
		if Debug.AfficheSol then  print("DC_UT GroundTarget "..side_name.." percent "..GroundTarget[side_name].percent) end
	end
end