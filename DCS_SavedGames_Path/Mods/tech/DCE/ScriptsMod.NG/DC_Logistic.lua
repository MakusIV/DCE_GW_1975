--[[


Aircraft resupply (ready aircraft) depends from damage level of airbase and damage level of supply_line and supply_plant

The supply infrastructure logic:

supply plant --- supplies ---->|----> supply line A -- supplies---> |--> airbase 1
                               |                                    |--> airbase 3
                               |                                    |--> airbase 5
                               |
                               |----> supply line B -- supplies---> |--> airbase 2
							   |                                    |--> airbase 5
							   |
                               |----> supply line C -- supplies---> |--> airbase 2

calculus:
aircraft.ready = expected.aircraft.ready * ( 2^( airbase.efficiency * k ) -1 ). k: defined by user for balance
airbase.efficiency = airbase.integrity * airbase.supply
airbase.supply = max( supply_plant.integrity * supply_line.integrity )
supply_plant.integrity, supply_line.integrity and airbase.integrity are alive/100 values defined for specific asset

This module use two new table: airbase_tab and supply_tab.
airbase_tab include airbases with aircraft_type and efficiency values: property used for number of aircraft avalaibility calculation.
airbase_tab is automatically created, used and saved (/Active) during mission generation.
supply_tab is loaded initially from supply_tab_init.lua file (/Init), used and saved (/Active) during mission generation.
supply_tab define association from airbase and supply asset: supply_line, supply_plant).
The Campaign Creator must define the supply_tab_init using targets presents in targetlist table and airbases presents in oob_air.
Important: the names of the airbases must be the same as those used in the oob_air. The names of the airbases defined in targetlist must be
the same as those used in oob_air, eventually with the addition of " Airbase" or " FARP".
For example: oob_air[<n>].base = "Mozdok", supply_tab[][][][airbases_supply]["Mozdok"], targetlist[]["Mozdok"] or targetlist[]["Mozdok Airbase"]

]]

-- airbase_tab structure example
--[[
airbase_tab = {

    [blue]
        [base_1] = {
            ["aircraft_types"]
                [aircraft_1] true
                [aircraft_2] true
            ["efficiency"] 0.72
            ["integrity"] 0.8
            ["supply"] 0.9

        --......
    [red]
        [base_n]
            --......
        }
}
]]

-- supply_tab structure example
--[[
-- this definition of supply_tab is dedicated for development enviroment
supply_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--      supply plant
			['integrity'] = 0.8, --           supply plant integrity
			['supply_line_names'] = {          table of supply lines supplyed by supply plant
				['Bridge Alagir MN 36'] = {   supply line
					['integrity'] = 0.5,      integrity of supply line
					['airbase_supply'] = {    table of airbases supplyd by supply line
						['Beslan'] = true,    test info: Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
						['Mozdok'] = true,
					},
				},
				['Bridge South Beslan MN 68'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Beslan'] = true,
						['Nalchik'] = true,
						['Sochi-Adler'] = true,
					},
				},
			},
		},
		['Mineralnye-Vody Airbase'] = {
			['integrity'] = 0.6,
			['supply_line_names'] = {
				['Rail Bridge SE Mayskiy MP 23'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Sochi-Adler'] = true,
						['Beslan'] = true,
					},
				},
				['Bridge South Elhotovo MN 39'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Reserves'] = true,
						['Sochi-Adler'] = true,
						['Maykop-Khanskaya'] = true,
						['Nalchik'] = true,
						['Mozdok'] = true,
						['Beslan'] = true,
						['Mineralnye-Vody'] = true,
					},
				},
			},
		},
		['101 EWR Site'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Russian Convoy 1'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Mineralnye-Vody'] = true,
					},
				},
				['Bridge SW Kardzhin MN 49'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Reserves'] = true,
						['Sochi-Adler'] = true,
						['Mineralnye-Vody'] = true,
						['Beslan'] = true,
						['Mozdok'] = true,
					},
				},
			},
		},
	},
	['blue'] = {
		['Sukhumi Airbase Strategics'] = {
			['integrity'] = 0.4,
			['supply_line_names'] = {
				['Rail Bridge Grebeshok-EH99'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Vaziani'] = true,
					},
				},
				['Bridge Anaklia-GG19'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Senaki-Kolkhi'] = true,
						['Batumi'] = true,
						['Reserves'] = true,
					},
				},
			},
		},
		['Novyy Afon Train Station - FH57'] = {
			['integrity'] = 0.8,
			['supply_line_names'] = {
				['Bridge Tagrskiy-FH08'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Batumi'] = true,
					},
				},
				['Bridge Nizh Armyanskoe Uschele-FH47'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Vaziani'] = true,
						['Senaki-Kolkhi'] = true,
						['Reserves'] = true,
					},
				},
			},
		},
	},
}

]]


--[[
-- this definition of supply_tab is for testing in an active campaign running in DCS dedicated server enviroment
-- don't use in developement enviroment
supply_tab = {
	['blue'] = {
		['EWR-1'] = {
			['integrity'] = 0.8,
			['supply_line_names'] = {
				['EAU East Front Convoy 1'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Al Maktoum Intl'] = true,
						['Sharjah Intl'] = true
					}
				},
				['US Army ELINT Station'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Dubai Intl'] = true,
						['Reserves'] = true,
						['Jazirat al Hamra FARP'] = true
					}
				}
			}
		},
		['EWR-2'] = {
			['integrity'] = 0.4,
			['supply_line_names'] = {
				['EAU West Front Convoy 2'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Reserves'] = true,
						['LHA_Nassau'] = true,
						['Al Dhafra AB'] = true
					}
				},
				['US Army ELINT Station 2'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['LHA_Tarawa'] = true,
						['Dubai Intl'] = true
					}
				}
			}
		},
    ['EWR-3'] = {
      ['integrity'] = 0.4,
      ['supply_line_names'] = {
        ['EAU West Front Convoy 3'] = {
          ['integrity'] = 0.5,
          ['airbase_supply'] = {
            ['Reserves'] = true,
            ['LHA_Nassau'] = true,
            ['LHA_Tarawa'] = true
          }
        },
        ['EAU West Front Convoy 1'] = {
          ['integrity'] = 0.25,
          ['airbase_supply'] = {
            ['Jazirat al Hamra FARP'] = true,
            ['Reserves'] = true
          }
        }
      }
    }
	},
	['red'] = {
		['EWR 1'] = {
			['integrity'] = 0.8,
			['supply_line_names'] = {
				['Mountain Iranian convoy 4'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Shiraz Intl'] = true,
						['Khasab'] = true
					}
				},
				['4th Iranian Transport fleet'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Bandar e Jask airfield'] = true,
						['Qeshm Island'] = true
					}
				},
			}
		},
		['EWR 2'] = {
			['integrity'] = 0.4,
			['supply_line_names'] = {
				['2nd Iranian Transport fleet'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Bandar Abbas Intl'] = true,
						['Al Ima FARP'] = true,
						['Sirri Island'] = true
					}
				},
				['5th Iranian Transport fleet'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Lar Airbase'] = true,
						['Reserves'] = true
					}
				}
			}
		},
    ['EWR 3'] = {
      ['integrity'] = 0.4,
      ['supply_line_names'] = {
        ['Iranian West frontline convoy 1'] = {
          ['integrity'] = 0.25,
          ['airbase_supply'] = {
            ['Reserves'] = true
          }
        },
        ['Iranian West frontline convoy 2'] = {
          ['integrity'] = 0.5,
          ['airbase_supply'] = {
            ['Lar Airbase'] = true,
            ['Reserves'] = true
          },
        }
      }
    }
	}
}
]]




