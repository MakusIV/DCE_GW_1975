
--To create the Air Tasking Order
-- Initiated by Main_NextMission.lua
-------------------------------------------------------------------------------------------------------

if not versionDCE then 
	versionDCE = {} 
end

               -- VERSION --

versionDCE["DC_Tactical.lua"] = "OB.1.0.0"

-------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.0: implements Tactical logic for update module config parameter
------------------------------------------------------------------------------------------------------- 


local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
local log_level = LOGGING_LEVEL -- 
local function_log_level = log_level --"warn" 
log.activate = false
log.level = log_level 
log.outfile = LOG_DIR .. "LOG_DC_Tactical.lua." .. camp.mission .. ".log" 
local local_debug = false -- local debug   
local active_log = false
local local_test = true
log.debug("Start")

log.info("require: Init/db_firepower.lua, Init/db_loadouts, Init/db_airbases, Active/oob_air, Active/oob_ground, Init/conf_mod, Init/radios_freq_compatible")
--require("Init/db_loadouts")
--require("Init/db_airbases")
require("Active/oob_air")
require("Active/oob_ground")
--require("Init/conf_mod")															-- Miguel21 modification M00 : need option
--require("Init/radios_freq_compatible")												-- miguel21 modification M34 custom FrequenceRadio
--

local ATO_TE_CONFIG = {
	
	MIN_ASSET_FOR_COMPUTE_LEVEL_INTERCEPT = 3,								-- minimum asset unless specified otherwise
	MIN_ASSET_FOR_COMPUTE_LEVEL_CAP = 3,									-- minimum asset unless specified otherwise
	GROUND_THREAT_RILEVABILITY_BLUE_AIR_CAPACITY = 1,						-- capacity for ground threath rilevability (1: max capacity, 0 minimum capacity)
	GROUND_THREAT_RILEVABILITY_BLUE_GROUND_CAPACITY = 1,					-- capacity for ground threath rilevability (1: max capacity, 0 minimum capacity)
	GROUND_THREAT_RILEVABILITY_RED_AIR_CAPACITY = 1,						-- capacity for ground threath rilevability (1: max capacity, 0 minimum capacity)
	GROUND_THREAT_RILEVABILITY_RED_GROUND_CAPACITY = 1,						-- capacity for ground threath rilevability (1: max capacity, 0 minimum capacity)
	MAN_SAM_RILEVABILITY = 0.2,												-- specific ground asset rilevability (1: detectability ensured, 0 asset undetectable)
	SMALL_AAA_SAM_IR_VEHICLE_RILEVABILITY = 0.4,							-- specific ground asset rilevability (1: detectability ensured, 0 asset undetectable)
	SMALL_AAA_SAM_RADAR_VEHICLE_RILEVABILITY = 0.5,							-- specific ground asset rilevability (1: detectability ensured, 0 asset undetectable)
	MEDIUM_AAA_SAM_IR_VEHICLE_RILEVABILITY = 0.6,							-- specific ground asset rilevability (1: detectability ensured, 0 asset undetectable)
	MEDIUM_AAA_SAM_RADAR_VEHICLE_RILEVABILITY = 0.7,
	LARGE_SAM_VEHICLE_RILEVABILITY = 0.8,
	SMALL_AAA_SAM_FIXEDPOS_RILEVABILITY = 0.6,
	MEDIUM_AAA_SAM_FIXEDPOS_RILEVABILITY = 0.8,
	LARGE_AAA_SAM_FIXEDPOS_RILEVABILITY = 0.9,
	SMALL_SHIP_RILEVABILITY = 0.7,
	MEDIUM_SHIP_RILEVABILITY = 0.8,
	LARGE_SHIP_RILEVABILITY = 0.95,
}

local ATO_RG_CONFIG = {
	TIME_FOR_INGRESS_CALCULATION = 60, -- (s) default 60s, time for compute ingress distance distance = speed(vattack) * time + standoff
	MINIMUM_STANDOFF_DISTANCE = 7000, -- (m) default 7000m, minimum standoff value for calculation (not not applicable when the value is defined in db_loadouts: always with new firepower code)
	TIME_FOR_STANDOFF_CALCULATION = 30, -- (s) default 30s, time for compute standoff distance distance = speed(vattack) * time + hattack
	PROFILE_MIN_ALT_FOR_CAP_DETECTION = 3000, -- min altitude for generic CAP detection (no need EWR support)(default = 3000 m ). Questo parametro condiziona la classificazione come minaccia di una CAP
	ALT_MIN_FOR_CLUTTER_EFFECT = 100, -- (defalut = 100 m)
	PERC_REDUCTION_THREAT_LEVER_FOR_CLUTTER = 0.5, -- (1 max, 0 total. default = 0.5)
	MAX_FACTOR_FOR_LENGHT_ROUTE = 1.5, -- default = 1.5, factor for calculate max distance of a route: max distance = factor * direct distance (from start to end point)
	MIN_DIFF_ALTITUDES_FOR_ALT_ROUTE = 300, -- min difference from leg_alt and profile.hattack to compute alternative route with altitude = hattack
	SEPARATION_FROM_THREAT_RANGE = 1000, -- min distance from threat.range border
	MAX_NUM_ISTANCE_PATH_FINDING = 7, -- max number of istances of function findPathLeg(), default = 7
	-- note: diminish FACTOR_FOR_DISTANCE_FROM_THREAT_RANGE and increments MAX_NUM_ISTANCE_PATH_FINDING could be generate a more optimized route (maybe)
	-- note: increments MAX_NUM_ISTANCE_PATH_FINDING could be generate  a more optimized route (maybe)
}

