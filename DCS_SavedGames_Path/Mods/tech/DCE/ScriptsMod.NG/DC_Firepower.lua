
--To create the Air Tasking Order
--Initiated by Main_NextMission.lua
-------------------------------------------------------------------------------------------------------

if not versionDCE then 
	versionDCE = {} 
end

               -- VERSION --

versionDCE["DC_Firepower.lua"] = "OB.1.0.1"

-------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.1: implements compute firepower code
------------------------------------------------------------------------------------------------------- 

--NOTE: nella prima missione deve aggiornare Active/targelist (considerando il numero di elementi) e Init/db_loadouts
-- verificare l'effettiva esigenza nelle missioni successive di aggiornarli

local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
local log_level = "info" --LOGGING_LEVEL -- 
local function_log_level = log_level --"warn" 
log.activate = true
log.level = log_level 
log.outfile = LOG_DIR .. "LOG_DC_Firepower.lua." .. camp.mission .. ".log" 
local local_debug = false -- local debug   
local active_log = false
log.debug("Start")
require("Init/db_firepower")

local MAX_ALTITUDE_ATTACK_ROCKETS = 1500                -- (m) max altitude attack for rockets loadout (hAltitude)
local MAX_ALTITUDE_ATTACK_ASM = 3000                    -- (m) max altitude attack for ASM loadout (hAltitude)
local ACTIVATE_STANDOFF_SETUP = true                    -- assign loadouts.standoff with weapon.range only for ASM
local PERCENTAGE_RANGE_FOR_STANDOFF_SETUP = {
    ["ASM"] = 0.7,          -- standoff = percentage * range weapon
    ["Rockets"] = 0.6,          -- standoff = percentage * range weapon
}
local MIN_EFFICIENCY_WEAPON_ATTRIBUTE = 0.01            -- minimum value for weapon efficiency,  efficiency = accuracy * destroy_capacity (1 max, 0.01 min),  accuracy: hit success percentage, 1 max, 0.1 min, destroy_capacity: destroy single element capacity,  1 max ( element destroyed with single hit),  0.1 min
local MAX_EFFICIENCY_WEAPON_ATTRIBUTE = math.huge
local FIREPOWER_ROUNDED_COMPUTATION = 0.01
local FIREPOWER_ROUNDED_ASSIGNEMENT = 0.1
local MISSILE_A2A_FIREPOWER_AMPLIFIER = 1               -- min 1  for balancing number aircraft assigned in ATO_Generator
-- LOCAL FUNCTION

-- return weapon data for weapon (side optional to speed up searching). Return nil if weapon not found
local function searchWeapon(weapon, side)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "searchWeapon(weapon: ( " .. weapon .. "), side(" .. (side or "nil") .. ") ): "
    log.traceLow(nameFunction .. "Start")

    if side then -- side is defined

        for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate in weapon_db for side
            
            if weapon == weapon_name then   --found weapon, return weapon data
                log.traceVeryLow(nameFunction .. "found weapon: " .. weapon .. ", return weapon data")
                log.level = previous_log_level
                return weapon_data
            end
        end

    else -- side isn't defined

        for side, side_data in pairs(weapon_db) do -- iterate from side

            for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate in weapon_db for side
            
                if weapon == weapon_name then   --found weapon, return weapon data
                    log.traceVeryLow(nameFunction .. "found weapon: " .. weapon .. ", return weapon data")
                    log.level = previous_log_level
                    return weapon_data
                end
            end
        end
    end
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return nil -- not weapon was found, return nil
end

