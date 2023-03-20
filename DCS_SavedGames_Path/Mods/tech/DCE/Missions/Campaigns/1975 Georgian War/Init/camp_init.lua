--Initial status of the campaign (static file, not updated)
--Copied to camp_status.lua and for use in running campaign


---------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.1: implements compute firepower code (property)
-------------------------------------------------------------------------------------------------------

camp = {
	title = "1975 Georgian War",	--Title of campaign (name of missions)
	version = "V0.1",
	mission = 1,					--campaig mission number
	date = {						--campaign date
        day = 13,
        year = 1975,
        month = 9,
    },
	time = 3600,					--daytime in seconds
	dawn = 21600,					--time of dawn in seconds
	dusk = 65700,					--time of dusk in seconds
	mission_duration = 5400,		--duration of a mission in seconds
	idle_time_min = 10800,			--minimum time between missions in seconds
	idle_time_max = 14400,			--maximum time between missions in seconds
	startup = 900,					--time in seconds allocated for player start-up
	units = "metric",				--unit output in briefing (imperial or metric)
	weather = {						--campaign weather
		pHigh = 50,				    --probability of high pressure weather system
		pLow = 50,					--probability of low pressure weather system
		refTemp = 20,				--average day max temperature
	},
	variation = 4,					--variation in degrees from true north to magneitic north
	debug = false,					--debug mode
	-- hotstart = false,       		--player flights starts with engines running     ---- change it  in init/conf_mod.lua
    -- intercept_hotstart = true,    --player flights with intercept task starts with engines running  ---- change it  in init/conf_mod.lua
	SCORE_TASK_FACTOR = { -- deve essere resa globale e inserita in camp status
		["CAP"] = 1,
		["AWACS"] = 1,
		["Intercept"] = 1,
		["Escort"] = 1,
		["Fighter Sweep"] = 1,
		["Anti-ship Strike"] = 1,
		["Strike"] = 1,
		["Reconnaissance"] = 1,
		["Refueling"] = 1,
		["Transport"] = 1,
		["SEAD"] = 1,
		["Laser Illumination"] = 1,
	}

	
	
	-- ANY MODIFICATIONS IN THIS FILE NEED TO RESTART ALL THE CAMPAIGN USING FIRSTMISSION.BAT FILE


}
