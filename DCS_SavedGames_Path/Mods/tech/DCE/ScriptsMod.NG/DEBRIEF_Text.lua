--To create the debriefing text for the mission
--Initiated by DEBRIEF_Master.lua
------------------------------------------------------------------------------------------------------- 
-------------------------------------------------------------------------------------------------------

if not versionDCE then 
	versionDCE = {} 
end

               -- VERSION --

versionDCE["DEBRIEF_Text.lua"] = "OB.1.0.1"

---------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.1: added Base Efficiency and Reserves Efficiency in stats
-- Old_Boy rev. OB.1.0.0: added friendly_kills in stats
---------------------------------------------------------------------------------------------------------

local function getEfficiency(base, side)
	
	if airbase_tab[side][base] then		
		local efficiency = airbase_tab[side][base].efficiency * 100
		
		if efficiency then
			local efficiencyStr = tostring(efficiency)	
			local histogram = ""
			local maxNumLeght = 3
			local SpaceSep = 2
			local space = string.sub("                              ", 1, maxNumLeght + SpaceSep - string.len(efficiencyStr))

			if efficiency < 1 then
				histogram = string.sub("##########", 1, math.ceil(10 * (1 - efficiency)))
			end		
			return efficiencyStr .. space .. histogram
		end
	end
	return "-"
end


debriefing = ""																						--Global debriefing text string. Will be used in DEBRIEF_Master.lua to write debriefing txt file with notepad

-- header ---------------------------------------------------------------------------------- 
do
	--mission number
	local s = "Mission " .. camp.mission

	--date
	s = s .. " - " .. FormatDate(camp.date.day, camp.date.month, camp.date.year) .. " (H+" .. camp.day .. "), " ..  FormatTime(camp.time, "hh:mm")

	--divider
	local divider_length = string.len(s)
	s = s .. "\n"
	for n = 1, divider_length do
		s = s .. "-"
	end
	
	debriefing = debriefing .. s .. "\n\n"
end


