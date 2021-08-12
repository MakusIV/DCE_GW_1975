supply_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--        supply plant
			['integrity'] = 1, --             supply plant integrity    
			['supply_line_names'] = {--         table of supply lines supplyed by supply plant
				['Bridge Alagir MN 36'] = {--   supply line
					['integrity'] = 1,--      integrity of supply line
					['airbase_supply'] = {--    table of airbases supplyd by supply line
						['Beslan'] = true,--    test info: Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
						['Mozdok'] = true
					},
				},
				['Bridge South Beslan MN 68'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Beslan'] = true,
						['Nalchik'] = true,   
						['Sochi-Adler'] = true,
						['Reserves-3./31.IAP'] = true,
						['Reserves-R./41.IAP'] = true,		
					},
				},
			},
		},
		['Mineralnye-Vody Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Rail Bridge SE Mayskiy MP 23'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Sochi-Adler'] = true,
						['Beslan'] = true,
						['Reserves-3./19.IAP'] = true,
						['Reserves-2./14.IAP'] = true,
					},
				},
				['Bridge South Elhotovo MN 39'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
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
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mozdok'] = true,
						['Mineralnye-Vody'] = true,
						['Reserves-R./61.IAP'] = true,
						['Reserves-R./81.IAP'] = true,
						['Reserves-2./17.IAP'] = true,	
					},
				},
				['Bridge SW Kardzhin MN 49'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
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
			['integrity'] = 1,
			['supply_line_names'] = {
				['Rail Bridge Grebeshok-EH99'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Vaziani'] = true,
					},
				},
				['Bridge Anaklia-GG19'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Senaki-Kolkhi'] = true,
						['Batumi'] = true,
						['Reserves-R/VF-101'] = true,
						['Reserves-EC 2/12'] = true,
						['Reserves-R/801 ARS'] = true,	
					},
				},
			},
		},
		['Novyy Afon Train Station - FH57'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Bridge Tagrskiy-FH08'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Batumi'] = true,
						['Reserves-F21'] = true,
						['Reserves-VMA 331'] = true,
						['Reserves-R/171 ARW'] = true,
						['Reserves-R/58 TFS'] = true,						
					},
				},
				['Bridge Nizh Armyanskoe Uschele-FH47'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Vaziani'] = true,
						['Senaki-Kolkhi'] = true,
						['Reserves-R/VFA-106'] = true,
						['Reserves-R/174 ARW'] = true,
						['Reserves-R/335 TFS'] = true,
						['Reserves-R/13 TFS'] = true,	
					},
				},
			},
		},
	},
}