--[[

DCE IMPLEMENTATION INFO

new file:

Active/: DC_Logistic.lua --marco
Init/: supply_tab_init.lua --defined by campaign's maker

file modified:

DEBRIEF_Master.lua:
94 --=====================  start marco implementation ==================================
95
96 --run logistic evalutation and save supply_tab
97 dofile("../../../ScriptsMod."..versionPackageICM.."/DC_Logistic.lua")--mark
98 UpdateOobAir()
99
100 --=====================  end marco implementation ==================================

BAT_FirstMission.lua:
84 --====================  start marco implementation ==================================
85
86 dofile("Init/supply_tab_init.lua")
87 local tgt_str = supply_tab .. " = " .. TableSerialization(supply_tab, 0)
88 local tgtFile = nil
89 tgtFile = io.open("Active/" .. supply_tab .. ".lua", "w")
90 tgtFile:write(tgt_str)
91 tgtFile:close()
92
93 --=====================  end marco implementation ==================================

]]




local executeTest = false
local update_ready = false

if executeTest then
  print("TEST EXECUTING\n")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Init/db_airbases.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/targetlist.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/oob_air.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/supply_tab.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/ScriptsMod.NG/UTIL_Functions.lua")

else
  dofile("Init/db_airbases.lua")
  dofile("Active/targetlist.lua")
  dofile("Active/oob_air.lua")
  dofile("Active/supply_tab.lua")
  dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Functions.lua")

end




-- Utility function

-- dump a table
--from: https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- copy the supply_tab from Init folder
--from: https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
local function copySupplyTab()

    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Init/supply_tab_init.lua")
    local tgt_str = "supply_tab = " .. TableSerialization(supply_tab, 0)
    local tgtFile = nil
    tgtFile = io.open("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/supply_tab.lua", "w")
    tgtFile:write(tgt_str)
    tgtFile:close()

    return true

end

-- table lenght
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end




  -- Logistic function

-- Initialize the airbase_tab by defining the planes operating in the airbase
-- OK
local function InitializeAirbaseTab()

    for side, index in pairs(oob_air) do-- iterate oob_air for take aircraft type in an airbase

        for index_value, oob_value in pairs(index) do
            aircraft_type = oob_value.type
            group_name = oob_value.name
            airbase_name = oob_value.base

            if airbase_name == "Reserves" then
                airbase_name = airbase_name .. "-" .. group_name
            end

            --print(side, airbase_name, aircraft_type)

            if airbase_tab == nil then
                --print("airbase_tab is nil\n")
                airbase_tab = {
                    [side] = {
                        [airbase_name] = {
                            ["aircraft_types"] = {
                                [aircraft_type] = group_name,
                            },
                            ["efficiency"] = 1, -- efficiency_<airbase> = ( damage_<airbase>  / 100 ) * energy_<airbase>; ( 0: min - 1: max )
                            ["integrity"] = 1, -- same of targetlist.alive
                            ["supply"] = 1 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

                        }
                    }
                }
                --print("\n--->: " .. dump(airbase_tab).. " <----\n")

            elseif airbase_tab[side] == nil then
                airbase_tab[side] = {
                    [airbase_name] = {
                        ["aircraft_types"] = {
                            [aircraft_type] = group_name,
                        },
                        ["efficiency"] = 1, -- efficiency_<airbase> = ( damage_<airbase>  / 100 ) * energy_<airbase>; ( 0: min - 1: max )
                        ["integrity"] = 1, -- same of targetlist.alive
                        ["supply"] = 1 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

                    }
                }

            else
                --print("airbase_tab is not nil\n")
                --print("oob_air airbase_name: " .. side .. " " .. airbase_name .. "\n")

                if airbase_tab[side][airbase_name] then
                    --print("airbase: " .. side .. " " .. airbase_name .." exists in airbase_tab\n")

                        if airbase_tab[side][airbase_name].aircraft_types[aircraft_type] == nil then
                            --print("oob_air aircraft type: " .. aircraft_type .. " --> not exixst aircraft, insert in airbase_tab.\n")
                            airbase_tab[side][airbase_name].aircraft_types[aircraft_type] = group_name
                        end
                else
                    --print("airbase not exists in airbase_tab\n")
                    airbase_tab[side][airbase_name] =  { -- insert new airbase, initializa property and assign aircraft
                        ["aircraft_types"] = { [aircraft_type] = group_name },-- insert new airbase and assign aircraft
                        ["efficiency"] = 1, -- efficiency_<airbase>  1 = max, 0 = min
                        ["integrity"] = 1, -- same of targetlist.alive 1 = max, 0 = min (full damage)
                        ["supply"]= 1 -- supply_<airbase> 1 = max, 0 = min
                    }
                end
                --print("\n--->: " .. dump(airbase_tab).. " <----\n")
            end
        end
    end

	return airbase_tab
end

-- Update the integrity property for supply plant in supply_tab, by using property alive in targetlist
-- OK
local function UpdateSupplyPlantIntegrity( sup_tab )

    -- note: supply Plant are defined in supply_tab and also in targetlist like targets

    for sidepw, side_val in pairs( sup_tab ) do

        for supply_plant_name, supply_plant_values in pairs( side_val ) do -- iteration of supply plants in supply_tab

            for side, targets in pairs( targetlist ) do -- iteration of side in targetlist tab

                for target_name, target_value in pairs( targets ) do -- iteration of targets from a single side
                    --print("sup tab side: " .. sidepw .. " - " .. "sup_pl_name: " .. supply_plant_name .. " - " .. "targlist side: " .. side .. " - " .. "target name: " .. target_name .. "\n")
                    --print("sup tab integrity: " .. supply_plant_values['integrity'] .. " - " .. "target_value[\"alive\"]: " .. tostring( target_value['alive']) .. "\n")

                    if supply_plant_name ==  target_name then  -- update integrity value of an supply plant using alive target property
                        --print( dump( target_value ) .. "\n")
                        supply_plant_values.integrity = target_value.alive / 100 -- normalize integrity from 0 to 1
                        -- eventuale codice per terminare l'iterazione
                    end

                end
            end
        end
    end
	return sup_tab
