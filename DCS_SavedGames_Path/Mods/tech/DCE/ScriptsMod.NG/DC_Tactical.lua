
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


-- GLOBAL FUNCTION 