-- player package evaluation ---------------------------------------------------------------------------------- 
do
	local s = ""
	
	--function to build a list of the target and target element status
	local function TargetStats(target_name)
		local t = ""
		if targetlist[camp.player.side][target_name].elements then									--if the target is a scenery, vehicle or ship target
			str_length = string.len(target_name)													--string lenght of target name
			for e = 1, #targetlist[camp.player.side][target_name].elements do						--find string lenght of elements names to find the longest name for alignement of status amendment
				local ename = targetlist[camp.player.side][target_name].elements[e].name			--element name
				local i = string.find(ename, "#")													--position of # in string
				if i then
					ename = string.sub(ename, 0, i - 1) 											--only display part of element name before #
				end
				if string.len(ename) + 2 > str_length then
					str_length = string.len(ename) + 2
				end
			end
			
			t = t .. target_name																	--Target name
			local space = str_length + 3 - string.len(target_name)									--calculate number of spaces that need to be added for alignement (string length of largest + 3 - length of current entry = number of spaces)
			for m = 1, space do															
				t = t .. " "																		--add one space for every missing letter
			end
			t = t .. "(" .. targetlist[camp.player.side][target_name].alive .. "%)\n"				--Target percentage of alive sub-elements 
			
			for e = 1, #targetlist[camp.player.side][target_name].elements do						--list all target elements
				local ename = targetlist[camp.player.side][target_name].elements[e].name			--element name
				local i = string.find(ename, "#")													--position of # in string
				if i then
					ename = string.sub(ename, 0, i - 1) 											--only display part of element name before #
				end
				t = t .. "- " .. ename
				space = str_length + 3 - string.len("- " .. ename)									--calculate number of spaces that need to be added for alignement (string length of largest + 3 - length of current entry = number of spaces)
				for m = 1, space do															
					t = t .. " "																	--add one space for every missing letter
				end
				
				if camp.ShipHealth[ename] then														--element is a ship that took damage
					if camp.ShipHealth[ename] == 0 then												--ship is sunk
						t = t .. "(sunk)"
					elseif camp.ShipHealth[ename] < 33 then											--ship has less than 33% health
						t = t .. "(heavy damage)"
					elseif camp.ShipHealth[ename] < 66 then											--ship has less than 66% health
						t = t .. "(moderate damage)"
					elseif camp.ShipHealth[ename] < 100 then										--ship has less than 100% health
						t = t .. "(light damage)"
					end
					if camp.ShipDamagedLast[ename] then												--ship has taken damage in last mission
						t = t .. " (+)\n"
					else
						t = t .. "\n"																--make new line
					end
				elseif targetlist[camp.player.side][target_name].elements[e].dead == true and targetlist[camp.player.side][target_name].elements[e].dead_last then			--if the target element is destroyed in this mission
					t = t .. "(destroyed)(+)\n"														--mark as destroyed and make new line
				elseif targetlist[camp.player.side][target_name].elements[e].dead == true then		--if the target element is destroyed in previous missions
					t = t .. "(destroyed)\n"														--mark as destroyed and make new line
				else
					t = t .. "\n"																	--make new line
				end
			end
			t = t .. "\n"
		end
		return t
	end
	
	--function to build a list of stats of all aircraft within a package
	local function PackageStats()
		local t = "Package:\n"
		
		--define list entries
		local entries = {
			[1] = {
				header = "Callsign",
				values = {},
			},
			[2] = {
				header = "Type",
				values = {},
			},
			[3] = {
				header = "Task",
				values = {},
			},
			[4] = {
				header = "Kills Air",
				values = {},
			},
			[5] = {
				header = "Kills Ground",
				values = {},
			},
			[6] = {
				header = "Kills Ship",
				values = {},
			},
			[7] = {
				header = "Lost",
				values = {},
			},
			[8] = {
				header = "Friendly Kills Air",
				values = {},
			},
			[9] = {
				header = "Friendly Kills Ground",
				values = {},
			},
			[10] = {
				header = "",
				values = {},
			},
		}
	
		--add list values
		for role_name, role in pairs(camp.player.pack) do
			
			for flight_n, flight in ipairs(role) do
				
				for n = 1, flight.number do
					local unit_name = "Pack " .. camp.player.pack_n .. " - " .. flight.name .. " - " .. flight.task .. " " .. flight_n .. "-" .. n
					local callsign = string.sub(flight.callsign, 1, -2) .. n
					table.insert(entries[1].values, callsign)
					table.insert(entries[2].values, ReplaceTypeName(flight.type))
					table.insert(entries[3].values, flight.task)
					table.insert(entries[4].values, packstats[unit_name].kills_air)
					table.insert(entries[5].values, packstats[unit_name].kills_ground)
					table.insert(entries[6].values, packstats[unit_name].kills_ship)
					table.insert(entries[7].values, packstats[unit_name].lost)
					table.insert(entries[8].values, packstats[unit_name].friendly_kills_air)
					table.insert(entries[9].values, packstats[unit_name].friendly_kills_ground)

					if flight.player and n == 1 then
						table.insert(entries[10].values, "(Player)")
					
					else
						table.insert(entries[10].values, "")
					end
				end
			end
		end
				
		--determine maximum string length for each entry
		for e = 1, #entries do																		--iterate through entries
			entries[e].str_length = string.len(entries[e].header)									--store string length of header for this entry
			
			for n = 1, #entries[e].values do														--iterate through values of this entry
				local l = string.len(tostring(entries[e].values[n]))								--get string length of value of this entry
				
				if l > entries[e].str_length then													--if the string length is larger than the previous
					entries[e].str_length = l														--make it the new length (find the largest)
				end
			end
		end
		
		--build the list header
		for e = 1, #entries do																		--iterate through entries
			t = t .. entries[e].header																--add header
			
			if e < #entries then																	--if this is not the last header, add spaces to the next header	
				local space = entries[e].str_length + 5 - string.len(entries[e].header)				--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
				
				for m = 1, space do															
					t = t .. " "																	--add one space for every missing letter
				end
			end
		end
		t = t .. "\n"
	
		--build the list		
		for n = 1, #entries[1].values do															--iterate through number of values (number of units)
			
			for e = 1, #entries do																	--iterate through entries
				t = t .. entries[e].values[n]														--add value to list
			
				if e < #entries then																--if this is not the last header, add spaces to the next header	
					local space = entries[e].str_length + 5 - string.len(tostring(entries[e].values[n]))	--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
			
					for m = 1, space do													
						t = t .. " "																--add one space for every missing letter
					end
				end
			end
			t = t .. "\n"																			--make a new line after each unit
		end
	
		return t
	end
	
	local player_task = camp.player.pack[camp.player.role][camp.player.flight].task								--player task
	local target_name = camp.player.pack[camp.player.role][camp.player.flight].target_name						--name of player package target
	local target_alive = targetlist[camp.player.side][target_name].alive										--alive percentage of player package target (if applicable)
	local target_hit = targetlist[camp.player.side][target_name].dead_last										--percentage destroyed in this mission
	local target_class = camp.player.pack[camp.player.role][camp.player.flight].target.class					--target class
	
	local pack_kills_air = 0
	local pack_kills_ground = 0
	local pack_kills_ship = 0
	local pack_friendly_kills_air = 0
	local pack_friendly_kills_ground = 0
	local pack_friendly_kills_ship = 0
	local pack_lost = 0
	
	for k,v in pairs(packstats) do
		pack_kills_air = pack_kills_air + v.kills_air
		pack_kills_ground = pack_kills_ground + v.kills_ground
		pack_kills_ship = pack_kills_ship + v.kills_ship
		pack_friendly_kills_air = pack_friendly_kills_air + v.friendly_kills_air
		pack_friendly_kills_ground = pack_friendly_kills_ground + v.friendly_kills_ground
		pack_friendly_kills_ship = pack_friendly_kills_ship + v.friendly_kills_ship
		pack_lost = pack_lost + v.lost
	end

	local s1

	if pack_kills_air == 0 then
		s1 = "Your package has not scored any kills"
	
	else
		s1 = "Your package has scored " .. pack_kills_air .. " air-air kills"
	end
		

	if pack_lost == 0 then
		s1 = s1 .. " without incurring losses.\n\n"
	
	else
		s1 = s1 .. " suffering these losses " .. pack_lost .. ".\n\n"
	end

	if pack_friendly_kills_air > 0 then
		s1 = s1 .. "Your package is responsible for destroying this number of friendly aircraft: " .. pack_friendly_kills_air .. ".\n\n"
	end

	if pack_friendly_kills_ground > 0 then
		s1 = s1 .. "Your package is responsible for destroying this number of friendly ground asset: " .. pack_friendly_kills_ground .. ".\n\n"
	end
	
	--CAP
	if player_task == "CAP" then
		s = s .. "You have been tasked to perform a Combat Air Patrol at " .. target_name .. ". " .. s1		
		s = s .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--Intercept
	elseif player_task == "Intercept" then
		s = s .. "You have been tasked to perform an Intercept mission from " .. camp.player.target.base .. ". " .. s1
		s = s .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package

	--Fighter Sweep
	elseif player_task == "Fighter Sweep" then
		s = s .. "You have been tasked to perform a Fighter Sweep in the area of " .. target_name .. ". " .. s1
		s = s .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--Airbase Strike
	elseif target_class == "airbase" then
		local target_unit_name = camp.player.pack[camp.player.role][camp.player.flight].target.unit.name
	
		if player_task == "Strike" then
			s = s .. "You have been tasked with striking " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		elseif player_task == "Escort" then
			s = s .. "You have been tasked with escorting a strike against " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		elseif player_task == "SEAD" then
			s = s .. "You have been tasked with providing SEAD escort for a strike against " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		elseif player_task == "Escort Jammer" then
			s = s .. "You have been tasked with providing jammer escort for a strike against " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		elseif player_task == "Flare Illumination" then
			s = s .. "You have been tasked with providing battlefield flare illumination for a strike against " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		elseif player_task == "Laser Illumination" then
			s = s .. "You have been tasked with providing target laser designation for a strike against " .. target_name .. " hosting " .. ReplaceTypeName(camp.player.pack[camp.player.role][camp.player.flight].target.unit.type) .. " of the " .. target_unit_name .. ". "
		end

		for side_name,side in pairs(oob_air) do

			for unit_n,unit in ipairs(side) do

				if unit.name == target_unit_name then												--find target unit oob_air entry

					if unit.score_last.lost > 0 and unit.score_last.damaged > 0 then				--target unit has losses and damages in last mission
						s = s .. "The " .. target_unit_name .. " has suffered " .. unit.score_last.lost .. " aircraft lost and " .. unit.score_last.damaged .. " aircraft damaged. "

					elseif unit.score_last.lost > 0 then											--target unit has losses in last mission
						s = s .. "The " .. target_unit_name .. " has suffered " .. unit.score_last.lost .. " aircraft lost. "

					elseif unit.score_last.damaged > 0 then											--target unit has damages in last mission
						s = s .. "The " .. target_unit_name .. " has suffered " .. unit.score_last.damaged .. " aircraft damaged. "

					else																			--target unit has no losses or damages in last mission
						s = s .. "The " .. target_unit_name .. " has not sustained any damage. "
					end

					if unit.roster.ready > 0 then
						s = s .. "It retains " .. unit.roster.ready .. " aircraft ready for operations.\n\n"

					else

						if unit.roster.damaged > 0 then
							s = s .. "It retains no undamaged aircraft ready for immediate operations.\n\n"

						else
							s = s .. "It retains no additional aircraft and has been completely disabled.\n\n"
						end
					end
				end
			end
		end
		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--Strike
	elseif player_task == "Strike" then
		s = s .. "You have been tasked with striking " .. target_name
		
		local ship_hit

		if targetlist[camp.player.side][target_name].elements then
			
			for e = 1, #targetlist[camp.player.side][target_name].elements do
				
				if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
					ship_hit = true
					break
				end
			end
		end
		
		if ship_hit then
			s = s .. ". The target has been hit and has taken damage.\n\n"
		
		elseif target_hit > 0 then
			s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
			
			if target_alive > 0 then
				s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			
			else
				s = s .. target_name .. " has been completely destroyed.\n\n"
			end
		
		else
			s = s .. " but were unable to inflict any damage. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		end
		
		--list the target
		s = s .. TargetStats(target_name) .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package

	--Anti-ship Strike
	elseif player_task == "Anti-ship Strike" then
		s = s .. "You have been tasked with an anti-ship strike against "  .. target_name
		
		local ship_hit
		
		if targetlist[camp.player.side][target_name].elements then
			
			for e = 1, #targetlist[camp.player.side][target_name].elements do
				
				if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
					ship_hit = true
					break
				end
			end
		end
		
		if ship_hit then
			s = s .. ". The target has been hit and has taken damage.\n\n"
		elseif target_hit > 0 then
			s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
			if target_alive > 0 then
				s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			else
				s = s .. target_name .. " has been completely destroyed.\n\n"
			end
		else
			s = s .. " but were unable to inflict any damage. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		end
		
		--list the target
		s = s .. TargetStats(target_name) .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Escort
	elseif player_task == "Escort" then

		if target_class == "airbase" then
			s = s .. "You have been tasked with escorting a strike against " .. targetlist[camp.player.side][target_name].name .. ".\n\n"
		
		elseif targetlist[camp.player.side][target_name].task == "Reconnaissance" then
			s = s .. "You have been tasked with escorting a recon mission " .. targetlist[camp.player.side][target_name].text .. ".\n\n"
		
		else
			s = s .. "You have been tasked with escorting a strike against " .. target_name
			
			local ship_hit
		
			if targetlist[camp.player.side][target_name].elements then
		
				for e = 1, #targetlist[camp.player.side][target_name].elements do
		
					if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
						ship_hit = true
						break
					end
				end
			end
			
			if ship_hit then
				s = s .. ". The target has been hit and has taken damage.\n\n"
		
			elseif target_hit > 0 then
				s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
		
				if target_alive > 0 then
					s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		
				else
					s = s .. target_name .. " has been completely destroyed.\n\n"
				end
		
			else
				s = s .. ". No damage was inflicted. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			end
			
			--list the target
			s = s .. TargetStats(target_name)
		end

		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--SEAD
	elseif player_task == "SEAD" then
		
		if target_class == "airbase" then
			s = s .. "You have been tasked with providing SEAD escort for a strike against " .. targetlist[camp.player.side][target_name].name .. ".\n\n"
		
		elseif targetlist[camp.player.side][target_name].task == "Reconnaissance" then
			s = s .. "You have been tasked with providing SEAD escort for a recon mission " .. targetlist[camp.player.side][target_name].text .. ".\n\n"
		
		else
			s = s .. "You have been tasked with providing SEAD escort for a strike against " .. target_name
			
			local ship_hit
		
			if targetlist[camp.player.side][target_name].elements then
		
				for e = 1, #targetlist[camp.player.side][target_name].elements do
		
					if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
						ship_hit = true
						break
					end
				end
			end
			
			if ship_hit then
				s = s .. ". The target has been hit and has taken damage.\n\n"
		
			elseif target_hit > 0 then
				s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
		
				if target_alive > 0 then
					s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		
				else
					s = s .. target_name .. " has been completely destroyed.\n\n"
				end
		
			else
				s = s .. ". No damage was inflicted. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			end
			
			--list the target
			s = s .. TargetStats(target_name)
		end
		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Escort Jammer
	elseif player_task == "Escort Jammer" then
		
		if targetlist[camp.player.side][target_name].task == "Reconnaissance" then
			s = s .. "You have been tasked with providing jammer escort for a recon mission " .. targetlist[camp.player.side][target_name].text .. ".\n\n"
		
		else
			s = s .. "You have been tasked with providing jammer escort for a strike against " .. target_name
			
			local ship_hit
		
			if targetlist[camp.player.side][target_name].elements then
		
				for e = 1, #targetlist[camp.player.side][target_name].elements do
		
					if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
						ship_hit = true
						break
					end
				end
			end
			
			if ship_hit then
				s = s .. ". The target has been hit and has taken damage.\n\n"
		
			elseif target_hit > 0 then
				s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
		
				if target_alive > 0 then
					s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		
				else
					s = s .. target_name .. " has been completely destroyed.\n\n"
				end
		
			else
				s = s .. ". No damage was inflicted. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			end
			
			--list the target
			s = s .. TargetStats(target_name)
		end
		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Flare Illumination
	elseif player_task == "Flare Illumination" then

		if targetlist[camp.player.side][target_name].task == "Reconnaissance" then
			s = s .. "You have been tasked with providing battlefield flare illumination for a recon mission " .. targetlist[camp.player.side][target_name].text .. ".\n\n"
		
		else
			s = s .. "You have been tasked with providing battlefield flare illumination for a strike against " .. target_name
			
			local ship_hit
		
			if targetlist[camp.player.side][target_name].elements then
		
				for e = 1, #targetlist[camp.player.side][target_name].elements do
		
					if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
						ship_hit = true
						break
					end
				end
			end
			
			if ship_hit then
				s = s .. ". The target has been hit and has taken damage.\n\n"
		
			elseif target_hit > 0 then
				s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
		
				if target_alive > 0 then
					s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		
				else
					s = s .. target_name .. " has been completely destroyed.\n\n"
				end
		
			else
				s = s .. ". No damage was inflicted. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			end
			
			--list the target
			s = s .. TargetStats(target_name)
		end
		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--Laser Illumination
	elseif player_task == "Laser Illumination" then
		
		if targetlist[camp.player.side][target_name].task == "Reconnaissance" then
			s = s .. "You have been tasked with providing target laser designation for a recon mission " .. targetlist[camp.player.side][target_name].text .. ".\n\n"
		
		else
			s = s .. "You have been tasked with providing target laser designation for a strike against " .. target_name
			
			local ship_hit
		
			if targetlist[camp.player.side][target_name].elements then
		
				for e = 1, #targetlist[camp.player.side][target_name].elements do
		
					if camp.ShipDamagedLast and camp.ShipDamagedLast[targetlist[camp.player.side][target_name].elements[e].name] then
						ship_hit = true
						break
					end
				end
			end
			
			if ship_hit then
				s = s .. ". The target has been hit and has taken damage.\n\n"
		
			elseif target_hit > 0 then
				s = s .. ". The target has been hit and sustained " .. target_hit .. "% damage. "
		
				if target_alive > 0 then
					s = s .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
		
				else
					s = s .. target_name .. " has been completely destroyed.\n\n"
				end
		
			else
				s = s .. ". No damage was inflicted. " .. target_name .. " remains " .. target_alive .. "% intact.\n\n"
			end
			
			--list the target
			s = s .. TargetStats(target_name)
		end
		s = s .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--Reconnaissance
	elseif player_task == "Reconnaissance" then
		s = s .. "You have been tasked with reconnaissance of " .. target_name .. ".\n\n" .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
	
	--AWACAS
	elseif player_task == "AWACS" then
		s = s .. "You have been tasked with an AWACS patrol at " .. target_name .. ".\n\n" .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Refuelling
	elseif player_task == "Refueling" then
		s = s .. "You have been tasked with a refuelling mission at " .. target_name .. ".\n\n" .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Transport
	elseif player_task == "Transport" then
		local from = camp.player.pack[camp.player.role][camp.player.flight].target.base
		local to = camp.player.pack[camp.player.role][camp.player.flight].target.destination
		s = s .. "You have been tasked with a transport  mission from " .. from .. " to " .. to .. ".\n\n" .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package
		
	--Ferry/Nothing
	elseif player_task == "Nothing" then
		local from = camp.player.pack[camp.player.role][camp.player.flight].target.base
		local to = camp.player.pack[camp.player.role][camp.player.flight].target.destination
		s = s .. "You have been tasked with a ferry flight from " .. from .. " to " .. to .. ".\n\n" .. s1 .. PackageStats() .. "\n\n"																			--add stats list for each aircraft in package

	end
	
	debriefing = debriefing .. s ..  "\n"	