-- compute loadouts.standoff and loadouts.hattack with weapon.range for ASM
local function assignStandoffAndCost(loadout)
    local cost = 0
    local weapons = loadout.weapons
    
    for weapon_name, weapon_qty in pairs(weapons) do                       --iterate wapons airccraft
        local weapon_data = searchWeapon(weapon_name, nil)   
        
        if weapon_data then-- search weapon in db_weapons        
            local cost_weapon = weapon_data.cost or 0
            cost = cost + cost_weapon * weapon_qty
            
            -- loadout altitude attack (hAttack) and standoff evalutation
            if ACTIVATE_STANDOFF_SETUP and weapon_data and weapon_data.range and weapon_data.type and ( weapon_data.type == "ASM" or  weapon_data.type == "Rockets") then 
                local range = math.floor( 1000 * weapon_data.range * PERCENTAGE_RANGE_FOR_STANDOFF_SETUP[weapon_data.type] )                
                if weapon_data.type == "Rockets" then log.info("-- weapon: " .. weapon_name .. ", range: " .. range) end

                if weapon_data.hAttack then -- weapons defined hAttack has priority
                    loadout.hAttack = weapon_data.hAttack

                elseif not loadout.hAttack then -- hAttack loadout not define                                        
                    loadout.hAttack = math.floor( range / 1.414 ) -- calculate hAttack               

                    if weapon_data.type == "Rockets" and loadout.hAttack > MAX_ALTITUDE_ATTACK_ROCKETS then --applied altitude limits
                        loadout.hAttack = MAX_ALTITUDE_ATTACK_ROCKETS
                    
                    elseif weapon_data.type == "ASM" and loadout.hAttack > MAX_ALTITUDE_ATTACK_ASM then --applied altitude limits
                        loadout.hAttack = MAX_ALTITUDE_ATTACK_ASM
                    end                                                
                end                
                
                if loadout.hAttack > range then

                    local max_effective_range = math.floor( weapon_data.range * 900 ) --  max_effective_range is 90% (1000 + 0.9) of weapon.range (without PERCENTAGE_RANGE_FOR_STANDOFF_SETUP reduction)
                    local max_hAttack = math.floor(  max_effective_range / 1.414 )  -- max hAttack is square of triangle with diagonal = max_effective_range

                    if loadout.hAttack > max_hAttack then -- loadout.hAttack is too big
                        loadout.hAttack = max_hAttack
                        range = max_effective_range

                    else                    
                        range = math.floor( loadout.hAttack * 1.414 )-- new range is diagonal of triangle with hAttack square
                    end
                end
                local standoff = math.floor(math.sqrt(range*range - loadout.hAttack * loadout.hAttack)) --calculate standoff

                if weapon_data.type == "Rockets" then log.info("-- weapon: " .. weapon_name .. ", hAttack: " .. loadout.hAttack .. ", computed standoff: " .. standoff) end

                if weapon_data.standoff and weapon_data.standoff < standoff then -- defined weapon standoff has priority if lesser of calculate standoff
                    standoff = weapon_data.standoff                
                
                elseif weapon_data.standoff and weapon_data.standoff > standoff then
                    log.warn("Attention: weapon.standoff is bigger of calculated standoff -> standoff is weapon outrange")
                end

                if not loadout.standoff or loadout.standoff > standoff then -- loadout standoff not defined or bigger of calculated or weapon defined standoff
                    loadout.standoff = standoff -- update loadout.standoff to choice lesser standoff from any weapons loadout
                end                
                if weapon_data.type == "Rockets" then log.info("-- weapon: " .. weapon_name .. ", hAttack: " .. loadout.hAttack .. ", assigned standoff: " .. loadout.standoff) end
            end
        end
    end    
    loadout.cost = cost
end

-- return firepower value for weapon parameter (weapon_table) of a weapon
local function getWeaponFirepower(side, task, attribute, weapon_table)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "getWeaponFirepower(side: (" .. (side or "nil") .. "), task(" .. task .. "), attribute(" .. attribute .. "), weapon_table ): "    
    log.traceLow(nameFunction .. "Start")
    local weapon_name
    local weapon_qty
    local weapon_data
    local weapon_data_db
    local firepower = 0
    local check

    for weapon_name, weapon_qty in pairs(weapon_table) do                
        log.traceVeryLow(nameFunction .. "weapon_name: " .. weapon_name .. ", weapon_qty: " .. weapon_qty)
        weapon_data_db = searchWeapon(weapon_name, side)

        if weapon_data_db then
           log.traceVeryLow(nameFunction .. "found weapon_data_db for weapon: " .. weapon_name) 
            --check task
            check = false
            
            --verify if exist weapon with the required task
            for task_num, task_name in pairs(weapon_data_db.task) do
                
                if task_name == task then
                    check = true --exist weapon with the required task
                    break
                end
            end

            if check then
               
                check = false
                 
                --verify if exist weapon with required attribute
                for attribute_name, attribute_item in pairs(weapon_data_db.efficiency) do

                    if attribute_name == attribute then 
                        check = true --exist weapon with the required attribute
                        break
                    end
                end
            
                if check then   -- calculates the average fire based on the data of each weapon that has the same task and the same attribute
                    firepower = firepower + roundAtNumber(weapon_qty * weapon_data_db.efficiency[attribute].mix.accuracy * weapon_data_db.efficiency[attribute].mix.destroy_capacity * ( 1 - weapon_data_db.perc_efficiency_variability), FIREPOWER_ROUNDED_COMPUTATION) -- untis firepower is calculated considering dimension target = mix and decreased of perc_efficiency_variability (aircraft needed bigger loadoutas to compensate efficiency variability)            
                    log.traceVeryLow(nameFunction .. "update unit firepower for weapon " .. weapon_name .. ": firepower: " .. firepower .. ", accuracy: " .. weapon_data_db.efficiency[attribute].mix.accuracy .. ", destroy_capacity: " .. weapon_data_db.efficiency[attribute].mix.destroy_capacity .. ", weapon_qty: " .. weapon_qty) 
                end
            end
        end
    end
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return firepower
end

