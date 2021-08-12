supply_tab = {
	['red'] = {
		['Prohladniy Depot MP 24'] = {--        supply plant
			['integrity'] = 1, --             supply plant integrity    
			['supply_line_names'] = {--         table of supply lines supplyed by supply plant
				['Bridge Vladikavkaz North MN 76'] = {--   supply line
					['integrity'] = 1,--      integrity of supply line
					['airbase_supply'] = {--    table of airbases supplyd by supply line
						['Beslan'] = true,--    test info: Beslan dovrebbe prendere 0.8*0.5=0.4 efficiency
						['Mozdok'] = true,
						['Sochi-Adler'] = true,
						['Maykop-Khanskaya'] = true,
					},
				},
				['Bridge Vladikavkaz South MN 76'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Nalchik'] = true,   
						['Mineralnye-Vody'] = true,						
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
				['Bridge SW Kardzhin MN 49'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Beslan'] = true,										
					},
				},
				['Bridge SW Kardzhin MN 49'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Nalchik'] = true,											
					},
				},
				['Bridge South Elhotovo MN 39'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Mozdok'] = true,													
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
				['Russian Convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						["FARP Vladikavkaz - MN76"] = true,
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
				['Rail Bridge Kardzhin MN 49'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						["FARP Vladikavkaz - MN76"] = true,
					},
				},
			},
		},
		['101 EWR Site'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Russian Convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						['Beslan'] = true,							
					},
				},
				['Bridge Alagir MN 36'] = {
					['integrity'] = 1,
					['airbase_supply'] = {						
						["FARP Vladikavkaz - MN76"] = true,
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


