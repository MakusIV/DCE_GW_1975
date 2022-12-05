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
	['VF-101 Alive 25%'] = {
		['condition'] = 'Return.AirUnitAlive("VF-101") + Return.AirUnitReady("R/VF-101") < 12',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the VF-101 Squadron equiped with F-14A-135-GR has fallen below 25%. The number of available airframes is critically low. The squadron is short of destruction.")',
		['active'] = true,
	},
	['Reinforce 315th Air Division'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/315th Air Division", "315th Air Division", 4)',
		['active'] = true,
	},
	['Maykop-Khanskaya Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Maykop-Khanskaya Airbase") < 2',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Recent air strikes have destroyed enemy ground elements running operations at Maykop-Khanskaya Airbase. Without their ground support, any remaining aircraft at the airstrip will no longer be able to launch on sorties.")',
		},
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
	['Reinforce VS-21'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VS-21", "VS-21", 4)',
		['active'] = true,
	},
	['Campaign End Loss 4'] = {
		['condition'] = 'Return.AirUnitReady("F7") + Return.AirUnitReady("F9") + Return.AirUnitReady("VMFA-151") + Return.AirUnitReady("GA 7rd AS") + Return.AirUnitReady("VMFA-157") + Return.AirUnitReady("GA 3rd AS") + Return.AirUnitReady("58 TFS") + Return.AirUnitReady("GA 4rd AS") < 8',
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
	['Reinforce VS-22'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VS-22", "VS-22", 4)',
		['active'] = true,
	},
	['Reinforce 58 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/58 TFS", "58 TFS", 8)',
		['active'] = true,
	},
	['Reinforce 1./115.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./115.IAP", "1./115.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 1./123.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./123.IAP", "1./123.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 6th Cvy'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/6th Cavalry", "6th Cavalry", 16)',
		['active'] = true,
	},
	['Reinforce 1./19.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./19.IAP", "1./19.IAP", 12)',
		['active'] = true,
	},
	['Reinforce 1./107.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./107.IAP", "1./107.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 29.OSAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./29.OSAP", "1./29.OSAP", 4)',
		['active'] = true,
	},
	['Sukhumi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Sukhumi Airbase") < 4 and Return.TargetAlive("Sukhumi Airbase Strategics") < 5',
		['action'] = {
			[1] = 'db_airbases["Sukhumi"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 17th Cavalry'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/17th Cavalry", "17th Cavalry", 16)',
		['active'] = true,
	},
	['VF-101 Alive 75%'] = {
		['condition'] = 'Return.AirUnitAlive("VF-101") + Return.AirUnitReady("R/VF-101") < 34',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the VF-101 Squadron equiped with F-14A-135-GR has fallen below 75%.")',
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
	['Reinforce 1./117.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./117.IAP", "1./117.IAP", 12)',
		['active'] = true,
	},
	['Reinforce 54 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/54 TFS", "54 TFS", 6)',
		['active'] = true,
	},
	['Reinforce 13th GHR'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/13th GHR", "13th GHR", 8)',
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
		['condition'] = 'GroundTarget["red"].percent < 100',
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
		['condition'] = 'GroundTarget["red"].percent < 80',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained fair damages. Keep up the good work")',
		},
		['active'] = true,
	},
	['Reinforce GA 3rd AS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GA 3rd AS", "GA 3rd AS", 12)',
		['active'] = true,
	},
	['Reinforce F7'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("F21", "F7", 12)',
		['active'] = true,
	},
	['Reinforce O/159.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/159.IAP", "O/159.IAP", 8)',
		['active'] = true,
	},
	['Campaign 50 percents destructions'] = {
		['condition'] = 'GroundTarget["red"].percent < 50',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("More than half of our targets are neutralized. Intelligence think that the enemy will ask for a cease fire soon")',
		},
		['active'] = true,
	},
	['Russian convoy 1 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("Russian Convoy 1", {{"Convoy 1-1", "Convoy 1-2", "Convoy 1-3", "Convoy 1-4"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Reinforce VMFA-157'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VMFA-157", "VMFA-157", 16)',
		['active'] = true,
	},
	['Senaki Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Senaki Airbase") < 12',
		['action'] = {
			[1] = 'db_airbases["Senaki-Kolkhi"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce VAW-125'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VAW-125", "VAW-125", 8)',
		['active'] = true,
	},
	['Tbilissi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Tbilissi Airbase") < 7',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("The infrastructure at Tbilissi-Lochini Airbase has been destroyed by air strikes. Flying operations at this base have ceased completely and are unlikely to resume. This will ease our efforts to hit other targets in the Kutaisi Country area.")',
		},
		['active'] = true,
	},
	['Reinforce 1./127.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./127.IAP", "1./127.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 1./113.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./113.IAP", "1./113.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 1./135.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./135.IAP", "1./135.IAP", 8)',
		['active'] = true,
	},
	['Reinforce VMFA-151'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VMFA-151", "VMFA-151", 4)',
		['active'] = true,
	},
	['Reinforce 27.OSAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/27.OSAP", "27.OSAP", 4)',
		['active'] = true,
	},
	['Reinforce 69 BS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/69 BS", "69 BS", 15)',
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
	['Sukhumi Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Sukhumi Airbase") < 4 and Return.TargetAlive("Sukhumi Airbase Strategics") < 5',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Recent air strikes have destroyed enemy ground elements running operations at Sukhumi Airbase. Without their ground support, any remaining aircraft at the airstrip will no longer be able to launch on sorties.")',
		},
		['active'] = true,
	},
	['Reinforce GA 5rd AS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GA 5rd TS", "GA 5rd TS", 12)',
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
	['VF-101 Alive 50%'] = {
		['condition'] = 'Return.AirUnitAlive("VF-101") + Return.AirUnitReady("R/VF-101") < 23',
		['once'] = true,
		['action'] = 'Action.Text("Aircraft strength of the VF-101 Squadron equiped with F-14A-135-GR has fallen below 50%. If losses continue at the present rate, the combat capability of the squadron is in jeopardy.")',
		['active'] = true,
	},
	['Reinforce 1./153.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./153.IAP", "1./153.IAP", 8)',
		['active'] = true,
	},
	['Reinforce VF-118/GA'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VF-118/GA", "VF-118/GA", 16)',
		['active'] = true,
	},
	['Reinforce 13.OSAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./13.OSAP", "13.OSAP", 4)',
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
	['Mineralnye Vody Airbase Disable Text'] = {
		['condition'] = 'Return.TargetAlive("Mineralnye-Vody Airbase") < 3',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Thanks to the destruction of the fuel and ammunition stocks at Mineralnye Vody Airbase, air operations at that base have come to a complete halt. Intelligence estimates that interceptors at Mineralnye Vody Airbase no longer pose a threat to allied strike aircraft. This will considerably ease our access to targets in the enemy rear area.")',
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
	['Campaign End Victory 2'] = {
		['condition'] = 'Return.AirUnitReady("1./113.IAP") + Return.AirUnitReady("790.IAP") + Return.AirUnitReady("1./123.IAP") + Return.AirUnitReady("1./37.IAP") + Return.AirUnitReady("1./19.IAP") + Return.AirUnitReady("1./133.IAP") + Return.AirUnitReady("1./153.IAP") < 8',
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
	['GroundUnitRepair'] = {
		['condition'] = 'true',
		['action'] = 'Action.GroundUnitRepair()',
		['active'] = true,
	},
	['Campaign Briefing'] = {
		['condition'] = 'true',
		['once'] = true,
		['action'] = {
			[7] = 'Action.Text("US NAvy has sent the CVN-68 USS Nimitz (T.Roosvelt) and CV-67 USS John F. Kennedy (J.C. Stennis) which operates off the coast of Batumi, and VF 101 (your group) and VF 118/GA are ready for aggressive operation.")',
			[1] = 'Action.Text("After the effective political action of the Minister of the Interior, a group of Georgian nationalists led by the Army Corps General Baaka Kobakhidze, carried out a coup by supporting Georgian military forces and with the political and military support of some western countries coordinated by the USA. On 9 September 1975, Tbilissi government buildings were occupied by Georgian military forces, at the same time the airports of Tbilissi, Soganlug, Vaziani, Kutaisi, Batumi, Kobuleti, Senaki, Sukhumi and Gudauta were occupied by Western coalition and/or Georgian military forces (Georgian War Coalition).")',
			[2] = 'Action.Text("The Georgian War Coalition occupy the whole area of North Ossetia up to Kurta. During this expansion phase, Georgian forces manage to appropriate an important quantity of Russian military equipment, including: Mig-19, Mig-21, Mig-27, SU-17, AN-26 as well as SAM systems of the SA-2, SA-3, SA-6, SA-8, SA-9 with AAA ZSU-23, ZSU-57. ")',
			[4] = 'Action.Text("Against all odds, Russia reacts swiftly and forcefully to the attack by engaging an impressive amount of military air forces in support of the ground operations necessary to restore military control over Georgia. After being relegated to Sakire, the Russian forces present in North Ossetia launch an immediate counterattack that allows them to consolidate their position in the areas of Didmukha, Tskhinvali and Sathiari by rejecting Georgian forces in the areas of Tsveri, Tkviavi and Kaspi.")',
			[8] = 'Action.Text("The effectiveness of operations depends on obtaining air superiority, of destruction airbases, ground forces and on the integrity of supply asset (supply plant and supply line). Obviously, these assets are sensitive targets for the enemy, so it is very important to defend them and destroy those of the enemy. ")',
			[9] = 'Action.AddImage("Newspaper_FirstNight_blue.jpg", "blue")',
			[5] = 'Action.Text("At this stage of the conflict, the main Russian military air bases are Mineralnye, Nalchik, Beslan and Mozdok where are operative squadrons of Mig-21, Mig-23, Mig-25, Mig-27, Su-17, Su-24, L-39. Maykop and Mineralnye are used by heavy bomber Tu-22, Kransnodar and Nalchik are operative Tu-126 (A-50 :| ) Awacs. In many Russian airbases are operative An-26 for transport. Russian FARP are presents in Nogir, Tskhinvali and Lenigori area, where are operative Mi-8MTV2 and Mi-24 squads.")',
			[10] = 'Action.AddImage("Newspaper_FirstNight_red.jpg", "red")',
			[3] = 'Action.Text("The goal of the Georgian War Coalition is to exploit the weakness of the Soviet Union to establish control in this important area through important and explicit military action. The decision made by Western countries to participate directly in the military action is based on the security that the conflict will remain localized in the Caucasian area due to the extreme weakness and instability facing the entire Soviet Union.")',
			[6] = 'Action.Text("The main Georgian and Western Coalition military base are Batumi, Kutaisi, Tbilissi, Vaziani where are operative squadron of Mig-19, Mig-21, Mig-27, F-4E, F-5, AJS-37 (Sweden). Batumi airbase are operative heavy bomber B-52 and at Kutaisi airbase are operative some new E-3 Awacs. In many Georgian airbases are operative C-130 and An-26 for transport and KC135 for refuelling. Georgian FARP are presents in Gori, khashuri, Ambrolauri where are operative the 6th and 17th Cavalry with UH-1H and AH-1.")',
		},
		['active'] = false,
	},
	['Reinforce 1./41.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./41.IAP", "1./41.IAP", 8)',
		['active'] = true,
	},
	['Campaign End Loss'] = {
		['condition'] = 'Return.AirUnitAlive("VF-101") + Return.AirUnitReady("R/VF-101") < 5',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("Ongoing combat operations have exhausted VF-101 Squadron. Loss rate has reached a level where reinforcements are no longer able to sustain combat operations. With the failure of Allied Air Force to attain air superiority, US Central Command has decided to call of the air campaign against the Russians. Without destroying Russians airbases it seems unlikely that the coalition will be able to win this war.")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['NATO convoy 1 Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("NATO Convoy 1", {{"NATO convoy 1-1", "NATO convoy 1-2", "NATO convoy 1-3", "NATO convoy 1-4"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Maykop-Khanskaya Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Maykop-Khanskaya Airbase") < 2',
		['action'] = {
			[1] = 'db_airbases["Maykop-Khanskaya"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 174 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/174 ARW", "174 ARW", 4)',
		['active'] = true,
	},
	['Campaign End Loss 2'] = {
		['condition'] = 'Return.TargetAlive("CVN-71 Theodore Roosevelt") == 0',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("After the CVN-71 Theodore Roosevelt has been hit by air strikes and neutralised, VF-101 Squadron is no longer able to fly. Other US units will have to continue the fight without the VF-101 Squadron support. This is a bitter failure.")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Tbilissi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Tbilissi Airbase") < 7',
		['action'] = {
			[1] = 'db_airbases["Tbilissi-Lochini"].inactive = true',
		},
		['active'] = true,
	},
	['Repair'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitRepair()',
		['active'] = true,
	},
	['LHA-Group Patrol ATest Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("LHA-Group", {{"Indy 3-1", "Indy 3-2", "Indy 3-3", "Indy 3-4"}}, 10, 8, nil)',
		['active'] = false,
	},
	['Reinforce GAH 2rd'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GAH 2rd", "GAH 2rd", 16)',
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
	['Reinforce F9'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("F23", "F9", 12)',
		['active'] = true,
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
	['Reinforce GA 4rd AS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GA 4rd AS", "GA 4rd AS", 12)',
		['active'] = true,
	},
	['Nalchik Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Nalchik Airbase") < 2',
		['action'] = {
			[1] = 'db_airbases["Nalchik"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce GA 5rd TS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GA 5rd TS", "GA 5rd TS", 3)',
		['active'] = true,
	},
	['Reinforce GA 7rd AS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/GA 7rd AS", "GA 7rd AS", 12)',
		['active'] = true,
	},
	['Reinforce 1./37.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./37.IAP", "1./37.IAP", 12)',
		['active'] = true,
	},
	['Reinforce 317th Air Division'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/317th Air Division", "317th Air Division", 8)',
		['active'] = true,
	},
	['Senaki Airbase Disabled Text'] = {
		['condition'] = 'Return.TargetAlive("Senaki Airbase") < 12',
		['once'] = false,
		['action'] = {
			[1] = 'Action.Text("After the facilities at Senaki-Kolkhi Airbase have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer ably to produce any aviation sorties.")',
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
	['Reinforce VF-101'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VF-101", "VF-101", 16)',
		['active'] = true,
	},
	['Reinforce 1./111AS.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./111AS.IAP", "1./111AS.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 1./115AS.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./115AS.IAP", "1./115AS.IAP", 8)',
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
	['Reinforce VMFA-159'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VMFA-151", "VMFA-151", 4)',
		['active'] = true,
	},
	['Campaign 40 percents destructions'] = {
		['condition'] = 'GroundTarget["red"].percent < 60',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained great damages. Strike missions are really efficient and we will win this war soon")',
		},
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
	['Reinforce 25.OSAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/25.OSAP", "25.OSAP", 4)',
		['active'] = true,
	},
	['Reinforce 1./133.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./133.IAP", "1./133.IAP", 8)',
		['active'] = true,
	},
	['Reinforce 2nd GHR'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/2nd GHR", "2nd GHR", 8)',
		['active'] = true,
	},
	['Kutaisi Airbase Disabled'] = {
		['condition'] = 'Return.TargetAlive("Kutaisi Airbase") < 11',
		['action'] = {
			[1] = 'db_airbases["Kutaisi"].inactive = true',
		},
		['active'] = true,
	},
	['Reinforce 1st GHR'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/1st GHR", "1st GHR", 8)',
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
	['Reinforce 23.OSAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/23.OSAP", "23.OSAP", 4)',
		['active'] = true,
	},
	['Reinforce 1./81.IAP'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R./81.IAP", "1./81.IAP", 8)',
		['active'] = true,
	},
}