-- return true if year is within validity period of wapon usage (start_service <= year <= end_service)
local function isWeaponUsable(weapon_name, year)
    return ( weapon_db[weapon_name].start_service and weapon_db[weapon_name].start_service <= year or false ) and ( weapon_db[weapon_name].end_service and weapon_db[weapon_name].start_service >= year or false )
end

-- return firepower of A2A missile
local function evalutateFirepowerA2AMissile(missile_data)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "evalutateFirepowerA2AMissile(missile_data): "
    log.traceLow(nameFunction .. "Start")

    local firepower
    local range_factor = 0.8
    local semiactive_range_factor = 1
    local active_range_factor = 1
    local max_height_factor = 0.8
    local max_speed_factor = 0.8
    local tnt_factor = 0.8 
    local seeker_factor    
    
    if missile_data.seeker == "radar" then
    
        if missile_data.range then
            range_factor = missile_data.range / REFERENCE_EFFICIENCY_MISSILE_A2A.radar_range

            --[[if range_factor > 1 then
                range_factor = 1
            end]]
        end
            
        if missile_data.active_range then
            active_range_factor = 1 + missile_data.active_range / REFERENCE_EFFICIENCY_MISSILE_A2A.active_range
    
            --[[if active_range_factor > 1 then
                active_range_factor = 1
            end]]
        end

        --[[if missile_data.semiactive_range then        
            semiactive_range_factor = missile_data.semiactive_range / REFERENCE_EFFICIENCY_MISSILE_A2A.semiactive_range

            if semiactive_range_factor > 1 then
                semiactive_range_factor = 1
            end       
        end]]

        if missile_data.max_height then
            max_height_factor = missile_data.max_height / REFERENCE_EFFICIENCY_MISSILE_A2A.max_height_radar_missile
    
            if max_height_factor > 1 then
                max_height_factor = 1
            end
        end
    
        if missile_data.max_speed then
            max_speed_factor = missile_data.max_speed / REFERENCE_EFFICIENCY_MISSILE_A2A.max_speed_radar_missile
    
            --[[if max_speed_factor > 1 then
                max_speed_factor = 1
            end]]
        end
        seeker_factor = max_speed_factor * max_height_factor * semiactive_range_factor * active_range_factor * range_factor

    elseif missile_data.seeker == "infrared" or missile_data.seeker == "electro-optical" then
        
        range_factor = missile_data.range / REFERENCE_EFFICIENCY_MISSILE_A2A.infrared_range
       
        --[[if range_factor > 1 then
            range_factor = 1
        end]]

        if missile_data.max_height then
            max_height_factor = missile_data.max_height / REFERENCE_EFFICIENCY_MISSILE_A2A.max_height_infrared_missile
    
            --[[if max_height_factor > 1 then
                max_height_factor = 1
            end]]
        end
    
        if missile_data.max_speed then
            max_speed_factor = missile_data.max_speed / REFERENCE_EFFICIENCY_MISSILE_A2A.max_speed_infrared_missile
    
            --[[if max_speed_factor > 1 then
                max_speed_factor = 1
            end]]
        end
        seeker_factor = max_speed_factor * max_height_factor * range_factor
    end

    if missile_data.tnt then
        tnt_factor = missile_data.tnt / REFERENCE_EFFICIENCY_MISSILE_A2A.tnt

        --[[if tnt_factor > 1 then
            tnt_factor = 1
        end]]
    end
    
    -- compression firepower from 0.1 to 1
    -- ready * (  2^( efficiency * percentage_efficiency_influence ) - 1 ) ) -- min: 0 max = actual roster.ready
    firepower = missile_data.reliability * missile_data.manouvrability * seeker_factor * tnt_factor * MISSILE_A2A_FIREPOWER_AMPLIFIER

    if firepower > 1 then
        firepower = 1
    end
    
    -- normalize firepower from 0.1 to 1.1
    firepower = 2^(firepower) - 0.1 
    firepower = roundAtNumber(firepower, FIREPOWER_ROUNDED_COMPUTATION)

    log.traceVeryLow(nameFunction .. "seeker_factor: " .. seeker_factor .. ", tnt_factor: " .. tnt_factor)
    log.traceVeryLow(nameFunction .. "missile_data.reliability: " .. missile_data.reliability .. ", missile_data.manouvrability: " .. missile_data.manouvrability .. ", firepower: " .. firepower)
    log.level = previous_log_level
    return firepower
end

-- return true if task_name is a A2A task (CAP, ..)
local function isA2ATask(task_name)    

    return task_name == "Intercept" or task_name == "CAP" or task_name == "Fighter Sweep" or task_name == "Escort"
end

-- return true if task_name is a A2G task (Strike, ..)
local function isA2GTask(task_name)    

    return task_name == "Strike" or task_name == "Anti-ship Strike" or task_name == "SEAD"
end

