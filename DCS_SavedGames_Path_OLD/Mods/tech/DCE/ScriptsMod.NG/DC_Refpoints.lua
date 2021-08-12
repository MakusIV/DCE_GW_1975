--For easy reference to x-y coordinates, create Refpoints from trigger zones in base_mission
--Initiated by MAIN_NextMission.lua
------------------------------------------------------------------------------------------------------- 

--Check all trigger zones on base_mission and store their x-y coordinates for easier use
Refpoint = {}														--table to store x-y coordinates of trigger zones as reference points
for zone_n,zone in ipairs(mission.triggers.zones) do				--iterate throug trigger zones in mission
	Refpoint[zone.name] = {											--store x-y coordinates in Refpoint array
		x = zone.x,
		y = zone.y
	}
end