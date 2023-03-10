
--To create the Air Tasking Order
--Initiated by Main_NextMission.lua
-------------------------------------------------------------------------------------------------------

if not versionDCE then 
	versionDCE = {} 
end

               -- VERSION --

versionDCE["db_firepower.lua"] = "OB.1.0.0"

-------------------------------------------------------------------------------------------------------
-- Old_Boy rev. OB.1.0.0: first coding 
------------------------------------------------------------------------------------------------------- 


-- nato
-- a2a: missile AIM-54A-MK60, AIM-7, AIM-7M, AIM-7E, AIM-9, AIM-9M, AIM-9P, RB-05A, RB-74, RB-74J, RB-24J, R550, R530IR, R530EM, 
-- bomb: GBU-12, GBU-16, GBU-10, Mk-82, Mk-82SE, Mk-83, Mk-84, Mk-20 (cluster), M/71, RB-75T, CBU-52B (cluster), CBU-52 (cluster), SAMP400kg, SNEB256_HE_DEFR, SNEB253_HEAT, SAMP250kgHD, 
-- rockets: Zuni-Mk71, Hydra-70, 
-- a2g missile: MavTV, AGM-86C, AGM-65D, AGM-65K, BGM-71D, AGM-114 (dal 1982)
-- a2r missile: AGM-45, 
-- a2s missile: RB 15F (dal 1985), AGM-84A,

--russia
-- a2a missile: K-13A, R-60M, R-3R, R-3S, R-24T, R-24R, R-40R, R-40T, R-27T(dopo), R-27R(dopo)
-- bomb: FAB-1500, FAB-500, FAB-250, FAB-100, BL-755(cluster? att inglese??), RBK-250(cluster), RBK-500AO(cluster), FAB-500-M62(?), KAB-500L(laser), KMGU-96r(cluster), KMGU-2F/2B(cluster, )
-- rockets: S24-HE-FRAG, S-25, S-13, B-8, UB-13, UB-32, S-5KO, S-8KOM, UPK-23, 9M114, S-24B, UB16UM, S-5M, ORO-57K_S5M_HEFRAG
-- a2g missile: Kh-58, Kh-66, Kh-25ML, Kh-25MR, Kh-29L, Kh-29T, Kh-31A(dopo), Kh-31P(dopo), Kh-35(dopo), Kh-41(dopo), Kh-65(dopo)
-- a2r missile: Kh-25MPU,
-- a2s missile: Kh-22N, Kh-59M (1980), 

REFERENCE_EFFICIENCY_MISSILE_A2A = {
                ["range"] = 80,                                     -- km, range (aircraft must track target)                  
                ["semiactive_range"] = 50,                          -- km, semiactive range (aircraft can or not track target)                  
                ["active_range"] = 10,                              -- km, active range  (missile has active autonomous tracking target)                
                ["max_height"] = 18,                                -- km max height
                ["max_speed"] = 2,                                  -- mach
                ["tnt"] = 30,                                       -- kg
            }



db_tnt_target_element = {
    -- att se non hai informazioni esatto risulter difficile bilanciare
   ["structure_little"] = 100,
   ["structure_medium"] = 300,
   ["structure_big"] = 500,	
   ["ship_little"] = 100, -- kg tnt
   ["ship_medium"] = 300,
   ["ship_big"] = 500,	
   ["armor"] = 200, -- kg tnt
   ["vehicle"] = 30,
   ["sam"] = 100,	
   ["bridge"] = 300, -- kg tnt
   ["aircraft"] = 30,
   ["supply"] = 1,	
}

