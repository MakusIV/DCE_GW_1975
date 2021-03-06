--To put vehicles and ships from ground OOB into next mission
--Initiated by MAIN_NextMission.lua
-------------------------------------------------------------------------------------------------------


--M33.f frequence des FARP selon db_airbase

for coal_name,coal in pairs(oob_ground) do												--go through sides(red/blue)	
	for country_n,country in ipairs(coal) do											--go through countries
		if country.static then															--country has ships
			for group_n,group in ipairs(country.static.group) do							--go through groups
				for n = 1, #group.units do												--ship group found
					if group.units[n].type == 'FARP' then
					end
					if group.units[n].type == 'FARP' and db_airbases[group.units[n].name] and db_airbases[group.units[n].name].ATC_frequency then
						group.units[n].heliport_frequency = db_airbases[group.units[n].name].ATC_frequency
					end
				end
			end
		end
	end
end


mission.coalition.blue.country = deepcopy(oob_ground.blue)											--copy blue oob into mission
mission.coalition.red.country = deepcopy(oob_ground.red)											--copy red oob into mission

--iterate through all vehicles and ships to remove those marked as dead during previous debriefings (static objects need not be removed, as these are spawned in a destroyed state)
for k1,v1 in pairs(mission.coalition) do															--side table(red/blue)	
	for k2,v2 in pairs(v1.country) do																--country table (number array)
		if v2.vehicle then																			--if country has vehicles
			local n = 1
			local nEnd = #v2.vehicle.group
			repeat																					--groups table (number array)
				local m = 1
				local mEnd = #v2.vehicle.group[n].units
				repeat																				--units table (number array)
					if v2.vehicle.group[n].units[m].dead then
						
						--dead units are replaced by dead static objects
						if v2.static == nil then													--country table has no other static objects
							v2.static = {															--create static objects table
								group = {}															--create group subtable
							}
						end
						
						local dead_static_group = {													--define dead static group to replace dead unit 
							["heading"] = v2.vehicle.group[n].units[m].heading,						--set static group heading according to dead unit
							["route"] = {
								["points"] = 
								{
									[1] = 
									{
										["alt"] = 0,
										["type"] = "",
										["name"] = "",
										["y"] = v2.vehicle.group[n].units[m].y,
										["speed"] = 0,
										["x"] = v2.vehicle.group[n].units[m].x,
										["formation_template"] = "",
										["action"] = "",
									},
								},
							},
							["groupId"] = GenerateID(),
							["hidden"] = true,
							["units"] = {
								[1] = {
									["category"] = "Unarmed",
									["canCargo"] = false,
									["type"] = v2.vehicle.group[n].units[m].type,
									["unitId"] = GenerateID(),
									["y"] = v2.vehicle.group[n].units[m].y,
									["x"] = v2.vehicle.group[n].units[m].x,
									["name"] = v2.vehicle.group[n].units[m].name,
									["heading"] = v2.vehicle.group[n].units[m].heading,
								},
							},
							["y"] = v2.vehicle.group[n].units[m].y,
							["x"] = v2.vehicle.group[n].units[m].x,
							["name"] = "Dead Static " .. v2.vehicle.group[n].units[m].name,
							["dead"] = true,
						}
						table.insert(v2.static.group, dead_static_group)							--add group to static table
						
						--remove dead unit from vehicle table
						if #v2.vehicle.group[n].units == 1 then										--if group has only one unit
							table.remove(v2.vehicle.group, n)										--remove group of dead unit from group table
							n = n - 1
							nEnd = nEnd - 1
						else
							table.remove(v2.vehicle.group[n].units, m)								--remove dead unit from units table
							v2.vehicle.group[n].route.points[1].x = v2.vehicle.group[n].units[1].x	--update group position to position of first units
							v2.vehicle.group[n].route.points[1].y = v2.vehicle.group[n].units[1].y	--update group position to position of first units
							m = m - 1
							mEnd = mEnd - 1
						end
					end
					m = m + 1
				until m > mEnd
				n = n + 1
			until n > nEnd
		end
		if v2.ship then																				--if country has ships
			local n = 1
			local nEnd = #v2.ship.group
			repeat																					--groups table (number array)
				local m = 1
				local mEnd = #v2.ship.group[n].units
				repeat																				--units table (number array)	
					if v2.ship.group[n].units[m].dead then
						if #v2.ship.group[n].units == 1 then										--if group has only one unit
							table.remove(v2.ship.group, n)											--remove group of dead unit from group table
							n = n - 1
							nEnd = nEnd - 1
						else
							table.remove(v2.ship.group[n].units, m)									--remove dead unit from units table
							m = m - 1
							mEnd = mEnd - 1
						end
					end
					m = m + 1
				until m > mEnd
				n = n + 1
			until n > nEnd
		end
	end
end


--disable carriers as air bases if they are damaged, destroyed or do not have a 100% probability
for basename,base in pairs(db_airbases) do															--iterate through airbases
	if base.unitname then																			--if airbase is a carrier, find the unit in the OOB Ground
		for coal_name,coal in pairs(oob_ground) do													--go through sides(red/blue)	
			for country_n,country in ipairs(coal) do												--go through countries
				if country.ship then																--country has ships
					for groupn,group in pairs(country.ship.group) do								--group table
						for unitn,unit in pairs(group.units) do										--units table
							if unit.name == base.unitname then										--respective unit found
								if unit.dead or (camp.ShipHealth and camp.ShipHealth[unit.name] and camp.ShipHealth[unit.name] < 66) or (group.probability and group.probability < 1) then	 --unit is dead, damaged or its group has a probability that is not 100%
									base.x = nil													--remove base coordinates to prevent sortie generation from this abse
									base.y = nil
								end
							end
						end
					end
				end
			end
		end
	end
end