local ATO_G_CONFIG = {

	WEIGHT_SCORE_FOR_LOADOUT_COST = {									-- weight for weapon cost in mission score calculus (0 .. 1)

		["Strike"] = 0.3,
		["Anti-ship Strike"] = 0.1,
		["SEAD"] = 0.1,
		["Intercept"] = 0.2,
		["CAP"] = 0.4,
		["Escort"] = 0.3,
		["Fighter Sweep"] = 0.2,
		["Reconnaissance"] = 0.1,
	},

	WEIGHT_SCORE_FOR_AIRCRAFT_COST = { 									-- weight for aircraft cost in mission score calculus (0 .. 1) 

		["Fighter"] = 0.3, 
		["Attacker"] = 0.5,  
		["Bomber"] = 0.2,  
		["Transporter"] = 0.1, 
		["Reco"] = 0.2, 
		["Refueler"] = 0.1,  
		["AWACS"] = 0.1, 
		["Helicopter"] = 0.2, 
	},

	MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = 2,							-- minimum aircraft for strike and anti-ship strike task (default 2 or 3 -needed to survive the anti-aircraft defenses)
	ESCORT_NUMBER_MULTIPLIER = 3,										-- max multiplier for escort number: when more escorts ESCORT_NUMBER_MULTIPLIER times escorts than escorted aircraft, limit escort number to ESCORT_NUMBER_MULTIPLIER times escorted aircraft (default 3)
	MINIMUM_VALUE_OF_AIR_THREAT = 0.5,									-- minimum value of air threat for air unit with self escort capacity (default = 0.5) 	
	FACTOR_FOR_REDUCTION_AIR_THREAT = 0.5,								-- factor for reduction of air threat for air unit with self escort capacity (default = 0.5)
	SCORE_INFLUENCE_ROUTE_THREAT = 1,									-- (min 1) factor for draft_sorties_entry.score = unit_loadouts[l].capability * target.priority / ( route_threat * SCORE_INFLUENCE_ROUTE_THREAT )
	FACTOR_FOR_REDUCE_SCORE = 0.01, 									-- factor for reduce_score in CAP (score = score - reduce_score * factor)
	MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_UNIT_RANGE_LOADOUT = 2,	-- factor for check if target distance is lesser of support.unit.range route.lenght > unit_loadouts[l].minrange * MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_UNIT_RANGE_LOADOUT) (default = 2)
	MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_COMPUTING_ROUTE = 1.5,  -- factor for check if target distance is bigger of unit.loadout.minrange,  computed before intensive route calculations (getRoute) (ToTarget * MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_COMPUTING_ROUTE > unit_loadouts[l].minrange) (default = 1.5)
	MIN_TOTAL_AIR_THREAT_FOR_ESCORT_SUPPORT = 0.5,						-- min total air threat level to authorize support escort flight (default = 0.5)
	MIN_CLOUD_DENSITY = 0.8,											-- min clouds density for evalutation weather mission condition (defalut = 0.8)
	MIN_FOG_VISIBILITY = 5000,											-- min fog visibility for any task (default: 5000m)
	MIN_CLOUD_EIGHT_ABOVE_AIRBASE = 333,								-- min eight above airbase for execute any task (default: 333m, 1000 ft)
	UNIT_SERVICEABILITY = 0.8,											-- serviceability percentage of unit.roster.ready 
	MIN_PERCENTAGE_FOR_ESCORT = 0.75,									-- min percentage reduction of avalaible asset request for an escort group (for ammissible strike with escort), default 0.75
	MAX_AIRCRAFT_FOR_INTERCEPT = 2,									-- max number of aircraft for an intercept mission 
	MAX_AIRCRAFT_FOR_RECONNAISSANCE = 2, 								-- max number of aircraft for an reconnaisance mission 
	MAX_AIRCRAFT_FOR_STRIKE = 4, 										-- max number of aircraft for an strike mission 
	MAX_AIRCRAFT_FOR_CAP = 4, 											-- max number of aircraft for an cap mission 
	MAX_AIRCRAFT_FOR_ESCORT = 4,		 								-- max number of aircraft for an escort mission 
	MAX_AIRCRAFT_FOR_SWEEP = 4,		 								-- max number of aircraft for an sweep mission 
	MAX_AIRCRAFT_FOR_OTHER = 3,		 								-- max number of aircraft for other mission 
	--MIN_AIRCRAFT_FOR_OTHER = 1, 										-- min number of aircraft for other mission 
	MAX_AIRCRAFT_FOR_BOMBER = 1,										-- max number of aircraft for bomber 
	BOMBERS_RECO = {"S-3B",  "F-117A", "B-1B", "B-52H", "Tu-22M3", "Tu-95MS", "Tu-142", "Tu-160", "MiG-25RBT"},
}


