--[[


Aircraft resupply (ready aircraft) depends from damage level of airbase and damage level of power_line and power_plant

The power infrastructure logic:

power plant --- energizes ---->|----> power line A -- energizes---> |--> airbase 1
                               |                                    |--> airbase 3
                               |                                    |--> airbase 5
                               |
                               |----> power line B -- energizes---> |--> airbase 2
															 |      |--> airbase 5
															 |
                               |----> power line C -- energizes---> |--> airbase 2


aircraft.ready = expected.aircraft.ready * ( 2^( airbase.efficiency * k ) -1 ). k:(1-100) defined by user for balance
airbase.efficiency = airbase.integrity * airbase.power
airbase.power = max( power_plant.integrity * power_line.integrity )
power_plant.integrity, power_line.integrity and airbase.integrity are alive/100 values defined for specific asset

This module use two new table: airbase_tab and power_tab.
airbase_tab include airbases with aircraft_type and efficiency values: propriety used for number of aircraft avalaibility calculation.
airbase_tab is automatically created, used and saved (/Active) during mission generation.
power_tab is loaded initially from power_tab_init.lua file, used and saved (/Active) during mission generation. 
power_tab define association from airbase and power asset: power_line, power_plant).
The Campaign Creator must define the power_tab_init using targets presents in targetlist table.

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
            ["power"] 0.9 

        --......
    [red]
        [base_n]
            --......
        }
}
]]