end

-- Update the integrity property for supply line in supply_tab, by using property alive in targetlist
-- OK
local function UpdateSupplyLineIntegrity( sup_tab )

    -- note: supply Line are defined in supply_tab and also in targetlist like targets

    for sidepw, side_val in pairs( sup_tab ) do

        for supply_plant_name, supply_plant_values in pairs( side_val ) do -- iteration of supply plants in supply_tab

            for supply_line_name, supply_line_values in pairs( supply_plant_values.supply_line_names ) do-- iteration of supply lines from a single supply_tab

                for side, targets in pairs( targetlist ) do-- iteration of blue and red side in targetlist tab

                    for target_name, target_value in pairs( targets ) do -- iteration of targets from a single side

                        if supply_line_name == target_name then -- update integrity value of an supply line using alive target property
                            supply_line_values.integrity = target_value.alive / 100 -- normalize integrity from 0 to 1
                        end
                    end
                end
            end
        end
    end
	return sup_tab
end


-- Update the supply property in airbase_tab using integrity property from supply_tab
-- OK
local function UpdateSupplyAirbase( airb_tab, sup_tab )

    for side_base, side_values in pairs( airb_tab ) do

        for base_name, base_values in pairs( side_values ) do

            for supply_plant_name, supply_plant_values in pairs( sup_tab[side_base] ) do

                for supply_line_name, supply_line_values in pairs( supply_plant_values.supply_line_names ) do

                    for airbase_name, airbase_values in pairs( supply_line_values.airbase_supply ) do
                        --print("air_tab.airbase: " .. base_name .. ", supply_line.airbase: " .. airbase_name .. "\n")
                        --print("supply_plant: " .. supply_plant_name .. ", supply_line_name: " .. supply_line_name .. "\n")

                        if base_name == airbase_name then
                            -- print("side: " .. side_base .. " air_tab.airbase: " .. base_name .. ", supply_line.airbase: " .. airbase_name .. "\n")
                            local supply = supply_plant_values.integrity * supply_line_values.integrity  -- update supply value of an airbase
                            --print("air_tab.airbase.supply: " .. base_values.supply .. ", calculated supply: " .. supply .. "\n")
                            --print("supply_plant_values.integrity: " .. supply_plant_values.integrity .. ", supply_line_values.integrity: " .. supply_line_values.integrity .. ", calculated supply: " .. supply .. "\n")

                            if ( base_values.supply == 1 and supply > 0 ) or ( supply > base_values.supply ) then -- select supply value from highest supply supply integrity calculated
                                --print("air_tab.supply ==1 or calculated supply > air_tab.supply(" .. base_values.supply .. ") --> update air_tab.supplyt: air_tab.supply = supply(" .. supply .. ") \n")
                                base_values.supply  = supply
                            end
                        end
                    end
                end
            end
        end
    end
	return airb_tab
end

-- Update the integrity property in airbase_tab using alive property from targetlist
-- OK
local function UpdateAirbaseIntegrity( airb_tab )

    for side, side_values in pairs( airb_tab ) do

        local target_side = "red"

        if side == "red" then
            target_side = "blue"
        end

        for base, airbase_values in pairs( side_values ) do

            -- base = base .." Airbase" or " FARP"
            for target_name, target_value in pairs( targetlist[target_side] ) do
                --print("airbase_tab airbase: " .. base .. ", targetlist airbase: " .. target_name .. "\n")

                if target_name == base or target_name  == base .. " Airbase" or  target_name == base .. " FARP" or  target_name == "FARP " .. base then
                    --print("==============================\nairbase_tab airbase == targetlist airbase\n==============================\n")
                    --print("airbase_tab airbase: " .. base .. ", targetlist airbase: " .. target_name .. "\n")
                    --print("airbase_tab integrity: " .. airbase_values.integrity .. " ---> " .. target_value.alive / 100 .. "\n")
                    airbase_values.integrity = target_value.alive / 100
                    break
                end
            end
       end
    end
	return airb_tab
end

-- Update the airbase efficiency property in airbase_tab
-- OK
local function UpdateAirbaseEfficiency( airb_tab )

	for side, side_val in pairs( airb_tab ) do

		for base, airbase_values in pairs( side_val ) do
			airbase_values.efficiency = airbase_values.integrity * airbase_values.supply
			--print("airbase: " .. base  .. "\n" )
			--print("airbase_values.integrity: " .. airbase_values.integrity .. ", " .. "airbase_values.supply: " ..  airbase_values.supply .. ", " .. "airbase_values.efficiency: " ..  ", " .. airbase_values.efficiency .. "\n" )
		end
  end
	return airb_tab
end