-- store weapon info
weapon_db = {	
    
    ["blue"] = {

        ["AIM-54A-MK47"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1974,
            ["end_service"] = 2004,
            ["cost"] = 1,-- k$  
            ["tnt"] = 61, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 222,                                    -- km, range (aircraft must track target)                  
            ["semiactive_range"] = 130,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = 18,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 24.8,                             -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AIM-54A-MK60"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1975,
            ["end_service"] = 2004,
            ["cost"] = 1,-- k$  
            ["tnt"] = 61, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 268,                                    -- km, range (aircraft must track target)                  
            ["semiactive_range"] = 130,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = 18,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 24.8 ,                             -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AIM-54C"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1986,
            ["end_service"] = 2004,
            ["cost"] = 1,-- k$  
            ["tnt"] = 61, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 240,                                    -- km, range (aircraft must track target)                  
            ["semiactive_range"] = 130,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = 18,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 24.8 ,                             -- km max height
            ["max_speed"] = 3,                                  -- mach                             
        },

        ["AIM-7E"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 45,                                     -- km, range (aircraft must track target)                  
            ["semiactive_range"] = nil,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = nil,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 18,                                -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AIM-7F"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1975,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 70,                                     -- km, range (aircraft must track target)                  
            ["semiactive_range"] = nil,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = nil,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 18,                                -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },


        ["AIM-7M"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1982,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 70,                                     -- km, range (aircraft must track target)                  
            ["semiactive_range"] = nil,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = nil,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 18,                                -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AIM-7MH"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1985,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 70,                                     -- km, range (aircraft must track target)                  
            ["semiactive_range"] = nil,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = nil,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 18,                                -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AIM-7P"] = {                                             -- weapon name
            ["type"] = "AAM",                                       -- weapon type
            ["task"] = {"A2A"},                               -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1987,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["reliability"] = 0.8,                              -- reliability (0-1)
            ["range"] = 70,                                     -- km, range (aircraft must track target)                  
            ["semiactive_range"] = nil,                         -- km, semiactive range (aircraft can or not track target)                  
            ["active_range"] = nil,                              -- km, active range  (missile has active autonomous tracking target)                
            ["max_height"] = 18,                                -- km max height
            ["max_speed"] = 3,                                  -- mach                            
        },

        ["AGM-84A"] = {                                             -- weapon name
            ["type"] = "ASM",                                       -- weapon type
            ["task"] = {"Anti-ship Strike"},                        -- weapon task: loadout and targetlist task (Strike, Anti-ship Strike, CAP, Intercept, AWACS, Fighter Sweep, Escort, SEAD)
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = nil, --kg
            ["perc_efficiency_variability"] = 0.1,                  -- efficiecy variability(0-1): firepower_max = firepower_max * ( 1 + perc_efficiency_variability )
            ["efficiency"] = {                                      -- efficiency attribute table
                
                ["ship"] = {                                        -- attribute
                    ["big"] = {                                     -- element dimension (big, medium, small, mix)
                        ["accuracy"] = 1,                           -- accuracy: hit success probability percentage, 1 max, 0.1 min
                        ["destroy_capacity"] = 0.6,                 -- destroy_capacity: number of destroyed single element ( element destroyed with single hit),  0.1 min
                    },
                    ["med"] = {
                        ["accuracy"] = 1,  
                        ["destroy_capacity"] = 0.8,
                    },
                    ["small"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.85,
                    },
                },        
            },                              
        },

        ["AGM-65D"] = { -- infrared
            ["type"] = "ASM",       
            ["task"] = {"Anti-ship Strike", "Strike", "SEAD"},
            ["start_service"] = 1967,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 52, --kg
            ["perc_efficiency_variability"] = 0.05, -- efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 1,   -- 
                        ["destroy_capacity"] = 0.6,
                    },
                    ["med"] = {
                        ["accuracy"] = 1,  
                        ["destroy_capacity"] = 0.8,
                    },
                    ["small"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.85,
                    },
                },   
                
                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },

                ["armor"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 0.9,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },   

                ["Parked Aircraft"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },

                ["SAM"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 1, -- element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 1,
                    },
                }, 
            },                              
        },

        ["AGM-65K"] = { -- electro - optic
            ["type"] = "ASM",       
            ["task"] = {"Anti-ship Strike", "Strike"},
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 52, --kg
            ["perc_efficiency_variability"] = 0.05, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 1,   -- 
                        ["destroy_capacity"] = 0.6,
                    },
                    ["med"] = {
                        ["accuracy"] = 1,  
                        ["destroy_capacity"] = 0.8,
                    },
                    ["small"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.85,
                    },
                },   
                
                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },

                ["armor"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 0.9,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },   

                ["Parked Aircraft"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },

                ["SAM"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 1, -- element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 1,
                    },
                }, 
            },                              
        },

        ["AGM-114"] = { -- laser
            ["type"] = "ASM",       
            ["task"] = {"Strike"},
            ["start_service"] = 1984,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 9, --kg
            ["perc_efficiency_variability"] = 0.05, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                               
                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 1,   -- 
                        ["destroy_capacity"] = 0.5,
                    },
                    ["med"] = {
                        ["accuracy"] = 1,  
                        ["destroy_capacity"] = 0.6,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9,   
                        ["destroy_capacity"] = 0.7,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.7, 
                        ["destroy_capacity"] = 0.6,
                    },
                },

                ["armor"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 1,   -- 
                        ["destroy_capacity"] = 0.4,
                    },
                    ["med"] = {
                        ["accuracy"] = 1,  
                        ["destroy_capacity"] = 0.5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9,   
                        ["destroy_capacity"] = 0.6,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.7, 
                        ["destroy_capacity"] = 0.5,
                    },
                },                   

                ["SAM"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 0.6, -- element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.7,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.7,
                    },
                }, 
            },                              
        },
    
        ["Mk-84"] = {
            ["type"] = "Bombs",       
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1950,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 428, --kg
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 0.8, -- 1 max: element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.9,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.85,
                    },
                },                
            
                ["Bridge"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 0.7,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.9,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.85, 
                        ["destroy_capacity"] = 0.8,
                    },
                },        

                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.5,   -- 
                        ["destroy_capacity"] = 0.85,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.4,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.2,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.3, 
                        ["destroy_capacity"] = 0.8,
                    },
                },        
            },                              
        },

        ["Mk-83"] = {
            ["type"] = "Bombs",       
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1950,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 202, --kg
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 0.4, -- 1 max: element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.45,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.5,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.42,
                    },
                },                
            
                ["Bridge"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 0.35,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.4,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.45,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.85, 
                        ["destroy_capacity"] = 0.4,
                    },
                },        

                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 0.42,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.5,  
                        ["destroy_capacity"] = 0.5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.3,   
                        ["destroy_capacity"] = 0.5,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 0.4,
                    },
                },        
            },                              
        },

        ["Mk-82"] = {
            ["type"] = "Bombs",       
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1950,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 92, --kg
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.21,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.52,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.21,
                    },
                },                
            
                
                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 0.21,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.5,  
                        ["destroy_capacity"] = 0.25,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.3,   
                        ["destroy_capacity"] = 0.25,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 0.2,
                    },
                },        
            },                              
        },

        ["Mk-82AIR"] = { -- verificare se sigla Mk-82SE
            ["type"] = "Bombs",       
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1950,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 92, --kg
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                
                    ["med"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.2,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.15,
                    },
                },                
            
                
                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 0.15,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.5,  
                        ["destroy_capacity"] = 0.25,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.3,   
                        ["destroy_capacity"] = 0.4,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 0.3,
                    },
                },        
            },                              
        },

        ["GBU-10"] = {
            ["type"] = "Guided Bombs",
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1980,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 428, --kg
            ["perc_efficiency_variability"] = 0.05, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 0.8, -- 1 max: element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.9,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.95, 
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.85,
                    },
                },                
            
                ["Bridge"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 0.7,
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.9,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.95, 
                        ["destroy_capacity"] = 0.8,
                    },
                },        

                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity "] = 0.85,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.4,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 0.8,
                    },
                },        
            },                  
        },
    
        ["GBU-16"] = {
            ["type"] = "Guided Bombs",
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 202, --kg
            ["perc_efficiency_variability"] = 0.05, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 0.4, -- 1 max: element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.45,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.95, 
                        ["destroy_capacity"] = 0.5,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.42,
                    },
                },                
            
                ["Bridge"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 1,   
                        ["destroy_capacity"] = 0.35,
                    },
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.4,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.9, 
                        ["destroy_capacity"] = 0.45,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.95, 
                        ["destroy_capacity"] = 0.4,
                    },
                },        

                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 0.42,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.7,  
                        ["destroy_capacity"] = 0.5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5,   
                        ["destroy_capacity"] = 0.5,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.7, 
                        ["destroy_capacity"] = 0.4,
                    },
                },        
            },                  
        },

        ["GBU-12"] = {
            ["type"] = "Guided Bombs",
            ["task"] = {"Strike"},
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 90, --kg
            ["perc_efficiency_variability"] = 0.05, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                   
                    ["med"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.21,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.95, 
                        ["destroy_capacity"] = 0.25,
                    },
                    ["mix"] = {
                        ["accuracy"] = 1, 
                        ["destroy_capacity"] = 0.21,
                    },
                },                 

                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 0.21,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.7,  
                        ["destroy_capacity"] = 0.25,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5,   
                        ["destroy_capacity"] = 0.25,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.7, 
                        ["destroy_capacity"] = 0.2,
                    },
                },        
            },                   
        },
            
        ["Mk-20"] = {  --aka CBU-100
            ["type"] = "Cluster Bombs",
            ["task"] = {"Strike"},	
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["SAM"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 2, -- element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 7,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 6,
                    },
                },                
            
                ["Parked Aircraft"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 4,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 6,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 8,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 7,
                    },
                },        

                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 3,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6,  
                        ["destroy_capacity"] = 5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5,   
                        ["destroy_capacity"] = 7,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 6,
                    },
                },

                ["armor"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 3,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6,  
                        ["destroy_capacity"] = 5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5,   
                        ["destroy_capacity"] = 7,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 6,
                    },
                },    
            },                  
        },

        ["CBU-52"] = {  --aka CBU-100
            ["type"] = "Cluster Bombs",
            ["task"] = {"Strike"},	
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["SAM"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 1 max, 0.1 min ( hit success percentage )
                        ["destroy_capacity"] = 2, -- element destroyed (single hit), 0.1 min ( element destroy capacity )                                    
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 3,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 4,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 3,
                    },
                },                
            
                ["Parked Aircraft"] = {-- fixed target (guided bombs and agm missile are more efficiency)            
                    ["big"] = {
                        ["accuracy"] = 7,   
                        ["destroy_capacity"] = 2,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 3,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 4,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 3,
                    },
                },        

                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 3,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.6,  
                        ["destroy_capacity"] = 5,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.5,   
                        ["destroy_capacity"] = 7,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.6, 
                        ["destroy_capacity"] = 6,
                    },
                },                
            },                  
        },

        ["M/71"] = { -- HE Framegtation bombs for AJS37 Viggen
            ["type"] = "Bombs",       
            ["task"] = {"Strike", "Anti-ship Strike"},
            ["start_service"] = 1970,
            ["end_service"] = nil,
            ["cost"] = 1,-- k$  
            ["tnt"] = 40, --kg
            ["perc_efficiency_variability"] = 0.1, -- percentage of efficiecy variability 0-1 (100%)
            ["efficiency"] = {  
                
                ["Structure"] = { -- fixed target (guided bombs and agm missile are more efficiency)            
                                   
                    ["small"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 0.52,
                    },                   
                },                
            
                
                ["ship"] = { -- mobile target
                    ["big"] = {
                        ["accuracy"] = 0.7,   -- 
                        ["destroy_capacity"] = 0.07,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.5,  
                        ["destroy_capacity"] = 0.12,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.3,   
                        ["destroy_capacity"] = 0.12,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.5, 
                        ["destroy_capacity"] = 0.1,
                    },
                },    
                
                ["soft"] = { -- mobile target(artillery group)
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },

                ["armor"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 0.8,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 0.9,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },   

                ["Parked Aircraft"] = { -- mobile target armor non è presente in targetlist, cmq valuta se inserirlo x distinguerlo da soft
                    ["big"] = {
                        ["accuracy"] = 0.8,   -- 
                        ["destroy_capacity"] = 1,
                    },
                    ["med"] = {
                        ["accuracy"] = 0.8,  
                        ["destroy_capacity"] = 1,
                    },
                    ["small"] = {
                        ["accuracy"] = 0.7,   
                        ["destroy_capacity"] = 1,
                    },
                    ["mix"] = {
                        ["accuracy"] = 0.8, 
                        ["destroy_capacity"] = 1,
                    },
                },
            },                              
        },
    },
    
    ["red"] = {

    },
}
 