-- power_tab structure example
--[[
-- this definition of power_tab is dedicated for development enviroment
power_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--      power plant
			['integrity'] = 0.8, --           power plant integrity    
			['power_line_names'] = {          table of power lines powered by power plant
				['Bridge Alagir MN 36'] = {   power line
					['integrity'] = 0.5,      integrity of power line
					['airbase_supply'] = {    table of airbases powerd by power line
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
			['power_line_names'] = {
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
			['power_line_names'] = {
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
			['power_line_names'] = {
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
			['power_line_names'] = {
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
-- this definition of power_tab is for testing in an active campaign running in DCS dedicated server enviroment
-- don't use in developement enviroment
power_tab = {
	['blue'] = {
		['EWR-1'] = {
			['integrity'] = 0.8,
			['power_line_names'] = {
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
			['power_line_names'] = {
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
      ['power_line_names'] = {
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
			['power_line_names'] = {
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
			['power_line_names'] = {
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
      ['power_line_names'] = {
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
Init/: power_tab_init.lua --defined by campaign's maker

file modified:

DEBRIEF_Master.lua:
87 --=====================  start marco implementation ==================================
88
89 --run logistic evalutation and save power_tab
90 dofile("../../../ScriptsMod."..versionPackageICM.."/DC_Logistic.lua")--mark
91 UpdateOobAir()
92
93 --=====================  end marco implementation ==================================

BAT_FirstMission.lua:
84 --====================  start marco implementation ==================================
85
86 dofile("Init/power_tab_init.lua")
87 local tgt_str = power_tab .. " = " .. TableSerialization(power_tab, 0)						
88 local tgtFile = nil
89 tgtFile = io.open("Active/" .. power_tab .. ".lua", "w")
90 tgtFile:write(tgt_str)																		
91 tgtFile:close()
92
93 --=====================  end marco implementation ==================================

]]




local executeTest = true

if executeTest then
  print("TEST EXECUTING\n")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Init/db_airbases.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/targetlist.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/oob_air.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/power_tab.lua")
  dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/ScriptsMod.NG/UTIL_Functions.lua")

else
  dofile("Init/db_airbases.lua")
  dofile("Active/targetlist.lua")
  dofile("Active/oob_air.lua")
  dofile("Active/power_tab.lua")
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

-- copy the power_tab from Init folder
local function copyPowerTab()
    return true
end


-- Logistic function

-- Initialize the airbase_tab by defining the planes operating in the airbase
-- OK
local function InitializeAirbaseTab()


    for side, index in pairs(oob_air) do-- iterate oob_air for take aircraft type in an airbase

        for index_value, oob_value in pairs(index) do
            aircraft_type = oob_value.type
            airbase_name = oob_value.base
            --print(side, airbase_name, aircraft_type)

            if airbase_tab == nil then
                --print("airbase_tab is nil\n")
                airbase_tab = {
                    [side] = {
                        [airbase_name] = {
                            ["aircraft_types"] = {
                                [aircraft_type] = true,
                            },
                            ["efficiency"] = 1, -- efficiency_<airbase> = ( damage_<airbase>  / 100 ) * energy_<airbase>; ( 0: min - 1: max )
                            ["integrity"] = 1, -- same of targetlist.alive
                            ["power"] = 1 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

                        }
                    }
                }
                --print("\n--->: " .. dump(airbase_tab).. " <----\n")

            elseif airbase_tab[side] == nil then
                airbase_tab[side] = {
                    [airbase_name] = {
                        ["aircraft_types"] = {
                            [aircraft_type] = true,
                        },
                        ["efficiency"] = 1, -- efficiency_<airbase> = ( damage_<airbase>  / 100 ) * energy_<airbase>; ( 0: min - 1: max )
                        ["integrity"] = 1, -- same of targetlist.alive
                        ["power"] = 1 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

                    }
                }

            else
                --print("airbase_tab is not nil\n")
                --print("oob_air airbase_name: " .. side .. " " .. airbase_name .. "\n")

                if airbase_tab[side][airbase_name] then
                    --print("airbase: " .. side .. " " .. airbase_name .." exists in airbase_tab\n")

                        if airbase_tab[side][airbase_name].aircraft_types[aircraft_type] == nil then
                            --print("oob_air aircraft type: " .. aircraft_type .. " --> not exixst aircraft, insert in airbase_tab.\n")
                            airbase_tab[side][airbase_name].aircraft_types[aircraft_type] = true
                        end
                else
                    --print("airbase not exists in airbase_tab\n")
                    airbase_tab[side][airbase_name] =  { -- insert new airbase, initializa property and assign aircraft
                        ["aircraft_types"] = { [aircraft_type] = true },-- insert new airbase and assign aircraft
                        ["efficiency"] = 1, -- efficiency_<airbase>  1 = max, 0 = min
                        ["integrity"] = 1, -- same of targetlist.alive 1 = max, 0 = min (full damage)
                        ["power"]= 1 -- power_<airbase> 1 = max, 0 = min
                    }
                end
                --print("\n--->: " .. dump(airbase_tab).. " <----\n")
            end
        end
    end

	return airbase_tab
end

-- Update the integrity propriety for power plant in power_tab, by using propriety alive in targetlist
-- OK
local function UpdatePowerPlantIntegrity( pow_tab )

    -- note: Power Plant are defined in power_tab and also in targetlist like targets

    for sidepw, side_val in pairs( pow_tab ) do

        for power_plant_name, power_plant_values in pairs( side_val ) do -- iteration of power plants in power_tab

            for side, targets in pairs( targetlist ) do -- iteration of side in targetlist tab

                for target_name, target_value in pairs( targets ) do -- iteration of targets from a single side
                    --print("pow tab side: " .. sidepw .. " - " .. "pow_pl_name: " .. power_plant_name .. " - " .. "targlist side: " .. side .. " - " .. "target name: " .. target_name .. "\n")
                    --print("pow tab integrity: " .. power_plant_values['integrity'] .. " - " .. "target_value[\"alive\"]: " .. tostring( target_value['alive']) .. "\n")

                    if power_plant_name ==  target_name then  -- update integrity value of an power plant using alive target propriety
                        --print( dump( target_value ) .. "\n")
                        power_plant_values.integrity = target_value.alive / 100 -- normalize integrity from 0 to 1
                        -- eventuale codice per terminare l'iterazione
                    end

                end
            end
        end
    end
	return pow_tab
end

-- Update the integrity propriety for power line in power_tab, by using propriety alive in targetlist
-- OK
local function UpdateAPowerLineIntegrity( pow_tab )

    -- note: Power Line are defined in power_tab and also in targetlist like targets

    for sidepw, side_val in pairs( pow_tab ) do

        for power_plant_name, power_plant_values in pairs( side_val ) do -- iteration of power plants in power_tab

            for power_line_name, power_line_values in pairs( power_plant_values.power_line_names ) do-- iteration of power lines from a single power_tab

                for side, targets in pairs( targetlist ) do-- iteration of blue and red side in targetlist tab

                    for target_name, target_value in pairs( targets ) do -- iteration of targets from a single side

                        if power_line_name == target_name then -- update integrity value of an power line using alive target propriety
                            power_line_values.integrity = target_value.alive / 100 -- normalize integrity from 0 to 1
                        end
                    end
                end
            end
        end
    end
	return pow_tab
end

-- Update Power Plant integrity and Power Line integrity in power_tab, by using propriety alive in target list
-- OK
local function UpdatePowerTabIntegrity( pow_tab )

    UpdatePowerPlantIntegrity( pow_tab )
    UpdateAPowerLineIntegrity( pow_tab )

	  return pow_tab

end

-- Update the power propriety in airbase_tab using integrity propriety from power_tab
-- OK
local function UpdatePowerAirbase( airb_tab, pow_tab )

    for side_base, side_values in pairs( airb_tab ) do

        for base_name, base_values in pairs( side_values ) do

            for power_plant_name, power_plant_values in pairs( pow_tab[side_base] ) do

                for power_line_name, power_line_values in pairs( power_plant_values.power_line_names ) do

                    for airbase_name, airbase_values in pairs( power_line_values.airbase_supply ) do
                        --print("air_tab.airbase: " .. base_name .. ", power_line.airbase: " .. airbase_name .. "\n")
                        --print("power_plant: " .. power_plant_name .. ", power_line_name: " .. power_line_name .. "\n")

                        if base_name == airbase_name then
                            -- print("side: " .. side_base .. " air_tab.airbase: " .. base_name .. ", power_line.airbase: " .. airbase_name .. "\n")
                            local power = power_plant_values.integrity * power_line_values.integrity  -- update power value of an airbase
                            --print("air_tab.airbase.power: " .. base_values.power .. ", calculated power: " .. power .. "\n")
                            --print("power_plant_values.integrity: " .. power_plant_values.integrity .. ", power_line_values.integrity: " .. power_line_values.integrity .. ", calculated power: " .. power .. "\n")

                            if ( base_values.power == 1 and power > 0 ) or ( power > base_values.power ) then -- select power value from highest power supply integrity calculated
                                --print("air_tab.power ==1 or calculated power > air_tab.power(" .. base_values.power .. ") --> update air_tab.powert: air_tab.power = power(" .. power .. ") \n")
                                base_values.power  = power
                            end
                        end
                    end
                end
            end
        end
    end
	return airb_tab
end

-- Update the integrity propriety in airbase_tab using alive propriety from targetlist
-- OK
local function UpdateAirbaseIntegrity( airb_tab )

    for base, airbase_values in pairs( airb_tab ) do
        -- base = base .. " " .."Airbase"

        for side, targets in pairs( targetlist ) do

            for target_name, target_value in pairs( targets ) do

                if target_name == base or target_name == base .. " " .."Airbase" or  target_name == base .. " " .."FARP" then
                    airbase_values.integrity = target_value.alive / 100
                    break
                end
            end
        end
    end
	return airb_tab
end

-- Update the airbase efficiency propriety in airbase_tab
-- OK
local function UpdateAirbaseEfficiency( airb_tab )

	for side, side_val in pairs( airb_tab ) do

		for base, airbase_values in pairs( side_val ) do
			airbase_values.efficiency = airbase_values.integrity * airbase_values.power
			--print("airbase: " .. base  .. "\n" )
			--print("airbase_values.integrity: " .. airbase_values.integrity .. ", " .. "airbase_values.power: " ..  airbase_values.power .. ", " .. "airbase_values.efficiency: " ..  ", " .. airbase_values.efficiency .. "\n" )
		end
  end
	return airb_tab
end

-- Update oob_air number propriety considering airbase efficiency propriety
function UpdateOobAir()

  local percentage_efficiency_effect_for_airbases = 100 -- (0 - 100) parameter to balance the influence property in the calculation of aircraft number for airbases
	local percentage_efficiency_effect_for_reserves = 100 -- (0 - 100) parameter to balance the influence property in the calculation of aircraft number for reserves
	local airbase_tab = InitializeAirbaseTab()

  if not executeTest then -- delete this condition in operative version and insert UpdatePowerTestIntegrity in a new line
	   UpdatePowerTabIntegrity( power_tab )
  end

	airbase_tab = UpdatePowerAirbase( airbase_tab, power_tab )
	airbase_tab = UpdateAirbaseIntegrity( airbase_tab )
	airbase_tab = UpdateAirbaseEfficiency( airbase_tab )

	for side, index in pairs(oob_air) do -- iterate oob_air for take aircraft type in an airbase

        for index_value, oob_value in pairs(index) do
			--print("airbase_tab is not nil\n")
			--print("oob_air value: ", side, oob_value.base, oob_value.type, oob_value.roster.ready )

			if airbase_tab[side][oob_value.base] then
				--print("airbase: " .. side .. " " .. airbase_name .." exists in airbase_tab\n")

				if airbase_tab[side][oob_value.base].aircraft_types[oob_value.type] then
					result = true

					if oob_value.base ~= "Reserves" then
						--print("old airbase oob_value.roster.ready: " .. oob_value.roster.ready .."\n")
						--print("airbase_tab[side][airbase_name].efficiency: " .. airbase_tab[side][oob_value.base].efficiency .. "\n")
						-- oob_value.roster.ready = math.floor( 0.5 + oob_value.roster.ready * ( 2^( airbase_tab[side][oob_value.base].efficiency * percentage_efficiency_effect_for_airbases/100 ) - 1 ) )
                        oob_value.roster.ready = math.floor( 0.5 + oob_value.roster.ready * ( 2^( airbase_tab[side][oob_value.base].efficiency * percentage_efficiency_effect_for_airbases/100 ) - 1 ) )
						--print("new airbase oob_value.roster.ready: " .. oob_value.roster.ready .."\n")
					else
						--print("old reserves oob_value.roster.ready: " .. oob_value.roster.ready .."\n")
						--print("airbase_tab[side][airbase_name].efficiency: " .. airbase_tab[side][oob_value.base].efficiency .. "\n")
						--oob_value.roster.ready = math.floor( 0.5 + oob_value.roster.ready * ( 2^( airbase_tab[side][oob_value.base].efficiency * percentage_efficiency_effect_for_reserves/100 ) - 1 ) )
                        oob_value.roster.ready = math.floor( 0.5 + oob_value.roster.ready * ( 2^( airbase_tab[side][oob_value.base].efficiency * percentage_efficiency_effect_for_reserves/100 ) - 1 ) )
						--print("new reserves oob_value.roster.ready: " .. oob_value.roster.ready .."\n")
					end

				else
					print("oob_air aircraft type: " .. oob_value.type .. " --> not exixst aircraft.\n")
					result = false
				end

			else
				print("airbase not exists in airbase_tab\n")
				result = false
			end
        end
	end
    -- print("\n--->: " .. dump(airbase_tab).. " <----\n")
	-- print("\n--->: " .. dump(oob_air).. " <----\n")
  SaveTabOnDisk( "airbase_tab", airbase_tab )
  SaveTabOnDisk( "power_tab", power_tab )

	return result
end


-- Save table on disk power_tab.lua
function SaveTabOnDisk( table_name, table )
    local tgt_str = table_name .. " = " .. TableSerialization(table, 0)						    --make a string
    local tgtFile = nil

    if executeTest then
      tgtFile = io.open("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/" .. table_name .. ".lua", "w")	--open power_tab file
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
            ["power"] 0.9 -- energy_<airbase> = energy_line_efficiency_<airbase> *  energy_request_<airbase> * total_energy_production ;   (  0: min - 1: max  )

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
			--print( base_values["efficiency"] .. ", " .. base_values["integrity"] .. ", " .. base_values["power"] .. "\n" )

			if base_values["efficiency"] ~= 1 or base_values["integrity"] ~= 1 or base_values["power"] ~= 1 then

				result = false
				break;
			end

			if not result then
				break
			end
		end
	end

	if result then
		print("Test_InitalizeAirbaseAndAircraft(): true\n")
	else
		print("Test_InitalizeAirbaseAndAircraft(): false\n")
	end


    --for side, sideval in pairs(airbase_tab) do
        --print("\nside: " .. side .." ========================== \n")
        --for base_name, base_values in pairs(sideval) do
            --print("\nbase: " .. base_name .." ----------------------------- \n")
            --print("efficiency: " .. base_values.efficiency ..",  " .. "integrity: " .. base_values.integrity ..",  " .. "power: " .. base_values.power)

            --for aircraft_type, value in pairs(base_values.aircraft_types) do
                --print("\naircraft type: " .. aircraft_type ..",  value: " .. tostring(value) .."\n--------------------------------------\n")
            --end
        --end
    --end
	return result
end

local function Test_UpdatePowerPlantIntegrity()

    local result = false
	local _power_tab = UpdatePowerPlantIntegrity( deepcopy( power_tab ) )
	--print( dump( power_tab) .. "\n"  )

    if _power_tab.blue['Sukhumi Airbase Strategics'].integrity == 1 and _power_tab.red["Mineralnye-Vody Airbase"].integrity == 1 then
        result = true
    end

    print("Test function UpdatePowerPlantIntegrity(): " .. tostring(result) .."\n")


    return result
end

local function Test_UpdateAPowerLineIntegrity()

    local result = false
    local _power_tab = UpdateAPowerLineIntegrity( deepcopy( power_tab ) )

	--print( dump( power_tab) .. "\n"  )

    if _power_tab.blue["Sukhumi Airbase Strategics"]["power_line_names"]['Rail Bridge Grebeshok-EH99'].integrity == 1 and _power_tab.blue["Sukhumi Airbase Strategics"]["power_line_names"]['Bridge Anaklia-GG19'].integrity == 1 and
    _power_tab.blue["Novyy Afon Train Station - FH57"]["power_line_names"]['Bridge Tagrskiy-FH08'].integrity == 1 and
    _power_tab.red["Mineralnye-Vody Airbase"]["power_line_names"]['Bridge South Elhotovo MN 39'].integrity == 1 and _power_tab.red["Mineralnye-Vody Airbase"]["power_line_names"]['Rail Bridge SE Mayskiy MP 23'].integrity == 1 and
    _power_tab.red["Prohladniy Depot MP 24"]["power_line_names"]['Bridge South Beslan MN 68'].integrity == 1 then
        result = true
    end

    print("Test function UpdateAPowerLineIntegrity(): " .. tostring(result) .."\n")

    --print( dump( power_tab ) )

    return result
end

local function Test_UpdatePowerTabIntegrity()

	local result = false
	local _power_tab = UpdatePowerTabIntegrity( deepcopy( power_tab ) )

	--print( dump( power_tab) .. "\n"  )

    if _power_tab.blue['Sukhumi Airbase Strategics'].integrity == 1 and _power_tab.red["Mineralnye-Vody Airbase"].integrity == 1 and
	_power_tab.blue["Sukhumi Airbase Strategics"]["power_line_names"]['Rail Bridge Grebeshok-EH99'].integrity == 1 and
	_power_tab.blue["Sukhumi Airbase Strategics"]["power_line_names"]['Bridge Anaklia-GG19'].integrity == 1 and
    _power_tab.blue["Novyy Afon Train Station - FH57"]["power_line_names"]['Bridge Tagrskiy-FH08'].integrity == 1 and
    _power_tab.red["Mineralnye-Vody Airbase"]["power_line_names"]['Bridge South Elhotovo MN 39'].integrity == 1 and
	_power_tab.red["Mineralnye-Vody Airbase"]["power_line_names"]['Rail Bridge SE Mayskiy MP 23'].integrity == 1 and
    _power_tab.red["Prohladniy Depot MP 24"]["power_line_names"]['Bridge South Beslan MN 68'].integrity == 1 then
        result = true
    end

    print("Test function UpdatePowerTabIntegrity(): " .. tostring(result) .."\n")

    return result
end

local function Test_UpdatePowerAirbase()

	--print( dump( power_tab) .. "\n"  )

	local airbase_tab = UpdatePowerAirbase( InitializeAirbaseTab(), deepcopy( power_tab ))

    local result = false

    --[[
    print("airbase_tab.red.Beslan.power: " .. airbase_tab.red.Beslan.power .. ", airbase_tab.red.Mozdok.power: " .. airbase_tab.red.Mozdok.power
    .. ", airbase_tab.red.Nalchik.power: " .. airbase_tab.red.Nalchik.power .. ", airbase_tab.red['Mineralnye-Vody'].power :"
    .. airbase_tab.red['Mineralnye-Vody'].power .. ", airbase_tab.red['Maykop-Khanskaya'].power :" .. airbase_tab.red['Maykop-Khanskaya'].power
    .. ", airbase_tab.red['Sochi-Adler'].power :" .. airbase_tab.red['Sochi-Adler'].power .. ", airbase_tab.blue.Batumi.power :"
    .. airbase_tab.blue.Batumi.power .. ", airbase_tab.blue.Vaziani.power :" .. airbase_tab.blue.Vaziani.power .. ", airbase_tab.blue.Kutaisi: " .. airbase_tab.blue.Kutaisi.power
    .. ", airbase_tab.blue.Reserves.power: " .. airbase_tab.blue.Reserves.power .. ", airbase_tab.red.Reserves.power: "
    .. airbase_tab.red.Reserves.power .. "\n")
    ]]

    if airbase_tab.red.Beslan.power == 0.4 and airbase_tab.red.Mozdok.power == 0.5 and airbase_tab.red.Nalchik.power == 0.2 and
    airbase_tab.red['Mineralnye-Vody'].power == 0.5 and airbase_tab.red['Maykop-Khanskaya'].power == 0.15 and
    airbase_tab.red['Sochi-Adler'].power == 0.3 and airbase_tab.blue.Batumi.power == 0.2 and airbase_tab.blue.Vaziani.power == 0.4
    and airbase_tab.red.Reserves.power == 0.25 and airbase_tab.blue.Reserves.power == 0.4 and airbase_tab.blue.Kutaisi.power == 0.2 then
        result = true
    end

    print("Test_UpdatePowerAirbase(): " .. tostring(result) .. "\n")

    --print( dump( airbase_tab) )


end

local function Test_UpdateAirbaseIntegrity()

	local result = true
	airbase_tab = UpdateAirbaseIntegrity( InitializeAirbaseTab() )

	for side_base, side_values in pairs( airbase_tab ) do --

        for base_name, base_values in pairs( side_values ) do --

			if base_values.integrity ~= 1 then

				result = false
				break;
			end

			if not result then
				break
			end
		end
	end

	if result then
		print("Test_UpdateAirbaseIntegrity(): true" .. "\n")

	else
		print("Test_UpdateAirbaseIntegrity(): false" .. "\n")

	end

end

local function Test_UpdateAirbaseEfficiency()

	--local airbase_tab = InitializeAirbaseTab()
	--print( dump( airbase_tab).."\n" )

	local airbase_tab = UpdatePowerAirbase( InitializeAirbaseTab(), deepcopy( power_tab ) )
	--print( dump( airbase_tab).."\n" )

	airbase_tab = UpdateAirbaseEfficiency( airbase_tab )
    local result = false

    if airbase_tab.red.Beslan.power == 0.4 and airbase_tab.red.Mozdok.power == 0.5 and airbase_tab.red.Nalchik.power == 0.2 and
    airbase_tab.red['Mineralnye-Vody'].power == 0.5 and airbase_tab.red['Maykop-Khanskaya'].power == 0.15 and
    airbase_tab.red['Sochi-Adler'].power == 0.3 and airbase_tab.blue.Batumi.power == 0.2 and airbase_tab.blue.Vaziani.power == 0.4 then
        result = true
    end

    print("Test_UpdateAirbaseEfficiency(): " .. tostring(result) .. "\n")

    --print( dump( airbase_tab) )



end

-- IMPORTANT:
-- before testing you must commentate line 495 UpdatePowerTabIntegrity( power_tab ): not upgrading power_tab and use the inital (example) value
local function Test_UpdateOobAir()

    --[[

    NOTE:
    In UpdateOobAir() apply this: local percentage_efficiency_effect_for_airbases = 100, local percentage_efficiency_effect_for_resupplies = 100

    ]]

    local result = true

    oob_air_old = deepcopy (oob_air)

    UpdateOobAir()


	for side, index in pairs(oob_air) do

        for index_value, oob_value in pairs(index) do
            --print("oob_air value: ", side, oob_value.base, oob_value.type, oob_value.roster.ready )
            --print("old oob_air value: ", side, oob_air_old[side][index_value].base, oob_air_old[side][index_value].type, oob_air_old[side][index_value].roster.ready )

            if oob_value.base == "Mozdok" or oob_value.base == "Mineralnye-Vody"  then
                result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.5 ) - 1  ) ) )

            elseif oob_value.base == "Beslan"  or oob_value.base == "Vaziani" or oob_value.base == "Senaki-Kolkhi"
                or ( oob_value.base == "Reserves" and side == "blue") then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.4 ) - 1  ) ) )

            elseif oob_value.base == "Sochi-Adler"  then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.3 ) - 1  ) ) )

            elseif oob_value.base == "Reserves" and side == "red" then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.25 ) - 1  ) ) )

            elseif oob_value.base == "Nalchik" or oob_value.base == "Kutaisi" or oob_value.base == "Batumi" then
                    result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.2 ) - 1  ) ) )

            elseif oob_value.base == "Maykop-Khanskaya"  then
                result = result and ( oob_value.roster.ready == math.floor( 0.5 + oob_air_old[side][index_value].roster.ready * ( 2^( 0.15 ) - 1  ) ) )

            end
        end
	end
	print("Test_UpdateOobAir(): " .. tostring(result) .. "\n")
    return result
