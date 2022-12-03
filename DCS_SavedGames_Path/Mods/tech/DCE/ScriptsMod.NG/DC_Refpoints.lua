--For easy reference to x-y coordinates, create Refpoints from trigger zones in base_mission
--Initiated by MAIN_NextMission.lua
------------------------------------------------------------------------------------------------------- 
-- =====================  Marco implementation ==================================
local log = dofile("../../../ScriptsMod."..versionPackageICM.."/UTIL_Log.lua")
-- NOTE MARCO: prova a caricarlo usando require(".. . .. . .. .ScriptsMod."versionPackageICM..".UTIL_Log.lua")
-- NOTE MARCO: https://forum.defold.com/t/including-a-lua-module-solved/2747/2
log.level = "trace"
log.outfile = "Log/LOG_DC_Refpoints." .. camp.mission .. ".txt.lua" -- "prova Log.LOG_DEVRIEF_Master"
local local_debug = true -- local debug   
log.debug("Start")
-- =====================  End Marco implementation ==================================

--Check all trigger zones on base_mission and store their x-y coordinates for easier use
Refpoint = {}														--table to store x-y coordinates of trigger zones as reference points
for zone_n,zone in ipairs(mission.triggers.zones) do				--iterate throug trigger zones in mission
	Refpoint[zone.name] = {											--store x-y coordinates in Refpoint array
		x = zone.x,
		y = zone.y
	}
end