-- return true if task_name isn't air fight task (refuelling, Transport and AWACS)
local function isNotFightTask(task_name)

    return task_name == "Transport" or task_name == "Refueling" or task_name == "AWACS"
end

-- return a key (string) for table computed_target_efficiency
local function getKeyComputedEfficiency(num_targets_element, side, dimension_element, attribute, task, firepower_min, choice_value)
    return tostring(num_targets_element) .. side .. tostring(dimension_element) .. attribute .. task .. tostring(firepower_min) .. choice_value
end

-- insert an element (key, value) in table computed_target_efficiency
local function insertEfficiency(key, efficiency)
    computed_target_efficiency[key] = efficiency
end
 
-- return name. median efficiency and median efficiency_variability of weapons defined in weapon_db for attribute and task parameters, return nil if no weapon found
-- efficiency = accuracy * destroy_capacity (1 max, 0.01 min)
-- accuracy: hit success percentage, 1 max, 0.1 min, 
-- destroy_capacity: destroy single element capacity,  1 max ( element destroyed with single hit),  0.1 min
local function medEfficiencyWeapon(side, target_attribute, target_dimension, task)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "medEfficiencyWeapon(target_attribute: " .. target_attribute .. ", target_dimension: " .. target_dimension .. ", task: " .. task .."): "
    log.traceLow(nameFunction .. "Start")
    
    local draft_weapon_efficiency = 0
    local draft_weapon_variability = 0    
    local i = 0
    local break_loop = false


    -- calculates the average fire based on the data of each weapon that has the same task and the same attribute
    for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate weapons
        
        if weapon_data.start_service and ( weapon_data.start_service > camp.date.year ) then
            log.traceLow(nameFunction .. "campaign year(" .. camp.date.year .. ") is over of weapon start service(" .. weapon_data.start_service .. "), End")            
            
        else        

            for n_weapon_task, weapon_task in pairs(weapon_data.task) do -- itarate to search weapon for task

                if task == weapon_task then  -- found weapon for this task                

                    for attribute_name, attribute_data in pairs(weapon_data.efficiency) do -- iterate for search attribute data for target attirbute

                        if target_attribute == attribute_name then  -- found attribure data for target attribute
                            log.traceVeryLow(nameFunction .. "found weapon with attribute: " .. attribute_name .. ", and task: " .. task)
                            break_loop = true

                            for dimension_name, dimension_data in pairs(attribute_data) do -- iterate for search dimension data for target dimension

                                if dimension_name == target_dimension then -- found efficiency data for target dimension
                                    draft_weapon_efficiency = draft_weapon_efficiency + dimension_data.accuracy * dimension_data.destroy_capacity       
                                    draft_weapon_variability = draft_weapon_variability +  weapon_data.perc_efficiency_variability                         
                                    i = i + 1
                                    log.traceVeryLow(nameFunction .. "found weapon: " .. weapon_name .. " with efficienty: " .. tostring(dimension_data.accuracy * dimension_data.destroy_capacity) .. "(accuracy value: " .. dimension_data.accuracy .. ", destroy_capacity value: " .. dimension_data.destroy_capacity .. "), perc_efficiency_variability: " .. weapon_data.perc_efficiency_variability .. ", values added for comput media: " .. i)                                                                         
                                end
                            end  
                            break_loop = true
                            break -- break attribute iteration, weapon efficiency data are defined for single attribute and single task
                        end
                    end
                end             

                if break_loop then
                    break -- break task iteration, weapon efficiency data are defined for single attribute and single task
                end
            end
        end
    end

    if break_loop then
        draft_weapon_efficiency = roundAtNumber( draft_weapon_efficiency / i, FIREPOWER_ROUNDED_COMPUTATION)
        draft_weapon_variability = roundAtNumber( draft_weapon_variability / i, FIREPOWER_ROUNDED_COMPUTATION)
    else
        draft_weapon_efficiency = nil
        draft_weapon_variability = nil
    end

    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return draft_weapon_efficiency, draft_weapon_variability
end