-- function
local function name(param)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "name(param: ( " .. param .. ") ): "
    log.traceLow(nameFunction .. "Start")

    
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return nil -- not weapon was found, return nil
end

--[[

-- task
["Strike"] = 0.3,
["Anti-ship Strike"] = 0.1,
["SEAD"] = 0.1,
["Intercept"] = 0.2,
["CAP"] = 0.4,
["Escort"] = 0.3,
["Fighter Sweep"] = 0.2,
["Reconnaissance"] = 0.1,
},

-- role
["Fighter"] = 0.3, 
["Attacker"] = 0.5,  
["Bomber"] = 0.2,  
["Transporter"] = 0.1, 
["Reco"] = 0.2, 
["Refueler"] = 0.1,  
["AWACS"] = 0.1, 
["Helicopter"] = 0.2, 
]]
-- change loadouts weight score (usa l'istruzione, non ha senso realizzare una funzione)
--[[
--num resource
camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST[task] = val
camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST[role] = val
camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = val
camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = val
camp.module_config.ATO_Generator[side].MIN_PERCENTAGE_FOR_ESCORT = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_OTHER = val
camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = val


-- reduce score weight: 
-- reduce_score = flights_requested - aircraft_assign / math.ceil(target.firepower.max / unit_loadouts[l].firepower) 
-- CAPS: increase factor by one for each flight that is missing  and target firepower == loadout firpower
-- AWACS and Refueling:  increase factor by one for each flight that is missing 
-- Other: reduce_score = 0


camp.module_config.ATO_Generator[side].FACTOR_FOR_REDUCE_SCORE = val

camp.module_config.ATO_Generator[side].MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_UNIT_RANGE_LOADOUT = val
camp.module_config.ATO_Generator[side].MULTIPLIER_TARGET_DISTANCE_FOR_EVALUTATION_COMPUTING_ROUTE = val


-- route threat
camp.module_config.ATO_Generator[side].MIN_TOTAL_AIR_THREAT_FOR_ESCORT_SUPPORT = val
camp.module_config.ATO_Generator[side].MINIMUM_VALUE_OF_AIR_THREAT = val
camp.module_config.ATO_Generator[side].FACTOR_FOR_REDUCTION_AIR_THREAT = val
camp.module_config.ATO_Generator[side].SCORE_INFLUENCE_ROUTE_THREAT = val


--meteo
camp.module_config.ATO_Generator[side].MIN_CLOUD_DENSITY = val
camp.module_config.ATO_Generator[side].MIN_FOG_VISIBILITY = val
camp.module_config.ATO_Generator[side].MIN_CLOUD_EIGHT_ABOVE_AIRBASE = val

-- efficiency manutention
camp.module_config.ATO_Generator[side].UNIT_SERVICEABILITY = val

]]

--local module_config_init -- default module_config: module config parameters stored initialized in camp_init module
local target_priority_default -- priority_default table contains initial target priority value specified in targetlist_init

-- implement function to modify target priority for change objective tactics: 	
-- devono essere inseriti anche gli altri fattori condizionanti presenti negli altri moduli


-- load module_config_init table, if not exist create one new
local function loadModuleConfigDefault()

    --if ( camp.mission > 1 or ( local_test and camp.mission == 1 ) ) and io.open("Active/module_config_init.lua", "r") then
	if camp.mission > 1 and io.open("Active/module_config_init.lua", "r") then
        require("Active/module_config_init") -- load stored computed_target_efficiency.lua if not first mission campaign and exist table

    else -- initialize new computed_target_efficiency if not exist 	
		os.remove("Active/module_config_init.lua")	
		module_config_init = camp.module_config 
		SaveTabOnPath( "Active/", "module_config_init", module_config_init )       
		require("Active/module_config_init") -- load stored computed_target_efficiency.lua if not first mission campaign and exist table  
    end
end

-- change aircraft number in relation to the oprations (all, ground, ground attack, groud interdiction, air superiority, air defensive, air offensive)	
local function changeNumberAircraftForTactics(side, perc, operations)

	if operations == "all" then		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP * ( 1 + perc ) 
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_OTHER = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_OTHER * ( 1 + perc )
	
	elseif operations == "ground" then		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE * ( 1 + perc )		
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE * ( 1 + perc )

	elseif operations == "ground attack" then		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE * ( 1 + perc )		
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE * ( 1 + perc )		
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE * ( 1 + perc )		
		
	elseif operations == "ground interdiction" then		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE * ( 1 + perc )		

	elseif operations == "air superiority" then		
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER * ( 1 + perc )		
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP * ( 1 + perc ) 
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP * ( 1 + perc )		
		
	elseif operations == "air defensive" then		
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER * ( 1 + perc )		
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP * ( 1 + perc ) 
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT * ( 1 + perc )		

	elseif operations == "air offensive" then		
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER * ( 1 + perc )				
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT * ( 1 + perc )
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP * ( 1 + perc )		
	
	elseif operations == "default" then				
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = module_config_init.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP 
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = module_config_init.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_OTHER = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_OTHER		

	elseif operations == "default ground" then		
		camp.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = module_config_init.module_config.ATO_Generator[side].MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_BOMBER
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_RECONNAISSANCE

	elseif operations == "default air" then
		camp.module_config.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER = module_config_init.ATO_Generator[side].ESCORT_NUMBER_MULTIPLIER
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_CAP 
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_INTERCEPT
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_ESCORT
		camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP = module_config_init.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP		
		


	else
		log.warn("unknow operations: " .. operations)
	end
end

-- change cost weight in reation to the opration (air, ground, all)
local function airCostChange(side, operations, perc)

	-- factor cost (loadouts or aircraft) decrease as the cost increases -> perc change WEIGHT of factor cost -> increment oof perc cause bigger influence of low cost policy

	local perc_air, perc_ground	
	
	if operations == "all" then
		perc_air = perc
		perc_ground = perc
	
	elseif operations == "ground" then
		perc_air = 1
		perc_ground = perc

	elseif operations == "air" then
		perc_air = perc
		perc_ground = 1

	elseif operations == "default" then
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST
	
	elseif operations == "default aircraft" then
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST		
		
	elseif operations == "default loadouts" then	
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST
	
	elseif operations == "default air" then				
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Transporter"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Transporter"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Refueler"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Refueler"]
		-- loadouts				
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["CAP"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["CAP"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Fighter Sweep"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Fighter Sweep"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Intercept"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Intercept"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Escort"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Escort"]

	elseif operations == "default ground" then				
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Bomber"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Bomber"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Reco"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Reco"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Helicopter"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Helicopter"]
		-- loadouts
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Strike"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Strike"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Anti-ship Strike"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Anti-ship Strike"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["SEAD"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["SEAD"]
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Reconnaissance"] = module_config_init.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Reconnaissance"]
	
	else
		log.warn("unknow operations: " .. operations)
		operations = "unknow operations"
	end	
	
	if string.sub(operations,1,7) ~= "default" and operations ~= "unknow operations" then
		-- aircraft
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] * ( 1 + perc_ground ) -- increment(perc > 0 ) or decrement (perc < 0) cost weight cost for reduce score of expensive aircraft
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Bomber"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Bomber"] * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Reco"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Reco"] * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Helicopter"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Helicopter"] * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] * ( 1 + perc_air ) -- increment(perc > 0 ) or decrement (perc < 0) cost weight cost for reduce score of expensive aircraft
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Transporter"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Transporter"] * ( 1 + perc_air )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Refueler"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Refueler"] * ( 1 + perc_air )			
		-- loadouts
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Strike"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Strike"]  * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Anti-ship Strike"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Anti-ship Strike"]  * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["SEAD"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["SEAD"]  * ( 1 + perc_ground )		
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Reconnaissance"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Reconnaissance"]  * ( 1 + perc_ground )					
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["CAP"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["CAP"]  * ( 1 + perc_air )					
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Fighter Sweep"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Fighter Sweep"]  * ( 1 + perc_air )					
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Intercept"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Intercept"]  * ( 1 + perc_air )					
		camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Escort"] = camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST["Escort"]  * ( 1 + perc_air )					
	end