end


-- Order of Battle Air ---------------------------------------------------------------------------------- 
do
	local s = "Order of Battle (AIR):\n----------------------\n\n"									--make lists of the air order of battle for all sides
	
	local entries = {}
	local air_loss_data = {}

	for side_name,side in pairs(oob_air) do															--iterate through sides in oob_air

		air_loss_data[side_name] = {
			["total"] = {
				["aircraft_qty"] = 0,
				["aircraft_cost"] = 0,
			},
			["last_mission"] = {
				["aircraft_qty"] = 0,
				["aircraft_cost"] = 0,
			},
		}
	
		--define list entries
		entries[side_name] = {
			[1] = {
				header = "Unit",
				values = {},
			},
			[2] = {
				header = "Type",
				values = {},
			},
			[3] = {
				header = "Base",
				values = {},
			},
			[4] = {
				header = "Kills Air",
				values = {},
			},
			[5] = {
				header = "Kills Ground",
				values = {},
			},
			[6] = {
				header = "Kills Ship",
				values = {},
			},
			[7] = {
				header = "Lost",
				values = {},
			},
			[8] = {
				header = "Damaged",
				values = {},
			},
			[9] = {
				header = "Ready",
				values = {},
			},
			[10] = {
				header = "Base Efficiency(%)",
				values = {},
			},
			[11] = {
				header = "Reserves Efficiency(%)",
				values = {},
			},
		}
	
		--add list values
		for unit_n,unit in ipairs(side) do																								--iterate through units
			if unit.inactive ~= true then																								--unit is active
				table.insert(entries[side_name][1].values, unit.name)																	--unit name
				table.insert(entries[side_name][2].values, ReplaceTypeName(unit.type))													--unit type
				table.insert(entries[side_name][3].values, unit.base)
				table.insert(entries[side_name][10].values, getEfficiency(unit.base, side_name))										-- base efficiency
				table.insert(entries[side_name][11].values, getEfficiency("Reserves-R/" .. unit.name, side_name))						-- reserves efficiency

				-- Loss evaluation ---
				if db_aircraft[side_name][unit.type] then																							
					air_loss_data[side_name].total.aircraft_qty = air_loss_data[side_name].total.aircraft_qty + unit.roster.lost																		-- update total aircraft losses
					air_loss_data[side_name].total.aircraft_cost = air_loss_data[side_name].total.aircraft_cost + db_aircraft[side_name][unit.type].cost * unit.roster.lost								-- update total cost aircraft losses

					if unit.score_last.lost > 0 then
						air_loss_data[side_name].last_mission.aircraft_qty = air_loss_data[side_name].last_mission.aircraft_qty + unit.score_last.lost													-- update mission aircraft losses
						air_loss_data[side_name].last_mission.aircraft_cost = air_loss_data[side_name].last_mission.aircraft_cost + db_aircraft[side_name][unit.type].cost * unit.score_last.lost		-- update mission cost aircraft losses
					end
				else
					--log.warn(" this unit don't exist in db_aircraft table: " .. side_name .. " - " ..  unit.type .. ", this loss is not included in the calculation of losses")
					print(" this unit don't exist in db_aircraft table: " .. side_name .. " - " ..  unit.type .. ", this loss is not included in the calculation of losses")
				end

				
				--unit base
				if unit.score_last.kills_air > 0 then
					table.insert(entries[side_name][4].values, unit.score.kills_air .. " (+" .. unit.score_last.kills_air .. ")")		--unit air kills plus score from this mission
				else
					table.insert(entries[side_name][4].values, unit.score.kills_air)													--unit air kills
				end
				if unit.score_last.kills_ground > 0 then
					table.insert(entries[side_name][5].values, unit.score.kills_ground .. " (+" .. unit.score_last.kills_ground .. ")")	--unit ground kills plus score from this mission
				else
					table.insert(entries[side_name][5].values, unit.score.kills_ground)													--unit ground kills
				end
				if unit.score_last.kills_ship > 0 then
					table.insert(entries[side_name][6].values, unit.score.kills_ship .. " (+" .. unit.score_last.kills_ship .. ")")		--unit ship kills plus score from this mission
				else
					table.insert(entries[side_name][6].values, unit.score.kills_ship)													--unit ship kills
				end
				if unit.score_last.lost > 0 then
					table.insert(entries[side_name][7].values, unit.roster.lost .. " (+" .. unit.score_last.lost .. ")")				--unit losses plus score from this mission
				else
					table.insert(entries[side_name][7].values, unit.roster.lost)														--unit losses
				end
				if unit.score_last.damaged > 0 then
					table.insert(entries[side_name][8].values, unit.roster.damaged .. " (+" .. unit.score_last.damaged .. ")")			--unit damaged aircraft plus score from this mission
				else
					table.insert(entries[side_name][8].values, unit.roster.damaged)														--unit damaged aircraft
				end
				if unit.score_last.ready > 0 then
					table.insert(entries[side_name][9].values, unit.roster.ready .. " (-" .. unit.score_last.ready .. ")")				--unit ready aircraft plus score from this mission
				else
					table.insert(entries[side_name][9].values, unit.roster.ready)														--unit ready aircraft
				end
			end
		end
	end
		
	--determine maximum string length for each entry
	for e = 1, #entries["blue"] do																	--iterate through entries
		entries["blue"][e].str_length = string.len(entries["blue"][e].header)						--store string length of header for this entry
		entries["red"][e].str_length = string.len(entries["red"][e].header)							--store string length of header for this entry
		for n = 1, #entries["blue"][e].values do													--iterate through values of this entry
			local l = ReplaceTypeName(string.len(tostring(entries["blue"][e].values[n])))			--get string length of value of this entry
			if l > entries["blue"][e].str_length then												--if the string length is larger than the previous
				entries["blue"][e].str_length = l													--make it the new length (find the largest)
				entries["red"][e].str_length = l													--make it the new length (find the largest)
			end
		end
		for n = 1, #entries["red"][e].values do														--iterate through values of this entry
			local l = ReplaceTypeName(string.len(tostring(entries["red"][e].values[n])))			--get string length of value of this entry
			if l > entries["red"][e].str_length then												--if the string length is larger than the previous
				entries["blue"][e].str_length = l													--make it the new length (find the largest)
				entries["red"][e].str_length = l													--make it the new length (find the largest)
			end
		end
	end
		
	--build list
	for side_name,side in pairs(entries) do															--iterate through sides in oob_air
		if side_name == "blue" then
			s = s .. "Blue Air Units:\n"															--side header
		else
			s = s .. "Red Air Units:\n"																--side header
		end
		
		--build the list header
		for e = 1, #entries[side_name] do															--iterate through entries
			s = s .. entries[side_name][e].header													--add header
			if e < #entries[side_name] then															--if this is not the last header, add spaces to the next header	
				local space = entries[side_name][e].str_length + 5 - string.len(entries[side_name][e].header)		--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
				for m = 1, space do															
					s = s .. " "																	--add one space for every missing letter
				end
			end
		end
		s = s .. "\n"
	
		--build the list		
		for n = 1, #entries[side_name][1].values do													--iterate through number of values (number of units)
			for e = 1, #entries[side_name] do														--iterate through entries
				s = s .. entries[side_name][e].values[n]											--add value to list
				if e < #entries[side_name] then														--if this is not the last header, add spaces to the next header	
					local space = entries[side_name][e].str_length + 5 - string.len(tostring(entries[side_name][e].values[n]))		--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
					for m = 1, space do													
						s = s .. " "																--add one space for every missing letter
					end
				end
			end
			s = s .. "\n"																			--make a new line after each unit
		end

		s = s .. "\n\n"																				--make a new line after each side
	end
	
	s = s ..  "------------------------------ AIR LOSS EVALUATION --------------------------------------------------------------------------\n"

	local statistic_losses = {
		
		["mission"] = {
			["delta_loss"] = 0,
			["delta_loss_cost"] = 0,
			["delta_loss_perc"] = 0,
			["delta_loss_cost_perc"] = 0,
			["winner"] = "tie",
		 },
		["total"] = { 
			["delta_loss"] = 0,
			["delta_loss_cost"] = 0,
			["delta_loss_perc"] = 0,
			["delta_loss_cost_perc"] = 0,
			["winner"] = "tie",
		},		
	}

	statistic_losses.mission.delta_loss_cost = air_loss_data.blue.last_mission.aircraft_cost - air_loss_data.red.last_mission.aircraft_cost
	statistic_losses.mission.delta_loss = air_loss_data.blue.last_mission.aircraft_qty - air_loss_data.red.last_mission.aircraft_qty

	if statistic_losses.mission.delta_loss_cost > 0 then
		statistic_losses.mission.winner = "Red"

		if air_loss_data.red.last_mission.aircraft_cost > 0 then 
			statistic_losses.mission.delta_loss_cost_perc = math.ceil( statistic_losses.mission.delta_loss_cost * 100 / air_loss_data.red.last_mission.aircraft_cost )
			statistic_losses.mission.delta_loss_perc = math.ceil( statistic_losses.mission.delta_loss * 100 / air_loss_data.red.last_mission.aircraft_qty )
		else
			statistic_losses.mission.delta_loss_cost_perc = "- "
			statistic_losses.mission.delta_loss_perc = "- "
		end
		
	elseif statistic_losses.mission.delta_loss_cost < 0 then
		statistic_losses.mission.winner = "Blue"

		if air_loss_data.blue.last_mission.aircraft_cost > 0 then 
			statistic_losses.mission.delta_loss_cost_perc = math.ceil( -statistic_losses.mission.delta_loss_cost * 100 / air_loss_data.blue.last_mission.aircraft_cost )
			statistic_losses.mission.delta_loss_perc = math.ceil( -statistic_losses.mission.delta_loss * 100 / air_loss_data.blue.last_mission.aircraft_qty )
		else
			statistic_losses.mission.delta_loss_cost_perc = "- "
			statistic_losses.mission.delta_loss_perc = "- "
		end
		
	end

	statistic_losses.total.delta_loss_cost = air_loss_data.blue.total.aircraft_cost - air_loss_data.red.total.aircraft_cost
	statistic_losses.total.delta_loss = air_loss_data.blue.total.aircraft_qty - air_loss_data.red.total.aircraft_qty

	if statistic_losses.total.delta_loss_cost > 0 then
		statistic_losses.total.winner = "Red"

		if air_loss_data.red.total.aircraft_cost > 0 then 
			statistic_losses.total.delta_loss_cost_perc = math.ceil( statistic_losses.total.delta_loss_cost * 100 / air_loss_data.red.total.aircraft_cost )
			statistic_losses.total.delta_loss_perc = math.ceil( statistic_losses.total.delta_loss * 100 / air_loss_data.red.total.aircraft_qty )
		else
			statistic_losses.total.delta_loss_cost_perc = "- "
			statistic_losses.total.delta_loss_perc = "- "
		end
		
		
	elseif statistic_losses.total.delta_loss_cost < 0 then
		statistic_losses.total.winner = "Blue"

		if air_loss_data.blue.total.aircraft_cost > 0 then 
			statistic_losses.total.delta_loss_cost_perc = math.ceil( -statistic_losses.total.delta_loss_cost * 100 / air_loss_data.blue.total.aircraft_cost )
			statistic_losses.total.delta_loss_perc = math.ceil( -statistic_losses.total.delta_loss * 100 / air_loss_data.blue.total.aircraft_qty )
		else
			statistic_losses.total.delta_loss_cost_perc = "- "
			statistic_losses.total.delta_loss_perc = "- "
		end
		
	end


	s = s .. " - Blue Loss:\n   - last mission: aircraft lost: " ..  air_loss_data["blue"].last_mission.aircraft_qty .. ", cost: " .. air_loss_data["blue"].last_mission.aircraft_cost .."\n   - total campaign: aircraft lost: " .. air_loss_data["blue"].total.aircraft_qty .. ", cost: " .. air_loss_data["blue"].total.aircraft_cost .. "\n\n"
	s = s .. " - Red Loss:\n   - last mission: aircraft lost: " ..  air_loss_data["red"].last_mission.aircraft_qty .. ", cost: " .. air_loss_data["red"].last_mission.aircraft_cost .."\n   - total campaign: aircraft lost: " .. air_loss_data["red"].total.aircraft_qty .. ", cost: " .. air_loss_data["red"].total.aircraft_cost .. "\n\n"
	s = s .. " - Loss Statistic:\n   - last mission: air winner: " ..  statistic_losses.mission.winner .. "\n   - blue-red delta loss: " .. statistic_losses.mission.delta_loss .. " ( " .. statistic_losses.mission.delta_loss_perc .. "% )" .. ", blue-red delta loss cost : " .. statistic_losses.mission.delta_loss_cost .. " ( " .. statistic_losses.mission.delta_loss_cost_perc .. "% )"  .. "\n\n"
	s = s .. "   - status campaign: Air Winner: " ..  statistic_losses.total.winner .. "\n   - blue-red delta loss: " .. statistic_losses.total.delta_loss .. " ( " .. statistic_losses.total.delta_loss_perc .. "% )" .. ", blue-red delta loss cost : " .. statistic_losses.total.delta_loss_cost .. " ( " .. statistic_losses.total.delta_loss_cost_perc .. "% )"  .. "\n\n"

	debriefing = debriefing .. s .. "\n\n"
