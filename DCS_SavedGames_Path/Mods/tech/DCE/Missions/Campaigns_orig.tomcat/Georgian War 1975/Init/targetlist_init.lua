targetlist = {
	["blue"] = {
		["Battle Group CAP"] = {
			task = "CAP",
			priority = 20,
			attributes = {"CV CAP"},
			firepower = {
				min = 2,
				max = 2,
			},
			slaved = {"CVN-71 Theodore Roosevelt", 335, 80000},
			radius = 111000,
			text = "",
		},
		["CAP Sharjah"] = {
			task = "CAP",
			priority = 5,
			attributes = {"Air Forces"},
			firepower = {
				min = 2,
				max = 4,
			},
			refpoint = "CAP Sharjah",
			radius = 50000,
			text = "east of Sharjah",
			inactive = false,
		},
		["AWACS"] = {
			task = "AWACS",
			priority = 10,
			attributes = {"Sentry"},
			firepower = {
				min = 1,
				max = 1,
			},
			refpoint = "AWACS",
			radius = 15000,
			text = "",
		},		
		["Battle Group AEW"] = {
			task = "AWACS",
			priority = 10,
			attributes = {"AEW"},
			firepower = {
				min = 1,
				max = 1,
			},
			slaved = {"CVN-71 Theodore Roosevelt",320, 45000},
			text = "",
		},
		["Mission Support Tanker"] = {
			task = "Refueling",
			priority = 10,
			attributes = {"medium"},
			firepower = {
				min = 1,
				max = 1,
			},
			slaved = {"CVN-71 Theodore Roosevelt", 330, 40000},
			text = "",
		},
		["Recovery Tanker"] = {
			task = "Refueling",
			priority = 5,
			attributes = {"low"},
			firepower = {
				min = 1,
				max = 1,
			},
			slaved = {"CVN-71 Theodore Roosevelt", 310, 30000},
			text = "",
		},		
		["Tanker Track Center"] = {
			task = "Refueling",
			priority = 10,
			attributes = {"KC135MPRS"},
			firepower = {
				min = 1,
				max = 1,
			},
			refpoint = "Tanker Center",
			radius = 15000,
			text = "",
		},
		["Tanker KC135"] = {
			task = "Refueling",
			priority = 10,
			attributes = {"KC135"},
			firepower = {
				min = 1,
				max = 1,
			},
			refpoint = "Tanker KC135",
			radius = 15000,
			text = "",
		},
		["Dubai Intl"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 2,
				max = 2,
			},
			base = "Dubai Intl",
			radius = 150000,
		},
		["Al Dhafra AB"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 2,
				max = 2,
			},
			base = "Al Dhafra AB",
			radius = 150000,
		},		
		["CVN-74 John C. Stennis Interception"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 2,
				max = 4,
			},
			base = "CVN-74 John C. Stennis",
			radius = 150000,
		},
		["CVN-71 Theodore Roosevelt Interception"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 2,
				max = 4,
			},
			base = "CVN-71 Theodore Roosevelt",
			radius = 150000,
		},
		-- ["Battle Group CAP"] = {
			-- task = "CAP",
			-- priority = 20,
			-- attributes = {},
			-- firepower = {
				-- min = 2,
				-- max = 2,
			-- },
			-- slaved = {"CVN-74 John C. Stennis", 85, 92600},
			-- radius = 111000,
			-- text = "",
		-- },
		-- ["Battle Group CAP 2"] = {
			-- task = "CAP",
			-- priority = 10,
			-- attributes = {},
			-- firepower = {
				-- min = 2,
				-- max = 2,
			-- },
			-- slaved = {"CVN-74 John C. Stennis", 45, 92600},
			-- radius = 111000,
			-- text = "",
		-- },		
		-- ["Battle Group AEW"] = {
			-- task = "AWACS",
			-- priority = 10,
			-- attributes = {},
			-- firepower = {
				-- min = 1,
				-- max = 1,
			-- },
			-- slaved = {"CVN-74 John C. Stennis",300, 20000},
			-- text = "",
		-- },
		-- ["Mission Support Tanker"] = {
			-- task = "Refueling",
			-- priority = 2,
			-- attributes = {"medium"},
			-- firepower = {
				-- min = 1,
				-- max = 1,
			-- },
			-- slaved = {"CVN-74 John C. Stennis", 085, 53000},
			-- text = "",
		-- },
		-- ["Recovery Tanker"] = {
			-- task = "Refueling",
			-- priority = 1,
			-- attributes = {"low"},
			-- firepower = {
				-- min = 1,
				-- max = 1,
			-- },
			-- slaved = {"CVN-74 John C. Stennis", 085, 20000},
			-- text = "",
		-- },
		["Airlift shopper LHA_Nassau"] = {
			task = "Transport",
			priority = 1,
			attributes = {},
			firepower = {
				min = 4,
				max = 4,
			},
			base = "LHA_Nassau",
			destination = "Fujairah Intl",
		},
		-- ["Airlift Al Dhafra AB"] = {
			-- task = "Transport",
			-- priority = 1,
			-- attributes = {},
			-- firepower = {
				-- min = 10,
				-- max = 10,
			-- },
			-- base = "Dubai Intl",
			-- destination = "Al Dhafra AB",
		-- },
		-- ["Airlift Dubai Intl"] = {
			-- task = "Transport",
			-- priority = 1,
			-- attributes = {},
			-- firepower = {
				-- min = 10,
				-- max = 10,
			-- },
			-- base = "Al Dhafra AB",
			-- destination = "Dubai Intl",
		-- },		