-- Update oob_air number property considering airbase efficiency property
function UpdateOobAir()

    local percentage_efficiency_influence_for_airbases = 100 -- (0 - 100) parameter to balance the influence property in the calculation of aircraft number for airbases
	local percentage_efficiency_influence_for_reserves = 100 -- (0 - 100) parameter to balance the influence property in the calculation of aircraft number for reserves
	airbase_tab = nil
    airbase_tab = InitializeAirbaseTab()



  if not executeTest then -- delete this condition in operative version and insert UpdatesupplyTestIntegrity in a new line
    UpdateSupplyPlantIntegrity( supply_tab )
    UpdateSupplyLineIntegrity( supply_tab )
  end

	airbase_tab = UpdateSupplyAirbase( airbase_tab, supply_tab )
	airbase_tab = UpdateAirbaseIntegrity( airbase_tab )
	airbase_tab = UpdateAirbaseEfficiency( airbase_tab )

	for side, index in pairs(oob_air) do -- iterate oob_air for take aircraft type in an airbase

        for index_value, oob_value in pairs(index) do
			--print("airbase_tab is not nil\n")
			--print("oob_air value: ", side, oob_value.base, oob_value.type, oob_value.roster.ready )
            local existed_airbase_name = oob_value.base .. "-" .. oob_value.name

            if airbase_tab[side][oob_value.base] then
                existed_airbase_name = oob_value.base
            end


			if existed_airbase_name then -- airbase name in oob_air exists in airbase_tab
				--print("airbase: " .. side .. " " .. existed_airbase_name .." exists in airbase_tab\n")

				if airbase_tab[side][existed_airbase_name].aircraft_types[oob_value.type] then --aircraft_type in oob_air exist in airbase_tab
					result = true
                    local percentage_efficiency_influence = nil

					if string.sub(oob_value.base, 1, 8) ~= "Reserves" then
                        percentage_efficiency_influence = percentage_efficiency_influence_for_airbases/100

                    else
                        percentage_efficiency_influence = percentage_efficiency_influence_for_reserves/100
                    end

                    --print("old airbase oob_value.number: " .. oob_value.number .."\n")
                    --print("airbase_tab[side][airbase_name].efficiency: " .. airbase_tab[side][existed_airbase_name].efficiency .. "\n")

                    ------ ELIMINARE SOSTITUNDO CON IL CRITERIO SCELTO PER UPDATE --------------
                    if update_ready then
                        local old_ready = oob_value.roster.ready
                        oob_value.roster.ready = math.floor( 0.5 + oob_value.roster.ready * ( 2^( airbase_tab[side][existed_airbase_name].efficiency * percentage_efficiency_effect ) - 1 ) )
                        local increment_lost = old_ready - oob_value.roster.ready
                        oob_value.roster.lost = oob_value.roster.ready + increment_lost

                    else
                        oob_value.number = math.floor( 0.5 + oob_value.number * ( 2^( airbase_tab[side][existed_airbase_name].efficiency * percentage_efficiency_influence ) - 1 ) )--  valutare l'opportunità di valutare il numero di aerei presenti nella base: tablelength( airbase_tab[side][existed_airbase_name].aircraft_types )
                        --print("new airbase oob_value.number: " .. oob_value.number .."\n")
                    end
                    -----------------------------------------------------------------------------
				else
					print("oob_air aircraft type: " .. oob_value.type .. " --> not exist in airbase_tab\n")
					result = false
				end

			else
				print( "airbase: " .. side .. " " .. airbase_name .. " not exists in airbase_tab\n" )
				result = false
			end
        end
	end
    -- print("\n--->: " .. dump(airbase_tab).. " <----\n")
	-- print("\n--->: " .. dump(oob_air).. " <----\n")
  SaveTabOnDisk( "airbase_tab", airbase_tab )
  SaveTabOnDisk( "supply_tab", supply_tab )

	return result
end


-- Save table on disk supply_tab.lua
function SaveTabOnDisk( table_name, table )
    local tgt_str = table_name .. " = " .. TableSerialization(table, 0)						    --make a string
    local tgtFile = nil

    if executeTest then
      tgtFile = io.open("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Test/" .. table_name .. ".lua", "w")	--open supply_tab file
    else
      tgtFile = io.open("Active/" .. table_name .. ".lua", "w")
    end

    tgtFile:write(tgt_str)																		--save new data
    tgtFile:close()
end







-- Test function

local function Test_InitializeAirbaseTab()

    --[[
    airbase_tab = {

        [base_1] = {
            ["aircraft_types"]
                [aircraft_1] true
                [aircraft_2] true
            ["efficiency"] 0.72 -- efficiency_<airbase> = ( damage_<airbase>  / 100 ) * energy_<airbase>; ( 0: min - 1: max )
            ["damage"] 0.8 -- same of targetlist.alive
            ["supply"] 0.9 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

        --......
        [base_n]
            --......
        }
    }
    ]]

    local airbase_tab = InitializeAirbaseTab()
	--print( dump( airbase_tab ) .. "\n")
	local result = true

	for side_base, side_values in pairs( airbase_tab ) do --

        for base_name, base_values in pairs( side_values ) do --
			--print( base_values["efficiency"] .. ", " .. base_values["integrity"] .. ", " .. base_values["supply"] .. "\n" )

			if base_values["efficiency"] ~= 1 or base_values["integrity"] ~= 1 or base_values["supply"] ~= 1 then

				result = false
				break;
			end

			if not result then
				break
			end
		end
	end

	if result then
		print("-------------------------> Test_InitalizeAirbaseAndAircraft(): true\n")
        SaveTabOnDisk("airbase_tab",  airbase_tab)
	else
		print("-------------------------> Test_InitalizeAirbaseAndAircraft(): false\n")
	end


    --for side, sideval in pairs(airbase_tab) do
        --print("\nside: " .. side .." ========================== \n")
        --for base_name, base_values in pairs(sideval) do
            --print("\nbase: " .. base_name .." ----------------------------- \n")
            --print("efficiency: " .. base_values.efficiency ..",  " .. "integrity: " .. base_values.integrity ..",  " .. "supply: " .. base_values.supply)

            --for aircraft_type, value in pairs(base_values.aircraft_types) do
                --print("\naircraft type: " .. aircraft_type ..",  value: " .. tostring(value) .."\n--------------------------------------\n")
            --end
        --end
    --end
	return result
end

local function Test_UpdateSupplyPlantIntegrity()

    local result = false
	local _supply_tab = UpdateSupplyPlantIntegrity( deepcopy( supply_tab ) )
	--print( dump( supply_tab) .. "\n"  )

    if _supply_tab.blue['Sukhumi Airbase Strategics'].integrity == 1 and _supply_tab.red["Mineralnye-Vody Airbase"].integrity == 1 then
        result = true
    end

    print("-------------------------> Test function UpdateSupplyPlantIntegrity(): " .. tostring(result) .."\n")


    return result
end

local function Test_UpdateSupplyLineIntegrity()

    local result = false
    local _supply_tab = UpdateSupplyLineIntegrity( deepcopy( supply_tab ) )

	--print( dump( supply_tab) .. "\n"  )

    if _supply_tab.blue["Sukhumi Airbase Strategics"]["supply_line_names"]['Rail Bridge Grebeshok-EH99'].integrity == 1 and _supply_tab.blue["Sukhumi Airbase Strategics"]["supply_line_names"]['Bridge Anaklia-GG19'].integrity == 1 and
    _supply_tab.blue["Novyy Afon Train Station - FH57"]["supply_line_names"]['Bridge Tagrskiy-FH08'].integrity == 1 and
    _supply_tab.red["Mineralnye-Vody Airbase"]["supply_line_names"]['Bridge South Elhotovo MN 39'].integrity == 1 and _supply_tab.red["Mineralnye-Vody Airbase"]["supply_line_names"]['Rail Bridge SE Mayskiy MP 23'].integrity == 1 and
    _supply_tab.red["Prohladniy Depot MP 24"]["supply_line_names"]['Bridge South Beslan MN 68'].integrity == 1 then
        result = true
    end

    print("-------------------------> Test function UpdateSupplyLineIntegrity(): " .. tostring(result) .."\n")

    --print( dump( supply_tab ) )

    return result