-- return name. efficiency and efficiency_variability of weapon with max efficiency defined in weapon_db for attribute and task parameters, return efficiency -1 if no weapon found
-- efficiency = accuracy * destroy_capacity (1 max, 0.01 min)
-- accuracy: hit success percentage, 1 max, 0.1 min, 
-- destroy_capacity: destroy single element capacity,  1 max ( element destroyed with single hit),  0.1 min
local function maxEfficiencyWeapon(side, target_attribute, target_dimension, task)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "maxEfficiencyWeapon(target_attribute: " .. target_attribute .. ", target_dimension: " .. target_dimension .. ", task: " .. task .."): "
    log.traceLow(nameFunction .. "Start")

    local choice_weapon_efficiency = -1
    local draft_weapon_efficiency = -2
    local choice_weapon_variability = -3
    local choice_weapon_name = ""
    local break_loop = false

    for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate weapons     
        
        if weapon_data.start_service and ( weapon_data.start_service > camp.date.year ) then
            log.traceLow(nameFunction .. "campaign year(" .. camp.date.year .. ") is over of weapon start service(" .. weapon_data.start_service .. "), End")            
            
        else  

            for n_weapon_task, weapon_task in pairs(weapon_data.task) do -- itarate to search weapon for task

                if task == weapon_task then  -- found weapon for this task               

                    for attribute_name, attribute_data in pairs(weapon_data.efficiency) do -- iterate for search attribute data for target attirbute

                        if target_attribute == attribute_name then  -- found attribure data for target attribute
                            log.traceVeryLow(nameFunction .. "found weapon with attribute: " .. attribute_name .. ", and task: " .. task)
                            break_loop = true

                            for dimension_name, dimension_data in pairs(attribute_data) do -- iterate for search dimension data for target dimension

                                if dimension_name == target_dimension then -- found efficiency data for target dimension
                                    draft_weapon_efficiency = roundAtNumber(dimension_data.accuracy * dimension_data.destroy_capacity, FIREPOWER_ROUNDED_COMPUTATION)
                                    
                                    if choice_weapon_efficiency < draft_weapon_efficiency then                           
                                        log.traceVeryLow(nameFunction .. "found weapon: " .. weapon_name .. " with bigger efficienty: " .. draft_weapon_efficiency .. "(accuracy value: " .. dimension_data.accuracy .. ", destroy_capacity value: " .. dimension_data.destroy_capacity .. "), perc_efficiency_variability: " .. weapon_data.perc_efficiency_variability .. ", previous best efficiency value: " .. choice_weapon_efficiency)         
                                        choice_weapon_efficiency = draft_weapon_efficiency
                                        choice_weapon_variability = weapon_data.perc_efficiency_variability
                                        choice_weapon_name = weapon_name
                                    end
                                end
                            end  
                            break_loop = true
                            break -- break attribute iteration, weapon efficiency data are defined for single attribute and single task
                        end
                    end
                end
                
                if break_loop then
                    break -- break task iteration, weapon efficiency data are defined for single attribute and single task
                end            
            end
        end
    end
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return choice_weapon_name, choice_weapon_efficiency, choice_weapon_variability
end

-- return name efficiency and efficiency_variability of weapon with min efficiency defined in weapon_db for attribute and task parameters, return efficiency math.uge if no weapon found
-- efficiency = accuracy * destroy_capacity (1 max, 0.01 min)
-- accuracy: hit success percentage, 1 max, 0.1 min, 
-- destroy_capacity: destroy single element capacity,  1 max ( element destroyed with single hit),  0.1 min
local function minEfficiencyWeapon(side, target_attribute, target_dimension, task)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "maxEfficiencyWeapon(target_attribute: " .. target_attribute .. ", target_dimension: " .. target_dimension .. ", task: " .. task .."): "
    log.traceLow(nameFunction .. "Start")

    local choice_weapon_efficiency = MAX_EFFICIENCY_WEAPON_ATTRIBUTE
    local draft_weapon_efficiency
    local choice_weapon_variability = 0
    local choice_weapon_name = ""
    local break_loop = false


    for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate weapons

        if weapon_data.start_service and ( weapon_data.start_service > camp.date.year ) then
            log.traceLow(nameFunction .. "campaign year(" .. camp.date.year .. ") is over of weapon start service(" .. weapon_data.start_service .. "), End")            
            
        else  
        
            for n_weapon_task, weapon_task in pairs(weapon_data.task) do -- itarate to search weapon for task

                if task == weapon_task then  -- found weapon for this task

                    for attribute_name, attribute_data in pairs(weapon_data.efficiency) do -- iterate for search attribute data for target attirbute

                        if target_attribute == attribute_name then  -- found attribure data for target attribute
                            log.traceVeryLow(nameFunction .. "found weapon with attribute: " .. attribute_name .. ", and task: " .. task)

                            for dimension_name, dimension_data in pairs(attribute_data) do -- iterate for search dimension data for target dimension

                                if dimension_name == target_dimension then -- found efficiency data for target dimension
                                    draft_weapon_efficiency = roundAtNumber(dimension_data.accuracy * dimension_data.destroy_capacity, FIREPOWER_ROUNDED_COMPUTATION)
                                    
                                    if choice_weapon_efficiency > draft_weapon_efficiency then                           
                                        log.traceVeryLow(nameFunction .. "found weapon: " .. weapon_name .. " with bigger efficienty: " .. draft_weapon_efficiency .. "(accuracy value: " .. dimension_data.accuracy .. ", destroy_capacity value: " .. dimension_data.destroy_capacity .. "), perc_efficiency_variability: " .. weapon_data.perc_efficiency_variability .. ", previous best efficiency value: " .. choice_weapon_efficiency)         
                                        choice_weapon_efficiency = draft_weapon_efficiency
                                        choice_weapon_variability = weapon_data.perc_efficiency_variability
                                        choice_weapon_name = weapon_name
                                    end
                                end
                            end  
                            break_loop = true
                            break -- weapon efficiency data are defined for single task                        
                        end
                    end
                end
                if break_loop then
                    break -- break task iteration, weapon efficiency data are defined for single attribute and single task
                end               
            end
        end
    end
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return choice_weapon_name, choice_weapon_efficiency, choice_weapon_variability
end

