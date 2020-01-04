GlobalConfig = {
--[[ 
Action IDS
It is advisable to use actionID only if you need to create a function that is called multiple times in different locations.
]]
	
	-- positions of exit shrines, for internal use, don't edit
	positionExitShrine = {
		Position(32026, 31511, 7),
		Position(32032, 31511, 7),
		Position(32027, 31515, 7),
		Position(32033, 31515, 7)
	},
	["ExitCarlin"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32360, 31781, 9), storageKey = Storage.Others.Shrine.Carlin},
	["ExitThais"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32369, 32242, 6), storageKey = Storage.Others.Shrine.Thais},
	["ExitVenore"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32958, 32077, 5), storageKey = Storage.Others.Shrine.Venore},
	["ExitAbDendriel"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32681, 31686, 2), storageKey = Storage.Others.Shrine.AbDendriel},
	["ExitKazordoon"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32646, 31925, 11), storageKey = Storage.Others.Shrine.Kazordoon},
	["ExitDarashia"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(33230, 32392, 5), storageKey = Storage.Others.Shrine.Darashia},
	["ExitAndrahmun"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(33130, 32815, 4), storageKey = Storage.Others.Shrine.Andrahmun},
	["ExitEdron"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(33266, 31835, 9), storageKey = Storage.Others.Shrine.Edron},
	["ExitLibertyBay"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32337, 32837, 8), storageKey = Storage.Others.Shrine.LibertyBay},
	["ExitPortHope"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32628, 32743, 4), storageKey = Storage.Others.Shrine.PortHope},
	["ExitSvarground"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32213, 31132, 8), storageKey = Storage.Others.Shrine.Svarground},
	["ExitYalahar"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(32786, 31245, 5), storageKey = Storage.Others.Shrine.Yalahar},
	["ExitOramond"] = {actionId = 30000, itemId = 775, itemPos = positionExitShrine, destination = Position(33594, 31899, 4), storageKey = Storage.Others.Shrine.ExitOramond},

	["PremiumBridge"] = {actionId = 30001, itemId = 10904, itemPos = {Position(32063, 32192, 7), Position(32063, 32193, 7)}, destination = Position(32066, 32192, 7), effect = CONST_ME_MAGIC_BLUE},-- rookgaard premium bridge
	
	