end

	
-- Order of Battle Ground ---------------------------------------------------------------------------------- 
do
	local s = "Order of Battle (GROUND):\n-------------------------\n\n"
	
	for side_name,side in pairs(targetlist) do														--iterate through sides in targetlist
		if side_name == "blue" then																	--owner of the target is the opposite of targetlist side
			s = s .. "Red Ground Assets:\n"															--side header
		else
			s = s .. "Blue Ground Assets:\n"														--side header
		end
		
		--put targetlist in array and sort
		local sort_table = {}																		--array to sort the targetlist
		for k,v in pairs(side) do
			table.insert(sort_table, k)																--insert key into sort table
		end
		table.sort(sort_table)																		--sort the table
		
		--define list entries
		local entries = {
			[1] = {
				header = "",
				values = {},
			},
			[2] = {
				header = "",
				values = {},
			},
			[3] = {
				header = "",
				values = {},
			},
		}
		
		--add list values
		for i, v in ipairs(sort_table) do															--iterate through sort table
			if side[v].inactive ~= true then														--target is active
				if side[v].hidden == nil or side[v].hidden == false then							--target is not hidden
					if side[v].alive then															--if target has an alive value it is a scenery, vehicle or ship target and should be listed
						table.insert(entries[1].values, v)										
						table.insert(entries[2].values, math.ceil(side[v].alive) .. "%")
						if side[v].dead_last > 0 then
							table.insert(entries[3].values, "(-" .. math.ceil(side[v].dead_last) .. "%)")
						else
							table.insert(entries[3].values, "")
						end
					end
				end
			end
		end

		--determine maximum string length for each entry
		for e = 1, #entries do																		--iterate through entries
			entries[e].str_length = string.len(entries[e].header)									--store string length of header for this entry
			for n = 1, #entries[e].values do														--iterate through values of this entry
				local l = string.len(tostring(entries[e].values[n]))								--get string length of value of this entry
				if l > entries[e].str_length then													--if the string length is larger than the previous
					entries[e].str_length = l														--make it the new length (find the largest)
				end
			end
		end
		
		--build the list header
		--[[for e = 1, #entries do																		--iterate through entries
			s = s .. entries[e].header																--add header
			if e < #entries then																	--if this is not the last header, add spaces to the next header	
				local space = entries[e].str_length + 3 - string.len(entries[e].header)				--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
				for m = 1, space do															
					s = s .. " "																	--add one space for every missing letter
				end
			end
		end
		s = s .. "\n"--]]
	
		--build the list		
		for n = 1, #entries[1].values do															--iterate through number of values (number of units)
			for e = 1, #entries do																	--iterate through entries
				s = s .. entries[e].values[n]														--add value to list
				if e < #entries then																--if this is not the last header, add spaces to the next header	
					local space = entries[e].str_length + 3 - string.len(tostring(entries[e].values[n]))	--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
					for m = 1, space do													
						s = s .. " "																--add one space for every missing letter
					end
				end
			end
			s = s .. "\n"																			--make a new line after each unit
			if targetlist[side_name][entries[1].values[n]].expand then												--target should be displayed with expanded elements
				if targetlist[side_name][entries[1].values[n]].elements then										--target has elements
					for e = 1, #targetlist[side_name][entries[1].values[n]].elements do								--iterate through elements
						local element_name = targetlist[side_name][entries[1].values[n]].elements[e].name
						s = s .. "   - " .. element_name															--add element
						if camp.ShipHealth and camp.ShipHealth[element_name] then									--ship has a health entry
							local space = entries[1].str_length - string.len(tostring("   - " .. element_name))		--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
							for m = 1, space do													
								s = s .. " "																		--add one space for every missing letter
							end
							if camp.ShipHealth[element_name] == 0 then									--ship is sunk
								s = s .. "   (sunk)"
							elseif camp.ShipHealth[element_name] < 33 then								--ship has less than 33% health
								s = s .. "   (heavy damage)"
							elseif camp.ShipHealth[element_name] < 66 then								--ship has less than 66% health
								s = s .. "   (moderate damage)"
							elseif camp.ShipHealth[element_name] < 100 then								--ship has less than 100% health
								s = s .. "   (light damage)"
							end
						end
						s = s .. "\n"
					end
				end
			end
		end

		s = s .. "\n\n"																				--make a new line after each side
	end
	
	debriefing = debriefing .. s .. "\n"