end

-- local costs_policy = { "reduction", "high reduction", "increment", "high_increment", "ground_reduction", "ground_increment", "air_reduction", "air_increment" }

-- change cost weight of aircraft and loadout in relation to the cost policy { "reduction", "high reduction", "increment", "high_increment", "ground_reduction", "ground_increment", "air_reduction", "air_increment" }
-- factor cost (loadouts or aircraft) decrease as the cost increases -> perc change WEIGHT of factor cost -> increment oof perc cause bigger influence of low cost policy
local function airCostPolicy(side, cost_policy)
	
	if cost_policy == "reduction" then -- increments use of low cost aircraft/loadouts
		airCostChange(side, "all", 2)

	elseif cost_policy == "high reduction" then -- increments use of low cost aircraft/loadouts
		airCostChange(side, "all", 4)

	elseif cost_policy == "increment" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "all", 0.5)

	elseif cost_policy == "high increment" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "all", 0.1)

	elseif cost_policy == "ground reduction" then -- increments use of low cost aircraft/loadouts
		airCostChange(side, "ground", 2)
	
	elseif cost_policy == "ground increment" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "ground", 0.5)
		
	elseif cost_policy == "air reduction" then -- increments use of low cost aircraft/loadouts
		airCostChange(side, "air", 2)
	
	elseif cost_policy == "air increment" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "air", 0.5)

	elseif cost_policy == "default" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "default", nil)

	elseif cost_policy == "default air" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "default air", nil)
	
	elseif cost_policy == "default ground" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "default ground", nil)

	elseif cost_policy == "default aircraft" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "default aircraft", nil)

	elseif cost_policy == "default loadouts" then -- increments use of costly aircraft/loadouts
		airCostChange(side, "default loadouts", nil)
	
	else
		log.warn("unknow cost policy: " .. cost_policy)
	end