end

local function Test_SaveTabOnDisk()

    power_tab_test = {
        ['red'] = {
            ['Prohladniy Depot MP 24'] = {
                ['integrity'] = 1,
                ['power_line_names'] = {
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
                ['power_line_names'] = {
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
                ['power_line_names'] = {
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
                ['power_line_names'] = {
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
                ['power_line_names'] = {
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

    SaveTabOnDisk( "power_tab_test", power_tab_test )
    power_tab_test = nil
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/power_tab_test.lua")
    local result = power_tab_test.blue["Novyy Afon Train Station - FH57"].integrity == 1
    power_tab_test = {

        ["red"] = {

            ["Prohladniy Depot MP 24"] = { -- power plant
                integrity = 0.8, -- integrity (property alive in targetlist) of power plant
                ["power_line_names"] = { -- table of power line powered of power plant
                    ["Bridge Alagir MN 36"] = { -- power line n.1
                        integrity = 0.5, -- integrity (property alive in targetlist) of power line
                        ["airbase_supply"] = {  -- airbases powered from this power line n.1
                            ["Beslan"] = true,
                            ["Reserves"] = true,
                            ["Mozdok"] = true
                        }
                    },
                    ["Bridge South Beslan MN 68"] = { -- power line n.2
                        integrity = 0.25,
                        ["airbase_supply"] = { -- airbases powered from this power line n.2
                            ["Nalchik"] = true,
                            ["Mineralnye-Vody"] = true
                        }
                    }
                }
            },
            ["Mineralnye-Vody Airbase"] = { -- another power plant and
                integrity = 0.4,
                ["power_line_names"] = {
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
                ["power_line_names"] = {
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
                ["power_line_names"] = {
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
    SaveTabOnDisk( "power_tab_test", power_tab_test )
    power_tab_test = nil
    dofile("E://DCE/DCE_GW_1975/DCS_SavedGames_Path/Mods/tech/DCE/Missions/Campaigns/1975 Georgian War/Active/power_tab_test.lua")
    result = result and ( power_tab_test.blue["Novyy Afon Train Station - FH57"].integrity == 0.8 )
    print("Test_SaveTabOnDisk(): " .. tostring(result) .. "\n")
    return result

end

local function executeAllTest()

	print("\nExecuting test" .. "\n")

	Test_InitializeAirbaseTab()
	-- OK

	Test_UpdatePowerPlantIntegrity()
	-- OK

	Test_UpdateAPowerLineIntegrity()
	-- OK

	Test_UpdatePowerTabIntegrity()
	-- OK

	Test_UpdatePowerAirbase()
	-- OK

	Test_UpdateAirbaseIntegrity()
	-- OK

	Test_UpdateAirbaseEfficiency()
    -- OK

	Test_UpdateOobAir()
	-- OK

    Test_SaveTabOnDisk()
    -- OK
end

if executeTest then
	executeAllTest()
end

--[[
att. le Reserves sono specificate per base e per name (lo squadrone delle riserve che e' associato negli event trigger definiti in camp_triggers.lua (utilizano la funzione Action.AirUnitReinforce("2nd Shaheen Squadron Res", "2nd Shaheen Squadron", 12)' dove il numero finale   sono gli aerei da trasferire limitato poi a 4 all'interno della funzione))
teoricamente si potrebbbe distinguere le riserve in power tab identificandole per i due parametri (che palle)

oob_air che contiene le informazioni sui resupply per airbases e reserves viene salvato su disco in MAIN_NextMission.lua
molto probabilmente il valore number non viene mai aggiornato in quanto costituisce il riferimento per calcolare se non ci
sono più aerei disponibili utilizzando i dati in [rooster]: lost, damaged e ready.
L'aggiornamento dei dati in [rooster]: lost, damaged e ready, viene fatto in DEBRIEF_StatsEvaluation.lua alla riga 149 "--oob loss update for crashed aircraft".
Quindi puoi fare l'updating di oob_air appena conclusa la missione in DEBRIEF_Master.lua prima della riga 87 "--run log evaluation and status updates"
considerando che la valutazione sulla vittoria della campagna deve essere fatta sicuramente dopo l'aggiornamento delle stat:

--run log evaluation and status updates
dofile("Active/power_tab.lua")
dofile("../../../ScriptsMod."..versionPackageICM.."/DC_Logistic.lua")
dofile("../../../ScriptsMod."..versionPackageICM.."/DEBRIEF_StatsEvaluation.lua")
dofile("../../../ScriptsMod."..versionPackageICM.."/DC_DestroyTarget.lua")												--Mod11.j
dofile("../../../ScriptsMod."..versionPackageICM.."/DC_UpdateTargetlist.lua")



OPPURE CONSIDERA:
verifica come i resupply sono aggiornati in oob_air.lua (vedi [rooster]) e applica li il coefficente di riduzione,
es: oob_air.lua - roster.ready = 30 * efficiency_<airbase>
l'aggiornamento di oob_air.lua: devi creare una tabella dove il nome della base (base) è associato al nome dello squadron (name) utilizzando oob_air.lua,

]]