end

debriefing =  debriefing .. reportLogisticStatus(supply_tab, airbase_tab) .. "\n"

-- Clien scoreboard ---------------------------------------------------------------------------------- 
do
	local s = "Scoreboard:\n-----------\n\n"														--make lists of player scoreboard
	
	--define list entries
	local entries = {
		[1] = {
			header = "Name",
			values = {},
		},
		[2] = {
			header = "Missions",
			values = {},
		},
		[3] = {
			header = "Kills Air",
			values = {},
		},
		[4] = {
			header = "Kills Ground",
			values = {},
		},
		[5] = {
			header = "Kills Ship",
			values = {},
		},
		[6] = {
			header = "Crashed",
			values = {},
		},
		[7] = {
			header = "Ejected",
			values = {},
		},
		[8] = {
			header = "Dead",
			values = {},
		},
	}

	--add list values
	for clientname,client in pairs(clientstats) do												--iterate through clients
		table.insert(entries[1].values, clientname)
		if client.score_last.mission > 0 then
			table.insert(entries[2].values, client.mission .. " (+" .. client.score_last.mission .. ")")
		else
			table.insert(entries[2].values, client.mission)
		end
		if client.score_last.kills_air > 0 then
			table.insert(entries[3].values, client.kills_air .. " (+" .. client.score_last.kills_air .. ")")
		else
			table.insert(entries[3].values, client.kills_air)
		end
		if client.score_last.kills_ground > 0 then
			table.insert(entries[4].values, client.kills_ground .. " (+" .. client.score_last.kills_ground .. ")")
		else
			table.insert(entries[4].values, client.kills_ground)
		end
		if client.score_last.kills_ship > 0 then
			table.insert(entries[5].values, client.kills_ship .. " (+" .. client.score_last.kills_ship .. ")")
		else
			table.insert(entries[5].values, client.kills_ship)
		end
		if client.score_last.crash > 0 then
			table.insert(entries[6].values, client.crash .. " (+" .. client.score_last.crash .. ")")
		else
			table.insert(entries[6].values, client.crash)
		end
		if client.score_last.eject > 0 then
			table.insert(entries[7].values, client.eject .. " (+" .. client.score_last.eject .. ")")
		else
			table.insert(entries[7].values, client.eject)
		end
		if client.score_last.dead > 0 then
			table.insert(entries[8].values, client.dead .. " (+" .. client.score_last.dead .. ")")
		else
			table.insert(entries[8].values, client.dead)
		end
	end
	
	--determine maximum string length for each entry
	for e = 1, #entries do																		--iterate through entries
		entries[e].str_length = string.len(entries[e].header)									--store string length of header for this entry
		for n = 1, #entries[e].values do														--iterate through values of this entry
			local l = string.len(tostring(entries[e].values[n]))								--get string length of value of this entry
			if l > entries[e].str_length then													--if the string length is larger than the previous
				entries[e].str_length = l														--make it the new length (find the largest)
			end
		end
	end
	
	--build the list header
	for e = 1, #entries do																		--iterate through entries
		s = s .. entries[e].header																--add header
		if e < #entries then																	--if this is not the last header, add spaces to the next header	
			local space = entries[e].str_length + 5 - string.len(entries[e].header)				--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
			for m = 1, space do															
				s = s .. " "																	--add one space for every missing letter
			end
		end
	end
	s = s .. "\n"

	--build the list		
	for n = 1, #entries[1].values do															--iterate through number of values (number of units)
		for e = 1, #entries do																	--iterate through entries
			s = s .. entries[e].values[n]														--add value to list
			if e < #entries then																--if this is not the last header, add spaces to the next header	
				local space = entries[e].str_length + 5 - string.len(tostring(entries[e].values[n]))	--calculate number of spaces that need to be added for alignement (string length of largest entry of same type + 3 - length of current entry = number of spaces)
				for m = 1, space do													
					s = s .. " "																--add one space for every missing letter
				end
			end
		end
		s = s .. "\n"																			--make a new line after each unit
	end
	
	debriefing = debriefing .. s
end