--[[		["Airlift Al Dhafra"] = {
			task = "Transport",
			priority = 1,
			attributes = {},
			firepower = {
				min = 10,
				max = 10,
			},
			base = "Khasab",
			destination = "Al Dhafra AB",
		},
		["Airlift Khasab"] = {
			task = "Transport",
			priority = 1,
			attributes = {},
			firepower = {
				min = 10,
				max = 10,
			},
			base = "Al Dhafra AB",
			destination = "Khasab",
		},]]--
		-- ["Sweep North"] = {
			-- task = "Fighter Sweep",
			-- priority = 2,
			-- attributes = {},
			-- firepower = {
				-- min = 20,
				-- max = 40,
			-- },
			-- x = 00051420,
			-- y = 00030012,
			-- text = "in the north of Khasab",
		-- },
		-- ["Sweep West"] = {
			-- task = "Fighter Sweep",
			-- priority = 2,
			-- attributes = {},
			-- firepower = {
				-- min = 20,
				-- max = 40,
			-- },
			-- x = -138197,
			-- y = 776021,
			-- text = "in the west front area",
		-- },
		-- ["Sweep East"] = {
			-- task = "Fighter Sweep",
			-- priority = 2,
			-- attributes = {},
			-- firepower = {
				-- min = 20,
				-- max = 40,
			-- },
			-- x = -129150,
			-- y = 888342,
			-- text = "in the east front area",
		-- },
		-- ["Bandar Abbas Intl OCA Strike"] = {
			-- task = "Strike",
			-- priority = 1,
			-- attributes = {"Parked Aircraft"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "airbase",
			-- name = "Bandar Abbas Intl",
		-- },
		-- ["Lar Airbase OCA Strike"] = {
			-- task = "Strike",
			-- priority = 1,
			-- attributes = {"Parked Aircraft"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "airbase",
			-- name = "Lar Airbase",
		-- },
--[[		["Nalchik airbase OCA Strike"] = {
			task = "Strike",
			priority = 1,
			attributes = {"Parked Aircraft"},
			firepower = {
				min = 40,
				max = 80,
			},
			class = "airbase",
			name = "Nalchik",
		},
		["Mineralnye-Vody airbase OCA Strike"] = {
			task = "Strike",
			priority = 1,
			attributes = {"Parked Aircraft"},
			firepower = {
				min = 40,
				max = 80,
			},
			class = "airbase",
			name = "Mineralnye-Vody",
		},	]]--	
		["EWR 1"] = {
			task = "Strike",
			priority = 7,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "EWR 1",
		},
		["EWR 2"] = {
			task = "Strike",
			priority = 7,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "EWR 2",
		},
		["EWR 3"] = {
			task = "Strike",
			priority = 7,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "EWR 3",
		},
		["Bandar-E-Jask Silkworm Battery"] = {
			task = "Strike",
			priority = 9,
			picture = {"Bandar-E-Jask Silkworm Battery.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "Bandar-E-Jask Silkworm Battery",
		},
		["Scud 1"] = {
			task = "Strike",
			priority = 9,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "Scud 1",
			inactive = true,
		},
		["Scud 2"] = {
			task = "Strike",
			priority = 9,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "Scud 2",
			inactive = true,
		},
		["Scud 3"] = {
			task = "Strike",
			priority = 9,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "Scud 3",
			inactive = true,
		},
		["SA-6 Gainful Site E-1"] = {
			task = "Strike",
			priority = 6,
			picture = {"SA-6 Gainful Site E-1.png"},
			attributes = {"SAM"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "SA-6 Gainful Site E-1",
		},
		-- ["SA-2 Site E-2"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "vehicle",
			-- name = "SA-2 Site E-2",
		-- },
		-- ["SA-2 Site S-1"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "vehicle",
			-- name = "SA-2 Site S-1",
		-- },
		-- ["SA-6 Gainful Site W-1 - N261518 E0551912"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "vehicle",
			-- name = "SA-6 Gainful Site W-1",
		-- },
		-- ["SA-2 Site W-2"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "vehicle",
			-- name = "SA-2 Site W-2",
		-- },		
		-- ["SA-6 Gainful Site N-1 - N274093 E0542476"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 80,
			-- },
			-- class = "vehicle",
			-- name = "SA-6 Gainful Site N-1",
		-- },		
		-- ["Hawk Battery 1 - N271170 E0562319"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "vehicle",
			-- name = "Hawk Battery 1",
		-- },
		-- ["Hawk Battery 2 - 263426 E0551766"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "vehicle",
			-- name = "Hawk Battery 2",
		-- },
		-- ["Hawk Battery 3 - N270950 E0543759"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "vehicle",
			-- name = "Hawk Battery 3",
		-- },
		-- ["Hawk Battery 4 - N293057 E0523587"] = {
			-- task = "Strike",
			-- priority = 6,
			-- attributes = {"SAM"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "vehicle",
			-- name = "Hawk Battery 4",
		-- },		
--[[		["107 SA-3 Goa Site C-7 N433338 E0434288"] = {
			task = "Strike",
			priority = 6,
			attributes = {"SAM"},
			firepower = {
				min = 40,
				max = 60,
			},
			class = "vehicle",
			name = "107 SA-3 Goa Site C-7",
		},
		["110 SA-3 Goa Site W-10 N440952 E0430940"] = {
			task = "Strike",
			priority = 6,
			attributes = {"SAM"},
			firepower = {
				min = 40,
				max = 60,
			},
			class = "vehicle",
			name = "110 SA-3 Goa Site W-10",
		},]]--
		["Abu Musa Island Airport"] = {
			task = "Strike",
			priority = 2,
			picture = {"AbuMusa1.png", "AbuMusa2.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 4,
			},
			elements = {
				[1] = {
					name = "Abu Musa Control Tower",
					x = -31197.27734375,
					y = -122174.9921875,
				},
				[2] = {
					name = "Abu Musa Hangar 1",
					x = -31198.244140625,
					y = -122061.3671875,
				},
				[3] = {
					name = "Abu Musa Hangar 2",
					x = -31333.822265625,
					y = -122244.9296875,
				},
				[4] = {
					name = "Abu Musa HQ",
					x = -31287.83203125,
					y = -122282.46875,
				},
			},
		},
		["Abu Musa Island Airport Strategics"] = {
			task = "Strike",
			priority = 5,
			picture = {"AbuMusa1.png", "AbuMusa2.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Abu Musa Fuel Tank 1",
				},
				[2] = {
					name = "Abu Musa Fuel Tank 2",
				},
				[3] = {
					name = "Abu Musa Fuel Tank 3",
				},
				[4] = {
					name = "Abu Musa Fuel Tank 4",
				},
				[5] = {
					name = "Abu Musa Fuel Tank 5",
				},
				[6] = {
					name = "Abu Musa Ammo Shelter 1",
				},
				[7] = {
					name = "Abu Musa Ammo Shelter 2",
				},
				[8] = {
					name = "Abu Musa Comm Center",
				},				
			},
		},
		["2nd Iranian Transport fleet"] = {
			task = "Strike",
			priority = 6,
			picture = {"Khasab Harbor.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "static",
			elements = {
				[1] = {
					name = "2nd Iranian Transport fleet 1",
				},
				[2] = {
					name = "2nd Iranian Transport fleet 2",
				},
				[3] = {
					name = "2nd Iranian Transport fleet 3",
				},
				[4] = {
					name = "2nd Iranian Transport fleet 4",
				},
				[5] = {
					name = "2nd Iranian Transport fleet 5",
				},
				[6] = {
					name = "2nd Iranian Transport fleet 6",
				},
			},
		},
		["Iranian West frontline 1st Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {"Iranian West Front Bat.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline 1st Bat-1",
				},
				[2] = {
					name = "Iranian West frontline 1st Bat-2",
				},
				[3] = {
					name = "Iranian West frontline 1st Bat-3",
				},
				[4] = {
					name = "Iranian West frontline 1st Bat-4",
				},
				[5] = {
					name = "Iranian West frontline 1st Bat-5",
				},
				[6] = {
					name = "Iranian West frontline 1st Bat-6",
				},
				[7] = {
					name = "Iranian West frontline 1st Bat-7",
				},
				[8] = {
					name = "Iranian West frontline 1st Bat-8",
				},	
				[9] = {
					name = "Iranian West frontline 1st Bat-9",
				},	
				[10] = {
					name = "Iranian West frontline 1st Bat-10",
				},	
				[11] = {
					name = "Iranian West frontline 1st Bat-11",
				},	
				[12] = {
					name = "Iranian West frontline 1st Bat-12",
				},
			},
		},
		["Iranian West frontline 3rd Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {"Iranian West Front Bat.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline 3rd Bat-1",
				},
				[2] = {
					name = "Iranian West frontline 3rd Bat-2",
				},
				[3] = {
					name = "Iranian West frontline 3rd Bat-3",
				},
				[4] = {
					name = "Iranian West frontline 3rd Bat-4",
				},
				[5] = {
					name = "Iranian West frontline 3rd Bat-5",
				},
				[6] = {
					name = "Iranian West frontline 3rd Bat-6",
				},
				[7] = {
					name = "Iranian West frontline 3rd Bat-7",
				},
				[8] = {
					name = "Iranian West frontline 3rd Bat-8",
				},	
				[9] = {
					name = "Iranian West frontline 3rd Bat-9",
				},	
				[10] = {
					name = "Iranian West frontline 3rd Bat-10",
				},	
				[11] = {
					name = "Iranian West frontline 3rd Bat-11",
				},	
				[12] = {
					name = "Iranian West frontline 3rd Bat-12",
				},
			},
		},
		["Iranian West frontline 4th Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {"Iranian West Front Bat.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline 4th Bat-1",
				},
				[2] = {
					name = "Iranian West frontline 4th Bat-2",
				},
				[3] = {
					name = "Iranian West frontline 4th Bat-3",
				},
				[4] = {
					name = "Iranian West frontline 4th Bat-4",
				},
				[5] = {
					name = "Iranian West frontline 4th Bat-5",
				},
				[6] = {
					name = "Iranian West frontline 4th Bat-6",
				},
				[7] = {
					name = "Iranian West frontline 4th Bat-7",
				},
				[8] = {
					name = "Iranian West frontline 4th Bat-8",
				},	
				[9] = {
					name = "Iranian West frontline 4th Bat-9",
				},	
				[10] = {
					name = "Iranian West frontline 4th Bat-10",
				},	
				[11] = {
					name = "Iranian West frontline 4th Bat-11",
				},	
				[12] = {
					name = "Iranian West frontline 4th Bat-12",
				},
			},
		},
		["Iranian West frontline 5th Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {"Iranian West Front Bat.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline 5th Bat-1",
				},
				[2] = {
					name = "Iranian West frontline 5th Bat-2",
				},
				[3] = {
					name = "Iranian West frontline 5th Bat-3",
				},
				[4] = {
					name = "Iranian West frontline 5th Bat-4",
				},
				[5] = {
					name = "Iranian West frontline 5th Bat-5",
				},
				[6] = {
					name = "Iranian West frontline 5th Bat-6",
				},
				[7] = {
					name = "Iranian West frontline 5th Bat-7",
				},
				[8] = {
					name = "Iranian West frontline 5th Bat-8",
				},	
				[9] = {
					name = "Iranian West frontline 5th Bat-9",
				},	
				[10] = {
					name = "Iranian West frontline 5th Bat-10",
				},	
				[11] = {
					name = "Iranian West frontline 5th Bat-11",
				},	
				[12] = {
					name = "Iranian West frontline 5th Bat-12",
				},
			},
		},
		["Iranian West frontline 2nd Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {"Iranian West Front Bat.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline 2nd Bat-1",
				},
				[2] = {
					name = "Iranian West frontline 2nd Bat-2",
				},
				[3] = {
					name = "Iranian West frontline 2nd Bat-3",
				},
				[4] = {
					name = "Iranian West frontline 2nd Bat-4",
				},
				[5] = {
					name = "Iranian West frontline 2nd Bat-5",
				},
				[6] = {
					name = "Iranian West frontline 2nd Bat-6",
				},
				[7] = {
					name = "Iranian West frontline 2nd Bat-7",
				},
				[8] = {
					name = "Iranian West frontline 2nd Bat-8",
				},	
				[9] = {
					name = "Iranian West frontline 2nd Bat-9",
				},	
				[10] = {
					name = "Iranian West frontline 2nd Bat-10",
				},	
				[11] = {
					name = "Iranian West frontline 2nd Bat-11",
				},	
				[12] = {
					name = "Iranian West frontline 2nd Bat-12",
				},
			},
		},
		["Iranian West frontline convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline convoy 1-1",
				},
				[2] = {
					name = "Iranian West frontline convoy 1-2",
				},
				[3] = {
					name = "Iranian West frontline convoy 1-3",
				},
				[4] = {
					name = "Iranian West frontline convoy 1-4",
				},
				[5] = {
					name = "Iranian West frontline convoy 1-5",
				},
				[6] = {
					name = "Iranian West frontline convoy 1-6",
				},
				[7] = {
					name = "Iranian West frontline convoy 1-7",
				},
				[8] = {
					name = "Iranian West frontline convoy 1-8",
				},	
				[9] = {
					name = "Iranian West frontline convoy 1-9",
				},	
				[10] = {
					name = "Iranian West frontline convoy 1-10",
				},	
				[11] = {
					name = "Iranian West frontline convoy 1-11",
				},	
				[12] = {
					name = "Iranian West frontline convoy 1-12",
				},
			},
		},
		["Iranian West frontline convoy 2"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Iranian West frontline convoy 2-1",
				},
				[2] = {
					name = "Iranian West frontline convoy 2-2",
				},
				[3] = {
					name = "Iranian West frontline convoy 2-3",
				},
				[4] = {
					name = "Iranian West frontline convoy 2-4",
				},
				[5] = {
					name = "Iranian West frontline convoy 2-5",
				},
				[6] = {
					name = "Iranian West frontline convoy 2-6",
				},
				[7] = {
					name = "Iranian West frontline convoy 2-7",
				},
				[8] = {
					name = "Iranian West frontline convoy 2-8",
				},	
				[9] = {
					name = "Iranian West frontline convoy 2-9",
				},	
				[10] = {
					name = "Iranian West frontline convoy 2-10",
				},	
				[11] = {
					name = "Iranian West frontline convoy 2-11",
				},	
				[12] = {
					name = "Iranian West frontline convoy 2-12",
				},
			},
		},
		["Bukha Iranian Landing Troops"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Bukha Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Bukha Iranian Landing Troops 1",
				},
				[2] = {
					name = "Bukha Iranian Landing Troops 2",
				},
				[3] = {
					name = "Bukha Iranian Landing Troops 3",
				},
				[4] = {
					name = "Bukha Iranian Landing Troops 4",
				},
				[5] = {
					name = "Bukha Iranian Landing Troops 5",
				},
				[6] = {
					name = "Bukha Iranian Landing Troops 6",
				},
				[7] = {
					name = "Bukha Iranian Landing Troops 7",
				},
				[8] = {
					name = "Bukha Iranian Landing Troops 8",
				},	
				[9] = {
					name = "Bukha Iranian Landing Troops 9",
				},	
				[10] = {
					name = "Bukha Iranian Landing Troops 10",
				},	
				[11] = {
					name = "Bukha Iranian Landing Troops 11",
				},	
				[12] = {
					name = "Bukha Iranian Landing Troops 12",
				},
				[13] = {
					name = "Bukha Iranian Landing Troops 13",
				},
				[14] = {
					name = "Bukha Iranian Landing Troops 14",
				},
				[15] = {
					name = "Bukha Iranian Landing Troops 15",
				},	
				[16] = {
					name = "Bukha Iranian Landing Troops 16",
				},	
				[17] = {
					name = "Bukha Iranian Landing Troops 17",
				},	
				[18] = {
					name = "Bukha Iranian Landing Troops 18",
				},	
				[19] = {
					name = "Bukha Iranian Landing Troops 19",
				},	
				[20] = {
					name = "Bukha Iranian Landing Troops 20",
				},	
				[21] = {
					name = "Bukha Iranian Landing Troops 21",
				},	
				[22] = {
					name = "Bukha Iranian Landing Troops 22",
				},
				[23] = {
					name = "Bukha Iranian Landing Troops 23",
				},
				[24] = {
					name = "Bukha Iranian Landing Troops 24",
				},
				[25] = {
					name = "Bukha Iranian Landing Troops 25",
				},	
				[26] = {
					name = "Bukha Iranian Landing Troops 26",
				},	
				[27] = {
					name = "Bukha Iranian Landing Troops 27",
				},	
				[28] = {
					name = "Bukha Iranian Landing Troops 28",
				},
				[29] = {
					name = "Bukha Iranian Landing Troops 29",
				},	
				[30] = {
					name = "Bukha Iranian Landing Troops 30",
				},
			},
		},				
		["Bukha Iranian Command Post"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Bukha Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Bukha Iranian Command Post 1",
				},	
				[2] = {
					name = "Bukha Iranian Command Post 2",
				},
				[3] = {
					name = "Bukha Iranian Command Post 3",
				},
				[4] = {
					name = "Bukha Iranian Command Post 4",
				},
				[5] = {
					name = "Bukha Iranian Command Post 5",
				},	
				[6] = {
					name = "Bukha Iranian Command Post 6",
				},	
				[7] = {
					name = "Bukha Iranian Command Post 7",
				},	
				[8] = {
					name = "Bukha Iranian Command Post 8",
				},
				[9] = {
					name = "Bukha Iranian Command Post 9",
				},	
				[10] = {
					name = "Bukha Iranian Command Post 10",
				},
				[11] = {
					name = "Bukha Iranian Command Post 11",
				},
				[12] = {
					name = "Bukha Iranian Command Post 12",
				},
			},
		},
		["Bukha Iranian convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Bukha Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Bukha Iranian convoy 1-1",
				},
				[2] = {
					name = "Bukha Iranian convoy 1-2",
				},
				[3] = {
					name = "Bukha Iranian convoy 1-3",
				},
				[4] = {
					name = "Bukha Iranian convoy 1-4",
				},
				[5] = {
					name = "Bukha Iranian convoy 1-5",
				},
				[6] = {
					name = "Bukha Iranian convoy 1-6",
				},
				[7] = {
					name = "Bukha Iranian convoy 1-7",
				},
				[8] = {
					name = "Bukha Iranian convoy 1-8",
				},	
				[9] = {
					name = "Bukha Iranian convoy 1-9",
				},	
				[10] = {
					name = "Bukha Iranian convoy 1-10",
				},	
				[11] = {
					name = "Bukha Iranian convoy 1-11",
				},	
				[12] = {
					name = "Bukha Iranian convoy 1-12",
				},
				[13] = {
					name = "Bukha Iranian convoy 1-13",
				},
				[14] = {
					name = "Bukha Iranian convoy 1-14",
				},
				[15] = {
					name = "Bukha Iranian convoy 1-15",
				},	
				[16] = {
					name = "Bukha Iranian convoy 1-16",
				},	
				[17] = {
					name = "Bukha Iranian convoy 1-17",
				},	
				[18] = {
					name = "Bukha Iranian convoy 1-18",
				},	
				[19] = {
					name = "Bukha Iranian convoy 1-19",
				},	
				[20] = {
					name = "Bukha Iranian convoy 1-20",
				},	
				[21] = {
					name = "Bukha Iranian convoy 1-21",
				},	
				[22] = {
					name = "Bukha Iranian convoy 1-22",
				},
				[23] = {
					name = "Bukha Iranian convoy 1-23",
				},
				[24] = {
					name = "Bukha Iranian convoy 1-24",
				},
				[25] = {
					name = "Bukha Iranian convoy 1-25",
				},	
				[26] = {
					name = "Bukha Iranian convoy 1-26",
				},	
				[27] = {
					name = "Bukha Iranian convoy 1-27",
				},	
				[28] = {
					name = "Bukha Iranian convoy 1-28",
				},
				[29] = {
					name = "Bukha Iranian convoy 1-29",
				},	
				[30] = {
					name = "Bukha Iranian convoy 1-30",
				},	
			},
		},	
		["Khasab debarqued troops"] = {
			task = "Strike",
			priority = 5,
			picture = {"Khasab Harbor.png", "Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Khasab debarqued troops 1",
				},
				[2] = {
					name = "Khasab debarqued troops 2",
				},
				[3] = {
					name = "Khasab debarqued troops 3",
				},
				[4] = {
					name = "Khasab debarqued troops 4",
				},
				[5] = {
					name = "Khasab debarqued troops 5",
				},
				[6] = {
					name = "Khasab debarqued troops 6",
				},
				[7] = {
					name = "Khasab debarqued troops 7",
				},
				[8] = {
					name = "Khasab debarqued troops 8",
				},	
				[9] = {
					name = "Khasab debarqued troops 9",
				},	
				[10] = {
					name = "Khasab debarqued troops 10",
				},	
				[11] = {
					name = "Khasab debarqued troops 11",
				},	
				[12] = {
					name = "Khasab debarqued troops 12",
				},
				[13] = {
					name = "Khasab debarqued troops 13",
				},
				[14] = {
					name = "Khasab debarqued troops 14",
				},
				[15] = {
					name = "Khasab debarqued troops 15",
				},	
				[16] = {
					name = "Khasab debarqued troops 16",
				},	
				[17] = {
					name = "Khasab debarqued troops 17",
				},	
				[18] = {
					name = "Khasab debarqued troops 18",
				},	
				[19] = {
					name = "Khasab debarqued troops 19",
				},	
				[20] = {
					name = "Khasab debarqued troops 20",
				},	
				[21] = {
					name = "Khasab debarqued troops 21",
				},	
				[22] = {
					name = "Khasab debarqued troops 22",
				},
				[23] = {
					name = "Khasab debarqued troops 23",
				},
				[24] = {
					name = "Khasab debarqued troops 24",
				},
				[25] = {
					name = "Khasab debarqued troops 25",
				},	
				[26] = {
					name = "Khasab debarqued troops 26",
				},	
				[27] = {
					name = "Khasab debarqued troops 27",
				},	
				[28] = {
					name = "Khasab debarqued troops 28",
				},
				[29] = {
					name = "Khasab debarqued troops 29",
				},	
				[30] = {
					name = "Khasab debarqued troops 30",
				},	
				[31] = {
					name = "Khasab debarqued troops 31",
				},	
				[32] = {
					name = "Khasab debarqued troops 32",
				},
				[33] = {
					name = "Khasab debarqued troops 33",
				},
				[34] = {
					name = "Khasab debarqued troops 34",
				},
				[35] = {
					name = "Khasab debarqued troops 35",
				},	
				[36] = {
					name = "Khasab debarqued troops 36",
				},	
				[37] = {
					name = "Khasab debarqued troops 37",
				},	
				[38] = {
					name = "Khasab debarqued troops 38",
				},
				[39] = {
					name = "Khasab debarqued troops 39",
				},	
				[40] = {
					name = "Khasab debarqued troops 40",
				},
			},
		},
		["Khasab debarqued Hawk batterie"] = {
			task = "Strike",
			priority = 5,
			picture = {"Khasab Harbor.png", "Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Khasab debarqued Hawk batterie 1",
				},
				[2] = {
					name = "Khasab debarqued Hawk batterie 2",
				},
				[3] = {
					name = "Khasab debarqued Hawk batterie 3",
				},
				[4] = {
					name = "Khasab debarqued Hawk batterie 4",
				},
				[5] = {
					name = "Khasab debarqued Hawk batterie 5",
				},
				[6] = {
					name = "Khasab debarqued Hawk batterie 6",
				},
				[7] = {
					name = "Khasab debarqued Hawk batterie 7",
				},
				[8] = {
					name = "Khasab debarqued Hawk batterie 8",
				},	
				[9] = {
					name = "Khasab debarqued Hawk batterie 9",
				},	
				[10] = {
					name = "Khasab debarqued Hawk batterie 10",
				},	
				[11] = {
					name = "Khasab debarqued Hawk batterie 11",
				},	
				[12] = {
					name = "Khasab debarqued Hawk batterie 12",
				},
				[13] = {
					name = "Khasab debarqued Hawk batterie 13",
				},
				[14] = {
					name = "Khasab debarqued Hawk batterie 14",
				},
				[15] = {
					name = "Khasab debarqued Hawk batterie 15",
				},	
				[16] = {
					name = "Khasab debarqued Hawk batterie 16",
				},	
			},
		},
		-- ["Khasab debarqued Scud batterie"] = {
			-- task = "Strike",
			-- priority = 5,
			-- picture = {"Khasab Harbor.png", "Oman_Front-1.png"},
			-- attributes = {"soft"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Khasab debarqued Scud batterie 1",
				-- },
				-- [2] = {
					-- name = "Khasab debarqued Scud batterie 2",
				-- },
				-- [3] = {
					-- name = "Khasab debarqued Scud batterie 3",
				-- },
				-- [4] = {
					-- name = "Khasab debarqued Scud batterie 4",
				-- },
				-- [5] = {
					-- name = "Khasab debarqued Scud batterie 5",
				-- },
				-- [6] = {
					-- name = "Khasab debarqued Scud batterie 6",
				-- },
			-- },
		-- },
		["Khasab debarqued Silkworms batteries"] = {
			task = "Strike",
			priority = 5,
			picture = {"Khasab Harbor.png", "Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Khasab debarqued Silkworms batteries 1",
				},
				[2] = {
					name = "Khasab debarqued Silkworms batteries 2",
				},
				[3] = {
					name = "Khasab debarqued Silkworms batteries 3",
				},
				[4] = {
					name = "Khasab debarqued Silkworms batteries 4",
				},
				[5] = {
					name = "Khasab debarqued Silkworms batteries 5",
				},
				[6] = {
					name = "Khasab debarqued Silkworms batteries 6",
				},
				[7] = {
					name = "Khasab debarqued Silkworms batteries 7",
				},
				[8] = {
					name = "Khasab debarqued Silkworms batteries 8",
				},	
				[9] = {
					name = "Khasab debarqued Silkworms batteries 9",
				},	
				[10] = {
					name = "Khasab debarqued Silkworms batteries 10",
				},	
				[11] = {
					name = "Khasab debarqued Silkworms batteries 11",
				},	
				[12] = {
					name = "Khasab debarqued Silkworms batteries 12",
				},
				[13] = {
					name = "Khasab debarqued Silkworms batteries 13",
				},
				[14] = {
					name = "Khasab debarqued Silkworms batteries 14",
				},
				[15] = {
					name = "Khasab debarqued Silkworms batteries 15",
				},	
				[16] = {
					name = "Khasab debarqued Silkworms batteries 16",
				},	
				[17] = {
					name = "Khasab debarqued Silkworms batteries 17",
				},	
				[18] = {
					name = "Khasab debarqued Silkworms batteries 18",
				},	
				[19] = {
					name = "Khasab debarqued Silkworms batteries 19",
				},	
				[20] = {
					name = "Khasab debarqued Silkworms batteries 20",
				},	
				[21] = {
					name = "Khasab debarqued Silkworms batteries 21",
				},	
				[22] = {
					name = "Khasab debarqued Silkworms batteries 22",
				},
				[23] = {
					name = "Khasab debarqued Silkworms batteries 23",
				},
			},
		},
		["Mountain Iranian convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mountain Iranian convoy 1-1",
				},
				[2] = {
					name = "Mountain Iranian convoy 1-2",
				},
				[3] = {
					name = "Mountain Iranian convoy 1-3",
				},
				[4] = {
					name = "Mountain Iranian convoy 1-4",
				},
				[5] = {
					name = "Mountain Iranian convoy 1-5",
				},
				[6] = {
					name = "Mountain Iranian convoy 1-6",
				},
				[7] = {
					name = "Mountain Iranian convoy 1-7",
				},
				[8] = {
					name = "Mountain Iranian convoy 1-8",
				},	
				[9] = {
					name = "Mountain Iranian convoy 1-9",
				},	
				[10] = {
					name = "Mountain Iranian convoy 1-10",
				},	
				[11] = {
					name = "Mountain Iranian convoy 1-11",
				},	
				[12] = {
					name = "Mountain Iranian convoy 1-12",
				},
				[13] = {
					name = "Mountain Iranian convoy 1-13",
				},
				[14] = {
					name = "Mountain Iranian convoy 1-14",
				},
				[15] = {
					name = "Mountain Iranian convoy 1-15",
				},	
				[16] = {
					name = "Mountain Iranian convoy 1-16",
				},	
				[17] = {
					name = "Mountain Iranian convoy 1-17",
				},	
				[18] = {
					name = "Mountain Iranian convoy 1-18",
				},	
				[19] = {
					name = "Mountain Iranian convoy 1-19",
				},	
				[20] = {
					name = "Mountain Iranian convoy 1-20",
				},	
				[21] = {
					name = "Mountain Iranian convoy 1-21",
				},	
				[22] = {
					name = "Mountain Iranian convoy 1-22",
				},
				[23] = {
					name = "Mountain Iranian convoy 1-23",
				},
				[24] = {
					name = "Mountain Iranian convoy 1-24",
				},
				[25] = {
					name = "Mountain Iranian convoy 1-25",
				},	
				[26] = {
					name = "Mountain Iranian convoy 1-26",
				},	
				[27] = {
					name = "Mountain Iranian convoy 1-27",
				},	
				[28] = {
					name = "Mountain Iranian convoy 1-28",
				},
				[29] = {
					name = "Mountain Iranian convoy 1-29",
				},	
				[30] = {
					name = "Mountain Iranian convoy 1-30",
				},	
			},
		},
		["Mountain Iranian convoy 2"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mountain Iranian convoy 2-1",
				},
				[2] = {
					name = "Mountain Iranian convoy 2-2",
				},
				[3] = {
					name = "Mountain Iranian convoy 2-3",
				},
				[4] = {
					name = "Mountain Iranian convoy 2-4",
				},
				[5] = {
					name = "Mountain Iranian convoy 2-5",
				},
				[6] = {
					name = "Mountain Iranian convoy 2-6",
				},
				[7] = {
					name = "Mountain Iranian convoy 2-7",
				},
				[8] = {
					name = "Mountain Iranian convoy 2-8",
				},	
				[9] = {
					name = "Mountain Iranian convoy 2-9",
				},	
				[10] = {
					name = "Mountain Iranian convoy 2-10",
				},	
				[11] = {
					name = "Mountain Iranian convoy 2-11",
				},	
				[12] = {
					name = "Mountain Iranian convoy 2-12",
				},
				[13] = {
					name = "Mountain Iranian convoy 2-13",
				},
				[14] = {
					name = "Mountain Iranian convoy 2-14",
				},
				[15] = {
					name = "Mountain Iranian convoy 2-15",
				},	
				[16] = {
					name = "Mountain Iranian convoy 2-16",
				},	
				[17] = {
					name = "Mountain Iranian convoy 2-17",
				},	
				[18] = {
					name = "Mountain Iranian convoy 2-18",
				},	
				[19] = {
					name = "Mountain Iranian convoy 2-19",
				},	
				[20] = {
					name = "Mountain Iranian convoy 2-20",
				},	
				[21] = {
					name = "Mountain Iranian convoy 2-21",
				},	
				[22] = {
					name = "Mountain Iranian convoy 2-22",
				},
				[23] = {
					name = "Mountain Iranian convoy 2-23",
				},
				[24] = {
					name = "Mountain Iranian convoy 2-24",
				},
				[25] = {
					name = "Mountain Iranian convoy 2-25",
				},	
				[26] = {
					name = "Mountain Iranian convoy 2-26",
				},	
				[27] = {
					name = "Mountain Iranian convoy 2-27",
				},	
				[28] = {
					name = "Mountain Iranian convoy 2-28",
				},
				[29] = {
					name = "Mountain Iranian convoy 2-29",
				},	
				[30] = {
					name = "Mountain Iranian convoy 2-30",
				},	
			},
		},
		["Mountain Iranian convoy 3"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mountain Iranian convoy 3-1",
				},
				[2] = {
					name = "Mountain Iranian convoy 3-2",
				},
				[3] = {
					name = "Mountain Iranian convoy 3-3",
				},
				[4] = {
					name = "Mountain Iranian convoy 3-4",
				},
				[5] = {
					name = "Mountain Iranian convoy 3-5",
				},
				[6] = {
					name = "Mountain Iranian convoy 3-6",
				},
				[7] = {
					name = "Mountain Iranian convoy 3-7",
				},
				[8] = {
					name = "Mountain Iranian convoy 3-8",
				},	
				[9] = {
					name = "Mountain Iranian convoy 3-9",
				},	
				[10] = {
					name = "Mountain Iranian convoy 3-10",
				},	
				[11] = {
					name = "Mountain Iranian convoy 3-11",
				},	
				[12] = {
					name = "Mountain Iranian convoy 3-12",
				},
				[13] = {
					name = "Mountain Iranian convoy 3-13",
				},
				[14] = {
					name = "Mountain Iranian convoy 3-14",
				},
				[15] = {
					name = "Mountain Iranian convoy 3-15",
				},	
				[16] = {
					name = "Mountain Iranian convoy 3-16",
				},	
				[17] = {
					name = "Mountain Iranian convoy 3-17",
				},	
				[18] = {
					name = "Mountain Iranian convoy 3-18",
				},	
				[19] = {
					name = "Mountain Iranian convoy 3-19",
				},	
				[20] = {
					name = "Mountain Iranian convoy 3-20",
				},	
				[21] = {
					name = "Mountain Iranian convoy 3-21",
				},	
				[22] = {
					name = "Mountain Iranian convoy 3-22",
				},
				[23] = {
					name = "Mountain Iranian convoy 3-23",
				},
				[24] = {
					name = "Mountain Iranian convoy 3-24",
				},
				[25] = {
					name = "Mountain Iranian convoy 3-25",
				},	
				[26] = {
					name = "Mountain Iranian convoy 3-26",
				},	
				[27] = {
					name = "Mountain Iranian convoy 3-27",
				},	
				[28] = {
					name = "Mountain Iranian convoy 3-28",
				},
				[29] = {
					name = "Mountain Iranian convoy 3-29",
				},	
				[30] = {
					name = "Mountain Iranian convoy 3-30",
				},	
			},
		},
		["Mountain Iranian convoy 4"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mountain Iranian convoy 4-1",
				},
				[2] = {
					name = "Mountain Iranian convoy 4-2",
				},
				[3] = {
					name = "Mountain Iranian convoy 4-3",
				},
				[4] = {
					name = "Mountain Iranian convoy 4-4",
				},
				[5] = {
					name = "Mountain Iranian convoy 4-5",
				},
				[6] = {
					name = "Mountain Iranian convoy 4-6",
				},
				[7] = {
					name = "Mountain Iranian convoy 4-7",
				},
				[8] = {
					name = "Mountain Iranian convoy 4-8",
				},	
				[9] = {
					name = "Mountain Iranian convoy 4-9",
				},	
				[10] = {
					name = "Mountain Iranian convoy 4-10",
				},	
				[11] = {
					name = "Mountain Iranian convoy 4-11",
				},	
				[12] = {
					name = "Mountain Iranian convoy 4-12",
				},
				[13] = {
					name = "Mountain Iranian convoy 4-13",
				},
				[14] = {
					name = "Mountain Iranian convoy 4-14",
				},
				[15] = {
					name = "Mountain Iranian convoy 4-15",
				},	
				[16] = {
					name = "Mountain Iranian convoy 4-16",
				},	
				[17] = {
					name = "Mountain Iranian convoy 4-17",
				},	
				[18] = {
					name = "Mountain Iranian convoy 4-18",
				},	
				[19] = {
					name = "Mountain Iranian convoy 4-19",
				},	
				[20] = {
					name = "Mountain Iranian convoy 4-20",
				},	
				[21] = {
					name = "Mountain Iranian convoy 4-21",
				},	
				[22] = {
					name = "Mountain Iranian convoy 4-22",
				},
				[23] = {
					name = "Mountain Iranian convoy 4-23",
				},
				[24] = {
					name = "Mountain Iranian convoy 4-24",
				},
				[25] = {
					name = "Mountain Iranian convoy 4-25",
				},	
				[26] = {
					name = "Mountain Iranian convoy 4-26",
				},	
				[27] = {
					name = "Mountain Iranian convoy 4-27",
				},	
				[28] = {
					name = "Mountain Iranian convoy 4-28",
				},
				[29] = {
					name = "Mountain Iranian convoy 4-29",
				},	
				[30] = {
					name = "Mountain Iranian convoy 4-30",
				},	
			},
		},
		["Mina Saqr debarqued troops"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Mina Saqr Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mina Saqr debarqued troops-1",
				},
				[2] = {
					name = "Mina Saqr debarqued troops-2",
				},
				[3] = {
					name = "Mina Saqr debarqued troops-3",
				},
				[4] = {
					name = "Mina Saqr debarqued troops-4",
				},
				[5] = {
					name = "Mina Saqr debarqued troops-5",
				},
				[6] = {
					name = "Mina Saqr debarqued troops-6",
				},
				[7] = {
					name = "Mina Saqr debarqued troops-7",
				},
				[8] = {
					name = "Mina Saqr debarqued troops-8",
				},	
				[9] = {
					name = "Mina Saqr debarqued troops-9",
				},	
				[10] = {
					name = "Mina Saqr debarqued troops-10",
				},	
				[11] = {
					name = "Mina Saqr debarqued troops-11",
				},	
				[12] = {
					name = "Mina Saqr debarqued troops-12",
				},
				[13] = {
					name = "Mina Saqr debarqued troops-13",
				},
				[14] = {
					name = "Mina Saqr debarqued troops-14",
				},
				[15] = {
					name = "Mina Saqr debarqued troops-15",
				},	
				[16] = {
					name = "Mina Saqr debarqued troops-16",
				},	
				[17] = {
					name = "Mina Saqr debarqued troops-17",
				},	
				[18] = {
					name = "Mina Saqr debarqued troops-18",
				},	
				[19] = {
					name = "Mina Saqr debarqued troops-19",
				},	
				[20] = {
					name = "Mina Saqr debarqued troops-20",
				},	
				[21] = {
					name = "Mina Saqr debarqued troops-21",
				},	
				[22] = {
					name = "Mina Saqr debarqued troops-22",
				},
				[23] = {
					name = "Mina Saqr debarqued troops-23",
				},
				[24] = {
					name = "Mina Saqr debarqued troops-24",
				},
				[25] = {
					name = "Mina Saqr debarqued troops-25",
				},	
				[26] = {
					name = "Mina Saqr debarqued troops-26",
				},	
				[27] = {
					name = "Mina Saqr debarqued troops-27",
				},	
				[28] = {
					name = "Mina Saqr debarqued troops-28",
				},
				[29] = {
					name = "Mina Saqr debarqued troops-29",
				},	
				[30] = {
					name = "Mina Saqr debarqued troops-30",
				},	
				[31] = {
					name = "Mina Saqr debarqued troops-31",
				},	
				[32] = {
					name = "Mina Saqr debarqued troops-32",
				},
				[33] = {
					name = "Mina Saqr debarqued troops-33",
				},
				[34] = {
					name = "Mina Saqr debarqued troops-34",
				},
				[35] = {
					name = "Mina Saqr debarqued troops-35",
				},	
				[36] = {
					name = "Mina Saqr debarqued troops-36",
				},	
				[37] = {
					name = "Mina Saqr debarqued troops-37",
				},	
				[38] = {
					name = "Mina Saqr debarqued troops-38",
				},
				[39] = {
					name = "Mina Saqr debarqued troops-39",
				},	
				[40] = {
					name = "Mina Saqr debarqued troops-40",
				},
			},
		},
		["Mina Saqr convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Mina Saqr Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mina Saqr convoy 1-1",
				},
				[2] = {
					name = "Mina Saqr convoy 1-2",
				},
				[3] = {
					name = "Mina Saqr convoy 1-3",
				},
				[4] = {
					name = "Mina Saqr convoy 1-4",
				},
				[5] = {
					name = "Mina Saqr convoy 1-5",
				},
				[6] = {
					name = "Mina Saqr convoy 1-6",
				},
				[7] = {
					name = "Mina Saqr convoy 1-7",
				},
				[8] = {
					name = "Mina Saqr convoy 1-8",
				},	
				[9] = {
					name = "Mina Saqr convoy 1-9",
				},	
				[10] = {
					name = "Mina Saqr convoy 1-10",
				},	
				[11] = {
					name = "Mina Saqr convoy 1-11",
				},	
				[12] = {
					name = "Mina Saqr convoy 1-12",
				},
				[13] = {
					name = "Mina Saqr convoy 1-13",
				},
				[14] = {
					name = "Mina Saqr convoy 1-14",
				},
				[15] = {
					name = "Mina Saqr convoy 1-15",
				},	
				[16] = {
					name = "Mina Saqr convoy 1-16",
				},	
				[17] = {
					name = "Mina Saqr convoy 1-17",
				},	
				[18] = {
					name = "Mina Saqr convoy 1-18",
				},	
				[19] = {
					name = "Mina Saqr convoy 1-19",
				},	
				[20] = {
					name = "Mina Saqr convoy 1-20",
				},	
				[21] = {
					name = "Mina Saqr convoy 1-21",
				},	
				[22] = {
					name = "Mina Saqr convoy 1-22",
				},
				[23] = {
					name = "Mina Saqr convoy 1-23",
				},
				[24] = {
					name = "Mina Saqr convoy 1-24",
				},
				[25] = {
					name = "Mina Saqr convoy 1-25",
				},	
				[26] = {
					name = "Mina Saqr convoy 1-26",
				},	
				[27] = {
					name = "Mina Saqr convoy 1-27",
				},	
				[28] = {
					name = "Mina Saqr convoy 1-28",
				},
				[29] = {
					name = "Mina Saqr convoy 1-29",
				},	
				[30] = {
					name = "Mina Saqr convoy 1-30",
				},	
				[31] = {
					name = "Mina Saqr convoy 1-31",
				},	
				[32] = {
					name = "Mina Saqr convoy 1-32",
				},
				[33] = {
					name = "Mina Saqr convoy 1-33",
				},
				[34] = {
					name = "Mina Saqr convoy 1-34",
				},
				[35] = {
					name = "Mina Saqr convoy 1-35",
				},	
				[36] = {
					name = "Mina Saqr convoy 1-36",
				},	
				[37] = {
					name = "Mina Saqr convoy 1-37",
				},	
				[38] = {
					name = "Mina Saqr convoy 1-38",
				},
				[39] = {
					name = "Mina Saqr convoy 1-39",
				},	
				[40] = {
					name = "Mina Saqr convoy 1-40",
				},
			},
		},
		["Mina Saqr debarqued SAM systems"] = {
			task = "Strike",
			priority = 5,
			picture = {"Oman_Front-1.png", "Mina Saqr Harbor.png"},
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 120,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Mina Saqr debarqued SAM systems-1",
				},
				[2] = {
					name = "Mina Saqr debarqued SAM systems-2",
				},
				[3] = {
					name = "Mina Saqr debarqued SAM systems-3",
				},
				[4] = {
					name = "Mina Saqr debarqued SAM systems-4",
				},
				[5] = {
					name = "Mina Saqr debarqued SAM systems-5",
				},
				[6] = {
					name = "Mina Saqr debarqued SAM systems-6",
				},
				[7] = {
					name = "Mina Saqr debarqued SAM systems-7",
				},
				[8] = {
					name = "Mina Saqr debarqued SAM systems-8",
				},
				[9] = {
					name = "Mina Saqr debarqued SAM systems-9",
				},
				[11] = {
					name = "Mina Saqr debarqued SAM systems-11",
				},
			},
		},
		-- ["Sirri Island West Coast Battery"] = {
			-- task = "Strike",
			-- priority = 4,
			-- picture = {"SirriIsland1.png"},
			-- attributes = {"soft"},
			-- firepower = {
				-- min = 20,
				-- max = 40,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Sirri Island West Coast Bat Launcher 1",
				-- },
				-- [2] = {
					-- name = "Sirri Island West Coast Bat Launcher 2",
				-- },
				-- [3] = {
					-- name = "Sirri Island West Coast Bat Launcher 3",
				-- },
				-- [4] = {
					-- name = "Sirri Island West Coast Bat Launcher 4",
				-- },
				-- [5] = {
					-- name = "Sirri Island West Coast Bat CP",
				-- },
				-- [6] = {
					-- name = "Sirri Island West Coast Bat CP 2",
				-- },
				-- [7] = {
					-- name = "Sirri Island West Coast Bat Support 1",
				-- },
				-- [8] = {
					-- name = "Sirri Island West Coast Bat Support 2",
				-- },				
			-- },
		-- },
		-- ["Sirri Island East Coast Battery"] = {
			-- task = "Strike",
			-- priority = 4,
			-- picture = {"SirriIsland1.png"},
			-- attributes = {"soft"},
			-- firepower = {
				-- min = 20,
				-- max = 40,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Sirri Island East Coast Bat Launcher 1",
				-- },
				-- [2] = {
					-- name = "Sirri Island East Coast Bat Launcher 2",
				-- },
				-- [3] = {
					-- name = "Sirri Island East Coast Bat Launcher 3",
				-- },
				-- [4] = {
					-- name = "Sirri Island East Coast Bat Launcher 4",
				-- },
				-- [5] = {
					-- name = "Sirri Island East Coast Bat CP",
				-- },
				-- [6] = {
					-- name = "Sirri Island East Coast Bat CP 2",
				-- },
				-- [7] = {
					-- name = "Sirri Island East Coast Bat Support 1",
				-- },
				-- [8] = {
					-- name = "Sirri Island East Coast Bat Support 2",
				-- },				
			-- },
		-- },		
		-- ["Sirri Island"] = {
			-- task = "Strike",
			-- priority = 4,
			-- picture = {"SirriIsland1.png", "SirriIsland2.png"},
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- elements = {
				-- [1] = {
					-- name = "Sirri Control Tower",
					-- x = -27722.158203125,
					-- y = -170129.96875,
				-- },
				-- [2] = {
					-- name = "Sirri Hangar 1",
					-- x = -27957.611328125,
					-- y = -169850.734375,
				-- },
				-- [3] = {
					-- name = "Sirri Hangar 2",
					-- x = -27758.494140625,
					-- y = -170085.546875,
				-- },
				-- [4] = {
					-- name = "Sirri Hangar 3",
					-- x = -27758.494140625,
					-- y = -170085.546875,
				-- },
				-- [5] = {
					-- name = "Sirri HQ",
					-- x = -27811.7265625,
					-- y = -170019.953125,
				-- },
			-- },
		-- },
		-- ["Sirri Island Airport Strategics"] = {
			-- task = "Strike",
			-- priority = 5,
			-- picture = {"SirriIsland1.png", "SirriIsland2.png"},
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Sirri Fuel Tank 1",
				-- },
				-- [2] = {
					-- name = "Sirri Fuel Tank 2",
				-- },
				-- [3] = {
					-- name = "Sirri Ammo Shelter 1",
				-- },
				-- [4] = {
					-- name = "Sirri Ammo Shelter 2",
				-- },
				-- [5] = {
					-- name = "Sirri Comm Center",
				-- },				
			-- },
		-- },		
		-- ["Tunb Kochak shelters N255457 E0543235"] = {
			-- task = "Strike",
			-- priority = 5,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- elements = {
				-- [1] = {
					-- name = "Shelter 1",
					-- x = 8665.1246337891,
					-- y = -109607.54345703,
				-- },
				-- [2] = {
					-- name = "Shelter 2",
					-- x = 8658.9864807129,
					-- y = -109490.7109375,
				-- },
				-- [3] = {
					-- name = "Shelter 3",
					-- x = 8673.2406616211,
					-- y = -109400.11962891,
				-- },
				-- [4] = {
					-- name = "Shelter 4",
					-- x = 8703.4998474121,
					-- y = -109334.0144043,
				-- },
				-- [5] = {
					-- name = "Shelter 5",
					-- x = 8708.9671630859,
					-- y = -109286.07104492,
				-- },
				-- [6] = {
					-- name = "Shelter 6",
					-- x = 8832.8140869141,
					-- y = -109025.10839844,
				-- },
				-- [7] = {
					-- name = "Shelter 7",
					-- x = 8826.6236572266,
					-- y = -109056.06518555,
				-- },				
			-- },
		-- },		
		-- ["Bandar Abbas Intl"] = {
			-- task = "Strike",
			-- priority = 4,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- elements = {
				-- [1] = {
					-- name = "Bandar Abbas Main Control Tower",
					-- x = 115014.890625,
					-- y = 13275.213867188,
				-- },				
				-- [2] = {
					-- name = "Bandar Abbas secondary Control Tower",
					-- x = 117172.28125,
					-- y = 14315.420898438,
				-- },
				-- [3] = {
					-- name = "Bandar Abbas Hangar 1",
					-- x = 118565.328125,
					-- y = 15026.09375,
				-- },
				-- [4] = {
					-- name = "Bandar Abbas Hangar 2",
					-- x = 118481.1953125,
					-- y = 15051.412109375,
				-- },
				-- [5] = {
					-- name = "Bandar Abbas Hangar 3",
					-- x = 118682.890625,
					-- y = 15124.112304688,
				-- },
				-- [6] = {
					-- name = "Bandar Abbas Hangar 4",
					-- x = 118320,
					-- y = 15020.34375,
				-- },
				-- [7] = {
					-- name = "Bandar Abbas Hangar 5",
					-- x = 118692.984375,
					-- y = 14906.234375,
				-- },
				-- [8] = {
					-- name = "Bandar Abbas Hangar 6",
					-- x = 118785.7734375,
					-- y = 14765.086914063,
				-- },
				-- [9] = {
					-- name = "Bandar Abbas Hangar 7",
					-- x = 118568.640625,
					-- y = 14508.61328125,
				-- },
				-- [10] = {
					-- name = "Bandar Abbas Hangar 8",
					-- x = 118432.8125,
					-- y = 14332.237304688,
				-- },
				-- [11] = {
					-- name = "Bandar Abbas Hangar 9",
					-- x = 118333.640625,
					-- y = 14586.0625,
				-- },
				-- [12] = {
					-- name = "Bandar Abbas Hangar 10",
					-- x = 117279.0859375,
					-- y = 14470.143554688,
				-- },
				-- [13] = {
					-- name = "Bandar Abbas Hangar 11",
					-- x = 114411.46875,
					-- y = 12946.629882813,
				-- },
			-- },
		-- },
		-- ["Bandar Abbas Intl Strategics"] = {
			-- task = "Strike",
			-- priority = 5,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Bandar Abbas Fuel Tank 1",
				-- },
				-- [2] = {
					-- name = "Bandar Abbas Fuel Tank 2",
				-- },
				-- [3] = {
					-- name = "Bandar Abbas Fuel Tank 3",
				-- },
				-- [4] = {
					-- name = "Bandar Abbas Fuel Tank 4",
				-- },
				-- [5] = {
					-- name = "Bandar Abbas Fuel Tank 5",
				-- },
				-- [6] = {
					-- name = "Bandar Abbas Fuel Tank 6",
				-- },
				-- [7] = {
					-- name = "Bandar Abbas Fuel Tank 7",
				-- },
				-- [8] = {
					-- name = "Bandar Abbas Fuel Tank 8",
				-- },
				-- [9] = {
					-- name = "Bandar Abbas Fuel Tank 9",
				-- },
				-- [10] = {
					-- name = "Bandar Abbas Fuel Tank 10",
				-- },
				-- [11] = {
					-- name = "Bandar Abbas Fuel Tank 11",
				-- },
				-- [12] = {
					-- name = "Bandar Abbas Fuel Tank 12",
				-- },
				-- [13] = {
					-- name = "Bandar Abbas Fuel Tank 13",
				-- },
				-- [14] = {
					-- name = "Bandar Abbas Fuel Tank 14",
				-- },
				-- [15] = {
					-- name = "Bandar Abbas Fuel Tank 15",
				-- },				
				-- [16] = {
					-- name = "Bandar Abbas Ammo Storage 1",
				-- },
				-- [17] = {
					-- name = "Bandar Abbas Ammo Storage 2",
				-- },
				-- [18] = {
					-- name = "Bandar Abbas Ammo Storage 3",
				-- },
				-- [19] = {
					-- name = "Bandar Abbas Ammo Storage 4",
				-- },
				-- [20] = {
					-- name = "Bandar Abbas Ammo Storage 5",
				-- },
				-- [21] = {
					-- name = "Bandar Abbas Ammo Storage 6",
				-- },
				-- [22] = {
					-- name = "Bandar Abbas Ammo Storage 7",
				-- },
				-- [23] = {
					-- name = "Bandar Abbas Ammo Storage 8",
				-- },
				-- [24] = {
					-- name = "Bandar Abbas Ammo Storage 9",
				-- },
				-- [25] = {
					-- name = "Bandar Abbas Ammo Storage 10",
				-- },
				-- [26] = {
					-- name = "Bandar Abbas Ammo Storage 11",
				-- },
				-- [27] = {
					-- name = "Bandar Abbas Ammo Storage 12",
				-- },				
				-- [28] = {
					-- name = "Bandar Abbas Comm Center",
				-- },				
			-- },
		-- },		
		-- ["Havadarya"] = {
			-- task = "Strike",
			-- priority = 4,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- elements = {
				-- [1] = {
					-- name = "Havadarya Control Tower",
					-- x = 109320.03125,
					-- y = -7007.0859375,
				-- },				
				-- [2] = {
					-- name = "Havadarya Control Tower building",
					-- x = 109298.953125,
					-- y = -7009.4345703125,
				-- },
				-- [3] = {
					-- name = "Havadarya Hangar 1",
					-- x = 109334.765625,
					-- y = -7315.4482421875,
				-- },
				-- [4] = {
					-- name = "Havadarya Hangar 2",
					-- x = 109325.5078125,
					-- y = -7365.1206054688,
				-- },
				-- [5] = {
					-- name = "Havadarya Hangar 3",
					-- x = 109434.8515625,
					-- y = -6854.7231445313,
				-- },
				-- [6] = {
					-- name = "Havadarya Hangar 4",
					-- x = 109098.921875,
					-- y = -5768.0849609375,
				-- },
				-- [7] = {
					-- name = "Havadarya Hangar 5",
					-- x = 109119.1953125,
					-- y = -5659.9541015625,
				-- },
			-- },
		-- },
		-- ["Havadarya Airport Strategics"] = {
			-- task = "Strike",
			-- priority = 5,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Havadarya Fuel Tank 1",
				-- },
				-- [2] = {
					-- name = "Havadarya Fuel Tank 2",
				-- },
				-- [3] = {
					-- name = "Havadarya Fuel Tank 3",
				-- },
				-- [4] = {
					-- name = "Havadarya Fuel Tank 4",
				-- },
				-- [5] = {
					-- name = "Havadarya Fuel Tank 5",
				-- },
				-- [6] = {
					-- name = "Havadarya Fuel Tank 6",
				-- },
				-- [7] = {
					-- name = "Havadarya Fuel Tank 7",
				-- },
				-- [8] = {
					-- name = "Havadarya Fuel Tank 8",
				-- },				
				-- [9] = {
					-- name = "Havadarya Ammo Storage 1",
				-- },
				-- [10] = {
					-- name = "Havadarya Ammo Storage 2",
				-- },
				-- [11] = {
					-- name = "Havadarya Ammo Storage 3",
				-- },
				-- [12] = {
					-- name = "Havadarya Ammo Storage 4",
				-- },
				-- [13] = {
					-- name = "Havadarya Ammo Storage 5",
				-- },
				-- [14] = {
					-- name = "Havadarya Ammo Storage 6",
				-- },				
				-- [15] = {
					-- name = "Havadarya Comm Center",
				-- },				
			-- },
		-- },		
		-- ["Lar Airbase"] = {
			-- task = "Strike",
			-- priority = 3,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- elements = {
				-- [1] = {
					-- name = "Lar Airbase Control Tower",
					-- x = 168444.15625,
					-- y = -182475.6875,
				-- },				
				-- [2] = {
					-- name = "Lar Airbase Main Hangar",
					-- x = 168425.046875,
					-- y = -182382.125,
				-- },
				-- [3] = {
					-- name = "Lar Airbase Hangar 2",
					-- x = 168424.109375,
					-- y = -182284.3125,
				-- },				
				-- [4] = {
					-- name = "Lar Airbase Hangar 3",
					-- x = 168421.59375,
					-- y = -182654.46875,
				-- },
				-- [5] = {
					-- name = "Lar Airbase Command HQ",
					-- x = 168521.328125,
					-- y = -182896.328125,
				-- },
				-- [6] = {
					-- name = "Lar Airbase Com Center",
					-- x = 168384.140625,
					-- y = -182573.46875,
				-- },
				-- [7] = {
					-- name = "Lar Airbase Crew building",
					-- x = 168423.86621094,
					-- y = -181774.3927002,
				-- },				
			-- },
		-- },
		["1st Iranian Transport fleet"] = {
			task = "Anti-ship Strike",
			priority = 6,
			attributes = {"ship"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "1st Iranian Transport fleet",
		},
		["3rd Iranian Transport fleet"] = {
			task = "Anti-ship Strike",
			priority = 6,
			attributes = {"ship"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "3rd Iranian Transport fleet",
		},
		["4th Iranian Transport fleet"] = {
			task = "Anti-ship Strike",
			priority = 6,
			attributes = {"ship"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "4th Iranian Transport fleet",
		},
		["5th Iranian Transport fleet"] = {
			task = "Anti-ship Strike",
			priority = 6,
			picture = {"Oman_Front-1.png", "Mina Saqr Harbor.png"},
			attributes = {"ship"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "5th Iranian Transport fleet",
		},
		["Al Mina Ships"] = {
			task = "Anti-ship Strike",
			priority = 6,
			picture = {"Oman_Front-1.png", "Al Mina Ships.png"},
			attributes = {"ship"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "Al Mina Ships",
		},
		["Iranian suicide speedboat fleet-1"] = {
			task = "Anti-ship Strike",
			priority = 10,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "ship",
			name = "Iranian suicide speedboat fleet-1",
		},
		["Khasab Airbase"] = {
			task = "Strike",
			priority = 8,
			picture = {"Oman_Front-1.png", "Khasab Airbase.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 8,
			},
			elements = {
				[1] = {
					name = "Khasab Airbase Intel Center",
					x = -128.62350463867,
					y = -513.59222412109,
				},				
				[2] = {
					name = "Khasab Airbase Main Hangar",
					x = -628.54180908203,
					y = -595.2451171875,
				},
				[3] = {
					name = "Khasab Airbase Hangar 2",
					x = -756.59362792969,
					y = -612.51226806641,
				},				
				[4] = {
					name = "Khasab Airbase Hangar 3",
					x = -796.85180664063,
					y = -629.59075927734,
				},
				[5] = {
					name = "Khasab Airbase Hangar 4",
					x = -531.39874267578,
					y = -574.55676269531,
				},
				[6] = {
					name = "Khasab Airbase Command HQ",
					x = -388.31140136719,
					y = -617.20568847656,
				},
				[7] = {
					name = "Khasab Airbase Com Center 1",
					x = -587.76000976563,
					y = -678.24359130859,
				},
				[8] = {
					name = "Khasab Airbase Com Center 2",
					x = -619.853515625,
					y = -686.11639404297,
				},
				[9] = {
					name = "Khasab Airbase Tech Hangar",
					x = -694.47631835938,
					y = -588.74243164063,
				},
				[10] = {
					name = "Khasab Airbase Light Hangar 1",
					x = -492.86471557617,
					y = -561.50054931641,
				},				
			},
		},
		["Khasab Airbase Strategics"] = {
			task = "Strike",
			priority = 8,
			picture = {"Oman_Front-1.png", "Khasab Airbase.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Khasab Airbase Fuel Tank 1",
				},
				[2] = {
					name = "Khasab Airbase Fuel Tank 2",
				},
				[3] = {
					name = "Khasab Airbase Fuel Tank 3",
				},
				[4] = {
					name = "Khasab Airbase Fuel Tank 4",
				},
				[5] = {
					name = "Khasab Airbase Fuel Tank 5",
				},
				[6] = {
					name = "Khasab Airbase Fuel Tank 6",
				},
				[7] = {
					name = "Khasab Airbase Ammo Storage 1",
				},
				[8] = {
					name = "Khasab Airbase Ammo Storage 2",
				},
				[9] = {
					name = "Khasab Airbase Ammo Storage 3",
				},
				[10] = {
					name = "Khasab Airbase Ammo Storage 4",
				},
				[11] = {
					name = "Khasab Airbase Main Comm Center",
				},				
			},
		},
		["Bandar e Jask airfield"] = {
			task = "Strike",
			priority = 10,
			picture = {"Bandar e Jask airfield.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 8,
			},
			elements = {
				[1] = {
					name = "Bandar e Jask airfield Hangar 1",
					x = -57542.36328125,
					y = 154717.6875,
				},
				[2] = {
					name = "Bandar e Jask airfield Hangar 2",
					x = -57542.36328125,
					y = 154717.6875,
				},
				[3] = {
					name = "Bandar e Jask airfield Hangar 3",
					x = -57498.95703125,
					y = 154836.25,
				},
				[4] = {
					name = "Bandar e Jask airfield Hangar 4",
					x = -57528.09765625,
					y = 154872.734375,
				},
				[5] = {
					name = "Bandar e Jask airfield Hangar 5",
					x = -57557.83203125,
					y = 154846.4375,
				},
			},
		},
		["Bandar e Jask airfield Strategics"] = {
			task = "Strike",
			priority = 10,
			picture = {"Bandar e Jask airfield.png"},
			attributes = {"Structure"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Bandar e Jask airfield Fuel Tank-1",
				},
				[2] = {
					name = "Bandar e Jask airfield Fuel Tank-2",
				},
				[3] = {
					name = "Bandar e Jask airfield Ammo Storage-1",
				},
				[4] = {
					name = "Bandar e Jask airfield Ammo Storage-2",
				},
				[5] = {
					name = "Bandar e Jask airfield Comm Center",
				},				
			},
		},
		-- ["Molnya Patrol 3"] = {
			-- task = "Anti-ship Strike",
			-- priority = 6,
			-- attributes = {"ship"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "ship",
			-- name = "Molnya Patrol 3",
		-- },
		-- ["Cargo convoy 1"] = {
			-- task = "Anti-ship Strike",
			-- priority = 7,
			-- attributes = {"ship"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "ship",
			-- name = "Cargo convoy 1",
		-- },
		-- ["Cargo convoy 2"] = {
			-- task = "Anti-ship Strike",
			-- priority = 7,
			-- attributes = {"ship"},
			-- firepower = {
				-- min = 20,
				-- max = 60,
			-- },
			-- class = "ship",
			-- name = "Cargo convoy 2",
		-- },		
		-- ["FFG Neutrashimy"] = {
			-- task = "Anti-ship Strike",
			-- priority = 6,
			-- attributes = {"ship"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "ship",
			-- name = "FFG Neutrashimy",
		-- },		
		-- ["Lar Airbase Strategics"] = {
			-- task = "Strike",
			-- priority = 5,
			-- attributes = {"Structure"},
			-- firepower = {
				-- min = 20,
				-- max = 120,
			-- },
			-- class = "static",
			-- elements = {
				-- [1] = {
					-- name = "Lar Airbase Fuel Tank 1",
				-- },
				-- [2] = {
					-- name = "Lar Airbase Fuel Tank 2",
				-- },
				-- [3] = {
					-- name = "Lar Airbase Fuel Tank 3",
				-- },
				-- [4] = {
					-- name = "Lar Airbase Ammo Storage 1",
				-- },
				-- [5] = {
					-- name = "Lar Airbase Ammo Storage 2",
				-- },
				-- [6] = {
					-- name = "Lar Airbase Comm Center",
				-- },				
			-- },
		-- },		
--[[	["Mineralnye-Vody Airbase N441364 E0430493"] = {
			task = "Strike",
			priority = 2,
			attributes = {"Structure"},
			firepower = {
				min = 40,
				max = 120,
			},
			elements = {
				[1] = {
					name = "Fuel Support House",
					x = -52146.515625,
					y = 705679.875,
				},				
				[2] = {
					name = "Crew Home 1",
					x = -52287.57421875,
					y = 705966.375,
				},
				[3] = {
					name = "Crew Home 2",
					x = -52165.984375,
					y = 706024.8125,
				},
				[4] = {
					name = "Crew Home 3",
					x = -52380.97265625,
					y = 706210.75,
				},
				[5] = {
					name = "Mineralnye Rescue station",
					x = -52477.5859375,
					y = 707329.75,
				},
				[6] = {
					name = "Officers Club",
					x = -52277.8671875,
					y = 706074.125,
				},
				[7] = {
					name = "Crew club",
					x = -52337.421875,
					y = 706088.5,
				},				
				[8] = {
					name = "Mineralnye Control Tower",
					x = -52318.4140625,
					y = 706580.8125,
				},
				[9] = {
					name = "Mineralnye Command House",
					x = -51810.00390625,
					y = 705714.1875,
				},				
				[10] = {
					name = "Mineralnye Power Supply 1",
					x = -52009.95703125,
					y = 705334.3125,
				},
				[11] = {
					name = "Mineralnye Power Supply 2",
					x = -51528.6640625,
					y = 708070.625,
				},				
				[12] = {
					name = "Main Hangar 1",
					x = -51905.54296875,
					y = 705799.25,
				},
				[13] = {
					name = "Main Hangar 2",
					x = -51691.8046875,
					y = 705462,
				},
				[14] = {
					name = "Main Hangar 3",
					x = -51936.640625,
					y = 706042.6875,
				},
				[15] = {
					name = "Deported Repair Hangar 1",
					x = -51419.0859375,
					y = 707823.8125,
				},
				[16] = {
					name = "Deported Repair Hangar 2",
					x = -51376.71484375,
					y = 707733.75,
				},
				[17] = {
					name = "Deported Repair Hangar 3",
					x = -51190.4765625,
					y = 708177.25,
				},				
			},
		},
		["Prohladniy Depot - N434493 E0440343"] = {
			task = "Strike",
			priority = 2,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Prohladniy Depot 1",
				},
				[2] = {
					name = "Prohladniy Depot 2",
				},
				[3] = {
					name = "Prohladniy Depot 2",
				},
				[4] = {
					name = "Prohladniy Depot 4",
				},
				[5] = {
					name = "Prohladniy Depot 5",
				},
				[6] = {
					name = "Prohladniy Depot 6",
				},
				[7] = {
					name = "Prohladniy Depot Railway station",
				},
				[8] = {
					name = "Prohladniy Depot container 1",
				},
				[9] = {
					name = "Prohladniy Depot container 2",
				},
				[10] = {
					name = "Prohladniy Depot container 3",
				},
				[11] = {
					name = "Prohladniy Depot container 4",
				},
				[12] = {
					name = "Prohladniy Depot container 5",
				},
				[13] = {
					name = "Prohladniy Depot container 6",
				},
				[14] = {
					name = "Prohladniy Depot container 7",
				},
				[15] = {
					name = "Prohladniy Depot container 8",
				},
				[16] = {
					name = "Prohladniy Depot container 9",
				},
				[17] = {
					name = "Prohladniy Depot container 10",
				},
				[18] = {
					name = "Prohladniy Depot container 11",
				},
				[19] = {
					name = "Prohladniy Depot container 12",
				},
				[20] = {
					name = "Prohladniy Depot container 13",
				},
				[21] = {
					name = "Prohladniy Depot container 14",
				},
				[22] = {
					name = "Prohladniy Depot container 15",
				},
				[23] = {
					name = "Prohladniy Depot container 16",
				},
				[24] = {
					name = "Prohladniy Depot container 17",
				},
				[25] = {
					name = "Prohladniy Depot container 18",
				},
				[26] = {
					name = "Prohladniy Depot container 19",
				},
				[27] = {
					name = "Prohladniy Depot container 20",
				},
				[28] = {
					name = "Prohladniy Depot Fuel tank 1",
				},
				[29] = {
					name = "Prohladniy Depot Fuel tank 2",
				},
				[30] = {
					name = "Prohladniy Depot Fuel tank 3",
				},
				[31] = {
					name = "Prohladniy Depot Fuel tank 4",
				},
				[32] = {
					name = "Prohladniy Depot Fuel tank 5",
				},
				[33] = {
					name = "Prohladniy Depot Fuel tank 6",
				},
				[34] = {
					name = "Prohladniy Depot Fuel tank 7",
				},
				[35] = {
					name = "Prohladniy Depot Fuel tank 8",
				},
				[36] = {
					name = "Prohladniy Depot Fuel tank 9",
				},
				[37] = {
					name = "Prohladniy Depot Fuel tank 10",
				},				
				
			},
		},
		["FARP Vladikavkaz - N430415 E0443883"] = {
			task = "Strike",
			priority = 2,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "static",
			elements = {
				[1] = {
					name = "FARP 1 - Hind 1",
				},
				[2] = {
					name = "FARP 1 - Hind 2",
				},
				[3] = {
					name = "FARP 1 - Hind 3",
				},
				[4] = {
					name = "FARP 1 - Hip 1",
				},
				[5] = {
					name = "FARP 1 - Hip 2",
				},
				[6] = {
					name = "FARP 1 - Hip 3",
				},
				[7] = {
					name = "FARP 1 - Hip 4",
				},
				[8] = {
					name = "FARP 1 - Hip 5",
				},
				[9] = {
					name = "FARP 1 - Ammo depot 1",
				},
				[10] = {
					name = "FARP 1 - Ammo depot 2",
				},
				[11] = {
					name = "FARP 1 - Ammo depot 3",
				},
				[12] = {
					name = "FARP 1 - Fuel depot 1",
				},
				[13] = {
					name = "FARP 1 - Fuel depot 2",
				},
				[14] = {
					name = "FARP 1 - Fuel depot 3",
				},
				[15] = {
					name = "FARP 1 - Crew house",
				},
				[16] = {
					name = "FARP 1 - Crew Tent 1",
				},
				[17] = {
					name = "FARP 1 - Crew Tent 1",
				},
				[18] = {
					name = "FARP 1 - Crew Tent 1",
				},				
			},
		}, ]]--
		["Abu Musa Ships Facilities - N255237 E0550065"] = {
			task = "Strike",
			priority = 5,
			picture = {"AbuMusa1.png", "AbuMusaShipsFacilities.png"},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "static",
			elements = {
				[1] = {
					name = "Tanker 1",
				},
				[2] = {
					name = "Cargo ship 1",
				},
				[3] = {
					name = "Cargo ship 2",
				},
				[4] = {
					name = "SS-N-2-1",
				},
				[5] = {
					name = "SS-N-2-2",
				},
				[6] = {
					name = "SS-N-2-3",
				},
				[7] = {
					name = "SS-N-2-4",
				},
				[8] = {
					name = "CP truck 1",
				},
				[9] = {
					name = "Buk CC 1",
				},
				[10] = {
					name = "Buk LN 1",
				},
				[11] = {
					name = "Buk LN 2",
				},
				[12] = {
					name = "Buk LN 3",
				},
				[13] = {
					name = "Buk SR 1",
				},
				[14] = {
					name = "Truck 1",
				},
				[15] = {
					name = "Truck 2",
				},
				[16] = {
					name = "Truck 3",
				},
				[17] = {
					name = "Truck 4",
				},
				[18] = {
					name = "Truck 5",
				},
				[19] = {
					name = "Truck 6",
				},
				[20] = {
					name = "Truck 7",
				},
				[21] = {
					name = "Truck 8",
				},
				[22] = {
					name = "Truck 9",
				},
				[23] = {
					name = "Truck 10",
				},
				[24] = {
					name = "Fuel truck 1",
				},
				[25] = {
					name = "Fuel truck 2",
				},
				[26] = {
					name = "Fuel truck 3",
				},
				[27] = {
					name = "Fuel truck 4",
				},
				[28] = {
					name = "Fuel truck 5",
				},
				[29] = {
					name = "Fuel truck 6",
				},
				[30] = {
					name = "SS-N-2-1 Truck",
				},
				[31] = {
					name = "SS-N-2-2 Truck",
				},
				[32] = {
					name = "SS-N-2-3 Truck",
				},
				[33] = {
					name = "SS-N-2-4 Truck",
				},				
			},
		},	
--[[		["407 8th Army ELINT Station N424317 E0443115"] = {
			task = "Strike",
			priority = 6,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "static",
			elements = {
				[1] = {
					name = "ELINT Antenna Truck 1",
				},
				[2] = {
					name = "ELINT Antenna Truck 2",
				},
				[3] = {
					name = "ELINT Crew Van",
				},
				[4] = {
					name = "ELINT Equipment Van",
				},
				[5] = {
					name = "ELINT Generator Truck",
				},
			},
		},
		["501 5th Artillery Division/1.Btry N430981 E0443913"] = {
			task = "Strike",
			priority = 1,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "501 5th Artillery Division/1.Btry",
		},
		["502 5th Artillery Division/2.Btry N430223 E0443699"] = {
			task = "Strike",
			priority = 1,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "502 5th Artillery Division/2.Btry",
		},
		["503 5th Artillery Division/3.Btry N431127 E0442827"] = {
			task = "Strike",
			priority = 1,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "503 5th Artillery Division/3.Btry",
		},
		["504 5th Artillery Division/4.Btry N431320 E0444463"] = {
			task = "Strike",
			priority = 1,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "504 5th Artillery Division/4.Btry",
		},
		["Bridge Alagir N430138 E0441386"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge Alagir N430138 E0441386",
					x = -173099.3125,
					y = 815939.25,
				},
			},
		},
		["Bridge Vladikavkaz N430276 E0443974"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge Vladikavkaz N430276 E0443974",
					x = -165689.171875,
					y = 850781.9375,
				},
			},
		},
		["Bridge Vladikavkaz North N430355 E0443962"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge Vladikavkaz North N430355 E0443962",
					x = -164245.28125,
					y = 850403,
				},
			},
		},
		["Bridge Vladikavkaz South N430127 E0444088"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge Vladikavkaz South N430127 E0444088",
					x = -168229.1875,
					y = 852723.0625,
				},
			},
		},		
		["Bridge SW Kardzhin N431605 E0441618"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge north bank SW Kardzhin",
					x = -145416.77636719,
					y = 815400.75,
				},
				[2] = {
					name = "Bridge south bank SW Kardzhin",
					x = -145554.66015625,
					y = 815425,
				},
			},
		},
		["Bridge South Elhotovo N431922 E0441282"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge north bank South Elhotovo",
					x = -140288.05761719,
					y = 809993.75585938,
				},
				[2] = {
					name = "Bridge south bank South Elhotovo",
					x = -140195.16113281,
					y = 810098.49414063,
				},
			},
		},
		["Bridge South Beslan N431135 E0443048"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Bridge north bank South Beslan",
					x = -151580.80078125,
					y = 835949.02734375,
				},
				[2] = {
					name = "Bridge south bank South Beslan",
					x = -151456.44921875,
					y = 836013.34375,
				},
			},
		},		
		["Rail Bridge Digora N451029 E0441093"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Rail Bridge Digora N451029 E0441093",
					x = -157146.546875,
					y = 809730.375,
				},
			},
		},
		["Rail Bridge SW Kardzhin N431617 E0441558"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Rail Bridge right bank SW Kardzhin",
					x = -145428.47167969,
					y = 814533.16210938,
				},
				[2] = {
					name = "Rail Bridge left bank SW Kardzhin",
					x = -145376.90332031,
					y = 814618.83789063,
				},
			},
		},
		["Rail Bridge SE Mayskiy N433535 E0440532"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Rail Bridge right bank SE Mayskiy",
					x = -111785.2421875,
					y = 795963.7109375,
				},
				[2] = {
					name = "Rail Bridge Center SE Mayskiy",
					x = -111727.7109375,
					y = 795881.91699219,
				},
				[3] = {
					name = "Rail Bridge left bank SE Mayskiy",
					x = -111670.1796875,
					y = 795800.12207031,
				},
			},
		},		
		["Rail Bridge Kardzhin N431623 E0441733"] = {
			task = "Strike",
			priority = 3,
			attributes = {"Bridge"},
			firepower = {
				min = 20,
				max = 40,
			},
			elements = {
				[1] = {
					name = "Rail Bridge Kardzhin N431623 E0441733",
					x = -144986.53125,
					y = 816502.625,
				},
			},
		},]]-- 		
	},
	["red"] = {
		["Lar Airbase Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {"IRIAF"},
			firepower = {
				min = 1,
				max = 4,
			},
			base = "Lar Airbase",
			radius = 200000,
			inactive = false,
		},
		["Shiraz Intl Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 4,
			},
			base = "Shiraz Intl",
			radius = 200000,
			inactive = false,
		},		
		["Tanker Track North"] = {
			task = "Refueling",
			priority = 1,
			attributes = {},
			firepower = {
				min = 1,
				max = 1,
			},
			refpoint = "Tanker Track North",
			radius = 20000,
			text = "North West of Lar Airbase",
		},		
		["Bandar e Jask airfield Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 2,
			},
			base = "Bandar e Jask airfield",
			radius = 100000,
			inactive = false,
		},
		["Bandar e Jask airfield Alert 50"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 2,
			},
			base = "Bandar e Jask airfield",
			radius = 50000,
			inactive = false,
		},
		["Qeshm Island Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 4,
			},
			base = "Qeshm Island",
			radius = 100000,
			inactive = false,
		},		
		["Khasab Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 4,
			},
			base = "Khasab",
			radius = 50000,
			inactive = false,
		},
		["Bandar Abbas Intl 100 Km Alert"] = {
			task = "Intercept",
			priority = 10,
			attributes = {},
			firepower = {
				min = 1,
				max = 4,
			},
			base = "Bandar Abbas Intl",
			radius = 100000,
			inactive = false,
		},
		["CAP Islands"] = {
			task = "CAP",
			priority = 5,
			attributes = {},
			firepower = {
				min = 2,
				max = 4,
			},
			refpoint = "CAP Islands",
			radius = 50000,
			text = "Center Islands",
			inactive = false,
		},		
		["CAP Khasab"] = {
			task = "CAP",
			priority = 5,
			attributes = {},
			firepower = {
				min = 2,
				max = 4,
			},
			refpoint = "CAP Khasab",
			radius = 50000,
			text = "Khasab",
			inactive = false,
		},
		["CAP East"] = {
			task = "CAP",
			priority = 5,
			attributes = {""},
			firepower = {
				min = 2,
				max = 4,
			},
			refpoint = "CAP East",
			radius = 50000,
			text = "South East of Khasab",
			inactive = false,
		},
		["CAP Bandar Abbas"] = {
			task = "CAP",
			priority = 5,
			attributes = {"IRIAF"},
			firepower = {
				min = 2,
				max = 4,
			},
			refpoint = "CAP Bandar Abbas",
			radius = 50000,
			text = "North of Bandar Abbas",
			inactive = false,
		},		
		["Patriot Battery 1"] = {
			task = "Strike",
			priority = 2,
			attributes = {"SAM"},
			firepower = {
				min = 2,
				max = 4,
			},
			class = "vehicle",
			name = "Patriot Battery 1",
		},
		["FR Hawk Site 1"] = {
			task = "Strike",
			priority = 2,
			attributes = {"SAM"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "FR Hawk Site 1",
		},
		["US Army ELINT Station"] = {
			task = "Strike",
			priority = 6,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "static",
			elements = {
				[1] = {
					name = "US ELINT Antenna Truck 1",
				},
				[2] = {
					name = "US ELINT Antenna Truck 2",
				},
				[3] = {
					name = "US ELINT Crew Van",
				},
				[4] = {
					name = "US ELINT Equipment Van",
				},
				[5] = {
					name = "US ELINT Generator Truck",
				},
			},
		},
		["US Army ELINT Station 2"] = {
			task = "Strike",
			priority = 6,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "static",
			elements = {
				[1] = {
					name = "US ELINT 2 Antenna Truck 1",
				},
				[2] = {
					name = "US ELINT 2 Antenna Truck 2",
				},
				[3] = {
					name = "US ELINT 2 Crew Van",
				},
				[4] = {
					name = "US ELINT 2 Equipment Van",
				},
				[5] = {
					name = "US ELINT 2 Generator Truck",
				},
			},
		},
		["EAU West Front 1st Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front 1st Bat-1",
				},
				[2] = {
					name = "EAU West Front 1st Bat-2",
				},
				[3] = {
					name = "EAU West Front 1st Bat-3",
				},
				[4] = {
					name = "EAU West Front 1st Bat-4",
				},
				[5] = {
					name = "EAU West Front 1st Bat-5",
				},
				[6] = {
					name = "EAU West Front 1st Bat-6",
				},
				[7] = {
					name = "EAU West Front 1st Bat-7",
				},
				[8] = {
					name = "EAU West Front 1st Bat-8",
				},	
				[9] = {
					name = "EAU West Front 1st Bat-9",
				},	
				[10] = {
					name = "EAU West Front 1st Bat-10",
				},	
				[11] = {
					name = "EAU West Front 1st Bat-11",
				},	
				[12] = {
					name = "EAU West Front 1st Bat-12",
				},
			},
		},
		["EAU West Front 2nd Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front 2nd Bat-1",
				},
				[2] = {
					name = "EAU West Front 2nd Bat-2",
				},
				[3] = {
					name = "EAU West Front 2nd Bat-3",
				},
				[4] = {
					name = "EAU West Front 2nd Bat-4",
				},
				[5] = {
					name = "EAU West Front 2nd Bat-5",
				},
				[6] = {
					name = "EAU West Front 2nd Bat-6",
				},
				[7] = {
					name = "EAU West Front 2nd Bat-7",
				},
				[8] = {
					name = "EAU West Front 2nd Bat-8",
				},	
				[9] = {
					name = "EAU West Front 2nd Bat-9",
				},	
				[10] = {
					name = "EAU West Front 2nd Bat-10",
				},	
				[11] = {
					name = "EAU West Front 2nd Bat-11",
				},	
				[12] = {
					name = "EAU West Front 2nd Bat-12",
				},
			},
		},
		["EAU West Front 3rd Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front 3rd Bat-1",
				},
				[2] = {
					name = "EAU West Front 3rd Bat-2",
				},
				[3] = {
					name = "EAU West Front 3rd Bat-3",
				},
				[4] = {
					name = "EAU West Front 3rd Bat-4",
				},
				[5] = {
					name = "EAU West Front 3rd Bat-5",
				},
				[6] = {
					name = "EAU West Front 3rd Bat-6",
				},
				[7] = {
					name = "EAU West Front 3rd Bat-7",
				},
				[8] = {
					name = "EAU West Front 3rd Bat-8",
				},	
				[9] = {
					name = "EAU West Front 3rd Bat-9",
				},	
				[10] = {
					name = "EAU West Front 3rd Bat-10",
				},	
				[11] = {
					name = "EAU West Front 3rd Bat-11",
				},	
				[12] = {
					name = "EAU West Front 3rd Bat-12",
				},
			},
		},	
		["EAU West Front HQ"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front HQ-1",
				},
				[2] = {
					name = "EAU West Front HQ-2",
				},
				[3] = {
					name = "EAU West Front HQ-3",
				},
				[4] = {
					name = "EAU West Front HQ-4",
				},
				[5] = {
					name = "EAU West Front HQ-5",
				},
				[6] = {
					name = "EAU West Front HQ-6",
				},
				[7] = {
					name = "EAU West Front HQ-7",
				},
				[8] = {
					name = "EAU West Front HQ-8",
				},	
				[9] = {
					name = "EAU West Front HQ-9",
				},	
				[10] = {
					name = "EAU West Front HQ-10",
				},	
				[11] = {
					name = "EAU West Front HQ-11",
				},	
				[12] = {
					name = "EAU West Front HQ-12",
				},
			},
		},
		["EAU West Front Convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front Convoy 1-1",
				},
				[2] = {
					name = "EAU West Front Convoy 1-2",
				},
				[3] = {
					name = "EAU West Front Convoy 1-3",
				},
				[4] = {
					name = "EAU West Front Convoy 1-4",
				},
				[5] = {
					name = "EAU West Front Convoy 1-5",
				},
				[6] = {
					name = "EAU West Front Convoy 1-6",
				},
				[7] = {
					name = "EAU West Front Convoy 1-7",
				},
				[8] = {
					name = "EAU West Front Convoy 1-8",
				},	
				[9] = {
					name = "EAU West Front Convoy 1-9",
				},	
				[10] = {
					name = "EAU West Front Convoy 1-10",
				},	
				[11] = {
					name = "EAU West Front Convoy 1-11",
				},	
				[12] = {
					name = "EAU West Front Convoy 1-12",
				},
			},
		},
		["EAU West Front Convoy 2"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front Convoy 2-1",
				},
				[2] = {
					name = "EAU West Front Convoy 2-2",
				},
				[3] = {
					name = "EAU West Front Convoy 2-3",
				},
				[4] = {
					name = "EAU West Front Convoy 2-4",
				},
				[5] = {
					name = "EAU West Front Convoy 2-5",
				},
				[6] = {
					name = "EAU West Front Convoy 2-6",
				},
				[7] = {
					name = "EAU West Front Convoy 2-7",
				},
				[8] = {
					name = "EAU West Front Convoy 2-8",
				},	
				[9] = {
					name = "EAU West Front Convoy 2-9",
				},	
				[10] = {
					name = "EAU West Front Convoy 2-10",
				},	
				[11] = {
					name = "EAU West Front Convoy 2-11",
				},	
				[12] = {
					name = "EAU West Front Convoy 2-12",
				},
			},
		},
		["EAU West Front Convoy 3"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU West Front Convoy 3-1",
				},
				[2] = {
					name = "EAU West Front Convoy 3-2",
				},
				[3] = {
					name = "EAU West Front Convoy 3-3",
				},
				[4] = {
					name = "EAU West Front Convoy 3-4",
				},
				[5] = {
					name = "EAU West Front Convoy 3-5",
				},
				[6] = {
					name = "EAU West Front Convoy 3-6",
				},
				[7] = {
					name = "EAU West Front Convoy 3-7",
				},
				[8] = {
					name = "EAU West Front Convoy 3-8",
				},	
				[9] = {
					name = "EAU West Front Convoy 3-9",
				},	
				[10] = {
					name = "EAU West Front Convoy 3-10",
				},	
				[11] = {
					name = "EAU West Front Convoy 3-11",
				},	
				[12] = {
					name = "EAU West Front Convoy 3-12",
				},
			},
		},
		["EAU East Front 4th Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front 4th Bat-1",
				},
				[2] = {
					name = "EAU East Front 4th Bat-2",
				},
				[3] = {
					name = "EAU East Front 4th Bat-3",
				},
				[4] = {
					name = "EAU East Front 4th Bat-4",
				},
				[5] = {
					name = "EAU East Front 4th Bat-5",
				},
				[6] = {
					name = "EAU East Front 4th Bat-6",
				},
				[7] = {
					name = "EAU East Front 4th Bat-7",
				},
				[8] = {
					name = "EAU East Front 4th Bat-8",
				},	
				[9] = {
					name = "EAU East Front 4th Bat-9",
				},	
				[10] = {
					name = "EAU East Front 4th Bat-10",
				},	
				[11] = {
					name = "EAU East Front 4th Bat-11",
				},	
				[12] = {
					name = "EAU East Front 4th Bat-12",
				},
			},
		},
		["EAU East Front 5th Bat"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front 5th Bat-1",
				},
				[2] = {
					name = "EAU East Front 5th Bat-2",
				},
				[3] = {
					name = "EAU East Front 5th Bat-3",
				},
				[4] = {
					name = "EAU East Front 5th Bat-4",
				},
				[5] = {
					name = "EAU East Front 5th Bat-5",
				},
				[6] = {
					name = "EAU East Front 5th Bat-6",
				},
				[7] = {
					name = "EAU East Front 5th Bat-7",
				},
				[8] = {
					name = "EAU East Front 5th Bat-8",
				},	
				[9] = {
					name = "EAU East Front 5th Bat-9",
				},	
				[10] = {
					name = "EAU East Front 5th Bat-10",
				},	
				[11] = {
					name = "EAU East Front 5th Bat-11",
				},	
				[12] = {
					name = "EAU East Front 5th Bat-12",
				},
			},
		},
		["EAU East Front HQ"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front HQ-1",
				},
				[2] = {
					name = "EAU East Front HQ-2",
				},
				[3] = {
					name = "EAU East Front HQ-3",
				},
				[4] = {
					name = "EAU East Front HQ-4",
				},
				[5] = {
					name = "EAU East Front HQ-5",
				},
				[6] = {
					name = "EAU East Front HQ-6",
				},
				[7] = {
					name = "EAU East Front HQ-7",
				},
				[8] = {
					name = "EAU East Front HQ-8",
				},	
				[9] = {
					name = "EAU East Front HQ-9",
				},	
				[10] = {
					name = "EAU East Front HQ-10",
				},	
				[11] = {
					name = "EAU East Front HQ-11",
				},	
				[12] = {
					name = "EAU East Front HQ-12",
				},
			},
		},
		["EAU East Front Convoy 1"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front Convoy 1-1",
				},
				[2] = {
					name = "EAU East Front Convoy 1-2",
				},
				[3] = {
					name = "EAU East Front Convoy 1-3",
				},
				[4] = {
					name = "EAU East Front Convoy 1-4",
				},
				[5] = {
					name = "EAU East Front Convoy 1-5",
				},
				[6] = {
					name = "EAU East Front Convoy 1-6",
				},
				[7] = {
					name = "EAU East Front Convoy 1-7",
				},
				[8] = {
					name = "EAU East Front Convoy 1-8",
				},	
				[9] = {
					name = "EAU East Front Convoy 1-9",
				},	
				[10] = {
					name = "EAU East Front Convoy 1-10",
				},	
				[11] = {
					name = "EAU East Front Convoy 1-11",
				},	
				[12] = {
					name = "EAU East Front Convoy 1-12",
				},
			},
		},
		["EAU East Front Convoy 2"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front Convoy 2-1",
				},
				[2] = {
					name = "EAU East Front Convoy 2-2",
				},
				[3] = {
					name = "EAU East Front Convoy 2-3",
				},
				[4] = {
					name = "EAU East Front Convoy 2-4",
				},
				[5] = {
					name = "EAU East Front Convoy 2-5",
				},
				[6] = {
					name = "EAU East Front Convoy 2-6",
				},
				[7] = {
					name = "EAU East Front Convoy 2-7",
				},
				[8] = {
					name = "EAU East Front Convoy 2-8",
				},	
				[9] = {
					name = "EAU East Front Convoy 2-9",
				},	
				[10] = {
					name = "EAU East Front Convoy 2-10",
				},	
				[11] = {
					name = "EAU East Front Convoy 2-11",
				},	
				[12] = {
					name = "EAU East Front Convoy 2-12",
				},
			},
		},
		["EAU East Front Convoy 3"] = {
			task = "Strike",
			priority = 5,
			picture = {""},
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 8,
			},
			class = "static",
			elements = {
				[1] = {
					name = "EAU East Front Convoy 3-1",
				},
				[2] = {
					name = "EAU East Front Convoy 3-2",
				},
				[3] = {
					name = "EAU East Front Convoy 3-3",
				},
				[4] = {
					name = "EAU East Front Convoy 3-4",
				},
				[5] = {
					name = "EAU East Front Convoy 3-5",
				},
				[6] = {
					name = "EAU East Front Convoy 3-6",
				},
				[7] = {
					name = "EAU East Front Convoy 3-7",
				},
				[8] = {
					name = "EAU East Front Convoy 3-8",
				},	
				[9] = {
					name = "EAU East Front Convoy 3-9",
				},	
				[10] = {
					name = "EAU East Front Convoy 3-10",
				},	
				[11] = {
					name = "EAU East Front Convoy 3-11",
				},	
				[12] = {
					name = "EAU East Front Convoy 3-12",
				},
			},
		},
		["TF-71"] = {
			task = "Anti-ship Strike",
			priority = 1,
			attributes = {"ship"},
			firepower = {
				min = 4,
				max = 12,
			},
			class = "ship",
			name = "TF-71",
		},
		["TF-74"] = {
			task = "Anti-ship Strike",
			priority = 1,
			attributes = {"ship"},
			firepower = {
				min = 4,
				max = 12,
			},
			class = "ship",
			name = "TF-74",
		},		
		["LHA Group"] = {
			task = "Anti-ship Strike",
			priority = 1,
			attributes = {"ship"},
			firepower = {
				min = 4,
				max = 12,
			},
			class = "ship",
			name = "LHA Group",
		},		
		["EWR-1"] = {
			task = "Strike",
			priority = 8,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 2,
			},
			class = "vehicle",
			name = "EWR-1",
		},
		["EWR-2"] = {
			task = "Strike",
			priority = 8,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 2,
			},
			class = "vehicle",
			name = "EWR-2",
		},
		["EWR-3"] = {
			task = "Strike",
			priority = 8,
			attributes = {"soft"},
			firepower = {
				min = 2,
				max = 2,
			},
			class = "vehicle",
			name = "EWR-3",
		},
		["Dubai Intl OCA Strike"] = {
			task = "Strike",
			priority = 2,
			attributes = {"Parked Aircraft"},
			firepower = {
				min = 20,
				max = 60,
			},
			class = "airbase",
			name = "Dubai Intl",
		},
		["Al Dhafra AB OCA Strike"] = {
			task = "Strike",
			priority = 2,
			attributes = {"Parked Aircraft"},
			firepower = {
				min = 2,
				max = 6,
			},
			class = "airbase",
			name = "Al Dhafra AB",
		},
		["Al Maktoum Intl OCA Strike"] = {
			task = "Strike",
			priority = 2,
			attributes = {"Parked Aircraft"},
			firepower = {
				min = 2,
				max = 6,
			},
			class = "airbase",
			name = "Al Maktoum Intl",
		},	
--[[		["11 1st Artillery Division/1.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "11 1st Artillery Division/1.Btry",
		},
		["12 1st Artillery Division/2.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "12 1st Artillery Division/2.Btry",
		},
		["13 1st Artillery Division/3.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "13 1st Artillery Division/3.Btry",
		},
		["14 1st Artillery Division/4.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "14 1st Artillery Division/4.Btry",
		},
		["15 1st Artillery Division/5.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "15 1st Artillery Division/5.Btry",
		},
		["16 1st Artillery Division/6.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "16 1st Artillery Division/6.Btry",
		},
		["17 1st Artillery Division/7.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "17 1st Artillery Division/7.Btry",
		},
		["18 1st Artillery Division/8.Btry"] = {
			task = "Strike",
			priority = 4,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "18 1st Artillery Division/8.Btry",
		},
		["19 4th Army HQ"] = {
			task = "Strike",
			priority = 6,
			attributes = {"soft"},
			firepower = {
				min = 20,
				max = 40,
			},
			class = "vehicle",
			name = "19 4th Army HQ",
		},]]--		
	}
}