end

local function Test_UpdateSupplyAirbase()

	--print( dump( supply_tab) .. "\n"  )

    supply_tab = {
        ['red'] = {
            ['Mineralnye-Vody Airbase'] = {
                ['supply_line_names'] = {
                    ['Bridge South Elhotovo MN 39'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Nalchik'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                            ['Maykop-Khanskaya'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.6,
            },
            ['Prohladniy Depot MP 24'] = {
                ['supply_line_names'] = {
                    ['Bridge South Beslan MN 68'] = {
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Sochi-Adler'] = true,
                            ['Nalchik'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Alagir MN 36'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['101 EWR Site'] = {
                ['supply_line_names'] = {
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Russian Convoy 1'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 1,
            },
        },
        ['blue'] = {
            ['Novyy Afon Train Station - FH57'] = {
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['Sukhumi Airbase Strategics'] = {
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.4,
            },
        },
    }

    airbase_tab = nil
    airbase_tab = UpdateSupplyAirbase( InitializeAirbaseTab(), supply_tab )
    local result = false

    --[[
    print("airbase_tab.red.Beslan.supply: " .. airbase_tab.red.Beslan.supply .. ", airbase_tab.red.Mozdok.supply: " .. airbase_tab.red.Mozdok.supply
    .. ", airbase_tab.red.Nalchik.supply: " .. airbase_tab.red.Nalchik.supply .. ", airbase_tab.red['Mineralnye-Vody'].supply :"
    .. airbase_tab.red['Mineralnye-Vody'].supply .. ", airbase_tab.red['Maykop-Khanskaya'].supply :" .. airbase_tab.red['Maykop-Khanskaya'].supply
    .. ", airbase_tab.red['Sochi-Adler'].supply :" .. airbase_tab.red['Sochi-Adler'].supply .. ", airbase_tab.blue.Batumi.supply :"
    .. airbase_tab.blue.Batumi.supply .. ", airbase_tab.blue.Vaziani.supply :" .. airbase_tab.blue.Vaziani.supply .. ", airbase_tab.blue.Kutaisi: " .. airbase_tab.blue.Kutaisi.supply
    .. ", airbase_tab.blue.Reserves.supply: " .. airbase_tab.blue.Reserves.supply .. ", airbase_tab.red.Reserves.supply: "
    .. airbase_tab.red.Reserves.supply .. "\n")
    ]]

    if airbase_tab.red.Beslan.supply == 0.4 and airbase_tab.red.Mozdok.supply == 0.5 and airbase_tab.red.Nalchik.supply == 0.2 and
    airbase_tab.red['Mineralnye-Vody'].supply == 0.5 and airbase_tab.red['Maykop-Khanskaya'].supply == 0.15 and
    airbase_tab.red['Sochi-Adler'].supply == 0.3 and airbase_tab.blue.Batumi.supply == 0.2 and airbase_tab.blue.Vaziani.supply == 0.4
    and airbase_tab.blue.Kutaisi.supply == 0.2 then -- and airbase_tab.red.Reserves.supply == 0.25 and airbase_tab.blue.Reserves.supply == 0.4
        result = true
    end

    print("-------------------------> Test_UpdateSupplyAirbase(): " .. tostring(result) .. "\n")

    --print( dump( airbase_tab) )


end

local function Test_UpdateAirbaseIntegrity()

	local result = true

    airbase_tab = {
        ['blue'] = {
            ['Reserves'] = {
                ['aircraft_types'] = {
                    ['KC-135'] = true,
                    ['F/A-18C'] = true,
                    ['KC135MPRS'] = true,
                    ['AJS37'] = true,
                    ['AV8BNA'] = true,
                    ['E-2C'] = true,
                    ['F-16C_50'] = true,
                    ['F-15C'] = true,
                    ['S-3B Tanker'] = true,
                    ['F-15E'] = true,
                    ['F-14B'] = true,
                    ['M-2000C'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['LHA_Tarawa'] = {
                ['aircraft_types'] = {
                    ['AV8BNA'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['CVN-71 Theodore Roosevelt'] = {
                ['aircraft_types'] = {
                    ['F-14B'] = true,
                    ['FA-18C_hornet'] = true,
                    ['S-3B Tanker'] = true,
                    ['E-2C'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Soganlug'] = {
                ['aircraft_types'] = {
                    ['F-117A'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Senaki-Kolkhi'] = {
                ['aircraft_types'] = {
                    ['F-16C_50'] = true,
                    ['KC-135'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Tbilissi-Lochini'] = {
                ['aircraft_types'] = {
                    ['KC135MPRS'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Kutaisi'] = {
                ['aircraft_types'] = {
                    ['E-3A'] = true,
                    ['M-2000C'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Vaziani'] = {
                ['aircraft_types'] = {
                    ['F-15C'] = true,
                    ['F-15E'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Sukhumi'] = {
                ['aircraft_types'] = {
                    ['AJS37'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Batumi'] = {
                ['aircraft_types'] = {
                    ['KC135MPRS'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
        },
        ['red'] = {
            ['Beslan'] = {
                ['aircraft_types'] = {
                    ['MiG-29A'] = true,
                    ['An-26B'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Reserves'] = {
                ['aircraft_types'] = {
                    ['Su-27'] = true,
                    ['Tu-22M3'] = true,
                    ['Su-24M'] = true,
                    ['MiG-29A'] = true,
                    ['Su-25T'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Mineralnye-Vody'] = {
                ['aircraft_types'] = {
                    ['Su-24M'] = true,
                    ['Su-27'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Maykop-Khanskaya'] = {
                ['aircraft_types'] = {
                    ['Tu-22M3'] = true,
                    ['Su-24M'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Nalchik'] = {
                ['aircraft_types'] = {
                    ['A-50'] = true,
                    ['MiG-29A'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Sochi-Adler'] = {
                ['aircraft_types'] = {
                    ['An-26B'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
            ['Mozdok'] = {
                ['aircraft_types'] = {
                    ['MiG-31'] = true,
                    ['MiG-29A'] = true,
                    ['Su-25T'] = true,
                },
                ['supply'] = 0.5,
                ['efficiency'] = 0.5,
                ['integrity'] = 0.5,
            },
        },
    }

	airbase_tab = UpdateAirbaseIntegrity( airbase_tab )

    for side, side_values in pairs(targetlist) do
        local side_base = "red"

        if side == "red" then
            side_base = "blue"
        end

        for target_name, target_values in pairs(side_values) do

            if airbase_tab[side_base][target_name] and target_values.integrity ~= 1 then
                print("wrong integrity value in airbase_tab airbase: " .. target_name .. ", integrity: " .. target_values.integrity .. "\n")
				result = false
				break
			end
        end
    end


	if result then
		print("-------------------------> Test_UpdateAirbaseIntegrity(): true" .. "\n")

	else
		print("-------------------------> Test_UpdateAirbaseIntegrity(): false" .. "\n")

	end

end

local function Test_UpdateAirbaseEfficiency()

	--local airbase_tab = InitializeAirbaseTab()
	--print( dump( airbase_tab).."\n" )
    supply_tab = {
        ['red'] = {
            ['Mineralnye-Vody Airbase'] = {
                ['supply_line_names'] = {
                    ['Bridge South Elhotovo MN 39'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Nalchik'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                            ['Maykop-Khanskaya'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.6,
            },
            ['Prohladniy Depot MP 24'] = {
                ['supply_line_names'] = {
                    ['Bridge South Beslan MN 68'] = {
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Sochi-Adler'] = true,
                            ['Nalchik'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Alagir MN 36'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['101 EWR Site'] = {
                ['supply_line_names'] = {
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Russian Convoy 1'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 1,
            },
        },
        ['blue'] = {
            ['Novyy Afon Train Station - FH57'] = {
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['Sukhumi Airbase Strategics'] = {
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.4,
            },
        },
    }

    airbase_tab = nil

    airbase_tab = InitializeAirbaseTab()
    --dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Init/supply_tab_init.lua")
	airbase_tab = UpdateSupplyAirbase( airbase_tab, supply_tab )
	--print( dump( airbase_tab).."\n" )

	airbase_tab = UpdateAirbaseEfficiency( airbase_tab )
    local result = false

      --[[
    print("airbase_tab.red.Beslan.supply: " .. airbase_tab.red.Beslan.supply .. ", airbase_tab.red.Mozdok.supply: " .. airbase_tab.red.Mozdok.supply
    .. ", airbase_tab.red.Nalchik.supply: " .. airbase_tab.red.Nalchik.supply .. ", airbase_tab.red['Mineralnye-Vody'].supply :"
    .. airbase_tab.red['Mineralnye-Vody'].supply .. ", airbase_tab.red['Maykop-Khanskaya'].supply :" .. airbase_tab.red['Maykop-Khanskaya'].supply
    .. ", airbase_tab.red['Sochi-Adler'].supply :" .. airbase_tab.red['Sochi-Adler'].supply .. ", airbase_tab.blue.Batumi.supply :"
    .. airbase_tab.blue.Batumi.supply .. ", airbase_tab.blue.Vaziani.supply :" .. airbase_tab.blue.Vaziani.supply .. ", airbase_tab.blue.Kutaisi: " .. airbase_tab.blue.Kutaisi.supply
    .. ", airbase_tab.blue.Reserves.supply: " .. airbase_tab.blue.Reserves.supply .. ", airbase_tab.red.Reserves.supply: "
    .. airbase_tab.red.Reserves.supply .. "\n")
    ]]

    if airbase_tab.red.Beslan.supply == 0.4 and airbase_tab.red.Mozdok.supply == 0.5 and airbase_tab.red.Nalchik.supply == 0.2 and
    airbase_tab.red['Mineralnye-Vody'].supply == 0.5 and airbase_tab.red['Maykop-Khanskaya'].supply == 0.15 and
    airbase_tab.red['Sochi-Adler'].supply == 0.3 and airbase_tab.blue.Batumi.supply == 0.2 and airbase_tab.blue.Vaziani.supply == 0.4 then
        result = true
    end

    print("-------------------------> Test_UpdateAirbaseEfficiency(): " .. tostring(result) .. "\n")

    --print( dump( airbase_tab) )



end

local function Test_UpdateOobAir()

    --[[

    NOTE:
    In UpdateOobAir() needed: local percentage_efficiency_effect_for_airbases = 100, local percentage_efficiency_effect_for_resupplies = 100

    ]]

    local result = true
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Test/oob_air.lua")
    oob_air_old = deepcopy ( oob_air )

    supply_tab = {
        ['red'] = {
            ['Mineralnye-Vody Airbase'] = {
                ['supply_line_names'] = {
                    ['Bridge South Elhotovo MN 39'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Nalchik'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                            ['Maykop-Khanskaya'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.6,
            },
            ['Prohladniy Depot MP 24'] = {
                ['supply_line_names'] = {
                    ['Bridge South Beslan MN 68'] = {
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Sochi-Adler'] = true,
                            ['Nalchik'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Alagir MN 36'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['101 EWR Site'] = {
                ['supply_line_names'] = {
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Russian Convoy 1'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 1,
            },
        },
        ['blue'] = {
            ['Novyy Afon Train Station - FH57'] = {
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['Sukhumi Airbase Strategics'] = {
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.4,
            },
        },
    }

    UpdateOobAir()


	for side, index in pairs(oob_air) do

        for index_value, oob_value in pairs(index) do
            --print("oob_air value: ", side, oob_value.base, oob_value.type, oob_value.roster.ready )
            --print("old oob_air value: ", side, oob_air_old[side][index_value].base, oob_air_old[side][index_value].type, oob_air_old[side][index_value].roster.ready )

            if oob_value.base == "Mozdok" or oob_value.base == "Mineralnye-Vody"  then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.5 ) - 1  ) ) )
                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.5 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - I Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.5 ) - 1  ) ) )
                end

            elseif oob_value.base == "Beslan"  or oob_value.base == "Vaziani" or oob_value.base == "Senaki-Kolkhi" then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.4 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.4 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - I Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.4 ) - 1  ) ) )
                end

            elseif oob_value.base == "Sochi-Adler"  then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.3 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.3 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - I Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.3 ) - 1  ) ) )
                end


            elseif oob_value.base == "Nalchik" or oob_value.base == "Kutaisi" or oob_value.base == "Batumi" then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.2 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.2 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - I Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.2 ) - 1  ) ) )
                end


            elseif oob_value.base == "Maykop-Khanskaya"  then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.15 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.15 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - I Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.15 ) - 1  ) ) )
                end

            end
        end
	end

    --print("-------------------------> FIRST Test_UpdateOobAir(): " .. tostring(result) .. "\n")
    supply_tab = {
        ['red'] = {
            ['Mineralnye-Vody Airbase'] = {
                ['supply_line_names'] = {
                    ['Bridge South Elhotovo MN 39'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Nalchik'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                            ['Maykop-Khanskaya'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.6,
            },
            ['Prohladniy Depot MP 24'] = {
                ['supply_line_names'] = {
                    ['Bridge South Beslan MN 68'] = {
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Sochi-Adler'] = true,
                            ['Nalchik'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Alagir MN 36'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['101 EWR Site'] = {
                ['supply_line_names'] = {
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Sochi-Adler'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Russian Convoy 1'] = {
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 1,
            },
        },
        ['blue'] = {
            ['Novyy Afon Train Station - FH57'] = {
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.8,
            },
            ['Sukhumi Airbase Strategics'] = {
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                        ['integrity'] = 0.25,
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                        ['integrity'] = 0.5,
                    },
                },
                ['integrity'] = 0.4,
            },
        },
    }
    targetlist.blue["Mozdok Airbase"].alive = 50
    targetlist.blue["Beslan Airbase"].alive = 50
    targetlist.blue["Nalchik Airbase"].alive = 50
    targetlist.red["Kutaisi Airbase"].alive = 50
    targetlist.red["Batumi Airbase"].alive = 50
    oob_air = deepcopy(oob_air_old)
    UpdateOobAir()

	for side, index in pairs(oob_air) do

        for index_value, oob_value in pairs(index) do
            --print("oob_air value: ", side, oob_value.base, oob_value.type, oob_value.roster.ready, "\n" )
            --print("old oob_air value: ", side, oob_air_old[side][index_value].base, oob_air_old[side][index_value].type, oob_air_old[side][index_value].roster.ready, "\n" )
            --rispetto il test precedente ho eliminato le airbase non presenti in targetlist che, pertanto, vengono escluse dall'aggiornamento dell'integrity in airbase_tab
            --effettuato in base alle info presenti in targetlist. Nel precedente funzionava perche il calcolo considera i valori di integrity=1(alive=100)

            if oob_value.base == "Mozdok"  then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.25 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.roster.ready", oob_value.roster.ready, math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.25 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.25 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.25 ) - 1  ) ) )
                end

            elseif oob_value.base == "Beslan" then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.2 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.roster.ready", oob_value.roster.ready, math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.2 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.2 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.2 ) - 1  ) ) )

                end

            elseif oob_value.base == "Nalchik" or oob_value.base == "Kutaisi" or oob_value.base == "Batumi" then

                if update_ready then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.1 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.roster.ready", oob_value.roster.ready, math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.1 ) - 1  ) ) )

                else
                    result = result and ( oob_value.number == math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.1 ) - 1  ) ) )
                    --print( "Test_UpdateOobAir() - II Step oob_value.number", oob_value.number, math.floor( 0.5 + oob_air_old[side][index_value].number * ( 2^( 0.1 ) - 1  ) ) )
                end
            end
        end
	end

    print("-------------------------> Test_UpdateOobAir(): " .. tostring(result) .. "\n")
    return result
end

local function Test_SaveTabOnDisk()

    supply_tab_test = {
        ['red'] = {
            ['Prohladniy Depot MP 24'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Bridge Alagir MN 36'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Beslan'] = true,  -- Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
                            ['Mozdok'] = true,
                        },
                    },
                    ['Bridge South Beslan MN 68'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Nalchik'] = true, -- Nalchik dovrebbe prendere 0.8*0.25=0.2 efficiency
                            ['Sochi-Adler'] = true,
                        },
                    },
                },
            },
            ['Mineralnye-Vody Airbase'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,  -- Sochi-Adler dovrebbe prendere 0.6*0.5=0.3 efficiency
                            ['Beslan'] = true,
                        },
                    },
                    ['Bridge South Elhotovo MN 39'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Sochi-Adler'] = true,
                            ['Maykop-Khanskaya'] = true, -- Maykop-Khanskaya dovrebbe prendere 0.6*0.25=0.15 efficiency
                            ['Nalchik'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                    },
                },
            },
            ['101 EWR Site'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Russian Convoy 1'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Mozdok'] = true, -- Mozdok dovrebbe prendere 1*0.5=0.5 efficiency
                            ['Mineralnye-Vody'] = true,-- Mineralnye-Vody dovrebbe prendere 1*0.5=0.5 efficiency
                        },
                    },
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Reserves'] = true, -- Reserves dovrebbe prendere 1*0.25=0.25 efficiency
                            ['Sochi-Adler'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                        },
                    },
                },
            },
        },
        ['blue'] = {
            ['Sukhumi Airbase Strategics'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                    },
                },
            },
            ['Novyy Afon Train Station - FH57'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Vaziani'] = true,
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                        },
                    },
                },
            },
        },
    }

    SaveTabOnDisk( "supply_tab_test", supply_tab_test )
    supply_tab_test = nil
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Test/supply_tab_test.lua")
    local result = supply_tab_test.blue["Novyy Afon Train Station - FH57"].integrity == 1
    supply_tab_test = {

        ["red"] = {

            ["Prohladniy Depot MP 24"] = { -- supply plant
                integrity = 0.8, -- integrity (property alive in targetlist) of supply plant
                ["supply_line_names"] = { -- table of supply line supplyed of supply plant
                    ["Bridge Alagir MN 36"] = { -- supply line n.1
                        integrity = 0.5, -- integrity (property alive in targetlist) of supply line
                        ["airbase_supply"] = {  -- airbases supplyed from this supply line n.1
                            ["Beslan"] = true,
                            ["Reserves"] = true,
                            ["Mozdok"] = true
                        }
                    },
                    ["Bridge South Beslan MN 68"] = { -- supply line n.2
                        integrity = 0.25,
                        ["airbase_supply"] = { -- airbases supplyed from this supply line n.2
                            ["Nalchik"] = true,
                            ["Mineralnye-Vody"] = true
                        }
                    }
                }
            },
            ["Mineralnye-Vody Airbase"] = { -- another supply plant and
                integrity = 0.4,
                ["supply_line_names"] = {
                    ["Rail Bridge SE Mayskiy MP 23"] = {
                        integrity = 0.5,
                        ["airbase_supply"] = {
                            ["Sochi-Adler"] = true,
                            ["Reserves"] = true
                        }
                    },
                    ["Bridge South Elhotovo MN 39"] = {
                        integrity = 0.25,
                        ["airbase_supply"] = {
                            ["Mineralnye-Vody"] = true,
                            ["Sochi-Adler"] = true,
                            ["Maykop-Khanskaya"] = true,
                            ["Reserves"] = true
                        }
                    }
                }

            }
        },
        ["blue"] = {

            ["Novyy Afon Train Station - FH57"] = {
                integrity = 0.8,
                ["supply_line_names"] = {
                    ["Bridge Nizh Armyanskoe Uschele-FH47"] = {
                        integrity = 0.5,
                        ["airbase_supply"] = {
                            ["Senaki-Kolkhi"] = true,
                            ["Vaziani"] = true,
                            ["Reserves"] = true
                        }
                    },
                    ["Bridge Tagrskiy-FH08"] = {
                        integrity = 0.25,
                        ["airbase_supply"] = {
                            ["Kutaisi"] = true,
                            ["Batumi"] = true
                        }
                    }
                }
            },
            ["Sukhumi Airbase Strategics"] = {
                integrity = 0.4,
                ["supply_line_names"] = {
                    ["Bridge Anaklia-GG19"] = {
                        integrity = 0.5,
                        ["airbase_supply"] = {
                            ["Batumi"] = true,
                            ["Senaki-Kolkhi"] = true,
                            ["Reserves"] = true
                        }
                    },
                    ["Rail Bridge Grebeshok-EH99"] = {
                        integrity = 0.25,
                        ["airbase_supply"] = {
                            ["Kutaisi"] = true,
                            ["Vaziani"] = true
                        }
                    }
                }

            }
        }
    }
    SaveTabOnDisk( "supply_tab_test", supply_tab_test )
    supply_tab_test = nil
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Test/supply_tab_test.lua")
    result = result and ( supply_tab_test.blue["Novyy Afon Train Station - FH57"].integrity == 0.8 )
    print("-------------------------> Test_SaveTabOnDisk(): " .. tostring(result) .. "\n")
    return result

end

local function Test_CopySupplyTab()

    supply_tab = {
        ['red'] = {
            ['Prohladniy Depot MP 24'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Bridge Alagir MN 36'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Beslan'] = true,  -- Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
                            ['Mozdok'] = true,
                        },
                    },
                    ['Bridge South Beslan MN 68'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Beslan'] = true,
                            ['Nalchik'] = true, -- Nalchik dovrebbe prendere 0.8*0.25=0.2 efficiency
                            ['Sochi-Adler'] = true,
                        },
                    },
                },
            },
            ['Mineralnye-Vody Airbase'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Rail Bridge SE Mayskiy MP 23'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Mozdok'] = true,
                            ['Sochi-Adler'] = true,  -- Sochi-Adler dovrebbe prendere 0.6*0.5=0.3 efficiency
                            ['Beslan'] = true,
                        },
                    },
                    ['Bridge South Elhotovo MN 39'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Reserves'] = true,
                            ['Sochi-Adler'] = true,
                            ['Maykop-Khanskaya'] = true, -- Maykop-Khanskaya dovrebbe prendere 0.6*0.25=0.15 efficiency
                            ['Nalchik'] = true,
                            ['Mozdok'] = true,
                            ['Beslan'] = true,
                            ['Mineralnye-Vody'] = true,
                        },
                    },
                },
            },
            ['101 EWR Site'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Russian Convoy 1'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Mozdok'] = true, -- Mozdok dovrebbe prendere 1*0.5=0.5 efficiency
                            ['Mineralnye-Vody'] = true,-- Mineralnye-Vody dovrebbe prendere 1*0.5=0.5 efficiency
                        },
                    },
                    ['Bridge SW Kardzhin MN 49'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Reserves'] = true, -- Reserves dovrebbe prendere 1*0.25=0.25 efficiency
                            ['Sochi-Adler'] = true,
                            ['Mineralnye-Vody'] = true,
                            ['Beslan'] = true,
                            ['Mozdok'] = true,
                        },
                    },
                },
            },
        },
        ['blue'] = {
            ['Sukhumi Airbase Strategics'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Rail Bridge Grebeshok-EH99'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Vaziani'] = true,
                        },
                    },
                    ['Bridge Anaklia-GG19'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Senaki-Kolkhi'] = true,
                            ['Batumi'] = true,
                            ['Reserves'] = true,
                        },
                    },
                },
            },
            ['Novyy Afon Train Station - FH57'] = {
                ['integrity'] = 1,
                ['supply_line_names'] = {
                    ['Bridge Tagrskiy-FH08'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Kutaisi'] = true,
                            ['Batumi'] = true,
                        },
                    },
                    ['Bridge Nizh Armyanskoe Uschele-FH47'] = {
                        ['integrity'] = 1,
                        ['airbase_supply'] = {
                            ['Vaziani'] = true,
                            ['Senaki-Kolkhi'] = true,
                            ['Reserves'] = true,
                        },
                    },
                },
            },
        },
    }

    SaveTabOnDisk( "supply_tab_test", supply_tab )
    supply_tab = supply_tab_test
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Test/supply_tab_test.lua")
    local result = supply_tab.blue["Novyy Afon Train Station - FH57"].integrity == 1
    supply_tab = nil
    copySupplyTab()
    local result = supply_tab.blue["Novyy Afon Train Station - FH57"].integrity == 0.8
    print("-------------------------> Test_CopySupplyTab(): " .. tostring(result) .. "\n")
    return result

