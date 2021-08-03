supply_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--        supply plant
			['integrity'] = 0.8, --             supply plant integrity    
			['supply_line_names'] = {--         table of supply lines supplyed by supply plant
				['Bridge Alagir MN 36'] = {--   supply line
					['integrity'] = 0.5,--      integrity of supply line
					['airbase_supply'] = {--    table of airbases supplyd by supply line
						['Beslan'] = true,--    test info: Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
						['Mozdok'] = true
					},
				},
				['Bridge South Beslan MN 68'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Beslan'] = true,
						['Nalchik'] = true,   
						['Sochi-Adler'] = true,
					},
				},
			},
		},
		['Mineralnye-Vody Airbase'] = {
			['integrity'] = 0.6,
			['supply_line_names'] = {
				['Rail Bridge SE Mayskiy MP 23'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Sochi-Adler'] = true,
						['Beslan'] = true,
					},
				},
				['Bridge South Elhotovo MN 39'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Reserves'] = true,
						['Sochi-Adler'] = true,
						['Maykop-Khanskaya'] = true,
						['Nalchik'] = true,
						['Mozdok'] = true,
						['Beslan'] = true,
						['Mineralnye-Vody'] = true,
					},
				},
			},
		},
		['101 EWR Site'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Russian Convoy 1'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Mineralnye-Vody'] = true,
					},
				},
				['Bridge SW Kardzhin MN 49'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Reserves'] = true,
						['Sochi-Adler'] = true,
						['Mineralnye-Vody'] = true,
						['Beslan'] = true,
						['Mozdok'] = true,
					},
				},
			},
		},
	},
	['blue'] = {
		['Sukhumi Airbase Strategics'] = {
			['integrity'] = 0.4,
			['supply_line_names'] = {
				['Rail Bridge Grebeshok-EH99'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Vaziani'] = true,
					},
				},
				['Bridge Anaklia-GG19'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Senaki-Kolkhi'] = true,
						['Batumi'] = true,
						['Reserves'] = true,
					},
				},
			},
		},
		['Novyy Afon Train Station - FH57'] = {
			['integrity'] = 0.8,
			['supply_line_names'] = {
				['Bridge Tagrskiy-FH08'] = {
					['integrity'] = 0.25,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Batumi'] = true,
					},
				},
				['Bridge Nizh Armyanskoe Uschele-FH47'] = {
					['integrity'] = 0.5,
					['airbase_supply'] = {
						['Vaziani'] = true,
						['Senaki-Kolkhi'] = true,
						['Reserves'] = true,
					},
				},
			},
		},
	},
}