end

-- change weight task and/or task attribute for score mission
local function changeWeightScore(side, value, operation)

	if operation == "ground" then
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.Bridge = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.Structure = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.armor = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.soft = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.hard = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike["Parked Aircraft"] = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.SAM = value
		
	elseif operation == "ground attack" then		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.armor = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.soft = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.hard = value				

	elseif operation == "ground interdiction" then
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.Bridge = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.Structure = value		
		-- camp.module_config.SCORE_TASK_FACTOR[side].Strike["Parked Aircraft"] = value
		camp.module_config.SCORE_TASK_FACTOR[side].Strike.SAM = value	

	elseif operation == "anti-ship" then		
		camp.module_config.SCORE_TASK_FACTOR[side]["Anti-ship Strike"] = value				

	elseif operation == "air superiority" then
		camp.module_config.SCORE_TASK_FACTOR[side].CAP = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Escort = value
		camp.module_config.SCORE_TASK_FACTOR[side].Intercept = value
		camp.module_config.SCORE_TASK_FACTOR[side]["Fighter Sweep"] = value

	elseif operation == "air defensive" then
		camp.module_config.SCORE_TASK_FACTOR[side].CAP = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Escort = value
		camp.module_config.SCORE_TASK_FACTOR[side].Intercept = value
		-- camp.module_config.SCORE_TASK_FACTOR[side]["Fighter Sweep"] = value

	elseif operation == "air offensive" then
		camp.module_config.SCORE_TASK_FACTOR[side].CAP = value		
		camp.module_config.SCORE_TASK_FACTOR[side].Escort = value
		-- camp.module_config.SCORE_TASK_FACTOR[side].Intercept = value
		camp.module_config.SCORE_TASK_FACTOR[side]["Fighter Sweep"] = value

	elseif operation == "default ground" then
		camp.module_config.SCORE_TASK_FACTOR[side].Strike = module_config_init.SCORE_TASK_FACTOR[side].Strike		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike = module_config_init.SCORE_TASK_FACTOR[side]["Anti-ship Strike"]

	elseif operation == "default air" then
		camp.module_config.SCORE_TASK_FACTOR[side].CAP = module_config_init.SCORE_TASK_FACTOR[side].CAP		
		camp.module_config.SCORE_TASK_FACTOR[side].Escort = module_config_init.SCORE_TASK_FACTOR[side].Escort
		camp.module_config.SCORE_TASK_FACTOR[side].Intercept = module_config_init.SCORE_TASK_FACTOR[side].Intercept
		camp.module_config.SCORE_TASK_FACTOR[side]["Fighter Sweep"] = module_config_init.SCORE_TASK_FACTOR[side]["Fighter Sweep"]

	elseif operation == "default anti-ship" then		
		camp.module_config.SCORE_TASK_FACTOR[side]["Anti-ship Strike"] = module_config_init.SCORE_TASK_FACTOR[side]["Anti-ship Strike"]		

	elseif operation == "default" then		
		camp.module_config.SCORE_TASK_FACTOR[side].Strike = module_config_init.SCORE_TASK_FACTOR[side].Strike				
		camp.module_config.SCORE_TASK_FACTOR[side]["Anti-ship Strike"] = module_config_init.SCORE_TASK_FACTOR[side]["Anti-ship Strike"]
		camp.module_config.SCORE_TASK_FACTOR[side].CAP = module_config_init.SCORE_TASK_FACTOR[side].CAP		
		camp.module_config.SCORE_TASK_FACTOR[side].Escort = module_config_init.SCORE_TASK_FACTOR[side].Escort
		camp.module_config.SCORE_TASK_FACTOR[side].Intercept = module_config_init.SCORE_TASK_FACTOR[side].Intercept
		camp.module_config.SCORE_TASK_FACTOR[side]["Fighter Sweep"] = module_config_init.SCORE_TASK_FACTOR[side]["Fighter Sweep"]
		camp.module_config.SCORE_TASK_FACTOR[side]["Anti-ship Strike"] = module_config_init.SCORE_TASK_FACTOR[side]["Anti-ship Strike"]		

	else
		log.warn("unknow operation: " .. operation)
	end