end


local function executeAllTest()

	print("\nExecuting test" .. "\n")

	Test_InitializeAirbaseTab()
	-- OK

	Test_UpdateSupplyPlantIntegrity()
	-- OK

	Test_UpdateSupplyLineIntegrity()
	-- OK

	Test_UpdateSupplyTabIntegrity()
	-- OK

	Test_UpdateSupplyAirbase()
	-- OK

	Test_UpdateAirbaseIntegrity()
	-- OK

	Test_UpdateAirbaseEfficiency()
    -- OK

	Test_UpdateOobAir()
	-- OK

    Test_SaveTabOnDisk()
    -- OK

    Test_CopySupplyTab()
    --

end

if executeTest then
	executeAllTest()
end

--[[
att. le Reserves sono specificate per base e per name (lo squadrone delle riserve che e' associato negli event trigger definiti in camp_triggers.lua (utilizano la funzione Action.AirUnitReinforce("2nd Shaheen Squadron Res", "2nd Shaheen Squadron", 12)' dove il numero finale   sono gli aerei da trasferire limitato poi a 4 all'interno della funzione))
teoricamente si potrebbbe distinguere le riserve in supply tab identificandole per i due parametri (che palle)

oob_air che contiene le informazioni sui resupply per airbases e reserves viene salvato su disco in MAIN_NextMission.lua
molto probabilmente il valore number non viene mai aggiornato in quanto costituisce il riferimento per calcolare se non ci
sono più aerei disponibili utilizzando i dati in [rooster]: lost, damaged e ready.
L'aggiornamento dei dati in [rooster]: lost, damaged e ready, viene fatto in DEBRIEF_StatsEvaluation.lua alla riga 149 "--oob loss update for crashed aircraft".
Quindi puoi fare l'updating di oob_air appena conclusa la missione in DEBRIEF_Master.lua prima della riga 87 "--run log evaluation and status updates"
considerando che la valutazione sulla vittoria della campagna deve essere fatta sicuramente dopo l'aggiornamento delle stat:

]]
