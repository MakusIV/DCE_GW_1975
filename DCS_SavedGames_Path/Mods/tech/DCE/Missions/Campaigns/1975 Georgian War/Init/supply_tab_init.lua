supply_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--        supply plant
			['integrity'] = 1, --             supply plant integrity    
			['supply_line_names'] = {--         table of supply lines supplyed by supply plant
				['Mozdok Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mozdok'] = true,											
					},
				},			
				['Prohladniy Depot MP 24-BESLAN SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						 	
						['Beslan'] =  true,							
					},
				},
			},
		},
		['SUPPLY PLANT BAKSAN LP83'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['BAKSAN-MINERALNYE SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {	
						['Mineralnye-Vody'] = true,										
					},
				},
				['Nalchik Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Nalchik'] = true,											
					},
				},
				['BAKSAN-MOZDOK SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mozdok'] = true,													
					},
				},
			},
		},
		['CHERKESSK SUPPLY PLANT KP69'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Mineralnye-Vody Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mineralnye-Vody'] = true,											
					},
				},
				['Russian Convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {												
						['Sochi-Adler'] = true,
						['Maykop-Khanskaya'] = true,				
					},
				},				
			},
		},
		['Mineralnye-Vody Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Mineralnye-Vody Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {					
						['Reserves-3./19.IAP'] = true,
						['Reserves-3./31.IAP'] = true,							
					},
				},			
			},
		},
		['Beslan Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Beslan Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Reserves-3./19.IAP'] = true,
						['Reserves-2./17.IAP'] = true,
					},
				},
				['BESLAN-NOGIR FARP SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						["NOGIR FARP MN76"] = true,
					},
				},
				['BESLAN-LENIGORI FARP SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						["LENIGORI FARP MM56"] = true,
					},
				},		
				['BESLAN-TSKHINVALI FARP SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						["TSKHINVALI FARP MM17"] = true,
					},
				},						
			},
		},
		['Nalchik Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Nalchik Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {					
						['Reserves-2./14.IAP'] = true,	
						['Reserves-R./41.IAP'] = true,					
					},
				},	
				['NALCHIK-TSKHINVALI FARP SUPPLY LINE'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						["TSKHINVALI FARP MM17"] = true,
					},
				},				
			},
		},
		['Mozdok Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Mozdok Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Reserves-R./81.IAP'] = true,
						['Reserves-R./61.IAP'] = true,
					},
				},				
			},
		},
	},
	['blue'] = {
		['Sukhumi Airbase Strategics'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Sukhumi Airbase Strategics'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Sukhumi'] = true,
					},
				},
				['Bridge Anaklia-GG19'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Vaziani'] = true,													
					},
				},
			},
		},
		['Novyy Afon Train Station - FH57'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Rail Bridge Tsalkoti-EJ80'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,																	
					},
				},
				['Rail Bridge West Gantiadi-EJ80'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Senaki-Kolkhi'] = true,
					},
				},
			},
		},
		['CVN-71 Theodore Roosevelt'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['CVN-71 Theodore Roosevelt'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,												
						['Reserves-R/VFA-106'] = true,						
						['Reserves-R/335 TFS'] = true,
						['Reserves-R/13 TFS'] = true,							
					},
				},
			},
		},
		['CVN-74 John C. Stennis'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['CVN-74 John C. Stennis'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Batumi'] = true,	
						['Reserves-R/VF-101'] = true,			
						['Reserves-VMA 331'] = true,						
						['Reserves-R/58 TFS'] = true,						
					},
				},
			},
		},
		['Kutaisi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Kutaisi Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,
						['Batumi'] = true,
						['Reserves-F21'] = true,						
						['Reserves-R/171 ARW'] = true,
						['Reserves-R/58 TFS'] = true,						
					},
				},			
			},
		},
		['Kobuleti Airbase'] = { -- watch! Kobuleti not exists in oob_air_init. Delete it or insert an air groub with base = Kobuleti
			['integrity'] = 1,
			['supply_line_names'] = {
				['Kobuleti Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,											
					},
				},
			},
		},
		['Batumi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Batumi Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Reserves-F21'] = true,
						['Reserves-R/171 ARW'] = true,	
						['Reserves-EC 2/12'] = true,											
					},
				},
			},
		},
		['Senaki-Kolkhi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Senaki Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Reserves-R/801 ARS'] = true,
						['Reserves-R/58 TFS'] = true,						
					},
				},				
			},
		},
		['Gudauta Airbase'] = { -- watch! Gudauta not exists in oob_air_init. Delete it or insert an air groub with base = Kobuleti
			['integrity'] = 1,
			['supply_line_names'] = {
				['Gudauta Airbase'] = { -- attention: not present in oob_air_init
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,										
					},
				},
			},
		},
		['Sukhumi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Sukhumi Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,						
					},
				},			
			},
		},
		['Tbilisi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Tbilisi Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Reserves-R/174 ARW'] = true,
						['Reserves-R/335 TFS'] = true,
						['Reserves-R/13 TFS'] = true,							
						['Reserves-R/171 ARW'] = true,
						['Reserves-R/58 TFS'] = true,						
					},
				},
			},
		},
		['Gudauta Train Station - FH37'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Gudauta Train Station - FH37'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Gudauta'] = true, -- watch! Kobuleti not exists in oob_air_init. Delete it or insert an air groub with base = Kobuleti
						['Kutaisi'] = true,
					},
				},			
			},
		},
		['Sukhumi Train Station - FH66'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Sukhumi Train Station - FH66'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Sukhumi'] = true,										
					},
				},				
			},
		},
		['Sukhumi-Babushara Train Station - FH74'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Sukhumi-Babushara Train Station - FH74'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Sukhumi'] = true,									
					},
				},		
			},
		},
		['Senaki-Kolkhi Train Station - KM58'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Senaki-Kolkhi Train Station - KM58'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Senaki-Kolkhi'] = true,					
					},
				},				
			},
		},
		['Kobuleti Train Station - GG44'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Kobuleti Train Station - GG44'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Kutaisi'] = true,					
					},
				},
			},
		},
		['Sukhumi Airbase'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Sukhumi Airbase'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Reserves-R/171 ARW'] = true,					
					},
				},				
			},
		},	
	},
}

-- SUPPLY PLANT:
-- RED: SUPPLY PLANT BAKSAN LP83, "CHERKESSK SUPPLY PLANT KP69, Prohladniy Depot MP 24
-- BLUE: 