--[[ 
Unique IDS
As the name implies, it should be used in unique functions, where they should only be repeated once per action. It is advisable to use the uniques, because when repeated their use, the log of the repetition is returned in distro. It also does not risk conflicting with storages and other types of actions.

From UID 5013 to UID 5999 is reserved for general teleports
From UID 6021 to UID 6099 is reserved for tombs basins teleport
]]

	["Teleport"] = {uniqueId = 5000, itemId = 1949, itemPos = Position(33148, 32864, 7), destination = Position(33151, 32864, 7)},-- ankrahmun
	["Teleport1"] = {uniqueId = 5001, itemId = 1949, itemPos = Position(33150, 32864, 7), destination = Position(33147, 32864, 7)},-- ankrahmun
	["Teleport2"] = {uniqueId = 5002, itemId = 19200, itemPos = Position(32724, 31666, 6), destination = Position(32667, 31681, 6)},-- ab'dendriel
	["Teleport3"] = {uniqueId = 5003, itemId = 19200, itemPos = Position(32669, 31681, 6), destination = Position(32726, 31666, 6)},-- ab'dendriel
	["Teleport4"] = {uniqueId = 5004, itemId = 19200, itemPos = Position(32664, 31677, 6), destination = Position(32674, 31617, 6)},-- ab'dendriel
	["Teleport5"] = {uniqueId = 5005, itemId = 19200, itemPos = Position(32676, 31617, 6), destination = Position(32664, 31679, 6)},-- ab'dendriel
	["Teleport6"] = {uniqueId = 5006, itemId = 19200, itemPos = Position(32653, 31688, 6), destination = Position(32658, 31688, 8)},-- ab'dendriel
	["Teleport7"] = {uniqueId = 5007, itemId = 19200, itemPos = Position(32656, 31688, 8), destination = Position(32655, 31688, 6)},-- ab'dendriel
	
	["Teleport8"] = {uniqueId = 5008, itemId = 1949, itemPos = Position(32858, 32667, 8), destination = Position(32857, 32667, 9)},-- port hope: deeper banuta shortcut
	["Teleport9"] = {uniqueId = 5009, itemId = 1949, itemPos = Position(32888, 32632, 11), destination = Position(32892, 32632, 11)},-- port hope: deeper banuta shortcut
	["Teleport10"] = {uniqueId = 5010, itemId = 1949, itemPos = Position(32890, 32632, 11), destination = Position(32886, 32632, 11)},-- port hope: deeper banuta shortcut
	["Teleport11"] = {uniqueId = 5011, itemId = 1949, itemPos = Position(32817, 32510, 7), destination = Position(32866, 32452, 9)},-- port hope: deathlings entrance
	["Teleport12"] = {uniqueId = 5012, itemId = 1949, itemPos = Position(32881, 32473, 9), destination = Position(32870, 32510, 7)},-- port hope: deathlings exit
	
	["Teleport13"] = {uniqueId = 5013, itemId = 21046, itemPos = Position(33651, 31941, 7), destination = Position(33559, 31970, 12)}, -- glooth entrance
	["Teleport14"] = {uniqueId = 5014, itemId = 21047, itemPos = Position(33558, 31970, 12), destination = Position(33651, 31942, 7)}, -- glooth exit
	["Teleport15"] = {uniqueId = 5015, itemId = 21046, itemPos = Position(33492, 31985, 7), destination = Position(33539, 32014, 6)}, -- rathleton entrance
	["Teleport16"] = {uniqueId = 5016, itemId = 21048, itemPos = Position(33535, 32022, 6), destination = Position(33491, 31985, 7)}, -- rathleton back 
	
	["Teleport17"] = {uniqueId = 5017, itemId = 8193, itemPos = Position(32950, 31552, 3), destination = Position(32943, 31553, 1)},
	["Teleport18"] = {uniqueId = 5018, itemId = 8193, itemPos = Position(32939, 31558, 1), destination = Position(32938, 31573, 0)},
	["Teleport19"] = {uniqueId = 5019, itemId = 8193, itemPos = Position(32941, 31578, 0), destination = Position(32950, 31575, 1)},
	["Teleport20"] = {uniqueId = 5020, itemId = 8193, itemPos = Position(32952, 31567, 1), destination = Position(32961, 31559, 1)},
	["Teleport21"] = {uniqueId = 5021, itemId = 8193, itemPos = Position(32962, 31551, 1), destination = Position(32959, 31540, 4)},
	["Teleport22"] = {uniqueId = 5022, itemId = 8193, itemPos = Position(32960, 31541, 4), destination = Position(32961, 31552, 1)},
	["Teleport23"] = {uniqueId = 5023, itemId = 8193, itemPos = Position(32960, 31560, 1), destination = Position(32951, 31568, 1)},
	["Teleport24"] = {uniqueId = 5024, itemId = 8193, itemPos = Position(32951, 31575, 1), destination = Position(32940, 31577, 0)},
	["Teleport25"] = {uniqueId = 5025, itemId = 8193, itemPos = Position(32937, 31573, 0), destination = Position(32940, 31558, 1)},
	["Teleport26"] = {uniqueId = 5026, itemId = 8193, itemPos = Position(32944, 31553, 1), destination = Position(32951, 31552, 3)},
	
	["Teleport27"] = {uniqueId = 5027, itemId = 6763, itemPos = Position(32356, 31780, 9), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Carlin}, -- ice shrine (carlin)
	["Teleport28"] = {uniqueId = 5028, itemId = 6175, itemPos = Position(32364, 31780, 9), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Carlin}, -- earth shrine (carlin)
	["Teleport29"] = {uniqueId = 5029, itemId = 5064, itemPos = Position(32356, 31783, 9), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Carlin}, -- fire shrine (carlin)
	["Teleport30"] = {uniqueId = 5030, itemId = 7510, itemPos = Position(32364, 31783, 9), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Carlin}, -- energy shrine (carlin)
	["Teleport31"] = {uniqueId = 5031, itemId = 6763, itemPos = Position(32358, 32242, 6), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Thais}, -- ice shrine (thais)
	["Teleport32"] = {uniqueId = 5032, itemId = 6174, itemPos = Position(32360, 32239, 6), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Thais}, -- earth shrine (thais)
	["Teleport33"] = {uniqueId = 5033, itemId = 5067, itemPos = Position(32379, 32242, 6), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Thais}, -- fire shrine (thais)
	["Teleport34"] = {uniqueId = 5034, itemId = 7509, itemPos = Position(32377, 32239, 6), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Thais}, -- energy shrine (thais)
	["Teleport35"] = {uniqueId = 5035, itemId = 6763, itemPos = Position(32954, 32076, 5), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Venore}, -- ice shrine (venore)
	["Teleport36"] = {uniqueId = 5036, itemId = 6174, itemPos = Position(32958, 32079, 5), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Venore}, -- earth shrine (venore)
	["Teleport37"] = {uniqueId = 5037, itemId = 5067, itemPos = Position(32961, 32076, 5), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Venore}, -- fire shrine (venore)
	["Teleport38"] = {uniqueId = 5038, itemId = 7509, itemPos = Position(32958, 32072, 5), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Venore}, -- energy shrine (venore)
	["Teleport39"] = {uniqueId = 5039, itemId = 6763, itemPos = Position(32678, 31688, 2), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.AbDendriel}, -- ice shrine (ab'dendriel)
	["Teleport40"] = {uniqueId = 5040, itemId = 6175, itemPos = Position(32678, 31686, 2), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.AbDendriel}, -- earth shrine (ab'dendriel)
	["Teleport41"] = {uniqueId = 5041, itemId = 5064, itemPos = Position(32678, 31684, 2), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.AbDendriel}, -- fire shrine (ab'dendriel)
	["Teleport42"] = {uniqueId = 5042, itemId = 7509, itemPos = Position(32681, 31683, 2), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.AbDendriel}, -- energy shrine (ab'dendriel)
	["Teleport43"] = {uniqueId = 5043, itemId = 6765, itemPos = Position(32643, 31928, 11), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Kazordoon}, -- ice shrine (kazordoon)
	["Teleport44"] = {uniqueId = 5044, itemId = 6174, itemPos = Position(32649, 31928, 11), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Kazordoon}, -- earth shrine (kazordoon)
	["Teleport45"] = {uniqueId = 5045, itemId = 5066, itemPos = Position(32649, 31921, 11), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Kazordoon}, -- fire shrine (kazordoon)
	["Teleport46"] = {uniqueId = 5046, itemId = 7509, itemPos = Position(32643, 31921, 11), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Kazordoon}, -- energy shrine (kazordoon)
	["Teleport47"] = {uniqueId = 5047, itemId = 6765, itemPos = Position(32229, 32389, 5), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Darashia}, -- ice shrine (darashia)
	["Teleport48"] = {uniqueId = 5048, itemId = 6174, itemPos = Position(32232, 32389, 5), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Darashia}, -- earth shrine (darashia)
	["Teleport49"] = {uniqueId = 5049, itemId = 5066, itemPos = Position(32235, 32389, 5), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Darashia}, -- fire shrine (darashia)
	["Teleport50"] = {uniqueId = 5050, itemId = 7509, itemPos = Position(32226, 32389, 5), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Darashia}, -- energy shrine (darashia)
	["Teleport51"] = {uniqueId = 5051, itemId = 6763, itemPos = Position(33126, 32812, 4), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Andrahmun}, -- ice shrine (ankrahmun)
	["Teleport52"] = {uniqueId = 5052, itemId = 6174, itemPos = Position(33131, 32806, 4), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Andrahmun}, -- earth shrine (ankrahmun)
	["Teleport53"] = {uniqueId = 5053, itemId = 5064, itemPos = Position(33126, 32820, 4), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Andrahmun}, -- fire shrine (ankrahmun)
	["Teleport54"] = {uniqueId = 5054, itemId = 7509, itemPos = Position(33131, 32823, 4), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Andrahmun}, -- energy shrine (ankrahmun)
	["Teleport55"] = {uniqueId = 5055, itemId = 6763, itemPos = Position(33264, 31837, 9), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Edron}, -- ice shrine (edron)
	["Teleport56"] = {uniqueId = 5056, itemId = 6174, itemPos = Position(33266, 31831, 9), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Edron}, -- earth shrine (edron)
	["Teleport57"] = {uniqueId = 5057, itemId = 5066, itemPos = Position(33271, 31831, 9), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Edron}, -- fire shrine (edron)
	["Teleport58"] = {uniqueId = 5058, itemId = 7510, itemPos = Position(33271, 31837, 9), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Edron}, -- energy shrine (edron)
	["Teleport59"] = {uniqueId = 5059, itemId = 6763, itemPos = Position(32333, 32838, 8), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.LibertyBay}, -- ice shrine (liberty bay)
	["Teleport60"] = {uniqueId = 5060, itemId = 6174, itemPos = Position(32339, 32842, 8), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.LibertyBay}, -- earth shrine (liberty bay)
	["Teleport61"] = {uniqueId = 5061, itemId = 5067, itemPos = Position(32343, 32838, 8), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.LibertyBay}, -- fire shrine (liberty bay)
	["Teleport62"] = {uniqueId = 5062, itemId = 7509, itemPos = Position(32339, 32832, 8), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.LibertyBay}, -- energy shrine (liberty bay)
	["Teleport63"] = {uniqueId = 5063, itemId = 6763, itemPos = Position(32624, 32744, 4), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.PortHope}, -- ice shrine (port hope)
	["Teleport64"] = {uniqueId = 5064, itemId = 6174, itemPos = Position(32625, 32740, 4), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.PortHope}, -- earth shrine (port hope)
	["Teleport65"] = {uniqueId = 5065, itemId = 5066, itemPos = Position(32632, 32740, 4), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.PortHope}, -- fire shrine (port hope)
	["Teleport66"] = {uniqueId = 5066, itemId = 7510, itemPos = Position(32632, 32744, 4), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.PortHope}, -- energy shrine (port hope)
	["Teleport67"] = {uniqueId = 5067, itemId = 6765, itemPos = Position(32212, 31130, 8), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Svarground}, -- ice shrine (svargrond)
	["Teleport68"] = {uniqueId = 5068, itemId = 6175, itemPos = Position(32215, 31130, 8), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Svarground}, -- earth shrine (svargrond)
	["Teleport69"] = {uniqueId = 5069, itemId = 5064, itemPos = Position(32208, 31133, 8), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Svarground}, -- fire shrine (svargrond)
	["Teleport70"] = {uniqueId = 5070, itemId = 7509, itemPos = Position(32209, 31130, 8), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Svarground}, -- energy shrine (svargrond)
	["Teleport71"] = {uniqueId = 5071, itemId = 6765, itemPos = Position(32784, 31243, 5), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Yalahar}, -- ice shrine (yalahar)
	["Teleport72"] = {uniqueId = 5072, itemId = 6174, itemPos = Position(32787, 31243, 5), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Yalahar}, -- earth shrine (yalahar)
	["Teleport73"] = {uniqueId = 5073, itemId = 5066, itemPos = Position(32790, 31243, 5), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Yalahar}, -- fire shrine (yalahar)
	["Teleport74"] = {uniqueId = 5074, itemId = 7509, itemPos = Position(32781, 31243, 5), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Yalahar}, -- energy shrine (yalahar)
	["Teleport75"] = {uniqueId = 5075, itemId = 8193, itemPos = Position(32944, 31553, 1), destination = Position(32192, 31419, 2), storage = Storage.Others.Shrine.Oramond}, -- ice shrine (oramond)
	["Teleport76"] = {uniqueId = 5076, itemId = 8193, itemPos = Position(32944, 31553, 1), destination = Position(32972, 32227, 7), storage = Storage.Others.Shrine.Oramond}, -- earth shrine (oramond)
	["Teleport77"] = {uniqueId = 5077, itemId = 8193, itemPos = Position(32944, 31553, 1), destination = Position(32911, 32336, 15), storage = Storage.Others.Shrine.Oramond}, -- fire shrine (oramond)
	["Teleport78"] = {uniqueId = 5078, itemId = 8193, itemPos = Position(32944, 31553, 1), destination = Position(33059, 32716, 5), storage = Storage.Others.Shrine.Oramond}, -- energy shrine (oramond)
	
	["Teleport79"] = {uniqueId = 5079, itemId = 3042, itemPos = Position(33098, 32816, 13), destination = Position(33093, 32824, 13), teleportPosition = Position(33097, 32816, 13)}, -- tomb coal basin
	["Teleport80"] = {uniqueId = 5080, itemId = 3042, itemPos = Position(33093, 32741, 13), destination = Position(33299, 32742, 13), teleportPosition = Position(33293, 32742, 13)}, -- tomb coal basin
	["Teleport81"] = {uniqueId = 5081, itemId = 3042, itemPos = Position(33073, 32589, 13), destination = Position(33080, 32588, 13), teleportPosition = Position(33073, 32590, 13)}, -- tomb coal basin
	["Teleport82"] = {uniqueId = 5082, itemId = 3042, itemPos = Position(33240, 32855, 13), destination = Position(33246, 32850, 13), teleportPosition = Position(33240, 32856, 13)}, -- tomb coal basin
	["Teleport83"] = {uniqueId = 5083, itemId = 3042, itemPos = Position(33276, 32552, 14), destination = Position(33271, 32553, 14), teleportPosition = Position(33276, 32553, 14)}, -- tomb coal basin
	["Teleport84"] = {uniqueId = 5084, itemId = 3042, itemPos = Position(33233, 32692, 13), destination = Position(33234, 32687, 13), teleportPosition = Position(33234, 32692, 13)}, -- tomb coal basin
	["Teleport85"] = {uniqueId = 5085, itemId = 3042, itemPos = Position(33135, 32682, 12), destination = Position(33130, 32683, 12), teleportPosition = Position(33135, 32683, 12)}, -- tomb coal basin
	["Teleport86"] = {uniqueId = 5086, itemId = 3042, itemPos = Position(33161, 32831, 10), destination = Position(33158, 32832, 10), teleportPosition = Position(33162, 32831, 10)}, -- tomb coal basin
	
	["Teleport87"] = {uniqueId = 5087, itemId = 3042, itemPos = Position(32624, 31853, 11), destination = Position(32243, 32598, 8)},-- the spike entrance
	["Teleport88"] = {uniqueId = 5088, itemId = 3042, itemPos = Position(32243, 32596, 8), destination = Position(32624, 31855, 11)},-- the spike exit
	["Teleport89"] = {uniqueId = 5089, itemId = 3042, itemPos = Position(32234, 32604, 8), levelMin = 25, levelMax = 49, destination = Position(32228, 32596, 8)},-- entrance 
	["Teleport90"] = {uniqueId = 5090, itemId = 3042, itemPos = Position(32226, 32595, 8), destination = Position(32237, 32605, 8)}, -- exit 
	["Teleport91"] = {uniqueId = 5091, itemId = 3042, itemPos = Position(32234, 32604, 9), levelMin = 50, levelMax = 79, destination = Position(32243, 32619, 9)}, -- entrance 
	["Teleport92"] = {uniqueId = 5092, itemId = 3042, itemPos = Position(32242, 32620, 9), destination = Position(32237, 32605, 9)}, -- exit
	["Teleport93"] = {uniqueId = 5093, itemId = 3042, itemPos = Position(32234, 32604, 10), levelMin = 80, levelMax = 100000, destination = Position(32240, 32620, 10)}, -- entrance
	["Teleport94"] = {uniqueId = 5094, itemId = 3042, itemPos = Position(32240, 32621, 10), destination = Position(32237, 32605, 10)}, -- exit
	["Teleport95"] = {uniqueId = 5095, itemId = 3042, itemPos = Position(32234, 32604, 11), levelMin = 80, levelMax = 100000, destination = Position(32227, 32598, 11)}, -- entrance
	["Teleport96"] = {uniqueId = 5096, itemId = 3042, itemPos = Position(32226, 32598, 11), destination = Position(32237, 32605, 11)}, -- exit
	["Teleport97"] = {uniqueId = 5097, itemId = 3042, itemPos = Position(32234, 32604, 12), levelMin = 80, levelMax = 100000, destination = Position(32238, 32622, 12)}, -- entrance
	["Teleport98"] = {uniqueId = 5098, itemId = 3042, itemPos = Position(32238, 32623, 12), destination = Position(32237, 32605, 12)}, -- exit
	["Teleport99"] = {uniqueId = 5099, itemId = 3042, itemPos = Position(32238, 32831, 13), levelMin = 80, levelMax = 100000, destination = Position(32244, 32619, 13)}, -- entrance
	["Teleport100"] = {uniqueId = 5100, itemId = 3042, itemPos = Position(32244, 32620, 13), destination = Position(32237, 32605, 13)}, -- exit
	["Teleport101"] = {uniqueId = 5101, itemId = 3042, itemPos = Position(32238, 32831, 14), levelMin = 80, levelMax = 100000, destination = Position(32244, 32588, 14)}, -- entrance
	["Teleport102"] = {uniqueId = 5102, itemId = 3042, itemPos = Position(32244, 32587, 14), destination = Position(32237, 32605, 14)}, -- exit
	["Teleport103"] = {uniqueId = 5103, itemId = 3042, itemPos = Position(32238, 32831, 15), levelMin = 80, levelMax = 100000, destination = Position(32224, 32606, 15)}, -- entrance
	["Teleport104"] = {uniqueId = 5104, itemId = 3042, itemPos = Position(32223, 32606, 15), destination = Position(32237, 32605, 15)},-- exit
	
	["Teleport105"] = {uniqueId = 5104, itemId = 3042, townId = 1, itemPos = Position(32951, 32035, 7), destination = Position(32957, 32076, 7)}, -- become citizen venore
	["Teleport106"] = {uniqueId = 5104, itemId = 3042, townId = 2, itemPos = Position(32369, 32246, 6), destination = Position(32369, 32241, 7)}, -- become citizen thais
	["Teleport107"] = {uniqueId = 5104, itemId = 3042, townId = 3, itemPos = Position(32642, 31925, 12), destination = Position(32649, 31925, 11)}, -- become citizen kazordoon
	["Teleport108"] = {uniqueId = 5104, itemId = 3042, townId = 4, itemPos = Position(32360, 31784, 8), destination = Position(32360, 31782, 7)}, -- become citizen carlin
	["Teleport109"] = {uniqueId = 5104, itemId = 3042, townId = 5, itemPos = Position(32607, 31682, 7), destination = Position(32732, 31634, 7)}, -- become citizen ab'dendriel
	["Teleport110"] = {uniqueId = 5104, itemId = 3042, townId = 7, itemPos = Position(32313, 32818, 7), destination = Position(32317, 32826, 7)}, -- become citizen liberty bay
	["Teleport111"] = {uniqueId = 5104, itemId = 3042, townId = 8, itemPos = Position(32595, 32746, 6), destination = Position(32594, 32745, 7)}, -- become citizen port hope
	["Teleport112"] = {uniqueId = 5104, itemId = 3042, townId = 9, itemPos = Position(33195, 32846, 6), destination = Position(33194, 32853, 8)}, -- become citizen ankrahmun
	["Teleport113"] = {uniqueId = 5104, itemId = 3042, townId = 10, itemPos = Position(33216, 32455, 2), destination = Position(33213, 32454, 1)}, -- become citizen darashia
	["Teleport114"] = {uniqueId = 5104, itemId = 3042, townId = 11, itemPos = Position(33210, 31804, 8), destination = Position(33217, 31814, 8)}, -- become citizen edron
	["Teleport115"] = {uniqueId = 5104, itemId = 3042, townId = 12, itemPos = Position(32214, 31133, 5), destination = Position(32212, 31132, 7)}, -- become citizen svargrond 
	["Teleport116"] = {uniqueId = 5104, itemId = 3042, townId = 13, itemPos = Position(32785, 31277, 7), destination = Position(32787, 31276, 7)}, -- become citizen yalahar
	["Teleport117"] = {uniqueId = 5104, itemId = 3042, townId = 14, itemPos = Position(33008, 31493, 11), destination = Position(33023, 31521, 11)}, -- become citizen farmine
	["Teleport118"] = {uniqueId = 5104, itemId = 3042, townId = 28, itemPos = Position(33447, 31327, 9), destination = Position(33447, 31323, 9)}, -- become citizen gray beach
	["Teleport119"] = {uniqueId = 5104, itemId = 3042, townId = 29, itemPos = Position(33513, 32364, 7), destination = Position(33513, 32363, 6)}, -- become citizen roshamuul
	["Teleport120"] = {uniqueId = 5104, itemId = 3042, townId = 33, itemPos = Position(33587, 31899, 6), destination = Position(33594, 31899, 6)}, -- become citizen rathleton
	
	["VinesDown"] = {uniqueId = 6000, itemId = 7890, itemPos = Position(33187, 31205, 6), destination = Position(33187, 31206, 7)}, -- vines (temple of equilibrium)
	["VinesUp"] = {uniqueId = 6001, itemId = 7890, itemPos = Position(33187, 31205, 7), destination = Position(33187, 31206, 7)}, -- vines (temple of equilibrium)
	["BoatFarmine1"] = {uniqueId = 6002, itemId = 1755, itemPos = Position(33328, 31350, 7), destination = Position(33346, 31349, 7)},
	["BoatFarmine2"] = {uniqueId = 6003, itemId = 7890, itemPos = Position(33344, 31348, 7), destination = Position(33326, 31351, 7)},
	["BoatFarmine3"] = {uniqueId = 6004, itemId = 7890, itemPos = Position(33310, 31325, 8), destination = Position(33382, 31292, 7)},
	["BoatFarmine4"] = {uniqueId = 6005, itemId = 7890, itemPos = Position(33373, 31309, 7), destination = Position(33382, 31292, 7)},
	["BoatFarmine5"] = {uniqueId = 6006, itemId = 7890, itemPos = Position(33381, 31294, 7), destination = Position(33374, 31310, 7)},
	["FromFlyingCarpet"] = {uniqueId = 6007, itemId = 2772, itemPos = Position(32992, 31539, 1), playerPos = Position(32991, 31539, 1), destination = Position(32991, 31539, 4)}, -- last, to flying carpet
	["ToFlyingCarpet"] = {uniqueId = 6008, itemId = 2772, itemPos = Position(32992, 31539, 4), playerPos = Position(32991, 31539, 4), destination = Position(32991, 31539, 1)}, -- to flying carpet
	["ElevatorToFarmine"] = {uniqueId = 6009, itemId = 2772, itemPos = Position(32994, 31547, 4), playerPos = Position(32993, 31547, 4), destination = Position(33061, 31527, 14)}, -- elevator to farmine
	["FarmineStage1"] = {uniqueId = 6010, itemId = 2772, itemPos = Position(33062, 31527, 14), playerPos = Position(33061, 31527, 14), destination = Position(32993, 31547, 4)}, -- farmine stage 1
	["FarmineStage2"] = {uniqueId = 6011, itemId = 2772, itemPos = Position(33062, 31527, 12), playerPos = Position(33061, 31527, 12), destination = Position(32993, 31547, 4)}, -- farmine stage 2
	["FarmineStage3"] = {uniqueId = 6012, itemId = 2772, itemPos = Position(33062, 31527, 10), playerPos = Position(33061, 31527, 10), destination = Position(32993, 31547, 4)}, -- farmine stage 3

	["OreWagon1"] = {uniqueId = 6013, itemId = 7132, itemPos = Position(32618, 31944, 7), destination = Position(32618, 31899, 9)}, -- outside wagons
	["OreWagon2"] = {uniqueId = 6014, itemId = 7132, itemPos = Position(32553, 31931, 7), destination = Position(32620, 31899, 9)}, -- outside wagons
	["OreWagon3"] = {uniqueId = 6015, itemId = 7132, itemPos = Position(32601, 31875, 7), destination = Position(32614, 31899, 9)}, -- outside wagons
	["OreWagon4"] = {uniqueId = 6016, itemId = 7132, itemPos = Position(32577, 31928, 0), destination = Position(32616, 31899, 9)}, -- outside wagons

	["OreWagon5"] = {uniqueId = 6017, itemId = 7132, itemPos = Position(32574, 31978, 9), destination = Position(32673, 31975, 15)}, -- kaz main gate wagons
	["OreWagon6"] = {uniqueId = 6018, itemId = 7132, itemPos = Position(32574, 31975, 9), destination = Position(32625, 31921, 11)}, -- kaz main gate wagons
	["OreWagon7"] = {uniqueId = 6019, itemId = 7132, itemPos = Position(32574, 31972, 9), destination = Position(32605, 31902, 9)}, -- kaz main gate wagons
	["OreWagon8"] = {uniqueId = 6020, itemId = 7132, itemPos = Position(32574, 31969, 9), destination = Position(32654, 31902, 8)}, -- kaz main gate wagons
	
	["OreWagon9"] = {uniqueId = 6021, itemId = 7132, itemPos = Position(32624, 31920, 11), destination = Position(32575, 31974, 9)}, -- kaz temple wagons
	["OreWagon10"] = {uniqueId = 6022, itemId = 7132, itemPos = Position(32627, 31920, 11), destination = Position(32674, 31975, 15)}, -- kaz temple wagons
	["OreWagon11"] = {uniqueId = 6023, itemId = 7132, itemPos = Position(32629, 31920, 11), destination = Position(32605, 31907, 9)}, -- kaz temple wagons
	["OreWagon12"] = {uniqueId = 6024, itemId = 7132, itemPos = Position(32632, 31920, 11), destination = Position(32655, 31902, 8)}, -- kaz temple wagons

	["OreWagon13"] = {uniqueId = 6025, itemId = 7132, itemPos = Position(32672, 31974, 15), destination = Position(32575, 31977, 9)}, -- kaz steamboat
	["OreWagon14"] = {uniqueId = 6026, itemId = 7132, itemPos = Position(32675, 31974, 15), destination = Position(32626, 31921, 11)}, -- kaz steamboat
	["OreWagon15"] = {uniqueId = 6027, itemId = 7132, itemPos = Position(32677, 31974, 15), destination = Position(32605, 31908, 9)}, -- kaz steamboat
	["OreWagon16"] = {uniqueId = 6028, itemId = 7132, itemPos = Position(32680, 31974, 15), destination = Position(32660, 31902, 8)}, -- kaz steamboat

	["OreWagon17"] = {uniqueId = 6029, itemId = 7132, itemPos = Position(32653, 31901, 8), destination = Position(32575, 31968, 9)}, -- kaz depot wagons
	["OreWagon18"] = {uniqueId = 6030, itemId = 7132, itemPos = Position(32656, 31901, 8), destination = Position(32631, 31921, 11)}, -- kaz depot wagons
	["OreWagon19"] = {uniqueId = 6031, itemId = 7132, itemPos = Position(32658, 31901, 8), destination = Position(32605, 31903, 9)}, -- kaz depot wagons
	["OreWagon20"] = {uniqueId = 6032, itemId = 7132, itemPos = Position(32661, 31901, 8), destination = Position(32679, 31975, 15)}, -- kaz depot wagons

	["OreWagon21"] = {uniqueId = 6033, itemId = 7132, itemPos = Position(32604, 31909, 9), destination = Position(32678, 31975, 15)}, -- kaz shop wagons
	["OreWagon22"] = {uniqueId = 6034, itemId = 7132, itemPos = Position(32604, 31906, 9), destination = Position(32630, 31921, 11)}, -- kaz shop wagons
	["OreWagon23"] = {uniqueId = 6035, itemId = 7132, itemPos = Position(32604, 31904, 9), destination = Position(32659, 31902, 8)}, -- kaz shop wagons
	["OreWagon24"] = {uniqueId = 6036, itemId = 7132, itemPos = Position(32604, 31901, 9), destination = Position(32575, 31971, 9)}, -- kaz shop wagons

	["OreWagon25"] = {uniqueId = 6037, itemId = 7132, itemPos = Position(32615, 31899, 9), destination = Position(32600, 31875, 7)}, -- inside to outside wagons
	["OreWagon26"] = {uniqueId = 6038, itemId = 7132, itemPos = Position(32617, 31899, 9), destination = Position(32577, 31929, 0)}, -- inside to outside wagons
	["OreWagon27"] = {uniqueId = 6039, itemId = 7132, itemPos = Position(32619, 31899, 9), destination = Position(32619, 31944, 7)}, -- inside to outside wagons
	["OreWagon28"] = {uniqueId = 6040, itemId = 7132, itemPos = Position(32621, 31899, 9), destination = Position(32553, 31930, 7)}, -- inside to outside wagons

	["OreWagon29"] = {uniqueId = 6041, itemId = 7132, itemPos = Position(32559, 31851, 7), destination = Position(32526, 31840, 9)}, -- fermorhills lost cave house
	["OreWagon30"] = {uniqueId = 6042, itemId = 7132, itemPos = Position(32527, 31840, 9), destination = Position(32559, 31852, 7)}, -- fermorhills lost cave house
	["OreWagon31"] = {uniqueId = 6043, itemId = 7132, itemPos = Position(32515, 31828, 9), destination = Position(32499, 31827, 9)}, -- fermorhills lost cave house
	["OreWagon32"] = {uniqueId = 6044, itemId = 7132, itemPos = Position(32502, 31825, 9), destination = Position(32517, 31806, 9)}, -- fermorhills lost cave house
	["OreWagon33"] = {uniqueId = 6045, itemId = 7132, itemPos = Position(32511, 31823, 9), destination = Position(32515, 31827, 9)}, -- fermorhills lost cave house
	["OreWagon34"] = {uniqueId = 6046, itemId = 7132, itemPos = Position(32488, 31826, 9), destination = Position(32489, 31812, 9)}, -- fermorhills lost cave house
	["OreWagon35"] = {uniqueId = 6047, itemId = 7132, itemPos = Position(32474, 31810, 9), destination = Position(32495, 31833, 9)}, -- fermorhills lost cave house
	["OreWagon36"] = {uniqueId = 6048, itemId = 7132, itemPos = Position(32499, 31806, 9), destination = Position(32511, 31806, 9)}, -- fermorhills lost cave house
	["OreWagon37"] = {uniqueId = 6049, itemId = 7132, itemPos = Position(32511, 31805, 9), destination = Position(32498, 31807, 9)}, -- fermorhills lost cave house
	["OreWagon38"] = {uniqueId = 6050, itemId = 7132, itemPos = Position(32516, 31808, 9), destination = Position(32516, 31829, 9)} -- fermorhills lost cave house
}