end

-- change priority target (targetlist) of the perc(%) value for specific task
local function changePriorityTask(side, task, attribute, class, perc)

	for target_name, target in pairs(targetlist[side]) do

		if target.task == task and ( not attribute ) or ( ( target.attributes and target.attributes[1] and target.attributes[1] == attribute ) and (  ( not class ) or ( class and class == target.class )  )  ) then			
			target.priority = target.priority * ( 1 + perc )

		else
			log.warn("target not found: task: " .. task .. ", attribute: " .. (attribute or "nil") .. ", class: " .. (class or "nil"))
		end
	end
end

-- reset priority target (targetlist) of the perc(%) value for specific task
local function resetPriorityTask(side, task, attribute, class)

	for target_name, target in pairs(targetlist[side]) do

		if target.task == task and ( not attribute ) or ( ( target.attributes and target.attributes[1] and target.attributes[1] == attribute ) and (  ( not class ) or ( class and class == target.class )  )  ) then			
			target.priority = target_priority_default[side][target_name]
			
		else
			log.warn("target not found: task: " .. task .. ", attribute: " .. (attribute or "nil") .. ", class: " .. (class or "nil"))
		end
	end
end

-- define, save and load priority_default table. priority_default table contains initial target priority value specified in targetlist_init
local function loadPriorityDefault()

	if camp.mission > 1 and io.open("Active/target_priority_default.lua", "r") then
        require("Active/target_priority_default") -- load stored target_priority_default.lua if not first mission campaign and exist table

    else -- initialize new target_priority_default if not exist 
		os.remove("Active/target_priority_default.lua")
        target_priority_default = {} -- table contains target efficiency values: hash table with hash = target and value = firepower med for that target

		for side_name, side in pairs(targetlist) do
			target_priority_default[side_name] = {}
				
			for target_name, target in pairs(targetlist[side_name]) do
				target_priority_default[side_name][target_name] = target.priority
			end
		end
        SaveTabOnPath( "Active/", "target_priority_default", target_priority_default )         
    end
end

local function printPriorityTable(text)		
	print( text .. "\n\n" .. inspect( target_priority_default ) )	
end



local tactics = {
	
	["moderate increment offensive resource"] = "moderate increment offensive resource",						-- moderate increments resource for offensive task
	["increment offensive resource"] = "increment offensive resource",								-- increments resource and expensive asset for offensive task
	["increment offensive action"] = "increment offensive action",									-- increments actions for offensive task
	["increment offensive strategic action and resource"] = "increment offensive strategic action and resource", 				-- increments action, resource and expensive asset for strategic task	
	["expensive increment offensive action, resource and use of expensive asset"] = "expensive increment offensive action, resource and use of expensive asset",				-- increments resource, task and high cost asset for offensive task
	["air superiority"] = "air superiority",												-- increment action and resource for air superiority ( task and action )
	["defensive"] = "defensive",													-- increment action and resource for air defensive ( task and action )
	["increment priority for Anti-ship operations"] = "increment priority for Anti-ship operations",					-- increments mission for Anti-ship Strike task
	["increment priority for SAM strike operations"] = "increment priority for SAM strike operations",				-- increments mission for SAM Strike task
	["increment priority for Army Ground Attack operations"] = "increment priority for Army Ground Attack operations",		-- increments mission for Army Ground Attack task
	["reset priority for all operations"] = "reset priority for all operations",									-- reset priority operations
	["reset priority for SAM operations"] = "reset priority for SAM operations",									-- reset priority operations
	["restore default resource"] = "restore default resource",									-- restore resource config parameters at default value (camp_init)
	["restore global default condition"] = "restore global default condition",							-- restore resource, action and cost config parameters at default value (camp_init)
	["restore air default condition"] = "restore air default condition",								-- restore air resource, action and cost config parameters at default value (camp_init)
}

--changePriorityTask(side, task, attribute, class, perc)
--resetPriorityTask(side, task, attribute, class)

