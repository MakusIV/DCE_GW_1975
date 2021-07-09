camp_triggers = {
	['Campaign End Loss 3'] = {
		['condition'] = 'GroundTarget["red"].percent < 50',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("Russian airforce was able to destroy enough allied forces to decide US Command to ask for a cease fire  and stop any Air missions. This is a bitter failure for the Allies")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['F7 Alive 25%'] = {
		['condition'] = 'Return.AirUnitAlive("F7") + Return.AirUnitReady("F21") < 3',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the F7 Squadron equiped with Viggen has fallen below 25%. The number of available airframes is critically low. The squadron is short of destruction.")',
		['active'] = true,
	},
	['CVN-74 John C. Stennis sunk'] = {
		['condition'] = 'Return.TargetAlive("CVN-74 John C. Stennis") == 0',
		['action'] = {
			[1] = 'db_airbases["CVN-74 John C. Stennis"].inactive = true',
			[2] = 'Action.Text("After the CVN-74 John C. Stennis has been hit by air strikes and sunk, its Navy Squadrons are no longer able to fly. Most of its planes are deep into the sea and it will need a long time to restore this unit s capabilities")',
		},
		['active'] = true,
	},
	['Kobuleti Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Kobuleti Airbase") < 11',
		['action'] = {
			[1] = 'db_airbases["Kobuleti"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 58 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/58 TFS", "58 TFS", 8)',
		['active'] = true,
	},
	['Reinforce 1./31.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("3./31.IAP", "1./31.IAP", 10)',
		['active'] = true,
	},
	['Reinforce 1./19.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("3./19.IAP", "1./19.IAP", 12)',
		['active'] = true,
	},
	['Sukhumi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Sukhumi Airbase") < 4 and Return.TargetAlive("Sukhumi Airbase Strategics") < 5',
		['action'] = {
			[1] = 'db_airbases["Sukhumi"].inactive = true',
		},
		['active'] = true,
	},
	['Beslan Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Beslan Airbase") < 2',
		['action'] = {
			[1] = 'db_airbases["Beslan"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 801 ARS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/801 ARS", "801 ARS", 4)',
		['active'] = true,
	},
	['TF-74 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("TF-74", {{"Indy 2-1", "Indy 2-2", "Indy 2-3", "Indy 2-4"}}, 10, 8, nil)',
		['active'] = false,
	},
	['Batumi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Batumi Airbase") < 6',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Batumi Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Red Ground Target Briefing Intel'] = {
		['condition'] = 'true',
		['action'] = 'Action.AddGroundTargetIntel("red")',
		['active'] = true,
	},
	['Reinforce VFA-106'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VFA-106", "VFA-106", 16)',
		['active'] = true,
	},
	['Campaign End Victory 1'] = {
		['condition'] = 'GroundTarget["blue"].percent < 40',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("The Allied units deployed to Georgia have successfully destroyed all the targets that they were assigned by US Central Command with the precious help of the French and Swedish fighters. With the complete destruction of the Russian airbases, the air campaign of this war comes to an end. Allied air power has once again proven its effectiveness and decisiveness. Well done.")',
			[3] = 'Action.AddImage("Newspaper_Victory_blue.jpg", "blue")',
			[1] = 'Action.CampaignEnd("win")',
			[4] = 'Action.AddImage("Newspaper_Defeat_red.jpg", "red")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Campaign first destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 100',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("First targets have been destroyed. Keep up the good work")',
		},
		['active'] = true,
	},
	['Reinforce 1./61.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./61.IAP", "1./61.IAP", 8)',
		['active'] = true,
	},
	['CVN-71 Theodore Roosevelt Sunk'] = {
		['condition'] = 'Return.UnitDead("CVN-71 Theodore Roosevelt")',
		['once'] = true,
		['action'] = {
			[1] = 'db_airbases["CVN-71 Theodore Roosevelt"].inactive = true',
			[2] = 'Action.Text("CVN-71 Theodore Roosevelt has been lost, the exact cause of her sinking is still somewhat unclear at the moment. Despite her evacuation being orderly and escorts of the Battle Group picking up many survivors, losses are expected to be very high. Search and rescue operations are still ongoing. It s a difficult time for the US Navy.")',
		},
		['active'] = true,
	},
	['Gudauta Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Gudauta Airbase") < 10',
		['action'] = {
			[1] = 'db_airbases["Gudauta"].inactive = true',
		},
		['active'] = true,
	},
	['Mozdok Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Mozdok Airbase") < 2',
		['action'] = {
			[1] = 'db_airbases["Mozdok"].inactive = true',
		},
		['active'] = true,
	},
	['Kutaisi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Kutaisi Airbase") < 11',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("The infrastructure at Kutaisi Airbase has been destroyed by air strikes. Flying operations at this base have ceased completely and are unlikely to resume. This will ease our efforts to hit other targets in the Kutaisi Country area.")',
		},
		['active'] = true,
	},
	['Kobuleti Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Kobuleti Airbase") < 11',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Kobuleti Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Campaign 20 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 80',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained fair damages. Keep up the good work")',
		},
		['active'] = true,
	},
	['Reinforce F7'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("F21", "F7", 12)',
		['active'] = true,
	},
	['Reinforce VAW-125'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VAW-125", "VAW-125", 8)',
		['active'] = true,
	},
	['Tbilissi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Tbilisi Airbase") < 7',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("The infrastructure at Tbilissi-Lochini Airbase has been destroyed by air strikes. Flying operations at this base have ceased completely and are unlikely to resume. This will ease our efforts to hit other targets in the Kutaisi Country area.")',
		},
		['active'] = true,
	},
	['Mineralnye Vody Airbase Disable Text'] = {
		['condition'] = 'Return.TargetAlive("Mineralnye-Vody Airbase") < 3',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Thanks to the destruction of the fuel and ammunition stocks at Mineralnye Vody Airbase, air operations at that base have come to a complete halt. Intelligence estimates that interceptors at Mineralnye Vody Airbase no longer pose a threat to allied strike aircraft. This will considerably ease our access to targets in the enemy rear area.")',
		},
		['active'] = true,
	},
	['Campaign End Draw'] = {
		['condition'] = 'MissionInstance == 40',
		['once'] = true,
		['action'] = {
			[1] = 'Action.CampaignEnd("draw")',
			[2] = 'Action.Text("The air campaign has seen a sustained period of inactivity. Seemingly unable to complete the destruction of the Russian Air Force and infrastructure, US Central Command has called off all squadrons from offensive operations. We hope negociations with Russians will convince them to stop attacks in Georgia")',
			[3] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['TF-71 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("TF-71", {{"Indy 1-1", "Indy 1-2", "Indy 1-3", "Indy 1-4"}}, 10, 8, nil)',
		['active'] = false,
	},
	['Reinforce 335 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/335 TFS", "335 TFS", 6)',
		['active'] = true,
	},
	['Nalchik Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Nalchik Airbase") < 2',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("The infrastructure at Nalchik Airbase has been destroyed by air strikes. Flying operations at this base have ceased completely and are unlikely to resume. This will ease our efforts to hit other targets in the Nalchik Country area.")',
		},
		['active'] = true,
	},
	['Reinforce 1./17.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("2./17.IAP", "1./17.IAP", 12)',
		['active'] = true,
	},
	['Campaign End Victory 2'] = {
		['condition'] = 'Return.AirUnitReady("1./14.IAP") + Return.AirUnitReady("790.IAP") + Return.AirUnitReady("1./19.IAP") + Return.AirUnitReady("2./19.IAP") + Return.AirUnitReady("1./17.IAP") + Return.AirUnitReady("1./31.IAP") + Return.AirUnitReady("1./41.IAP") < 4',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("The Russian Air Force is in ruins. After repeated air strikes and disastrous losses in air-air combat, the Russians are no longer able to produce any sorties or offer any resistance. The NATO now owns complete air superiority. With the disappearance of the air threat, the role of the F-15C Eagle and Mirage 2000C in this war comes to an end. Once again the victorious Eagle has proved to be to leading fighter in the world. Well done.")',
			[3] = 'Action.AddImage("Newspaper_Victory_blue.jpg", "blue")',
			[1] = 'Action.CampaignEnd("win")',
			[4] = 'Action.AddImage("Newspaper_Defeat_red.jpg", "red")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce 1./41.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./41.IAP", "1./41.IAP", 8)',
		['active'] = true,
	},
	['Campaign End Loss'] = {
		['condition'] = 'Return.AirUnitAlive("F7") + Return.AirUnitReady("F21") < 5',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("Ongoing combat operations have exhausted F7 Squadron. Loss rate has reached a level where reinforcements are no longer able to sustain combat operations. With the failure of Allied Air Force to attain air superiority, US Central Command has decided to call of the air campaign against the Russians. Without destroying Russians airbases it seems unlikely that the coalition will be able to win this war.")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce EC 1/12'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("EC 2/12", "EC 1/12", 8)',
		['active'] = true,
	},
	['Reinforce 174 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/174 ARW", "174 ARW", 4)',
		['active'] = true,
	},
	['Campaign End Loss 2'] = {
		['condition'] = 'Return.TargetAlive("Sukhumi Airbase") == 0',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("After the Sukhumi Airbase has been hit by air strikes and neutralised, F7 Squadron is no longer able to fly. Other US units will have to continue the fight without the F7 Squadron support. This is a bitter failure.")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Campaign 50 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 50',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("More than half of our targets are neutralized. Intelligence think that the enemy will ask for a cease fire soon")',
		},
		['active'] = true,
	},
	['Tbilissi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Tbilisi Airbase") < 7',
		['action'] = {
			[1] = 'db_airbases["Tbilissi-Lochini"].inactive = true',
		},
		['active'] = true,
	},
	['LHA-Group Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("LHA-Group", {{"Indy 3-1", "Indy 3-2", "Indy 3-3", "Indy 3-4"}}, 10, 8, nil)',
		['active'] = false,
	},
	['Russian convoy 1 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("Russian Convoy 1", {{"Convoy 1-1", "Convoy 1-2", "Convoy 1-3", "Convoy 1-4"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Senaki Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Senaki Airbase") < 12',
		['action'] = {
			[1] = 'db_airbases["Senaki-Kolkhi"].inactive = true',
		},
		['active'] = true,
	},
	['Campaign End Victory 3'] = {
		['condition'] = 'Return.TargetAlive("Beslan Airbase") < 2 and Return.TargetAlive("Nalchik Airbase") < 2 and Return.TargetAlive("Mozdok Airbase") < 2 and Return.TargetAlive("Mineralnye-Vody Airbase") < 3',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("The Russian Air Force is in ruins. All their main bases are destroyed, Russians are no longer able to produce any sorties or offer any resistance. The Allied forces now owns complete air superiority. Well done.")',
			[3] = 'Action.AddImage("Newspaper_Victory_blue.jpg", "blue")',
			[1] = 'Action.CampaignEnd("win")',
			[4] = 'Action.AddImage("Newspaper_Defeat_red.jpg", "red")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Newspaper Nighthawk Down'] = {
		['condition'] = 'Return.AirUnitAlive("417 TFS") < 4',
		['once'] = true,
		['action'] = {
			[1] = 'Action.AddImage("Newspaper_NighthawkDown.jpg", "blue")',
			[2] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['F7 Alive 50%'] = {
		['condition'] = 'Return.AirUnitAlive("F7") + Return.AirUnitReady("F21") < 6',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the F7 Squadron equiped with Viggen has fallen below 50%. If losses continue at the present rate, the combat capability of the squadron is in jeopardy.")',
		['active'] = true,
	},
	['Reinforce 1./14.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("2./14.IAP", "1./14.IAP", 12)',
		['active'] = true,
	},
	['Kutaisi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Kutaisi Airbase") < 11',
		['action'] = {
			[1] = 'db_airbases["Kutaisi"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 13 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/13 TFS", "13 TFS", 8)',
		['active'] = true,
	},
	['Sukhumi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Sukhumi Airbase") < 4 and Return.TargetAlive("Sukhumi Airbase Strategics") < 5',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Recent air strikes have destroyed enemy ground elements running operations at Sukhumi Airbase. Without their ground support, any remaining aircraft at the airstrip will no longer be able to launch on sorties.")',
		},
		['active'] = true,
	},
	['Nalchik Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Nalchik Airbase") < 2',
		['action'] = {
			[1] = 'db_airbases["Nalchik"].inactive = true',
		},
		['active'] = true,
	},
	['Mozdok Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Mozdok Airbase") < 2',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Recent air strikes have destroyed enemy ground elements running operations at Mozdok Airbase. Without their ground support, any remaining aircraft at the airstrip will no longer be able to launch on sorties.")',
		},
		['active'] = true,
	},
	['Batumi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Batumi Airbase") < 6',
		['action'] = {
			[1] = 'db_airbases["Batumi"].inactive = true',
		},
		['active'] = true,
	},
	['NATO convoy 1 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("NATO Convoy 1", {{"NATO convoy 1-1", "NATO convoy 1-2", "NATO convoy 1-3", "NATO convoy 1-4"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Senaki Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Senaki Airbase") < 12',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Senaki-Kolkhi Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Campaign Briefing'] = {
		['condition'] = 'true',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("The US Air Force has sent considerable forces to Georgia in support of the operation. At the forefront are the F-15C Eagles of the 58th Tactical Fighter Squadron who are tasked to attain air superiority and protect coalition strike aircraft against the Russian Air Force with the help of the 1/12 Cambresis Squadron with the French Mirage 2000C and VF-101 with their Legendary F-14B Tomcats. The brunt of daylight attack falls on the F-16C of the 13rd Tactical Fighter Squadron, and the F/A-18C of the VFA-106 onboard of the CVN Theodore Roosevelt. Exceptionaly F7 Swedish Squadron will help NATO to attack ground and sea targets. Attack during the night is carried out by the F-15E Strike Eagles of the 335th Tactical Fighter Squadron, who are looking forward to the types combat debut. Of considerable interest to the USAF is the deployment of the F-117A Nighthawk stealth bomber with the 417th Tactical Fighter Squadron. The USAF contingent is completed by a deployment of E-3A Sentry from the 7th Airborne Command and Control Squadron. Together these squadrons form a powerful and mighty force.")',
			[3] = 'Action.Text("The Russian Air Force is flying a mix of MiG-29, MiG-31, Su-27 and Su-25T fighters directed by ground based early warning radar but possibly by new A-50 AWACS. Air bases and target complexes of high value are protected by a variety of dangerous surface-air missile systems, such as the SA-10, the SA-8 Gecko and the SA-11, as well as short-range IR-SAMs and AAA. As part of the coalition air offensive, the US Air Force is tasked with neutralizing the Russian Air Force, both in the air and on the ground, as well as destroying Russian airbases.")',
			[1] = 'Action.Text("Georgia is menaced by Russia and this little country asked for help. Multiple air operations were launched by Russia to attack Georgian civilian targets and NATO decided to help Georgia. The goal is to cripple main Russians airbases.")',
			[4] = 'Action.AddImage("Newspaper_FirstNight_blue.jpg", "blue")',
			[5] = 'Action.AddImage("Newspaper_FirstNight_red.jpg", "red")',
		},
		['active'] = false,
	},
	['CAP After EWR Destroyed'] = {
		['condition'] = 'Return.TargetAlive("102 EWR Site") == 0 and Return.TargetAlive("103 EWR Site") == 0 and Return.TargetAlive("101 EWR Site") == 0 and Return.AirUnitAlive("2457 SDRLO") == 0',
		['once'] = true,
		['action'] = {
			[7] = 'Action.TargetActive("Beslan Alert 120 Km", false)',
			[1] = 'Action.TargetActive("CAP Beslan", true)',
			[2] = 'Action.TargetActive("CAP Mozdok", true)',
			[4] = 'Action.TargetActive("Mozdok Alert 120 Km", false)',
			[8] = 'Action.TargetActive("Mineralnye-Vody Alert 200 Km", false)',
			[9] = 'Action.TargetActive("Nalchik Alert 100 Km", false)',
			[5] = 'Action.TargetActive("Nalchik Alert 200 Km", false)',
			[10] = 'Action.Text("With the recent destruction of all Early Warning Radar sites in the operations area, and Russians AWACS squadron being anihilated, the ability of the enemy to launch interceptors against our strike packages was severely degraded. Intelligence expects that the enemy will increasingly depend on Combat Air Patrols to compensate, though without the support of ground controllers these are estimated to be of limited effectiveness.")',
			[3] = 'Action.TargetActive("Mozdok Alert 200 Km", false)',
			[6] = 'Action.TargetActive("Mineralnye-Vody Alert 280 Km", false)',
		},
		['active'] = true,
	},
	['LHA_Tarawa Sunk'] = {
		['condition'] = 'Return.UnitDead("LHA_Tarawa")',
		['once'] = true,
		['action'] = {
			[1] = 'db_airbases["LHA_Tarawa"].inactive = true',
			[2] = 'Action.Text("LHA_Tarawa has been lost, the exact cause of her sinking is still somewhat unclear at the moment. Despite her evacuation being orderly and escorts of the Battle Group picking up many survivors, losses are expected to be very high. Search and rescue operations are still ongoing. It s a difficult time for the US Navy.")',
		},
		['active'] = true,
	},
	['GroundUnitRepair'] = {
		['condition'] = 'true',
		['action'] = 'Action.GroundUnitRepair()',
		['active'] = true,
	},
	['Beslan Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Beslan Airbase") < 2',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Beslan Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Repair'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitRepair()',
		['active'] = true,
	},
	['Reinforce VMA 311'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("VMA 331", "VMA 311", 4)',
		['active'] = true,
	},
	['Campaign 40 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 60',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained great damages. Strike missions are really efficient and we will win this war soon")',
		},
		['active'] = true,
	},
	['Gudauta Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Gudauta Airbase") < 10',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Gudauta Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Reinforce VF-101'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VF-101", "VF-101", 16)',
		['active'] = true,
	},
	['Reinforce 171 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/171 ARW", "171 ARW", 3)',
		['active'] = true,
	},
	['Blue Ground Target Briefing Intel'] = {
		['condition'] = 'true',
		['action'] = 'Action.AddGroundTargetIntel("blue")',
		['active'] = true,
	},
	['Mineralnye Vody Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Mineralnye-Vody Airbase") < 3',
		['action'] = {
			[1] = 'db_airbases["Mineralnye-Vody"].inactive = true',
		},
		['active'] = true,
	},
	['Russian convoy 2 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("Russian Convoy 2", {{"Convoy 2-1", "Convoy 2-2", "Convoy 2-3", "Convoy 2-4"}}, 8, 5, nil)',
		['active'] = false,
	},
	['F7 Alive 75%'] = {
		['condition'] = 'Return.AirUnitAlive("F7") + Return.AirUnitReady("F21") < 8',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the F7 Squadron equiped with Viggen has fallen below 75%.")',
		['active'] = true,
	},
	['Reinforce 1./81.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./81.IAP", "1./81.IAP", 8)',
		['active'] = true,
	},
}
