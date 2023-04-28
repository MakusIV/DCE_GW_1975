
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

	WEIGHT_SCORE_FOR_AIRCRAFT_COST = { 								-- weight for aircraft cost in mission score calculus (0 .. 1) 

		["Fighter"] = 0.3, 
		["Attacker"] = 0.5,  
		["Bomber"] = 0.2,  
		["Transporter"] = 0.1, 
		["Reco"] = 0.2, 
		["Refueler"] = 0.1,  
		["AWACS"] = 0.1, 
		["Helicopter"] = 0.2, 
	},

	MINIMUM_REQUESTED_AIRCRAFT_FOR_STRIKE = 2,									-- minimum aircraft for strike and anti-ship strike task (default 2 or 3 -needed to survive the anti-aircraft defenses)
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

-- returns config table in module: <module_name>
local function getModuleConfig(module_name)
    local previous_log_level = log.level
	log.level = function_log_level
	local nameFunction = "getModuleConfig(module_name: ( " .. module_name .. ") ): "
    log.traceLow(nameFunction .. "Start")

	local config_table_name = module_name .. "_CONFIG" 
    
    log.traceLow(nameFunction .. "End")
    log.level = previous_log_level
    return nil -- not weapon was found, return nil
end




-- GLOBAL FUNCTION 

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