-- da inserire in UTIL_Function o in un nuovo file DC_Firepower.lua (con data tab e funzioni)
-- compute firepower min, max for a target utiling best efficiency dedicated weapon. number of element = num_targets_element, using a dedicated weapon (defined in targetlist for that task and attribute) 
local function evaluate_target_firepower( num_targets_element, side, dimension_element, attribute, task, choice_value )    
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "evaluate_target_firepower( num_targets_element(" .. num_targets_element .. "), side: " .. side .. ", dimension_element(" .. dimension_element .. "), attribute(" .. attribute .. "), task(" .. task .. ") ): "
    log.traceLow(nameFunction .. "Start")
    local best_name_weapon, best_weapon_efficiency, best_weapon_variability
    local calculated_firepower_min, calculated_firepower_max

    if choice_value == "max" then
        best_name_weapon, best_weapon_efficiency, best_weapon_variability = maxEfficiencyWeapon(side, attribute, dimension_element, task)

    elseif choice_value == "min" then
        best_name_weapon, best_weapon_efficiency, best_weapon_variability = minEfficiencyWeapon(side, attribute, dimension_element, task)
    
    else
        best_weapon_efficiency, best_weapon_variability = medEfficiencyWeapon(side, attribute, dimension_element, task)
    end

    log.traceVeryLow(nameFunction .. "best_name_weapon(choice_value: " .. choice_value .. "): " .. (best_name_weapon or "nil") .. ", best_weapon_efficiency: " .. (best_weapon_efficiency or "nil") .. ", best_weapon_variability: " .. (best_weapon_variability or "nil"))

    if best_weapon_efficiency then

        if best_weapon_efficiency < MIN_EFFICIENCY_WEAPON_ATTRIBUTE then

            if best_weapon_efficiency < 0 then -- not found a weapon for this target
                log.warn(nameFunction .. "not found weapon for task: " .. task .. ", attribute: " .. attribute .. ", compute firepower with best_efficiency = 0.5")
                best_weapon_efficiency = 0.5
            
            else
                log.warn(nameFunction .. "found weapon for task: " .. task .. ", attribute: " .. attribute .. ", with best_efficiency < MIN_EFFICIENCY_WEAPON_ATTRIBUTE(" .. MIN_EFFICIENCY_WEAPON_ATTRIBUTE .. "), compute firepower with best_efficiency = " .. MIN_EFFICIENCY_WEAPON_ATTRIBUTE)
                best_weapon_efficiency = MIN_EFFICIENCY_WEAPON_ATTRIBUTE
            end
        
        elseif best_weapon_efficiency >= MAX_EFFICIENCY_WEAPON_ATTRIBUTE then -- not found a weapon for this target
            log.warn(nameFunction .. "not found weapon for task: " .. task .. ", attribute: " .. attribute)
            best_weapon_efficiency = nil
        end

    else
        log.warn(nameFunction .. "not found weapon for task: " .. task .. ", attribute: " .. attribute)
        best_weapon_efficiency = nil
    end
    
    if best_weapon_efficiency then
        calculated_firepower_min = roundAtNumber( num_targets_element / best_weapon_efficiency, FIREPOWER_ROUNDED_COMPUTATION )
        calculated_firepower_max = roundAtNumber( calculated_firepower_min * ( 1 + best_weapon_variability ), FIREPOWER_ROUNDED_COMPUTATION )     
    end

    log.traceVeryLow(nameFunction .. "computed firepower min, max: " .. (calculated_firepower_min or "nil") .. ", " .. (calculated_firepower_max or "nil"))
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return calculated_firepower_min, calculated_firepower_max
end

