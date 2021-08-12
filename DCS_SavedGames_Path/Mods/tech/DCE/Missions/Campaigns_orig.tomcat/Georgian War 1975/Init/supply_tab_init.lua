--[[

supply plant --- supplies ---->|----> supply line A -- supplies---> |--> airbase 1
                               |                                    |--> airbase 3
                               |                                    |--> airbase 5
                               |
                               |----> supply line B -- supplies---> |--> airbase 2
															 |                                    |--> airbase 5
															 |
                               |----> supply line C -- supplies---> |--> airbase 2

like for airbase damage, supply plant and/or supply line damage influence number of ready aircraft stored in airbases

]]



supply_tab = {
	['blue'] = {
		['EAU West Front HQ'] = {  -- supply plant: the string name equal to the same present in the target list table
			['integrity'] = 1, -- integrity of supply plant: it should be 1 as an initial value
			['supply_line_names'] = { -- table of supply line of the supply plant
				['EAU West Front Convoy 1'] = { -- supply line: the string name equal to the same present in the target list table
					['integrity'] = 1, -- integrity of supply line: it should be 1 as an initial value
					['airbase_supply'] = {  -- table of airbases supplyed from supply line
						['Al Maktoum Intl'] = true,  -- airbase: the string name equal to the same present in the oob_air table
					},
				},
				['EAU West Front Convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Jazirat al Hamra FARP'] = true,
					},
				},
			},
		},
		['EAU East Front HQ'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['EAU East Front Convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Dubai Intl'] = true,
					},
				},
				['EAU East Front Convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Jazirat al Hamra FARP'] = true,
					},
				},
			},
		},
		['EWR-3'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['EAU West Front Convoy 3'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Al Dhafra AB'] = true,
						['Reserves'] = true,
					},
				},
				['EAU East Front Convoy 3'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Reserves'] = true,
					},
				},
			},
		},
		['TF-74'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['LHA Group'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['CVN-71 Theodore Roosevelt'] = true,
						['LHA_Nassau'] = true,
					},
				},
			},
		},
		['TF-71'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['LHA Group'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['CVN-74 John C. Stennis'] = true,
						['LHA_Tarawa'] = true,
						['Reserves'] = true,
					},
				},
			},
		},
	},
	['red'] = {
		['EWR 1'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Iranian West frontline convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Shiraz Intl'] = true,
					},
				},
				['4th Iranian Transport fleet'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Bandar e Jask airfield'] = true,
					},
				},
				['Mountain Iranian convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Lar Airbase'] = true,
					},
				},
			},
		},
		['EWR 2'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['5th Iranian Transport fleet'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Reserves'] = true,
					},
				},
				['2nd Iranian Transport fleet'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Bandar Abbas Intl'] = true,
					},
				},
				['Mountain Iranian convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Al Ima FARP'] = true,
					},
				},
			},
		},
		['EWR 3'] = {
			['integrity'] = 1,
			['supply_line_names'] = {
				['Iranian West frontline convoy 2'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Qeshm Island'] = true,
						['Reserves'] = true,
					},
				},
				['Iranian West frontline convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Khasab'] = true,
					},
				},
				['Bukha Iranian convoy 1'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Bandar Abbas Intl'] = true,
					},
				},
				['Al Mina Ships'] = {
					['integrity'] = 1,
					['airbase_supply'] = {
						['Sirri Island'] = true,
					},
				},
			},
		},
	},
}

-- in oob_air

-- blue oob_air  -----
-- 'CVN-71 Theodore Roosevelt' +
-- 'Al Maktoum Intl' +
-- 'LHA_Nassau' +
-- 'CVN-74 John C. Stennis' +
-- 'LHA_Tarawa' +
-- 'Al Dhafra AB' +
-- 'Jazirat al Hamra FARP' **harrier +
-- 'Dubai Intl', ** +

-- blue targetlist (red targets)  -----
-- 'TF-74'
-- 'TF-71'
-- 'LHA Group'
-- 'EWR-1'
-- 'EWR-2'
-- 'EWR-3' +
-- 'EAU East Front HQ' +
-- 'EAU East Front Convoy 1' +
-- 'EAU East Front Convoy 2' +
-- 'EAU East Front Convoy 3' +
-- 'EAU East Front 5th Bat'
-- 'EAU West Front HQ' +
-- 'EAU West Front Convoy 1' +
-- 'EAU West Front Convoy 2' +
-- 'EAU West Front Convoy 3' +
-- 'EAU East Front Convoy 1'
-- 'US Army ELINT Station'
-- 'US Army ELINT Station 2'



-- red in oob_air -----
-- 'Sharjah Intl' ** +
-- 'Qeshm Island' +
-- 'Khasab' ** +
-- 'Bandar e Jask airfield' +
-- 'Bandar Abbas Intl' ** +
-- 'Sirri Island' ** +
-- 'Al Ima FARP' ** apache +
-- 'Lar Airbase' +

 -- red (blue targets)  -----
-- 'EWR 1' +
-- 'EWR 2' +
-- 'EWR 3' +
-- 'Mountain Iranian convoy 1'
-- 'Mountain Iranian convoy 2'
-- 'Mountain Iranian convoy 3'
-- 'Mountain Iranian convoy 4'
-- '3rd Iranian Transport fleet'
-- '4th Iranian Transport fleet'
-- '2nd Iranian Transport fleet'
-- '5th Iranian Transport fleet'
-- 'Iranian West frontline convoy 1'
-- 'Iranian West frontline convoy 2'
-- 'Bukha Iranian convoy 1'
-- 'Al Mina Ships'
-- 'Khasab Airbase Strategics'
-- '1st Iranian Transport fleet'
-- 'Dubai Intl'
-- 'Al Dhafra AB'
-- 'Abu Musa Island Airport Strategics'
-- 'Abu Musa Island Airport'
-- 'Abu Musa Ships Facilities - N255237 E0550065'
-- 'Bandar e Jask airfield Strategics'
-- 'Khasab Airbase'
-- 'Bandar e Jask airfield'
-- 'Bukha Iranian Command Post'