local task_attribute = { 
	["CAP"] = false,
	["Intercept"] = false,
	["Fighter Sweep"] = false,
	["Escort"] = false,
	["Anti-ship Strike"] = false,
	["Strike"] = {
		["attribute"] = {"Parked Aircraft", "SAM", "soft", "hard", "armor", "Structure", "Bridge", "ship"},
		["class"] = {"static", "airbase", "vehicle", "ship"},
	},
	["Transport"] = true,
	["Refueling"] = true,
	["AWACS"] = true,
}

local function airDirective(side, tactic)

	if tactic == tactics["moderate increment offensive resource"] then				-- moderate increments resource for offensive task
		changeNumberAircraftForTactics(side, 0.7, "ground attack")			-- increment min, max, requested aircraft for specific task/role
		changeNumberAircraftForTactics(side, 0.5, "air offensive")		
		
	elseif tactic == tactics["increment offensive resource"] then					-- increments resource and expensive asset for offensive task
		changeNumberAircraftForTactics(side, 1, "ground")					
		changeNumberAircraftForTactics(side, 0.5, "air offensive")
		airCostPolicy(side, "increment")									-- increments use of expensive asset (aircraft/loadouts)

	elseif tactic == tactics["increment offensive action"] then						-- increments actions for offensive task
		changeWeightScore(side, 3, "ground")								-- increments actions of ground missions					
		changeWeightScore(side, 1.5, "air offensive")						-- increments actions of air offensive missions					
		airCostPolicy(side, "increment")												 

	elseif tactic == tactics["increment offensive strategic action and resource"] then 			-- increments action, resource and expensive asset for strategic task			
		changeNumberAircraftForTactics(side, 1, "ground interdiction")					
		changeNumberAircraftForTactics(side, 0.5, "air offensive")	
		changeWeightScore(side, 3, "ground interdiction")					
		airCostPolicy(side, "increment")									-- increments expensive asset of ground interdiction missions (Bridge, Structure)
		
	elseif tactic == tactics["expensive increment offensive action, resource and use of expensive asset"] then				-- increments resource, task and use of expensive asset for offensive task
		changeNumberAircraftForTactics(side, 1, "ground")					
		changeNumberAircraftForTactics(side, 0.5, "air offensive")		
		changeWeightScore(side, 5, "ground")								-- increments choice of ground missions			
		airCostPolicy(side, "high increment")
		
	elseif tactic == tactics["air superiority"] then						-- increment action and resource for air superiority ( task and action )
		changeNumberAircraftForTactics(side, 0.7, "air superiority")
		changeNumberAircraftForTactics(side, 0.5, "ground interdiction")	
		changeWeightScore(side, 3, "air superiority")						-- increments choice of air superiority missions			
				
	elseif tactic == tactics["defensive"] then								-- increment action and resource for air defensive  ( task and action )
		changeNumberAircraftForTactics(side, 1, "air defensive")
		changeNumberAircraftForTactics(side, -0.5, "ground attack")			
		changeWeightScore(side, 4, "air defensive")							-- increments choice of air defensive missions			
		changeWeightScore(side, 0.3, "ground")								-- decrements choice of ground missions			

	elseif tactic == tactics["increment priority for Anti-ship operations"] then			-- increments mission for Anti-ship Strike task
		changePriorityTask(side, "Anti-ship Strike", nil, nil, 1)

	elseif tactic == tactics["increment priority for SAM strike operations"] then			-- increments mission for SAM Strike task
		changePriorityTask(side, "Strike", "SAM", nil, 1)

	elseif tactic == tactics["increment priority for Army Ground Attack operations"] then	-- increments mission for Army Ground Attack task
		changePriorityTask(side, "Strike", nil , "vehicle", 1)

	elseif tactic == tactics["reset priority for SAM operations"] then								-- increments mission for Anti-ship Strike task
		resetPriorityTask(side, "Strike", "SAM", nil, nil)
	
	elseif tactic == tactics["reset priority for all operations"] then								-- increments mission for Anti-ship Strike task
		resetPriorityTask(side, "All", nil, nil, nil)

	elseif tactic == tactics["restore default resource"] then								-- restore resource config parameters at default value (camp_init)
		changeNumberAircraftForTactics(side, nil, "default")
		
	elseif tactic == tactics["restore global default condition"] then						-- restore resource, action and cost config parameters at default value (camp_init)
		changeNumberAircraftForTactics(side, nil, "default")
		changeWeightScore(side, nil, "default")	
		airCostPolicy(side, "default")	

	elseif tactic == tactics["restore ground default condition"] then
		changeNumberAircraftForTactics(side, nil, "default ground")
		changeWeightScore(side, 4, "default ground")	
		airCostPolicy(side, "default ground")	

	elseif tactic == tactics["restore air default condition"] then
		changeNumberAircraftForTactics(side, nil, "default air")
		changeWeightScore(side, 4, "default air")	
		airCostPolicy(side, "default air")	

	else
		log.warn("unknow tactic: " .. tactic)
	end
end