-- return firepower (min or max) value 
local function getTargetFirepower( num_targets_element, side, dimension_element, attribute, task, choice_firepower_min, choice_value )  
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "getTargetFirepower( num_targets_element(" .. num_targets_element .. "), side: " .. side .. ", dimension_element(" .. dimension_element .. "), attribute(" .. attribute .. "), task(" .. task .. "), choice_firepower_min: " .. tostring(choice_firepower_min) .. ", choice_value: " .. choice_value .. "): "
    log.traceLow(nameFunction .. "Start")
    local key = getKeyComputedEfficiency(num_targets_element, side, dimension_element, attribute, task, choice_firepower_min, choice_value)
    log.traceVeryLow(nameFunction .. "key: " ..  key)
    local firepower = computed_target_efficiency[key]

    if firepower then -- firepower exist in computed_target_efficiency table
        log.traceVeryLow(nameFunction .. "firepower exist in computed_target_efficiency table, firepower: " ..  firepower)
        log.level = previous_log_level
        return firepower -- return firepower
    
    else  -- firepower not exist in computed_target_efficiency table  
        local firepower, firepower_max        
        firepower, firepower_max = evaluate_target_firepower( num_targets_element, side, dimension_element, attribute, task, choice_value ) --compute firepower min and max        

        if firepower and firepower_max then -- store firepower(min) and firepower_max in  computed_target_efficiency table  
            log.traceVeryLow(nameFunction .. "firepower not exist in computed_target_efficiency table, compute firepower min and max: " ..  firepower .. ", " .. firepower_max)
            key = getKeyComputedEfficiency(num_targets_element, side, dimension_element, attribute, task, true, choice_value)
            computed_target_efficiency[key] = firepower
            -- table.insert(computed_target_efficiency, 1, {[key] = firepower} )
            log.traceVeryLow(nameFunction .. "store firepower min  computed_target_efficiency table, key: " ..  key)
            key = getKeyComputedEfficiency(num_targets_element, side, dimension_element, attribute, task, false, choice_value)
            computed_target_efficiency[key] = firepower_max
            --table.insert(computed_target_efficiency, 1, {[key] = firepower_max} )
            log.traceVeryLow(nameFunction .. "store firepower max in  computed_target_efficiency table, key: " ..  key)
        else
            log.warn(nameFunction .. "firepower wasn't computed, returned nil value. End")
            log.level = previous_log_level
            return nil
        end
    
        if choice_firepower_min then --if requested firepower min
            log.level = previous_log_level
            log.warn(nameFunction .. "firepower min computed: " .. firepower .. ", returned value. End")
            return firepower
    
        else --if requested firepower max
            log.level = previous_log_level
            log.warn(nameFunction .. "firepower max computed: " .. firepower_max .. ", returned value. End")
            return firepower_max
        end        
    end
end

-- load computed_target_efficiency table, if not exist create one new
local function loadComputedTargetEfficiency()

    if camp.mission > 1 and io.open("Active/computed_target_efficiency.lua", "r") then
        require("Active/computed_target_efficiency") -- load stored computed_target_efficiency.lua if not first mission campaign and exist table

    else -- initialize new computed_target_efficiency if not exist 
        computed_target_efficiency = {} 
        SaveTabOnPath( "Active/", "computed_target_efficiency", computed_target_efficiency )         
    end
end



-- GLOBAL FUNCTION

-- call from DC_UpdateTargetList, initialize firepower value for target in targetlist
function defineTargetListFirepower(targetlist)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "defineTargetListFirepower(targetlist): "
    log.traceLow(nameFunction .. "Start")
    local alive
 
    loadComputedTargetEfficiency()

    if not computed_target_efficiency then
        log.error(nameFunction .. "computed_target_efficiency wasn't initializated!")
    end

    local task, num_elements, attribute, class, dimension, firepower_min, firepower_max

    for side_name, side in pairs(targetlist) do
    
        for target_name, target in pairs(side) do
            
            task = target.task -- antiship_strike, strike, ...            

            if isNotFightTask(task) then
                firepower_min = 1
                firepower_max = 1
            
            elseif task == "CAP" then
                firepower_min = 2
                firepower_max = 4

            elseif task == "Intercept" then
                firepower_min = 2
                firepower_max = 5
            
            elseif task == "Fighter Sweep" then
                firepower_min = 3
                firepower_max = 5

            elseif task == "Escort" then
                firepower_min = 2
                firepower_max = 4
            
            else            
                attribute = target.attributes[1] or "nil" -- soft, armor ecc (deve? essere sempre un solo attributo)            
                class = target.class or "scenery"-- ship, vehicle, ecc.

                if target.elements then
                    
                    if target.alive then
                        alive = target.alive / 100
                    else
                        alive = 1
                    end

                    num_elements = #target.elements * alive -- num of element of target
                
                elseif target.unit and target.unit.number then
                    num_elements = target.unit.number
                
                elseif class == "ship" then
                    num_elements = 9

                elseif class == "vehicle" then
                    num_elements = 13

                elseif class == "airbase" then
                    num_elements = 9

                elseif class == "static" then
                    num_elements = 8

                else
                    num_elements = 8
                    log.warn(nameFunction .. "elements and class not defined -> nume_element = 8")
                end
                dimension = target.dimension or "mix" -- mix, med, big, small


                log.traceVeryLow(nameFunction .. "target_name: " .. target_name .. ", task: " .. task .. ", num_elements" .. num_elements .. ", attribute: " .. attribute .. ", class: " .. class .. ", dimension: " ..dimension)

                firepower_min = getTargetFirepower(num_elements, side_name, dimension, attribute, task, true, "med")
                firepower_max = getTargetFirepower(num_elements, side_name, dimension, attribute, task, false, "med")                
            end
            log.traceVeryLow(nameFunction .. "target_name: " .. target_name .. ", firepower_min: " .. (firepower_min or "nil") .. ", firepower_max: " .. (firepower_max or "nil"))

            target.firepower.min = firepower_min or 99999
            target.firepower.max = firepower_max or 99999            
        end
    end    
    SaveTabOnPath( "Active/", "computed_target_efficiency", computed_target_efficiency )         
    log.traceVeryLow(nameFunction .. "computed_target_efficiency:\n" .. inspect(computed_target_efficiency))
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return
end

