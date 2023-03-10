
--To create the Air Tasking Order
--Initiated by Main_NextMission.lua
-------------------------------------------------------------------------------------------------------

if not versionDCE then 
	versionDCE = {} 
end

               -- VERSION --

versionDCE["DC_Firepower.lua"] = "OB.1.0.0"

-------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.0: first coding 
------------------------------------------------------------------------------------------------------- 

--NOTE: nella prima missione deve aggiornare Active/targelist (considerando il numero di elementi) e Init/db_loadouts
-- verificare l'effettiva esigenza nelle missioni successive di aggiornarli

local log = dofile("../../../ScriptsMod."..versionPackageICM.."//UTIL_Log.lua")
local log_level = "traceVeryLow" --LOGGING_LEVEL -- 
local function_log_level = log_level --"warn" 
log.activate = true
log.level = log_level 
log.outfile = LOG_DIR .. "LOG_DC_Firepower.lua." .. camp.mission .. ".log" 
local local_debug = true -- local debug   
local active_log = false
log.debug("Start")


local MIN_EFFICIENCY_WEAPON_ATTRIBUTE = 0.01 -- minimum value for weapon efficiency,  efficiency = accuracy * destroy_capacity (1 max, 0.01 min),  accuracy: hit success percentage, 1 max, 0.1 min, destroy_capacity: destroy single element capacity,  1 max ( element destroyed with single hit),  0.1 min
local MAX_EFFICIENCY_WEAPON_ATTRIBUTE = 9999999999

-- load computed_target_efficiency table, if not exist create one new
function loadComputedTargetEfficiency()

    if camp.mission > 1 and io.open("Active/computed_target_efficiency.lua", "r") then
        require("Active/computed_target_efficiency") -- load stored computed_target_efficiency.lua if not first mission campaign and exist table

    else -- initialize new computed_target_efficiency if not exist 
        computed_target_efficiency = {} 
        SaveTabOnPath( "Active/", "computed_target_efficiency", computed_target_efficiency )         
    end
end



-- return true if year is within validity period of wapon usage (start_service <= year <= end_service)
local function isWeaponUsable(weapon_name, year)
    return ( weapon_db[weapon_name].start_service and weapon_db[weapon_name].start_service <= year or false ) and ( weapon_db[weapon_name].end_service and weapon_db[weapon_name].start_service >= year or false )
end



-- return true if task_name is a A2A task (CAP, ..)
local function isA2ATask(task_name)    

    return task_name == "Intercept" or task_name == "CAP" or task_name == "Fighter Sweep" or task_name == "Escort"
end

-- return true if task_name is a A2G task (Strike, ..)
local function isA2GTask(task_name)    

    return task_name == "Strike" or task_name == "Anti-ship Strike"
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
        draft_weapon_efficiency = draft_weapon_efficiency / i
        draft_weapon_variability = draft_weapon_variability / i
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
                                    draft_weapon_efficiency = dimension_data.accuracy * dimension_data.destroy_capacity                                 
                                    
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
                                    draft_weapon_efficiency = dimension_data.accuracy * dimension_data.destroy_capacity                                 
                                    
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
        calculated_firepower_min = math.ceil( num_targets_element / best_weapon_efficiency )
        calculated_firepower_max = math.ceil( calculated_firepower_min * ( 1 + best_weapon_variability ) )     
    end

    log.traceVeryLow(nameFunction .. "computed firepower min, max: " .. (calculated_firepower_min or "nil") .. ", " .. (calculated_firepower_max or "nil"))
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return calculated_firepower_min, calculated_firepower_max
end


-- return firepower (min or max) value 
function getTargetFirepower( num_targets_element, side, dimension_element, attribute, task, choice_firepower_min, choice_value )  
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

-- call from DC_UpdateTargetList, initialize firepower value for target in targetlist
function defineTargetListFirepower(targetlist)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "defineTargetListFirepower(targetlist): "
    log.traceLow(nameFunction .. "Start")
 
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
            
            else            
                attribute = target.attributes[1] or "nil" -- soft, armor ecc (deve? essere sempre un solo attributo)            
                class = target.class or "scenery"-- ship, vehicle, ecc.

                if target.elements then
                    num_elements = #target.elements -- num of element of target
                
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

-- return weapon data for weapon (side optional to speed up searching). Return nil if weapon not found
local function searchWeapon(weapon, side)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "searchWeapon(weapon: " .. weapon .. "), side(" .. side .. "): "
    log.traceLow(nameFunction .. "Start")

    if side then -- side is defined

        for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate in weapon_db for side
            
            if weapon == weapon_name then   --found weapon, return weapon data
                log.level = previous_log_level
                return weapon_data
            end
        end

    else -- side isn't defined

        for side, side_data in pairs(weapon_db) do -- iterate from side

            for weapon_name, weapon_data in pairs(weapon_db[side]) do -- iterate in weapon_db for side
            
                if weapon == weapon_name then   --found weapon, return weapon data
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


