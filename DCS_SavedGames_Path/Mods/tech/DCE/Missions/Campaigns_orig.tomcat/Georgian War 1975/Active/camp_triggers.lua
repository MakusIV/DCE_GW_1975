camp_triggers = {
	['Reinforce 81 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("82 TFS", "81 TFS", 4)',
		['active'] = true,
	},
	['LHA Group No Enter Guldf of Oman'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("LHA Group", {"", {"LHA-2", "LHA-1", "LHA-3", "LHA-4"}}, 10, 8, nil)',
		},
		['active'] = false,
	},
	['Campaign End Loss 3'] = {
		['condition'] = 'GroundTarget["red"].percent < 30',
		['once'] = true,
		['action'] = {
			[6] = 'NoMoreNewspaper = true',
			[2] = 'Action.Text("Iranian forces inflicted enormous losses on enemy troops and all targets were met. The US will have to leave Oman to avoid more casualties.")',
			[3] = 'Action.Text("Les forces iraniennes ont infligé des pertes énormes aux troupes ennemies et tous les objectifs ont été atteints. Les USA vont devoir quitter Oman pour éviter plus de pertes.")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[5] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
		},
		['active'] = true,
	},
	['TF-74 Patrol Gulf of Oman'] = {
		['condition'] = 'Return.TargetAlive("Bandar-E-Jask Silkworm Battery") == 0 and Return.TargetAlive("Iranian suicide speedboat fleet-1") == 0 and Return.TargetAlive("Bandar e Jask airfield") == 0 and Return.TargetAlive("Bandar e Jask airfield Strategics") == 0',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("TF-74", {"", {"TF-74-2", "TF-74-4", "TF-74-5", "TF-74-6"}}, 10, 8, nil)',
		},
		['active'] = true,
	},
	['Campaign 40 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 60',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained great damages. Strike missions are really efficient and we will win this war soon")',
			[2] = 'Action.Text("Les cibles ennemies ont subi de gros dégâts. Les attaques au sol sont vraiment efficaces et nous gagnerons bientôt cette guerre")',
		},
		['active'] = true,
	},
	['Khasab Disabled'] = {
		['condition'] = 'Return.TargetAlive("Khasab Airbase") < 4 and Return.TargetAlive("Khasab Airbase Strategics") < 4',
		['action'] = {
			[1] = 'db_airbases["Khasab"].inactive = true',
			[2] = 'Action.Text("After the facilities at Khasab Airport have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer able to produce any aviation sorties.")',
			[3] = 'Action.Text("Après que les installations de l aéroport de Khasab aient été touchées par des frappes aériennes, les opérations aériennes de cette base se sont complètement arrêtées. Le renseignement estime qu en raison des lourds dommages infligés, la base n est plus en mesure de produire des sorties aériennes.")',
		},
		['active'] = true,
	},
	['Reinforce 21-2 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("22-2 TFS", "21-2 TFS", 6)',
		['active'] = true,
	},
	['TF-71 No Enter Guldf of Oman'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("TF-71", {"", {"TF-71-2", "TF-71-1", "TF-71-3", "TF-71-4"}}, 10, 8, nil)',
			[2] = 'Action.Text("Intelligence reports that Iranian defenses are still operating near the eastern entrance of the Strait of Hormuz. Until this threat has been eliminated, TF-71 will keep its distance and patrol in the Arabian Sea just outside the Gulf of Oman.")',
			[3] = 'Action.Text("Les services de renseignement rapportent que les défenses iraniennes fonctionnent toujours près de l entrée est du détroit d Ormuz. Tant que cette menace n aura pas été éliminée, le TF-71 gardera ses distances et patrouillera dans la mer d Oman juste à l extérieur du golfe d Oman.")',
		},
		['active'] = false,
	},
	['GroundUnitRepair'] = {
		['condition'] = 'true',
		['action'] = 'Action.GroundUnitRepair()',
		['active'] = true,
	},
	['Reinforce 71st FS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("71st FS Res", "71st FS", 12)',
		['active'] = true,
	},
	['Reinforce 41 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("141 TFS", "41 TFS", 4)',
		['active'] = true,
	},
	['Reinforce 72 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("73 TFS", "72 TFS", 6)',
		['active'] = true,
	},
	['Campaign End Draw'] = {
		['condition'] = 'MissionInstance == 40',
		['once'] = true,
		['action'] = {
			[1] = 'Action.CampaignEnd("draw")',
			[2] = 'Action.Text("The air campaign has seen a sustained period of inactivity. Seemingly unable to complete the destruction of the Islamic Republic Iranian Air Force and infrastructure, US Central Command has called off all squadrons from offensive operations. We hope negociations with Iranian will convince them to stop fortifications in the Persian Gulf")',
			[3] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce 83 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("84 TFS", "83 TFS", 4)',
		['active'] = true,
	},
	['Reinforce 171 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/171 ARW", "171 ARW", 3)',
		['active'] = true,
	},
	['LHA Group Patrol Gulf of Oman'] = {
		['condition'] = 'Return.TargetAlive("Bandar-E-Jask Silkworm Battery") == 0 and Return.TargetAlive("Iranian suicide speedboat fleet-1") == 0 and Return.TargetAlive("Bandar e Jask airfield") == 0 and Return.TargetAlive("Bandar e Jask airfield Strategics") == 0',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("LHA Group", {"", {"LHA-2", "LHA-4", "LHA-5", "LHA-6"}}, 10, 8, nil)',
		},
		['active'] = true,
	},
	['Reinforce 2nd Shaheen Squadron'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("2nd Shaheen Squadron Res", "2nd Shaheen Squadron", 12)',
		['active'] = true,
	},
	['Campaign 20 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 80',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("Enemy targets have sustained fair damages. Keep up the good work")',
			[2] = 'Action.Text("Les cibles ennemies ont subi des dommages moyens. Continuez votre bon travail")',
		},
		['active'] = true,
	},
	['Reinforce VMFA-312'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VMFA-312", "VMFA-312", 16)',
		['active'] = true,
	},
	['Reinforce VF-143'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VF-143", "VF-143", 16)',
		['active'] = true,
	},
	['Reinforce 50 Squadron'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("50 Squadron Res", "50 Squadron", 6)',
		['active'] = true,
	},
	['Campaign End Victory 2'] = {
		['condition'] = 'Return.AirUnitReady("81 TFS") + Return.AirUnitReady("23 TFS") + Return.AirUnitReady("91 TFS") + Return.AirUnitReady("41 TFS") + Return.AirUnitReady("72 TFS") + Return.AirUnitReady("51 TFS") + Return.AirUnitReady("21 TFS") + Return.AirUnitReady("83 TFS") + Return.AirUnitReady("21-2 TFS") + Return.AirUnitReady("21-3 TFS") + Return.AirUnitReady("21-4 TFS") < 2',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("The Islamic Republic Iranian Air Force is in ruins. After repeated air strikes and disastrous losses in air-air combat, the Iranians are no longer able to produce any sorties or offer any resistance. The US now owns complete air superiority. With the disappearance of the air threat. Once again the victorious Eagle has proved to be to leading fighter in the world. Well done.")',
			[3] = 'Action.AddImage("Newspaper_Victory_blue.jpg", "blue")',
			[1] = 'Action.CampaignEnd("win")',
			[4] = 'Action.AddImage("Newspaper_Defeat_red.jpg", "red")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce VAW-125'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VAW-125", "VAW-125", 4)',
		['active'] = true,
	},
	['Scud launcher 1 Activation'] = {
		['condition'] = 'Return.Mission() > 4',
		['once'] = true,
		['action'] = {
			[1] = 'Action.TargetActive("Scud 1",true)',
			[2] = 'Action.Text("A Scud launcher has been detected on the coastline far north of Bandar e Jask.")',
			[3] = 'Action.Text("Un lanceur Scud a été détecté le long de la côte loin au nord de Bandar e Jask.")',
		},
		['active'] = true,
	},
	['Iranian suicide speedboat fleet-1 second zone'] = {
		['condition'] = 'Return.Mission() > 3 and Return.TargetAlive("Iranian suicide speedboat fleet-1") > 0',
		['once'] = false,
		['action'] = {
			[1] = 'Action.ShipMission("Iranian suicide speedboat fleet-1", {"", {"Iranian suicide speedboat fleet-5", "Iranian suicide speedboat fleet-6", "Iranian suicide speedboat fleet-7", "Iranian suicide speedboat fleet-8"}}, 12, 8, nil)',
			[2] = 'Action.Text("Intelligence reports that Iranian suicide speed boat are operating near the Fleet")',
			[3] = 'Action.Text("Les services de renseignement rapportent que des bateaux-suicide iranien opèrent près de la TF")',
		},
		['active'] = true,
	},
	['Campaign End Loss'] = {
		['condition'] = 'Return.AirUnitAlive("VF-101") + Return.AirUnitReady("R/VF-101") < 2',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("Ongoing combat operations have exhausted 2nd Shaheen Squadron. Loss rate has reached a level where reinforcements are no longer able to sustain combat operations. With the failure of Allied Air Force to attain air superiority, US Central Command has decided to call of the air campaign against the Iranians. Without destroying Iranians airbases it seems unlikely that the coalition will be able to win this war.")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce 175 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/175 ARW", "175 ARW", 3)',
		['active'] = true,
	},
	['Reinforce 4eme RHA'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("3eme RHA", "4eme RHA", 6)',
		['active'] = true,
	},
	['Reinforce 174 ARW'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/174 ARW", "174 ARW", 6)',
		['active'] = true,
	},
	['Campaign End Loss 2'] = {
		['condition'] = 'Return.TargetAlive("CVN-71 Theodore Roosevelt") == 0',
		['once'] = true,
		['action'] = {
			[2] = 'Action.Text("After the CVN-71 Theodore Roosevelt has been hit by air strikes and sunk, VF-101 is no longer able to fly. Most of its planes are deep into the Caucasian waters and it will need a long time to restore this unit s capabilities. Other US units will have to continue the fight without the VF-101 support. This is a bitter failure for the Navy")',
			[3] = 'Action.AddImage("Newspaper_Victory_red.jpg", "red")',
			[1] = 'Action.CampaignEnd("loss")',
			[4] = 'Action.AddImage("Newspaper_Defeat_blue.jpg", "blue")',
			[5] = 'NoMoreNewspaper = true',
		},
		['active'] = true,
	},
	['Reinforce VF-101'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VF-101", "VF-101", 16)',
		['active'] = true,
	},
	['Repair'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitRepair()',
		['active'] = true,
	},
	['Reinforce 21 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("22 TFS", "21 TFS", 6)',
		['active'] = true,
	},
	['CVN-74 John C. Stennis sunk'] = {
		['condition'] = 'Return.TargetAlive("CVN-74 John C. Stennis") == 0',
		['action'] = {
			[1] = 'db_airbases["CVN-74 John C. Stennis"].inactive = true',
			[2] = 'Action.Text("After the CVN-74 John C. Stennis has been hit by air strikes and sunk, Squadrons are no longer able to fly. Most of its planes are deep into the Gulf waters and it will need a long time to restore this unit s capabilities")',
			[3] = 'Action.Text("Après que le CVN-74 John C. Stennis ait été touché par des frappes aériennes et coulé, les escadrons ne sont plus en mesure de voler. La plupart de ses avions sont au fond du Golfe et il faudra beaucoup de temps pour restaurer les capacités de cette unité")',
		},
		['active'] = true,
	},
	['Reinforce 74th FS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("74th FS Res", "74th FS", 4)',
		['active'] = true,
	},
	['Scud launcher 2 Activation'] = {
		['condition'] = 'Return.Mission() > 5',
		['once'] = true,
		['action'] = {
			[1] = 'Action.TargetActive("Scud 2",true)',
			[2] = 'Action.Text("A Scud launcher has been detected on Abu Musa Island.")',
			[3] = 'Action.Text("Un lanceur Scud a été détecté sur l île de Abu Musa.")',
		},
		['active'] = true,
	},
	['Red Ground Target Briefing Intel'] = {
		['condition'] = 'true',
		['action'] = 'Action.AddGroundTargetIntel("red")',
		['active'] = true,
	},
	['Reinforce 23 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("11 TFS", "23 TFS", 4)',
		['active'] = true,
	},
	['Reinforce 21-4 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("22-4 TFS", "21-4 TFS", 6)',
		['active'] = true,
	},
	['Campaign first destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 100',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("First targets have been destroyed. Keep up the good work")',
			[2] = 'Action.Text("Les premières cibles ont été détruites. Continuez votre bon travail")',
		},
		['active'] = true,
	},
	['CVN-71 Theodore Roosevelt sunk'] = {
		['condition'] = 'Return.TargetAlive("CVN-71 Theodore Roosevelt") == 0',
		['action'] = {
			[1] = 'db_airbases["CVN-71 Theodore Roosevelt"].inactive = true',
			[2] = 'Action.Text("After the CVN-71 Theodore Roosevelt has been hit by air strikes and sunk, Squadrons are no longer able to fly. Most of its planes are deep into the Gulf waters and it will need a long time to restore this unit s capabilities")',
			[3] = 'Action.Text("Après que le CVN-71 Theodore Roosevelt ait été touché par des frappes aériennes et coulé, les escadrons ne sont plus en mesure de voler. La plupart de ses avions sont au fond du Golfe et il faudra beaucoup de temps pour restaurer les capacités de cette unité")',
		},
		['active'] = true,
	},
	['Iranian suicide speedboat fleet-1 first zone'] = {
		['condition'] = 'Return.Mission() < 4 and Return.TargetAlive("Iranian suicide speedboat fleet-1") > 0',
		['once'] = false,
		['action'] = {
			[1] = 'Action.ShipMission("Iranian suicide speedboat fleet-1", {"", {"Iranian suicide speedboat fleet-1", "Iranian suicide speedboat fleet-2", "Iranian suicide speedboat fleet-3", "Iranian suicide speedboat fleet-4"}}, 12, 8, nil)',
			[2] = 'Action.Text("Intelligence reports that Iranian suicide speed boat are operating south of Bandar E Jask airfield")',
			[3] = 'Action.Text("Les services de renseignement rapportent que des bateaux-suicide iranien opèrent au sud de l aérodrome de Bandar E Jask")',
		},
		['active'] = true,
	},
	['Reinforce VMA 311'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("VMA 331", "VMA 311", 4)',
		['active'] = true,
	},
	['Scud launcher 3 Activation'] = {
		['condition'] = 'Return.Mission() > 7',
		['once'] = true,
		['action'] = {
			[1] = 'Action.TargetActive("Scud 3",true)',
			[2] = 'Action.Text("A new Scud launcher has been detected on Abu Musa Island.")',
			[3] = 'Action.Text("Un autre lanceur Scud a été détecté sur l île de Abu Musa.")',
		},
		['active'] = true,
	},
	['Reinforce 91 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("31 TFS", "91 TFS", 4)',
		['active'] = true,
	},
	['Reinforce 41 TAS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/41 TAS", "41 TAS", 1)',
		['active'] = true,
	},
	['Campaign End Victory 1'] = {
		['condition'] = 'GroundTarget["blue"].percent < 40',
		['once'] = true,
		['action'] = {
			[6] = 'NoMoreNewspaper = true',
			[2] = 'Action.Text("Allied forces inflicted enormous losses on Iranian troops and all targets were met. The Iranians will have to leave Oman to avoid more casualties. Good game")',
			[3] = 'Action.Text("Les forces alliées ont infligé des pertes énormes aux troupes iraniennes et tous les objectifs ont été atteints. Les iraniens vont devoir quitter Oman pour éviter plus de pertes. Bien joué")',
			[1] = 'Action.CampaignEnd("win")',
			[4] = 'Action.AddImage("Newspaper_Victory_blue.jpg", "blue")',
			[5] = 'Action.AddImage("Newspaper_Defeat_red.jpg", "red")',
		},
		['active'] = true,
	},
	['Campaign Briefing'] = {
		['condition'] = 'true',
		['once'] = true,
		['action'] = {
			[6] = 'Action.Text("Les iraniens disposent encore de quelques Tomcat, de F-4, de F-5E et d un escdaron de Mig-29. Des SU-24 seront leur atout majeur pour le Air-Sol. De nombreux sites de missiles Air-Sol défendent le sol Iranien et nous ignorons encore ce qui a pu être déployé sur la tête de pont mais des émissions radar sont nombreuses et il est probable que des systèmes Rapier soient déployés sur place avec beaucoup de Manpad. L objectif principal des alliés sera pour commencer d acquérir la supériorité aérienne puis de détruire toutes les forces navales et terrestres à proximité et sur le territoire d Oman. La base de Bandar e Jask devra être neutralisée pour permettre à la flotte de s approcher de la zone. Il est possible que des Scuds soient mis en oeuvre mais nous ignorons leurs positions. Des forces spéciales ont été déployées dans les montagnes et pourront ponctuellement être utilisées pour guider les frappes et trouver plus facilement des objectifs en territoire ennemi -Pour le multiplayer seulement avec combined arms et un humain JTAC-.")',
			[2] = 'Action.Text("L Iran a attaqué Oman et plusieurs points de débarquement sont signalés au nord de la presqu île. Nous ignorons quel est l objectif final des Iraniens mais il est à craindre qu ils foncent vers le sud pour envahir les EAU en profitant de la surprise et des forces relativement faibles pour l instant.")',
			[8] = 'Action.AddImage("Newspaper_FirstNight_red.jpg", "red")',
			[3] = 'Action.Text("The US has not yet been able to project all its forces into the UAE and the US Air Force has only half a squadron of A-10C IIs, AWACS and tankers. The US Navy, however, has two CVNs with 2 squadrons of Tomcats and two of Hornets. The UAE has Mirage and Falcon.France has sent a modest force of combat helicopters with Gazelles.")',
			[1] = 'Action.Text("Iran attacked Oman and several landing points are reported north of the peninsula. We do not know what the final objective of the Iranians is, but it is feared that they will rush south to invade the UAE taking advantage of the surprise and the relatively weak forces at the moment.")',
			[4] = 'Action.Text("Les USA nont pas encore pu projeter toutes leurs forces aux EAU et US Air Force ne dispose que d un demi escadron de A-10C II, d AWACS et de ravitailleurs. L US Navy dispose cependant de deux CVN avec 2 escadrons de Tomcats et deux de Hornets. Les EAU disposent de Mirage et de Falcon.La France a envoyé une modeste force d hélicoptères de combat avec des Gazelles.")',
			[5] = 'Action.Text("The Iranians still have a few Tomcat, F-4, F-5E and a squadron of Mig-29. SU-24s will be their major asset for Air-Ground. Many Air-to-Sol missile sites defend Iranian soil and we still do not know what may have been deployed on the beachhead but radar emissions are numerous and it is likely that Rapier systems will be deployed on site with a lot of Manpads. The main objective of the Allies will be to first acquire air superiority and then destroy all naval and land forces in the vicinity and on the territory of Oman. The Bandar e Jask base will have to be neutralized to allow the fleet to approach the area. It is possible that Scuds will be implemented but we do not know their positions. Special forces have been deployed in the mountains and can occasionally be used to guide strikes and more easily find objectives in enemy territory-For multiplayer only with combined arms and a human JTAC-.")',
			[7] = 'Action.AddImage("Newspaper_FirstNight_blue.jpg", "blue")',
		},
		['active'] = false,
	},
	['4th Iranian Transport fleet Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("4th Iranian Transport fleet", {{"4th Iranian Transport fleet-1", "4th Iranian Transport fleet-2", "4th Iranian Transport fleet-3", "4th Iranian Transport fleet-4", "4th Iranian Transport fleet-5", "4th Iranian Transport fleet-6"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Reinforce VFA-106'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("R/VFA-106", "VFA-106", 16)',
		['active'] = true,
	},
	['TF-71 Patrol Gulf of Oman'] = {
		['condition'] = 'Return.TargetAlive("Bandar-E-Jask Silkworm Battery") == 0 and Return.TargetAlive("Iranian suicide speedboat fleet-1") == 0 and Return.TargetAlive("Bandar e Jask airfield") == 0 and Return.TargetAlive("Bandar e Jask airfield Strategics") == 0',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("TF-71", {"", {"TF-71-2", "TF-71-4", "TF-71-5", "TF-71-6"}}, 10, 8, nil)',
			[2] = 'Action.Text("After the destruction of the Iranian threats near the eastern entrance of the Strait of Hormuz, TF-71 is allowed to move into and patrol deeper within the Gulf of Oman. This will shorten distance to targets for the Carrier Air Group, allowing less fuel and heavier weapon loads and facilitate striking targets deeper within Iran.")',
			[3] = 'Action.Text("Après la destruction des menaces iraniennes près de l entrée est du détroit d Ormuz, le TF-71 est autorisé à pénétrer et à patrouiller plus profondément dans le golfe d Oman. Cela raccourcira la distance par rapport aux cibles du groupe aéronaval, permettant moins de carburant et des charges d armes plus lourdes et facilitera la frappe de cibles plus profondément en Iran.")',
		},
		['active'] = true,
	},
	['CAP After EWR Destroyed'] = {
		['condition'] = 'Return.TargetAlive("EWR 1") == 0 and Return.TargetAlive("EWR 2") == 0 and Return.TargetAlive("EWR 3") == 0',
		['once'] = true,
		['action'] = {
			[7] = 'Action.TargetActive("Bandar Abbas Intl 100 Km Alert", false)',
			[1] = 'Action.TargetActive("Lar Airbase Alert", false)',
			[2] = 'Action.TargetActive("Shiraz Intl Alert", false)',
			[4] = 'Action.TargetActive("Bandar e Jask airfield Alert 50", false)',
			[8] = 'Action.Text("With the recent destruction of all Early Warning Radar sites in the operations area, the ability of the enemy to launch interceptors against our strike packages was severely degraded. Intelligence expects that the enemy will increasingly depend on Combat Air Patrols to compensate, though without the support of ground controllers these are estimated to be of limited effectiveness.")',
			[9] = 'Action.Text("Avec la destruction récente de tous les sites de radar d alerte précoce dans la zone d opérations, la capacité de l ennemi à lancer des intercepteurs contre nos paquets de frappe a été gravement dégradée. Le renseignement s attend à ce que l ennemi dépende de plus en plus des CAP pour compenser, bien que sans le soutien des contrôleurs au sol, on estime que leur efficacité est limitée.")',
			[5] = 'Action.TargetActive("Qeshm Island Alert", false)',
			[3] = 'Action.TargetActive("Bandar e Jask airfield Alert", false)',
			[6] = 'Action.TargetActive("Khasab Alert", false)',
		},
		['active'] = true,
	},
	['LHA_Tarawa'] = {
		['condition'] = 'Return.TargetAlive("LHA_Tarawa") == 0',
		['action'] = {
			[1] = 'db_airbases["LHA_Tarawa"].inactive = true',
			[2] = 'Action.Text("After the LHA_Tarawa has been hit by air strikes and sunk, VMA 311 is no longer able to fly. Most of its planes are deep into the Gulf waters and it will need a long time to restore this unit s capabilities")',
			[3] = 'Action.Text("Après que le LHA_Tarawa ait été touché par des frappes aériennes et coulé, le VMA 311 n est plus en mesure de voler. La plupart de ses avions sont au fond du Golfe et il faudra beaucoup de temps pour restaurer les capacités de cette unité.")',
		},
		['active'] = true,
	},
	['3rd Iranian Transport fleet Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("3rd Iranian Transport fleet", {{"3rd Iranian Transport fleet-1", "3rd Iranian Transport fleet-2", "3rd Iranian Transport fleet-3", "3rd Iranian Transport fleet-4", "3rd Iranian Transport fleet-5", "3rd Iranian Transport fleet-6", "3rd Iranian Transport fleet-7"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Reinforce 51 Squadron'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("51 Squadron Res", "51 Squadron", 2)',
		['active'] = true,
	},
	['Campaign 50 percents destructions'] = {
		['condition'] = 'GroundTarget["blue"].percent < 50',
		['once'] = true,
		['action'] = {
			[1] = 'Action.Text("More than half of our targets are neutralized. Intelligence think that the enemy will ask for a cease fire soon")',
			[2] = 'Action.Text("Plus de la moitié de nos cibles sont neutralisées. Les renseignements pensent que l ennemi demandera bientôt un cessez-le-feu")',
		},
		['active'] = true,
	},
	['Reinforce 21-3 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("22-3 TFS", "21-3 TFS", 10)',
		['active'] = true,
	},
	['1st Iranian Transport fleet Sea'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = 'Action.ShipMission("1st Iranian Transport fleet", {{"Iran Naval Group -1-1", "Iran Naval Group -1-2", "Iran Naval Group -1-3", "Iran Naval Group -1-4", "Iran Naval Group -1-5", "Iran Naval Group -1-6"}}, 8, 5, nil)',
		['active'] = false,
	},
	['Blue Ground Target Briefing Intel'] = {
		['condition'] = 'true',
		['action'] = 'Action.AddGroundTargetIntel("blue")',
		['active'] = true,
	},
	['Abu Musa Island Airport Disabled'] = {
		['condition'] = 'Return.TargetAlive("Abu Musa Island Airport") < 2 and Return.TargetAlive("Abu Musa Island Airport Strategics") < 4',
		['action'] = {
			[1] = 'db_airbases["Abu Musa Island Airport"].inactive = true',
			[2] = 'Action.Text("After the facilities at Abu Musa Island Airport have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer able to produce any aviation sorties.")',
		},
		['active'] = true,
	},
	['Reinforce 51 TFS'] = {
		['condition'] = 'true',
		['action'] = 'Action.AirUnitReinforce("52 TFS", "51 TFS", 6)',
		['active'] = true,
	},
	['TF-74 No Enter Guldf of Oman'] = {
		['condition'] = 'Return.Mission() == 1',
		['once'] = true,
		['action'] = {
			[1] = 'Action.ShipMission("TF-74", {"", {"TF-74-2", "TF-74-1", "TF-74-3", "TF-74-4"}}, 10, 8, nil)',
		},
		['active'] = false,
	},
	['Bandar e Jask airfield Disabled'] = {
		['condition'] = 'Return.TargetAlive("Bandar e Jask airfield") < 3 and Return.TargetAlive("Bandar e Jask airfield Strategics") < 3',
		['action'] = {
			[1] = 'db_airbases["Bandar e Jask airfield"].inactive = true',
			[2] = 'Action.Text("Après que les installations de l aéroport de Bandar e Jask airfield have been hit by air strikes, air operations at this base came to a complete stop. Intelligence believes that due to the heavy damage inflicted, the base is no longer able to produce any aviation sorties.")',
			[3] = 'Action.Text("After the facilities at Bandar e Jask aient été touchées par des frappes aériennes, les opérations aériennes de cette base se sont complètement arrêtées. Le renseignement estime qu en raison des lourds dommages infligés, la base n est plus en mesure de produire des sorties aériennes.")',
		},
		['active'] = true,
	},
}