-- call from MAIN_NextMission, initialize firepower value for loadouts
function defineLoadoutsFirepower()
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "defineLoadoutsFirepower(): "
    log.traceLow(nameFunction .. "Start")
    local task, weapons, weapon_data, firepower, i    

    for aircraft_name, aircraft in pairs(db_loadouts) do -- interate aircraft
    
        for task_name, task in pairs(aircraft) do -- iterate task: Intercept, CAP, antiship_strike, strike, ...            

            for loadout_name, loadout in pairs(task) do -- iterate loadout       
                         
                weapons = loadout.weapons

                if weapons then --aircraft has weapons

                    assignStandoffAndCost(loadout) 
                    
                    if isA2ATask(task_name) or task_name == "Reconnaissance" then --air to air task or armed reconnaisance task
                        firepower = 0

                        for weapon_name, weapon_qty in pairs(weapons) do                       --iterate wapons airccraft
                            weapon_data = searchWeapon(weapon_name, nil)                        -- search weapon in db_weapons

                            if weapon_data and weapon_data.type and weapon_data.type == "AAM" and weapon_data.start_service and ( weapon_data.start_service <= camp.date.year ) then -- weapons is compliants update firepower
                                firepower = firepower + weapon_qty * evalutateFirepowerA2AMissile(weapon_data) --update firepower with firpowers weapon
                                log.traceVeryLow(nameFunction .. "computed firepower for aircraft: " .. aircraft_name .. ", task: " .. task_name .. ", weapon: " .. weapon_name .. ", quantity: " .. weapon_qty .. ", firepower: " .. firepower)
                                
                            elseif weapon_data and weapon_data.start_service and ( weapon_data.start_service > camp.date.year ) then -- weapon not in service during the campaign period
                                log.traceLow(nameFunction .. "campaign year(" .. camp.date.year .. ") is over of weapon start service(" .. weapon_data.start_service .. "), End")            
                                log.warn(nameFunction .. "weapon(" .. weapon_name .. ") start service: " .. weapon_data.start_service .. " not compliant with campaign year: " .. camp.date.year)
                                                            
                            else
                                log.warn(nameFunction .. "weapon:" .. weapon_name .. ", not found in db_weapon. Return")                                
                            end
                        end                        
                    
                    elseif isA2GTask(task_name) then --air to ground task
                        i = 0
                        firepower = 0
                        
                        for attribute_num, attribute_name in pairs(loadout.attributes) do -- iterate attributes loadout
                            firepower = firepower + getWeaponFirepower(nil, task_name, attribute_name, weapons) -- update firepower with weapon firepower
                            i = i + 1
                            log.traceVeryLow(nameFunction .. "computed firepower for aircraft: " .. aircraft_name .. ", task: " .. task_name .. ", attribute_name: " .. attribute_name .. ", firepower: " .. firepower .. ", i: " .. i)            
                        end 
                        firepower = roundAtNumber(firepower / i, FIREPOWER_ROUNDED_ASSIGNEMENT ) -- firpower is median value of firepowers weapon                       

                    elseif isNotFightTask(task_name) then
                        log.warn(nameFunction .. "check db_loadouts.lua, found a Not Fight Task: " .. task_name .. " with weapons:\n" .. inspect(weapons))

                    else
                        log.warn(nameFunction .. "unknow task: " .. task_name .. ", check db_loadouts.lua")
                    end

                    if firepower then                        
                        loadout.firepower = firepower -- update firepower in db_loadouts.lua                        
                        log.traceVeryLow(nameFunction .. "computed firepower for aircraft: " .. aircraft_name .. ", task: " .. task_name .. ", firepower: " .. firepower .. " assigned in db_loadouts")
                    
                    else
                        log.traceVeryLow(nameFunction .. "firepower wasn't computed for aircraft: " .. aircraft_name .. ", task: " .. task_name .. ", fi6repower  assigned in db_loadouts")
                    end
                end                
            end            
        end
    end  
     
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return
end