-- GLOBAL FUNCTION 
function commander()

	-- acquisition status campaign
	-- evalutate status
	-- execution directive:
		-- operation(side, perc, tactic)

end

-- PREPROCESSING
loadModuleConfigDefault()
loadPriorityDefault()



-- TESTING (very little)
if local_test then
	local testChangeNumberAircraftForTacticsFlg = false
	local testAirCostChangeFlg = false
	local testAirDirectiveFlg = true
	
	
	printPriorityTable("default value")

	if testChangeNumberAircraftForTacticsFlg then --side, perc, operations		
		changeNumberAircraftForTactics("blue", 30, "all")
		print("change - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_STRIKE)
		--printPriorityTable("changeNumberAircraftForTactics('blue', 30, 'all')")
		changeNumberAircraftForTactics("blue", nil, "default")
		print("reset - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_STRIKE)		
				
	end

	if testAirCostChangeFlg then --side, perc, operations
		airCostChange("blue", "all", 30)
		print("change - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST: " .. inspect(camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST))
		print("change - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST: " .. inspect(camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_LOADOUT_COST))
		airCostChange("blue", "default", nil)
		print("reset - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST: " .. inspect(camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST))
		print("reset - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_LOADOUT_COST: " .. inspect(camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_LOADOUT_COST))				

	end

	if testAirDirectiveFlg then --side, perc, operations		
		print("init - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_STRIKE)
		print("init - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_SWEEP )
		print("init - camp.module_config.SCORE_TASK_FACTOR[side].Strike.Bridge: " .. camp.module_config.SCORE_TASK_FACTOR["blue"].Strike.Bridge )
		print("init - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Attacker']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] )
		print("init - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Fighter']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] )			
		airDirective("blue", "increment offensive strategic action and resource")		
		print("change - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_STRIKE)
		print("change - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_SWEEP )
		print("change - camp.module_config.SCORE_TASK_FACTOR[side].Strike.Bridge: " .. camp.module_config.SCORE_TASK_FACTOR["blue"].Strike.Bridge )
		print("change - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Attacker']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] )
		print("change - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Fighter']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] )			
		airDirective("blue", "restore global default condition")
		print("reset - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_STRIKE: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_STRIKE)
		print("reset - camp.module_config.ATO_Generator[side].MAX_AIRCRAFT_FOR_SWEEP: " .. camp.module_config.ATO_Generator["blue"].MAX_AIRCRAFT_FOR_SWEEP )
		print("reset - camp.module_config.SCORE_TASK_FACTOR[side].Strike.Bridge: " .. camp.module_config.SCORE_TASK_FACTOR["blue"].Strike.Bridge )
		print("reset - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Attacker']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Attacker"] )
		print("reset - camp.module_config.ATO_Generator[side].WEIGHT_SCORE_FOR_AIRCRAFT_COST['Fighter']: " .. camp.module_config.ATO_Generator["blue"].WEIGHT_SCORE_FOR_AIRCRAFT_COST["Fighter"] )			

		print("init -  targetlist.blue['203 SA-2 Site A-3'].priority: " .. targetlist.blue["203 SA-2 Site A-3"].priority )
		airDirective("blue", "increment priority for SAM strike operations")
		print("change -  targetlist.blue['203 SA-2 Site A-3'].priority: " .. targetlist.blue["203 SA-2 Site A-3"].priority )
		airDirective("blue", "reset priority for SAM operations")
		print("reset -  targetlist.blue['203 SA-2 Site A-3'].priority: " .. targetlist.blue["203 SA-2 Site A-3"].priority )
	end
end

--[[

module_config[module_name] = getModuleConfig(module_name)
saveModuleConfig( module_config[module_name] )




implementare modulo tattico per blue e red per elaborazione configurazione parametri moduli,

funzioni: 
evalStatusGround()
 - evalStatusGroundVehicle()
 - evalStatusGroundShip()
 - evalStatusGroundLogistic(): Plant & Line
 - evalStatusGroundStatic()

valuta:
aumentare/rinforzare l'esecuzione di missioni GA (supporto truppe): 
se 

rinforzare il supporto ESCORT: 
se le perdite di bomber/attacker dovute ai fighter è significativo: valuta i rapporti k_blue(red) = perdite bomber/ perdite fighter blue e red,   INCR= k_blue / k_red, 

rinforzare il supporto SEAD: 
se le perdite di bomber/attacker dovute ai ASM radar è significativo

aumentare/rinforzare l'esecuzione di missioni CAP, Intercept, Fighter Sweep : 
se il danno dei vehicle/Logistic/Static è significativo rispetto al totale dei ve
il modulo deve fornire un report preciso per la scelta dei blue mentre deve essere aleatorio per quelle dei red. L'aleatorietà deve dipendere dalle capacxità di intelligenze (recom ground, air, economy ec


]]