-- return firepower value for weapon parameter (weapon_table) of a weapon
function getWeaponFirepower(side, task, attribute, weapon_table)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "getWeaponFirepower(side: " .. side .. "), task(" .. task .. "), attribute(" .. attribute .. ", weapon_table) ): "    
    log.traceLow(nameFunction .. "Start")
    local weapon_name
    local weapon_qty
    local weapon_data
    local weapon_data_db
    local firepower = 0

    for num_weapon, weapon_data in pairs(weapon_table) do        
        weapon_name = weapon_data.name
        weapon_qty = weapon_data.quantity
        log.traceVeryLow("num_wepon: " .. num_weapon .. ", weapon_name: " .. weapon_name .. ", weapon_qty: " .. weapon_qty)
        weapon_data_db = searchWeapon(weapon_name, side)
        
        if weapon_data_db then
            firepower = firepower + weapon_qty * weapon_data_db.efficiency[attribute].mix.accuracy *  weapon_data_db.efficiency[attribute].mix.destroy_capacity * ( 1 + weapon_data_db.perc_efficiency_variability) -- untis firepower is calculated considering dimension target = mix and increased of perc_efficiency_variability
            log.traceVeryLow(nameFunction .. "update unit firepower for weapon " .. weapon_name .. ": firepower: " .. firepower .. ", accuracy: " .. weapon_data_db.efficiency[attribute].mix.accuracy .. ", destroy_capacity: " .. weapon_data_db.efficiency[attribute].mix.destroy_capacity .. ", weapon_qty: " .. weapon_qty) 
        end
    end
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return firepower
end

-- return firepower of A2A missile
local function evalutateFirepowerA2AMissile(missile_data)

    local firepower
    local range_factor = 0.1 --range equivalent 10 km            
    local semiactive_range_factor = 1 --
    local active_range_factor = 1 --
    local max_height_factor = 1 -- 
    local max_speed_factor = 0.5 -- speed equivalent 1900 km/h
    local tnt_factor = 0.3 -- tnt equivalent 10 kg
    
    
    if missile_data.range then
        range_factor = missile_data.range / REFERENCE_EFFICIENCY_MISSILE_A2A.range
    end
    
    if missile_data.semiactive_range then
        semiactive_range_factor = 1 + missile_data.semiactive_range / REFERENCE_EFFICIENCY_MISSILE_A2A.semiactive_range
    end

    if missile_data.active_range then
        active_range_factor = 1 + missile_data.active_range / REFERENCE_EFFICIENCY_MISSILE_A2A.active_range
    end

    if missile_data.max_height then
        max_height_factor = 1 + missile_data.max_height / REFERENCE_EFFICIENCY_MISSILE_A2A.max_height
    end

    if missile_data.max_speed then
        max_speed_factor = missile_data.max_speed / REFERENCE_EFFICIENCY_MISSILE_A2A.max_speed
    end

    if missile_data.tnt then
        tnt_factor = missile_data.tnt / REFERENCE_EFFICIENCY_MISSILE_A2A.tnt
    end

    firepower = missile_data.reliability * range_factor * semiactive_range_factor * active_range_factor * max_height_factor * max_speed_factor * tnt_factor

end


 -- NOTA: DECOMMENTA 232 E 233 IN MAIN_NEXT_MISSION PER 



-- call from ???, initialize firepower value for loadouts
-- verifica se  e come viene effettuato il salvataggio
function defineLoadoutsFirepower(db_loadouts)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "defineLoadoutsFirepower(db_loadouts): "
    log.traceLow(nameFunction .. "Start")
 

    local task, weapons, weapon_data, firepower
    local break_loop = false

    for aircraft_name, aircraft in pairs(db_loadouts) do -- interate aircraft
    
        for task_name, task in pairs(aircraft) do -- iterate task: Intercept, CAP, antiship_strike, strike, ...            

            for loadout_name, loadout in pairs(task) do -- iterate loadout                
                weapons = loadout.weapons

                if weapons then 
                    
                    if isA2ATask(task_name) then

                        for weapon_name, weapon_qty in pairs(weapons) do                       
                            weapon_data = searchWeapon(weapon_name, nil)

                            if not weapon_data then                            
                                log.warn(nameFunction .. "no weapon: " .. weapon_name .. ", in weapon_db. End")
                                log.level = previous_log_level
                                return 
                            end

                            if weapon_data.start_service and ( weapon_data.start_service > camp.date.year ) then
                                log.traceLow(nameFunction .. "campaign year(" .. camp.date.year .. ") is over of weapon start service(" .. weapon_data.start_service .. "), End")            
                                log.warn(nameFunction .. "weapon(" .. weapon_name .. ") start service: " .. weapon_data.start_service .. " not compliant with campaign year: " .. camp.date.year)
                                log.level = previous_log_level
                                return
                            end 

                            if weapon_data.type and weapon_data.type == "AAM" then
                                firepower = evalutateFirepowerA2AMissile(weapon_data)
                                log.traceVeryLow(nameFunction .. "computed firepower for aircraft: " .. aircraft_name .. ", task: " .. task .. ", weapon: " .. weapon_name .. ", quantity: " .. weapon_qty .. ", firepower: " .. firepower)
                                log.level = previous_log_level
                                return firepower
                            
                            else
                                log.warn(nameFunction .. "unknow weapon_data.type:" .. (weapon_data.type or "nil") .. ", return")
                                log.level = previous_log_level
                                return nil
                            end

                        end
                    
                    elseif isA2GTask(task_name) then


                    elseif isNotFightTask(task_name) then


                    else
                        log.warn(nameFunction .. "unknow task: " .. task_name)
                    end
                end
            end
            
            
            

            if target.elements then
                num_elements = #target.elements -- num of element of target
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
            log.traceVeryLow(nameFunction .. "target_name: " .. target_name .. ", firepower_min: " .. (firepower_min or "nil") .. ", firepower_max: " .. (firepower_max or "nil"))

            target.firepower.min = firepower_min or 99999.9999
            target.firepower.max = firepower_max or 99999.9999
            log.traceVeryLow(nameFunction .. "target_name: " .. target_name .. ", target.firepower_min: " .. (target.firepower.min or "nil") .. ", target.firepower_max: " .. (target.firepower.min or "nil"))
        end
    end    
    SaveTabOnPath( "Active/", "computed_target_efficiency", computed_target_efficiency )         
    log.traceVeryLow(nameFunction .. "computed_target_efficiency:\n" .. inspect(computed_target_efficiency))
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return
end