Bestiary.Storage = {
	PLAYER_CHARM_POINTS = 61301000,
	PLAYER_CHARM_SLOT_EXPANSION = 61302001,
	PLAYER_CHARM_RUNE_BIT = 61302002,
	PLAYER_CHARM_RUNE_USED_BIT = 61302003,
	PLAYER_CHARM_RUNE_BASE = 61303000,
	PLAYER_CHARM_RUNE_MONSTER_BASE = 61304000,
	PLAYER_BESTIARY_MONSTER = 61305000
}

Bestiary.getDefaultElements = function ()
	return {
		[COMBAT_PHYSICALDAMAGE] = 100,
		[COMBAT_FIREDAMAGE] = 100,
		[COMBAT_EARTHDAMAGE] = 100,
		[COMBAT_ENERGYDAMAGE] = 100,
		[COMBAT_ICEDAMAGE] = 100,
		[COMBAT_HOLYDAMAGE] = 100,
		[COMBAT_DEATHDAMAGE] = 100,
		[COMBAT_HEALING] = 100,
	}
end

Bestiary.CharmsTypes = {
	CHARM_OFFENSIVE = 1,
	CHARM_DEFENSIVE = 2,
	CHARM_PASSIVE = 3
}

Bestiary.KillStatus = {
	FIRST_LEVEL = 1,
	SECOND_LEVEL = 2,
	THIRD_LEVEL = 3,
	FINISHED = 4
}

Bestiary.Charms = {
	[0] = {
		name = 'Wound',
		id = 0,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 0,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 0,
		damageType = COMBAT_PHYSICALDAMAGE,
		message = "You wounded the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as physical damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 600,
	},
	[1] = {
		name = 'Enflame',
		id = 1,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 1,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 1,damageType = COMBAT_FIREDAMAGE,
		message = "You enflame the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as fire damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 1000
	},
	[2] = {
		name = 'Poison',
		id = 2,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 2,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 2,
		damageType = COMBAT_EARTHDAMAGE,
		message = "You poisoned the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as earth damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 600
	},
	[3] = {
		name = 'Freeze',
		id = 3,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 3,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 3,
		damageType = COMBAT_ICEDAMAGE,
		message = "You frozen the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as ice damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 800
	},
	[4] = {
		name = 'Zap',
		id = 4,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 4,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 4,
		damageType = COMBAT_ENERGYDAMAGE,
		message = "You eletrocuted the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as energy damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 800
	},
	[5] = {
		name = 'Curse',
		id = 5,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 5,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 5,
		damageType = COMBAT_DEATHDAMAGE,
		message = "You curse the monster.",
		description = "Triggers on a creature with a certain chance and deals 5% \z
			of its initial hit points as death damage once.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 900
	},
	[6] = {
		name = 'Cripple',
		id = 6,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 6,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 6,
		description = "Cripples the creature with a certain chance and paralyses it for 10 seconds.",
		type = Bestiary.CharmsTypes.CHARM_OFFENSIVE, points = 500
	},
	[7] = {
		name = 'Parry',
		id = 7,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 7,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 7,
		message = "You parry the attack.",
		description = "Any damage taken is reflected to the aggressor with a certain chance.",
		type = Bestiary.CharmsTypes.CHARM_DEFENSIVE, points = 1000
	},
	[8] = {
		name = 'Dodge',
		id = 8,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 8,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 8,
		message = "You dodged the attack.",
		description = "Dodges an attack with a certain chance without taking any damage at all.",
		type = Bestiary.CharmsTypes.CHARM_DEFENSIVE, points = 600
	},
	[9] = {
		name = 'Adrenaline Burst',
		id = 9,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 9,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 9,
		message = "Your movements where bursted.",
		description = "Bursts of adrenaline enhance your reflexes with a certain chance \z
			after you get hit and let you move faster for 10 seconds.",
		type = Bestiary.CharmsTypes.CHARM_DEFENSIVE, points = 500
	},
	[10] = {
		name = 'Numb',
		id = 10,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 10,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 10,
		description = "Numbs the creature with a certain chance after its attack and paralyses the creature for 10 seconds.",
		type = Bestiary.CharmsTypes.CHARM_DEFENSIVE, points = 500
	},
	[11] = {
		name = 'Cleanse',
		id = 11,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 11,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 11,
		description = "Cleanses you from within with a certain chance after you get hit and \z
			removes one random active negative status effect and temporarily makes you immune against it.",
		type = Bestiary.CharmsTypes.CHARM_DEFENSIVE, points = 700
	},
	[12] = {
		name = 'Bless',
		id = 12,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 12,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 12,
		description = "Blesses you and reduces skill and experience loss by 3% when killed by the chosen creature.",
		type = Bestiary.CharmsTypes.CHARM_PASSIVE, points = 2000
	},
	[13] = {
		name = 'Scavenge',
		id = 13,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 13,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 13,
		description = "Enhances your chances to successfully skin/dust a skinnable/dustable creature.",
		type = Bestiary.CharmsTypes.CHARM_PASSIVE, points = 1500
	},
	[14] = {
		name = 'Gut',
		id = 14,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 14,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 14,
		description = "Gutting the creature yields 10% more creature products.",
		type = Bestiary.CharmsTypes.CHARM_PASSIVE, points = 2000
	},
	[15] = {
		name = 'Low Blow',
		id = 15,
		storage = Bestiary.Storage.PLAYER_CHARM_RUNE_BASE + 15,
		storageMonster = Bestiary.Storage.PLAYER_CHARM_RUNE_MONSTER_BASE + 15,
		description = "Adds 8% critical hit chance to attacks with critical hit weapons.",
		type = Bestiary.CharmsTypes.CHARM_PASSIVE, points = 2000}
}

Bestiary.CharmsNames = {
	["Wound"] = 0,
	["Enflame"] = 1,
	["Poison"] = 2,
	["Freeze"] = 3,
	["Zap"] = 4,
	["Curse"] = 5,
	["Cripple"] = 6,
	["Parry"] = 7,
	["Dodge"] = 8,
	["Adrenaline Burst"] = 9,
	["Numb"] = 10,
	["Cleanse"] = 11,
	["Bless"] = 12,
	["Scavenge"] = 13,
	["Gut"] = 14,
	["Low Blow"] = 15
}

Bestiary.CharmsBinaries = {
	[0] = 1,
	[1] = 2,
	[2] = 4,
	[3] = 8,
	[4] = 16,
	[5] = 32,
	[6] = 64,
	[7] = 128,
	[8] = 256,
	[9] = 512,
	[10] = 1024,
	[11] = 2048,
	[12] = 4096,
	[13] = 8192,
	[14] = 16384,
	[15] = 32768
}


Bestiary.Races = {
	{
		name = "Amphibic",
		monsters = {262, 267, 268, 269, 270, 271, 563, 735, 738, 913}
	},
	{
		name = "Aquatic",
		monsters = {112, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 261, 437, 697, 734, 769,770, 772,
		779, 780, 781, 782, 783, 784, 795, 859, 860, 861, 862, 1097, 1098, 1099, 1100, 1101, 1105, 1667, 1677}
	},
	{
		name = "Bird",
		monsters = {111, 212, 217, 218, 264, 318, 335, 561, 562, 914, 915}
	},
	{
		name = "Construct",
		monsters = {67, 326, 503, 524, 533, 615, 680, 700, 701, 702, 705, 706, 873, 874, 879, 882, 883, 884,
		885, 897, 1038, 1039, 1041, 1043, 1325, 1326, 1327, 1656, 1751}
	},
	{
		name = "Demon",
		monsters = {35, 40, 285, 287, 288, 291, 294, 295, 296, 314, 519, 523, 581, 582, 586, 724, 725, 726,
		727, 728, 729, 973, 1019, 1134, 1135, 1196, 1197, 1198, 1619, 1620, 1621, 1622, 1637}
	},
	{
		name = "Dragon",
		monsters = {34, 39, 121, 317, 385, 386, 402, 461, 617, 618, 643, 672, 673, 963, 1376, 1380}
	},
	{
		name = "Elemental",
		monsters = {49, 236, 279, 313, 455, 456, 457, 458, 889, 890, 1569, 1670}
	},
	{
		name = "Extra Dimensional",
		monsters = {717, 1224, 1234, 1235, 1260}
	},
	{
		name = "Fey",
		monsters = {383, 462, 1434, 1435, 1436, 1437, 1438, 1439, 1485, 1496, 1740, 1741}
	},
	{
		name = "Giant",
		monsters = {22, 55, 324, 334, 389, 391, 1161, 1162, 1163, 1314, 1820, 1821, 1822}
	},
	{
		name = "Human",
		monsters = {9, 10, 11, 12, 47, 54, 57, 58, 72, 73, 77, 222, 223, 224, 225, 247, 248, 249, 250,
		252, 253, 254, 255, 310, 322, 323, 331, 332, 333, 371, 372, 376, 521, 525, 526, 527, 528, 529,
		578, 579, 583, 585, 587, 719, 776, 777, 867, 868, 922, 960, 961, 974, 1119, 1120, 1145, 1146,
		1147, 1413, 1481, 1482, 1512, 1513, 1775, 1776, 1824, 1800, 1799, 1798}
	},
	{
		name = "Humanoid",
		monsters = {2, 4, 5, 6, 7, 8, 15, 23, 24, 25, 29, 50, 53, 59, 61, 62, 63, 64, 66, 69, 70, 71,
		76, 214, 215, 216, 277, 319, 328, 329, 377, 379, 392, 393, 463, 464, 540, 541, 614, 737, 741,
		745, 886, 888, 916, 917, 918, 920, 924, 925, 926, 1044, 1045, 1046, 1051, 1052, 1053, 1321,
		1322, 1394, 1412, 1486, 1488, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1529, 1730,
		1731, 1732, 1733, 1734, 1735}
	},
	{
		name = "Lycanthrope",
		monsters = {510, 1142, 1143, 1144, 1549}
	},
	{
		name = "Magical",
		monsters = {17, 51, 80, 95, 103, 104, 108, 109, 292, 299, 330, 460, 518, 520, 570, 698, 739,
		740, 869, 880, 894, 978, 980, 1004, 1012, 1013, 1014, 1015, 1016, 1018, 1021, 1022, 1157,
		1442, 1443, 1653, 1655, 1659, 1663, 1664, 1665, 1666, 1668, 1669, 1671, 1721, 1722, 1723,
		1728, 1729, 1808, 1807, 1806, 1816, 1819}
	},
	{
		name = "Mammal",
		monsters = {3, 13, 14, 16, 21, 27, 31, 32, 41, 42, 52, 56, 60, 74, 94, 105, 106, 110, 116,
		117, 118, 122, 123, 125, 211, 260, 325, 327, 384, 387, 502, 509, 516, 555, 556, 557, 559,
		560, 630, 693, 720, 723, 730, 733, 870, 872, 877, 898, 981, 1118, 1139, 1174, 1395, 1548,
		1570, 1742}
	},
	{
		name = "Plant",
		monsters = {120, 221, 511, 679, 881, 891, 919, 979, 982, 1042, 1141}
	},
	{
		name = "Reptile",
		monsters = {28, 81, 113, 114, 115, 119, 220, 258, 259, 290, 438, 439, 616, 620, 623, 624, 625,
		627, 655, 656, 694, 695, 1096, 1525, 1817, 1818}
	},
	{
		name = "Slime",
		monsters = {19, 265, 289, 513, 514, 515, 584, 1054, 1056, 1658}
	},
	{
		name = "Undead",
		monsters = {18, 33, 37, 48, 65, 68, 78, 99, 100, 101, 256, 257, 281, 282, 283, 284, 286, 298,
		321, 388, 446, 465, 483, 508, 512, 558, 580, 594, 595, 675, 696, 704, 707, 708, 710, 711, 712,
		958, 959, 962, 975, 976, 1040, 1055, 1148, 1415, 1646, 1647, 1674, 1675, 1724, 1725, 1726,
		1864, 1865, 1866, 1880, 1885}
	},
	{
		name = "Vermin",
		monsters = {26, 30, 36, 38, 43, 44, 45, 79, 82, 83, 124, 219, 251, 621, 631, 632, 633, 641, 674,
		691, 709, 731, 732, 778, 786, 787, 788, 790, 791, 792, 796, 797, 801, 878, 899, 912, 1531, 1532,
		1544, 1545, 1546, 1736, 1737}}
}

Bestiary.Monsters = {
	[262] = {
		name = "Toad",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "The Laguna Islands, Arena and Zoo Quarter, Tiquanda/Tarantula Caves, \z
		Shadowthorn Bog God Temple, Northern Zao Plantations, Northern Brimstone Bug Cave."
	},
	[267] = {
		name = "Green Frog",
		class = "Amphibic",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Meriana and other Shattered Isles, Port Hope caves, The Witches Cliff (only accessible during a quest)."
	},
	[268] = {
		name = "Azure Frog",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Meriana, Laguna Islands, and other Shattered Isles."
	},
	[269] = {
		name = "Coral Frog",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Meriana, Laguna Islands, and other Shattered Isles."
	},
	[270] = {
		name = "Crimson Frog",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Meriana, Laguna Islands, and other Shattered Isles."
	},
	[271] = {
		name = "Orchid Frog",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Meriana, Laguna Islands, and other Shattered Isles."
	},
	[563] = {
		name = "Infernal Frog",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Isle of Evil, Drefia."
	},
	[735] = {
		name = "Filth Toad",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Tiquanda, around Lake Equivocolao."
	},
	[738] = {
		name = "Bog Frog",
		class = "Amphibic",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Shadowthorn in the bog god's temple, Drefia, around Lake Equivocolao when it's dirty."
	},
	[913] = {
		name = "Salamander",
		class = "Amphibic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Shadowthorn in the bog god's temple, Drefia, around Lake Equivocolao when it's dirty."
	},
	[112] = {
		name = "Crab",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Various locations like Goroma, Edron, Port Hope, Nargor and other Shattered Isles. \z
		There is also one located underwater by The Tibianic, however it is unreachable."
	},
	[237] = {
		name = "Quara Predator",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench, Sunken Quarter, Alchemist Quarter (unreachable), \z
		The Inquisition Quest, Seacrest Grounds."
	},
	[238] = {
		name = "Quara Predator Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Malada, Hrodmir Quara Scout Caves, Quara Grotto, Oramond."
	},
	[239] = {
		name = "Quara Constrictor",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench underwater sites, Yalahar (Sunken Quarter)."
	},
	[240] = {
		name = "Quara Constrictor Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Malada, Arena Quarter, Treasure Island Eastern Caves, \z
		Hrodmir Quara Scout Caves, Quara Grotto, Oramond."
	},
	[241] = {
		name = "Quara Mantassin",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench, Yalahar (Sunken Quarter)."
	},
	[242] = {
		name = "Quara Mantassin Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 2,
		Occurrence = 0,
		Locations = "Malada, Water Elemental Cave near Port Hope, Hrodmir Quara Scout Caves, Quara Grotto, Oramond."
	},
	[243] = {
		name = "Quara Hydromancer",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench, Yalahar (Sunken Quarter)."
	},
	[244] = {
		name = "Quara Hydromancer Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Malada, Hrodmir Quara Scout Caves, Quara Grotto, Oramond."
	},
	[245] = {
		name = "Quara Pincher",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench, Yalahar (Sunken Quarter)."
	},
	[246] = {
		name = "Quara Pincher Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Malada, Hrodmir Quara Scout Caves, Quara Grotto, Oramond."
	},
	[261] = {
		name = "Blood Crab",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Goroma (beyond electric barrier), Laguna Islands, Shattered Isles, Underground Port Hope, \z
		Mistrock, Treasure Island. There is also one underwater next to The Tibianic, however it is unreachable."
	},
	[437] = {
		name = "Deepsea Blood Crab",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Svargrond (Sea Serpent Area), Drefia. \z
		There is also one under Rookgaard Academy, however it is unreachable."
	},
	[697] = {
		name = "Crustacea Gigantica",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 3,
		Locations = "Calassa, Treasure Island , Seacrest Grounds. \z
		In the Seacrest Grounds the spawns are Varying Monster Spawns in which the common creature is an Abyssal Calamary. \z
		The chance to spawn a Crustacea Gigantica seems to be around 1%-2%."
	},
	[734] = {
		name = "Deepling Scout",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Fiehonja, Sunken Mines near Dwarf Mines."
	},
	[769] = {
		name = "Deepling Warrior",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Fiehonja."
	},
	[770] = {
		name = "Deepling Guard",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Fiehonja. During Deeplings stage 1 around 10 spawns exist. \z
		Also may spawn during the gemcutting mission. Many more spawns in almost all areas of Deepling stage 2 and 3."
	},
	[772] = {
		name = "Deepling Spellsinger",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Fiehonja."
	},
	[779] = {
		name = "Manta Ray",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Fiehonja only in stage 3 in a large room."
	},
	[780] = {
		name = "Calamary",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Fiehonja."
	},
	[781] = {
		name = "Jellyfish",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Fiehonja, Krailos Steppe underwater cave."
	},
	[782] = {
		name = "Shark",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Fiehonja, Seacrest Grounds, Krailos Steppe underwater cave."
	},
	[783] = {
		name = "Northern Pike",
		class = "Aquatic",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 1,
		Occurrence = 1,
		Locations = "Fiehonja."
	},
	[784] = {
		name = "Fish",
		class = "Aquatic",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Fiehonja."
	},
	[795] = {
		name = "Deepling Worker",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Fiehonja, Coral mine."
	},
	[859] = {
		name = "Deepling Brawler",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 10,
		SecondUnlock = 0,
		CharmsPoints = 0,
		Stars = 3,
		Occurrence = 1,
		Locations = "Fiehonja."
	},
	[860] = {
		name = "Deepling Master Librarian",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Fiehonja."
	},
	[861] = {
		name = "Deepling Tyrant",
		class = "Aquatic",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 2,
		Locations = "Fiehonja."
	},
	[862] = {
		name = "Deepling Elite",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Fiehonja (Tanjis lair)."
	},
	[1097] = {
		name = "Renegade Quara Constrictor",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Seacrest Grounds during a world change."
	},
	[1098] = {
		name = "Renegade Quara Hydromancer",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Seacrest Grounds during a world change."
	},
	[1099] = {
		name = "Renegade Quara Mantassin",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Seacrest Grounds during a world change."
	},
	[1100] = {
		name = "Renegade Quara Pincher",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Seacrest Grounds during a world change."
	},
	[1101] = {
		name = "Renegade Quara Predator",
		class = "Aquatic",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Seacrest Grounds during a world change."
	},
	[1105] = {
		name = "Abyssal Calamary",
		class = "Aquatic",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Seacrest Grounds."
	},
	[1667] = {
		name = "Deathling Scout",
		class = "Aquatic",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Deepling Ancestorial Grounds and Sunken Temple."
	},
	[1677] = {
		name = "Deathling Spellsinger",
		class = "Aquatic",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Ancient Ancestorial Grounds and Sunken Temple."
	},
	[111] = {
		name = "Chicken",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Sabrehaven, Rookgaard, The McRonalds Farm in Thais, Northport, \z
		Fibula, Carlin (killable but unreachable), Greenshore, Krimhorn, Orc Fortress, \z
		Factory Quarter, also theres one in the farm near Edron."
	},
	[212] = {
		name = "Flamingo",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Tiquanda, Shattered Isles, Gardens of Night."
	},
	[217] = {
		name = "Parrot",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In the jungle of Tiquanda, Liberty Bay, the Shattered Isles, and as a house pet in Meriana."
	},
	[218] = {
		name = "Terror Bird",
		class = "Bird",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Around Port Hope, Arena and Zoo Quarter in Yalahar, few on Zao steppes."
	},
	[264] = {
		name = "Seagull",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Various locations, sighted in the Shattered Isles, Venore, Thais, Femor Hills, \z
		Cormaya, Edron Troll-Goblin Peninsula, Liberty Bay, Port Hope, Fibula, Drefia, Factory Quarter, \z
		bordering Orc Fort, Rookgaard Premium Zone (not reachable), AbDendriel elf caves, \z
		Northern coast of Tibia between Dalbrect and Northport."
	},
	[318] = {
		name = "Penguin",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In and north of Formorgar Glacier, Nibelor, Helheim, Grimlund, south of Svargrond, Chyllfroest."
	},
	[335] = {
		name = "Dire Penguin",
		class = "Bird",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 3,
		Locations = "Any place with penguins like, Formorgar Glacier, Helheim, Tyrsung or Svargrond. \z
		Known spawn locations: west of Svargrond, up the Formorgar Glacier."
	},
	[561] = {
		name = "Berserker Chicken",
		class = "Bird",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[562] = {
		name = "Demon Parrot",
		class = "Bird",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[914] = {
		name = "Marsh Stalker",
		class = "Bird",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore swamp surface, Venore Salamander Cave, Dryad Gardens."
	},
	[915] = {
		name = "Pigeon",
		class = "Bird",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 1,
		Occurrence = 1,
		Locations = "Streets of Venore, Gardens of Night."
	},
	[1307] = {
		name = "Cave Parrot",
		class = "Bird",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Desecrated Glade."
	},
	[67] = {
		name = "Stone Golem",
		class = "Construct",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Maze of Lost Souls, in and around Ashta daramai, Formorgar Mines, \z
		Mad Technomancer room, Dark Cathedral, Demona, Goroma, Tarpit Tomb, Peninsula Tomb, \z
		Deeper Banuta, Forbidden Lands, Beregar Mines, Farmine Mines, Drillworm Caves, 2 caves on Hrodmir, \z
		Orc Fortress (single spawn) and Medusa Tower."
	},
	[326] = {
		name = "Ice Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Formorgar Glacier, Formorgar Mines, Nibelor Ice Cave, Ice Witch Temple, \z
		Deeper Banuta, Crystal Caves, Chyllfroest."
	},
	[503] = {
		name = "Worker Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Factory Quarter."
	},
	[524] = {
		name = "Damaged Worker Golem",
		class = "Construct",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Factory Quarter."
	},
	[533] = {
		name = "War Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Factory Quarter."
	},
	[615] = {
		name = "Eternal Guardian",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "North-east Muggy Plains, Deeper Banuta."
	},
	[680] = {
		name = "Cake Golem",
		class = "Construct",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 3,
		Locations = "Thais, Carlin, Edron, Darashia and Liberty Bay during A Piece of Cake."
	},
	[700] = {
		name = "Iron Servant",
		class = "Construct",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "Edron."
	},
	[701] = {
		name = "Golden Servant",
		class = "Construct",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Edron."
	},
	[702] = {
		name = "Diamond Servant",
		class = "Construct",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Edron."
	},
	[705] = {
		name = "Sandstone Scorpion",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[706] = {
		name = "Clay Guardian",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Horestis Tomb, Middle Spike, Medusa Tower."
	},
	[873] = {
		name = "Enraged Crystal Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Golem Workshop."
	},
	[874] = {
		name = "Damaged Crystal Golem",
		class = "Construct",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Golem Workshop in Gnomebase Alpha."
	},
	[879] = {
		name = "Stone Devourer",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 1."
	},
	[882] = {
		name = "Weeper",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 2."
	},
	[883] = {
		name = "Orewalker",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 3."
	},
	[884] = {
		name = "Lava Golem",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 2."
	},
	[885] = {
		name = "Magma Crawler",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 2."
	},
	[897] = {
		name = "Infected Weeper",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 2."
	},
	[1038] = {
		name = "Glooth Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Glooth Factory, Underground Glooth Factory, Rathleton Sewers, Jaccus Maxxens Dungeon, \z
		Oramond Dungeon (depending on Magistrate votes)."
	},
	[1039] = {
		name = "Metal Gargoyle",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Workshop Quarter, Glooth Factory, Underground Glooth Factory, Abandoned Sewers, \z
		Oramond Dungeon (depending on Magistrate votes), Jaccus Maxxens Dungeon."
	},
	[1041] = {
		name = "Rustheap Golem",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Workshop Quarter, Glooth Factory, Underground Glooth Factory, \z
		Oramond Dungeon (depending on Magistrate votes), Jaccus Maxxens Dungeon."
	},
	[1043] = {
		name = "Walker",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "A few spawns in the Underground Glooth Factory, Glooth Factory, and Rathleton Sewers."
	},
	[1325] = {
		name = "Iron Servant Replica",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Replica Dungeon."
	},
	[1326] = {
		name = "Diamond Servant Replica",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Replica Dungeon."
	},
	[1327] = {
		name = "Golden Servant Replica",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Replica Dungeon."
	},
	[1656] = {
		name = "Biting Book",
		class = "Construct",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Secret Library. There are also two incarcerated in the Issavi prison, \z
		reachable from the city Library."
	},
	[1751] = {
		name = "Animated Snowman",
		class = "Construct",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Percht Island."
	},
	[35] = {
		name = "Demon",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Hero Cave, Ferumbras' Citadel, Goroma, Ghostlands (Warlock area; unreachable), \z
		Liberty Bay (hidden underground passage; unreachable), Razzachai, deep in Pits of Inferno \z
		(found in every throneroom except Verminor's), deep Formorgar Mines, Demon Forge, \z
		Alchemist Quarter, Magician Quarter, Chyllfroest, Oramond Dungeon, Abandoned Sewers."
	},
	[40] = {
		name = "Fire Devil",
		class = "Demon",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Desert Dungeon, Ancient Temple, Magician Tower, Shadow Tomb, Ghostlands, Goroma, \z
		Plains of Havoc at Ornamented Shield Quest, Spike Sword Quest."
	},
	[285] = {
		name = "Dark Torturer",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, Vengoth, Blood Halls, Oramond Dungeon, Roshamuul Prison"
	},
	[287] = {
		name = "Destroyer",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Pits of Inferno, Formorgar Mines, Alchemist Quarter, Oramond Dungeon."
	},
	[288] = {
		name = "Diabolic Imp",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Inquisition, Pits of Inferno, Fenrock, Fury Dungeon and inside the \z
		Hellgore volcano on Goroma during the Fire from the Earth Mini World Change."
	},
	[291] = {
		name = "Fury",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno (Apocalypse's Throne Room), The Inquisition Quest \z
		(The Shadow Nexus, Battlefield), Vengoth, Fury Dungeon, Oramond Fury Dungeon, The Extension Site."
	},
	[294] = {
		name = "Hellhound",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Infernatil's Throneroom The Inquisition Quest Area, Hellgorge, \z
		Roshamuul Prison, Chyllfroest, Oramond Dungeon, The Extension Site and under the Asura Palace."
	},
	[295] = {
		name = "Hellfire Fighter",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, Demon Forge, Fury Dungeon."
	},
	[296] = {
		name = "Juggernaut",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Deep in Pits of Inferno (Apocalypse's throne room), The Dark Path, \z
		The Blood Halls, The Vats, The Hive, The Shadow Nexus, a room deep in Formorgar Mines, Roshamuul Prison, Oramond Dungeon, Grounds of Destruction."
	},
	[314] = {
		name = "Plaguesmith",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Pits of Inferno, Formorgar Mines, Edron Demon Forge (The Vats, The Foundry), \z
		Magician Quarter, Alchemist Quarter, Roshamuul Prison."
	},
	[519] = {
		name = "Hellspawn",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Magician Quarter, Vengoth, Deeper Banuta, Formorgar Mines, Chyllfroest, Oramond Dungeon."
	},
	[523] = {
		name = "Gozzler",
		class = "Demon",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Magician Quarter, cave in Beregar, Farmine Mines."
	},
	[581] = {
		name = "Duskbringer",
		class = "Demon",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Magician Quarter (Yalahar)."
	},
	[582] = {
		name = "Shadow Hound",
		class = "Demon",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Ramoa."
	},
	[586] = {
		name = "Herald Of Gloom",
		class = "Demon",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Edron."
	},
	[724] = {
		name = "Shaburak Demon",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Demonwar Crypt."
	},
	[725] = {
		name = "Shaburak Lord",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Demonwar Crypt."
	},
	[726] = {
		name = "Shaburak Prince",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Demonwar Crypt."
	},
	[727] = {
		name = "Askarak Demon",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Demonwar Crypt (teleporter before vampire shield quest)."
	},
	[728] = {
		name = "Askarak Lord",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Demonwar Crypt."
	},
	[729] = {
		name = "Askarak Prince",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Demonwar Crypt."
	},
	[973] = {
		name = "Nightfiend",
		class = "Demon",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Deep under Drefia."
	},
	[1019] = {
		name = "Demon Outcast",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Roshamuul Prison."
	},
	[1134] = {
		name = "Dawnfire Asura",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Asura Palace."
	},
	[1135] = {
		name = "Midnight Asura",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Asura Palace."
	},
	[1196] = {
		name = "Grimeleech",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Dungeons of The Ruthless Seven."
	},
	[1197] = {
		name = "Vexclaw",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Dungeons of The Ruthless Seven."
	},
	[1198] = {
		name = "Hellflayer",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Dungeons of The Ruthless Seven."
	},
	[1619] = {
		name = "Frost Flower Asura",
		class = "Demon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Asura Palace."
	},
	[1620] = {
		name = "True Dawnfire Asura",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Asura Palace."
	},
	[1621] = {
		name = "True Midnight Asura",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Asura Palace."
	},
	[1622] = {
		name = "True Frost Flower Asura",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Asura Palace's secret basement."
	},
	[1637] = {
		name = "Floating Savant",
		class = "Demon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Extension Site"
	},
	[34] = {
		name = "Dragon",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Thais Ancient Temple, Darashia Dragon Lair, Mount Sternum Dragon Cave, Mintwallin, \z
		deep in Fibula Dungeon, Kazordoon Dragon Lair (near Dwarf Bridge), Plains of Havoc, Elven Bane castle, \z
		Maze of Lost Souls, southern cave and dragon tower in Shadowthorn, Orc Fortress, Venore Dragon Lair, \z
		Pits of Inferno, Behemoth Quest room in Edron, Hero Cave, deep Cyclopolis, Edron Dragon Lair, Goroma, \z
		Ankrahmun Dragon Lairs, Draconia, Dragonblaze Peaks, some Ankrahmun Tombs, \z
		underground of Fenrock (on the way to Beregar), Krailos Steppe and Crystal Lakes."
	},
	[39] = {
		name = "Dragon Lord",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Ankrahmun Dragon Lairs, Banshee Quest final room (level 60+ to open the door), \z
		Deeper Cyclopolis past the Dragon Spawn (level 30+ to open the door), Draconia, Edron Dragon Lair, \z
		Fibula Dungeon (level 50+ to open the door), Maze of Lost Souls (level 30+ to open the door), \z
		Pits of Inferno Dragon Lair, Dragon Lord hole in Plains of Havoc, Carlin Dragon Lair, \z
		Thais Dragon Lair, Goroma Dragon Lairs, Hot Spot, Venore Dragon Lair, Arena and Zoo Quarter (Yalahar), \z
		beneath Fenrock, Darashia Dragon Lair, Razzachai, Dragonblaze Peaks, Ferumbras Citadel, \z
		Fury Dungeon, Lower Spike, Krailos Steppe."
	},
	[121] = {
		name = "Hydra",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Many on the northern Hydra Mountain in east Tiquanda, 3-4 on the southern Hydra Mountain, \z
		1 at the Hydra Egg Quest in Tiquanda, 1 north-east of the Elephant Tusk Quest, \z
		2 above the Forbidden Lands hydra cave here and many inside it, many in Deeper Banuta, \z
		many on Talahu surface, a few in Ferumbras Citadel basement on Kharos, \z
		2 on a hill in the Yalahar Arena and Zoo Quarter, 1 deep in the Yalahar Foreigner Quarter (Crystal Lake), \z
		many in the Oramond Hydra/Bog Raider Cave."
	},
	[317] = {
		name = "Frost Dragon",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Okolnir, Razzachai, Ice Witch Temple, Frost Dragon Tunnel, \z
		Yakchal Crypt (only during Yakchal's awakening ritual), Dragonblaze Peaks, Deeper Banuta, Chyllfroest."
	},
	[385] = {
		name = "Dragon Hatchling",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Thais Dragon Lair, beneath Fenrock, Darashia Dragon Lair, Venore Dragon Lair, \z
		Edron Dragon Lair, Dragonblaze Peaks, Krailos Steppe. Also summoned by Lizard Dragon Priests."
	},
	[386] = {
		name = "Dragon Lord Hatchling",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Thais Dragon Lair, Venore Dragon Lair, Edron Dragon Lair by the Fire Axe Quest, \z
		on the way to Pythius the Rotten, Razzachai, Dragonblaze Peaks."
	},
	[402] = {
		name = "Frost Dragon Hatchling",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Okolnir, Factory Quarter (Yalahar), Dragonblaze Peaks, Ice Witch Temple, \z
		Frost Dragon Tunnel, Chyllfroest."
	},
	[461] = {
		name = "Wyrm",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia Wyrm Lair (after the Medusa Shield Quest room), Darashia Wyrm Hills, Arena and Zoo Quarter, \z
		beneath Fenrock, Deeper Razachai, Lower Spike, Vandura Wyrm Cave and Vandura Mountain in Liberty Bay."
	},
	[617] = {
		name = "Draken Warmaster",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zao Palace, Chazorai, Razzachai, and Zzaion."
	},
	[618] = {
		name = "Draken Spellweaver",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Zao Palace, Razzachai, and Zzaion."
	},
	[643] = {
		name = "Ghastly Dragon",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Ghastly Dragon Lair, Corruption Hole, Razachai including the Inner Sanctum, \z
		Zao Palace, Deeper Banuta, Chyllfroest."
	},
	[672] = {
		name = "Draken Elite",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Razachai, including the Crystal Column chambers in the Inner Sanctum."
	},
	[673] = {
		name = "Draken Abomination",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Razachai including the Inner Sanctum."
	},
	[963] = {
		name = "Elder Wyrm",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Drefia Wyrm Lair, Vandura Wyrm Cave, Glooth Factory (west)."
	},
	[1376] = {
		name = "Haunted Dragon",
		class = "Dragon",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 2,
		Locations = "The First Dragon's Lair, fourth floor."
	},
	[1380] = {
		name = "Ice Dragon",
		class = "Dragon",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "The First Dragon's Lair."
	},
	[49] = {
		name = "Fire Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cyclopolis, Hero Cave in Edron, Ankrahmun tombs, Serpentine Tower, Factory Quarter in Yalahar, \z
		Deeper Banuta, Goroma inside the volcano and beneath Fenrock."
	},
	[236] = {
		name = "Water Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Water Elemental Cave in Port Hope, Water Elemental Dungeon, Deeper Banuta, Malada, Ramoa, \z
		Talahu, Folda (7 spawn on the 3rd floor), Water Elemental Cave in Outlaw Camp (only during the Down the \z
		Drain Mini World Change), Krailos Steppe underwater cave."
	},
	[279] = {
		name = "Massive Water Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Calassa, Frozen Trench, Water Elemental Dungeon through the water channels, \z
		before Zugurosh in The Inquisition Quest."
	},
	[313] = {
		name = "Massive Fire Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Demon Forge, Deeper Banuta, Hero Cave, Hot Spot, Fury Dungeon."
	},
	[455] = {
		name = "Massive Earth Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Forbidden Lands, on top of a hill in the northern part of the Arena and Zoo Quarter, \z
		Lower Spike, Truffels Garden and Mushroom Gardens."
	},
	[456] = {
		name = "Massive Energy Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "North west of Ankrahmun, you must Levitate to hunt. Two can also be found in the Asura Palace."
	},
	[457] = {
		name = "Energy Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Kha'zeel, Energy Elemental Lair, Vandura Mountain, Vengoth's mountain."
	},
	[458] = {
		name = "Earth Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Edron Earth Elemental Cave (17 of them on the first floor), Vandura Mountain, \z
		Deeper Banuta, Vengoth Castle, Robson Isle, Drillworm Caves, Crystal Grounds, Middle Spike."
	},
	[889] = {
		name = "Cliff Strider",
		class = "Elemental",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 3."
	},
	[890] = {
		name = "Ironblight",
		class = "Elemental",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 3."
	},
	[1000] = {
		name = "Furious Fire Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Hellgate."
	},
	[1116] = {
		name = "High Voltage Elemental",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "South side of the second floor of Underground Glooth Factory, Warzone 5"
	},
	[1121] = {
		name = "Raging Fire",
		class = "Elemental",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Jaccus Maxxen's Dungeon."
	},
	[1563] = {
		name = "Lava Lurker",
		class = "Elemental",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Gnome Deep Hub"
	},
	[1569] = {
		name = "Ravenous Lava Lurker",
		class = "Elemental",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Gnome Deep Hub in the Gnomish area."
	},
	[1670] = {
		name = "Knowledge Elemental",
		class = "Elemental",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Secret Library."
	},
	[717] = {
		name = "Yielothax",
		class = "Extra Dimensional",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "In another dimension, through a portal in the Raging Mage tower, southern Zao."
	},
	[1224] = {
		name = "Reality Reaver",
		class = "Extra Dimensional",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Otherworld."
	},
	[1234] = {
		name = "Sparkion",
		class = "Extra Dimensional",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Otherworld."
	},
	[1235] = {
		name = "Breach Brood",
		class = "Extra Dimensional",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Otherworld."
	},
	[1260] = {
		name = "Dread Intruder",
		class = "Extra Dimensional",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Otherworld."
	},
	[1264] = {
		name = "Instable Sparkion",
		class = "Extra Dimensional",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Unknown."
	},
	[1265] = {
		name = "Instable Breach Brood",
		class = "Extra Dimensional",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Otherworld."
	},
	[1266] = {
		name = "Stabilizing Reality Reaver",
		class = "Extra Dimensional",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Otherworld (Edron)"
	},
	[1267] = {
		name = "Stabilizing Dread Intruder",
		class = "Extra Dimensional",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Otherworld (Edron)"
	},
	[383] = {
		name = "Dryad",
		class = "Fey",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Dryads appear in forest areas of Edron, Port Hope, Carlin and Cormaya during raids in June. \z
		There are 5 total waves, the initial one with the raid message and the rest every 15 minutes during next hour."
	},
	[462] = {
		name = "Wisp",
		class = "Fey",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "All around Tiquanda and Feyrist. Several groups of Wisps can be found in and around \z
		the forests north of Edron. West of Hardek. Inside the Cyclops Camp. North of the triple \z
		Wyvern spawn outside Kazordoon. West of Ab'Dendriel. West of Venore Amazon Camp. \z
		A few spawns around Venore, 2 spawn on the Formorgar Glacier, and on Krimhorn."
	},
	[1434] = {
		name = "Faun",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist (daytime)."
	},
	[1435] = {
		name = "Pooka",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist (daytime)."
	},
	[1436] = {
		name = "Twisted Pooka",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist (nighttime) and its underground (all day)."
	},
	[1437] = {
		name = "Swan Maiden",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Feyrist Meadows."
	},
	[1438] = {
		name = "Pixie",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist."
	},
	[1439] = {
		name = "Boogy",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist (night time) and its underground (all day)."
	},
	[1485] = {
		name = "Nymph",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist."
	},
	[1496] = {
		name = "Dark Faun",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist (nighttime) and its underground (all day)."
	},
	[1626] = {
		name = "Arctic Faun",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Arctic Faun's Island."
	},
	[1740] = {
		name = "Percht",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Percht Island."
	},
	[1741] = {
		name = "Schiach",
		class = "Fey",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Percht Island."
	},
	[22] = {
		name = "Cyclops",
		class = "Giant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ab'Dendriel Underground, Cyclopolis, Femor Hills, Kazordoon Prison, Kazordoon Surroundings, \z
		Maze of the Lost Souls, Mistrock, Mount Sternum, Outlaw Camp, Plains of Havoc, Shadowthorn, \z
		Thais Northern Dungeon, Thais Surroundings, Thais Underground, Ulderek's Rock, Yalahar Foreigner Quarter."
	},
	[55] = {
		name = "Behemoth",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cyclopolis, deepest part of Tarpit Tomb after the flame, Forbidden Lands, Vandura Mountain, \z
		Deeper Banuta, Serpentine Tower (unreachable), deep into the Formorgar Mines, Arena and Zoo Quarter, \z
		The Dark Path, Lower Spike, Chyllfroest, Medusa Tower and Underground Glooth Factory (west side)."
	},
	[324] = {
		name = "Frost Giant",
		class = "Giant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tyrsung (in the Jotunar mountain), Formorgar Glacier (single spawn), \z
		Mammoth Shearing Factory, Chyllfroest."
	},
	[334] = {
		name = "Frost Giantess",
		class = "Giant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tyrsung (in the Jotunar mountain), Formorgar Glacier (single spawn), \z
		Mammoth Shearing Factory, Chyllfroest."
	},
	[389] = {
		name = "Cyclops Smith",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cyclopolis second floor and below, Mistrock, Mount Sternum, \z
		Cyclops Camp second floor and in the Cyclops version of the Forsaken Mine."
	},
	[391] = {
		name = "Cyclops Drone",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cyclopolis, Mount Sternum, Mistrock and in the Cyclops version of the Forsaken Mine."
	},
	[1161] = {
		name = "Ogre Brute",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Krailos Steppe."
	},
	[1162] = {
		name = "Ogre Savage",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Krailos Steppe."
	},
	[1163] = {
		name = "Ogre Shaman",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Krailos Steppe."
	},
	[1314] = {
		name = "Orclops Doomhauler",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Desecrated Glade, Edron Orc Cave."
	},
	[1320] = {
		name = "Orclops Ravager",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Desecrated Glade."
	},
	[1820] = {
		name = "Ogre Ruffian",
		class = "Giant",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Green Belt, Kilmaresh Mountains (underground)."
	},
	[1821] = {
		name = "Ogre Rowdy",
		class = "Giant",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Green Belt, Kilmaresh Mountains (underground)."
	},
	[1822] = {
		name = "Ogre Sage",
		class = "Giant",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Green Belt, Kilmaresh Mountains (underground)."
	},
	[1841] = {
		name = "Orger",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Feeding Grounds."
	},
	[1857] = {
		name = "Loricate Orger",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Feeding Grounds."
	},
	[1858] = {
		name = "Bellicose Orger",
		class = "Giant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Orcsoberfest Island."
	},
	[9] = {
		name = "Necromancer",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "All the Tombs, Lich Hell, Drefia, Medusa Shield Quest room, Old Fortress, Old Masonry, \z
		beneath Fenrock, Cemetery Quarter and Magician Quarter."
	},
	[10] = {
		name = "Warlock",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Demona, Ghostland (Banshee Quest area), Temple of Xayepocax, Oasis Tomb, Kharos, Magician Quarter, \z
		beneath Fenrock, The Arcanum."
	},
	[11] = {
		name = "Hunter",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "North of Mount Sternum, Plains of Havoc, Outlaw Camp, Dark Cathedral, Femor Hills, \z
		Maze of Lost Souls, north of the Amazon Camp, at the entrance and in the Hero Cave, \z
		a castle tower at Elvenbane, Trade Quarter, Smuggler camp on Tyrsung, Formorgar Mines."
	},
	[12] = {
		name = "Valkyrie",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Amazon Camp (Venore), Amazon Camp (Carlin), Amazonia, \z
		single respawn to the north west of Thais, Foreigner Quarter in Yalahar."
	},
	[47] = {
		name = "Wild Warrior",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Dark Cathedral, Outlaw Camp, North of Thais, Cyclopolis, in Edron Hero Cave and around it, \z
		the small camp near Femor Hills, in Ghostlands disguised as a statue."
	},
	[54] = {
		name = "Witch",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Vandura, west of the Dwarf Mines in a small house, Amazon Tower north of Carlin, \z
		Triangle Tower, Temple of Xayepocax, Green Claw Swamp and Amazon Camp (Venore), \z
		Dark Cathedral (2 levels underground), Goroma Volcano (underground), west from Necromant House, \z
		Mammoth Shearing Factory, Trade Quarter in Yalahar, The Witches' Cliff (only accessible during a quest)."
	},
	[57] = {
		name = "Monk",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Edron Hero Cave, Triangle Tower near Thais, Maze of Lost Souls, Deeper Dark Cathedral, \z
		Isle of the Kings, Trade Quarter."
	},
	[58] = {
		name = "Priestess",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Hero Cave, Drefia ruins, Lich Hell, Tombs, Magician Quarter in Yalahar, Vengoth Castle."
	},
	[72] = {
		name = "Stalker",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Triangle Tower, Drefia, Edron Hero Cave in the Warlock room, White Flower Temple, \z
		Ghostlands, Shadow Tomb, Ancient Ruins Tomb, Tarpit Tomb, Stone Tomb, Mountain Tomb, Peninsula Tomb, \z
		Oasis Tomb, Yalahar Trade Quarter and Isle of the Kings."
	},
	[73] = {
		name = "Hero",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "In Hero Cave in Edron, it has many rooms with many kinds of monsters and different amounts of Heroes. \z
		Also in Magician Quarter, accompanied by other monsters. Old Fortress"
	},
	[77] = {
		name = "Amazon",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore Amazon Camp, Carlin Amazon Camp, Amazon Tower, east of Carlin, underneath the Fields of Glory, \z
		west of Venore, Oasis Tomb, on the smallest of the Laguna Islands, Foreigner Quarter and Trade Quarter."
	},
	[222] = {
		name = "Smuggler",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Around Dark Cathedral, Tiquanda Bandit Caves, the Outlaw Camp, Tyrsung, Yalahar and Nargor."
	},
	[223] = {
		name = "Bandit",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Dark Cathedral, Tiquanda Bandit Caves, Outlaw Camp, mountain pass west of Ankrahmun, \z
		Tyrsung, Thais Bandit Cave, Formorgar Mines. Also summoned by Gamel."
	},
	[224] = {
		name = "Assassin",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Dark Cathedral, Trade Quarter, Factory Quarter, Foreigner Quarter."
	},
	[225] = {
		name = "Dark Monk",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Dark Cathedral, Vandura (Cult Cave), Foreigner Quarter."
	},
	[247] = {
		name = "Pirate Marauder",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Nargor, Tyrsung, Yalahar, Krailos Steppe."
	},
	[248] = {
		name = "Pirate Cutthroat",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Nargor, Tyrsung (on the ship), Yalahar, Krailos Steppe."
	},
	[249] = {
		name = "Pirate Buccaneer",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Nargor, Tyrsung (on the ship), Yalahar (Foreign Quarter), Krailos Steppe."
	},
	[250] = {
		name = "Pirate Corsair",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Nargor, Trade Quarter, Foreigner Quarter (Dock), Krailos Steppe."
	},
	[252] = {
		name = "Enlightened Of The Cult",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Goroma, Formorgar Mines, Magician Quarter, Forbidden Temple."
	},
	[253] = {
		name = "Acolyte Of The Cult",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Goroma, Deeper Cult Cave, Formorgar Mines, Magician Quarter, Forbidden Temple."
	},
	[254] = {
		name = "Adept of the Cult",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Goroma, Liberty Bay's deeper cult dungeon, Formorgar Mines, Magician Quarter, Forbidden Temple."
	},
	[255] = {
		name = "Novice of the Cult",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Liberty Bay Cult Cave, Formorgar Mines, Yalahar Magician Quarter, \z
		in the caves on top of the Hrodmir mountains."
	},
	[310] = {
		name = "Nomad",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Ankrahmun Pharaoh Tombs, Deeper Drefia, Kha'zeel Mountains, Northern Darama Desert, \z
		Southern Darama Desert, Yalahar Foreigner Quarter, Yalahar Trade Quarter."
	},
	[322] = {
		name = "Barbarian Skullhunter",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ragnir, Krimhorn, Bittermor, and Fenrock"
	},
	[323] = {
		name = "Barbarian Bloodwalker",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Krimhorn, Bittermor, Ragnir, Arena and Zoo Quarter inside the Arena."
	},
	[331] = {
		name = "Ice Witch",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Ice Witch Temple, tower in Krimhorn, caves around Hrodmir ('camps' area), \z
		Formorgar Glacier deepest mines, Magician Quarter in Yalahar (Level 60 Requirement Door)."
	},
	[332] = {
		name = "Barbarian Brutetamer",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Krimhorn, Bittermor, Ragnir, and Fenrock."
	},
	[333] = {
		name = "Barbarian Headsplitter",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Krimhorn, Bittermor, Ragnir, and Fenrock."
	},
	[371] = {
		name = "Dark Magician",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Hero Cave (Edron), Magician Tower, Dark Cathedral and Yalahar Academy of Magic in \z
		Magician Quarter and a single one on The Witches' Cliff (only accessible during a quest)."
	},
	[372] = {
		name = "Dark Apprentice",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Magician Tower, Dark Cathedral, Hero Cave, Magician Quarter."
	},
	[376] = {
		name = "Poacher",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South of Elvenbane and Ab'Dendriel, Ferngrims Gate, Northeast of Carlin, \z
		Edron Hunter Camps, Yalahar - Trade Quarter and Foreigner Quarter."
	},
	[521] = {
		name = "Mutated Human",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Alchemist Quarter and Factory Quarter (Yalahar), Robson's Isle, Tiquanda Laboratory."
	},
	[525] = {
		name = "Crazed Beggar",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Factory, Foreigner, and Trade Quarters in Yalahar."
	},
	[526] = {
		name = "Gang Member",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Throughout the Foreigner, Factory, and Trade Quarters in Yalahar."
	},
	[527] = {
		name = "Gladiator",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Trade Quarter, Arena and Zoo Quarter."
	},
	[528] = {
		name = "Mad Scientist",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Magician Quarter, Trade Quarter, Factory Quarter,Isle of Evil, Tiquanda Laboratory."
	},
	[529] = {
		name = "Infernalist",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Magician Quarter, Hero Cave, Demona, Fury Dungeon."
	},
	[578] = {
		name = "Acolyte of Darkness",
		class = "Human",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "Drefia."
	},
	[579] = {
		name = "Nightslayer",
		class = "Human",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Hellgate."
	},
	[583] = {
		name = "Doomsday Cultist",
		class = "Human",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "Tarpit Tomb."
	},
	[585] = {
		name = "Midnight Warrior",
		class = "Human",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Plains of Havoc."
	},
	[587] = {
		name = "Bride of Night",
		class = "Human",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Dwacatra (Kazordoon)."
	},
	[719] = {
		name = "Feverish Citizen",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Venore."
	},
	[776] = {
		name = "Nomad",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Drefia, Ankrahmun."
	},
	[777] = {
		name = "Nomad",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Drefia, Ankrahmun."
	},
	[867] = {
		name = "Grave Robber",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[868] = {
		name = "Crypt Defiler",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[922] = {
		name = "Adventurer",
		class = "Human",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore swamp."
	},
	[960] = {
		name = "Shadow Pupil",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia."
	},
	[961] = {
		name = "Blood Priest",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia and Old Fortress."
	},
	[974] = {
		name = "Blood Hand",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia."
	},
	[1119] = {
		name = "Glooth Bandit",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Underground Glooth Factory."
	},
	[1120] = {
		name = "Glooth Brigand",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Underground Glooth Factory."
	},
	[1145] = {
		name = "Vicious Squire",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Fortress (north of Edron), Old Masonry, Forbidden Temple (Carlin)."
	},
	[1146] = {
		name = "Renegade Knight",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Fortress (north of Edron), Old Masonry, Forbidden Temple (Carlin)."
	},
	[1147] = {
		name = "Vile Grandmaster",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Fortress (north of Edron), Old Masonry, Forbidden Temple (Carlin)."
	},
	[1413] = {
		name = "Misguided Thief",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Misguided Camp accessible via Outlaw Camp's portal."
	},
	[1481] = {
		name = "Goldhanded Cultist",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Museum of Tibian Arts."
	},
	[1482] = {
		name = "Goldhanded Cultist Bride",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Museum of Tibian Arts."
	},
	[1512] = {
		name = "Cult Believer",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Forbidden Temple (Carlin)."
	},
	[1513] = {
		name = "Cult Enforcer",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Forbidden Temple (Carlin)."
	},
	[1514] = {
		name = "Cult Scholar",
		class = "Human",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Forbidden Temple (Carlin)."
	},
	[1775] = {
		name = "Cobra Assassin",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Cobra Bastion."
	},
	[1776] = {
		name = "Cobra Scout",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Cobra Bastion."
	},
	[1798] = {
		name = "Burning Gladiator",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Issavi Sewers, Kilmaresh Catacombs and Kilmaresh Mountains (above and under ground)."
	},
	[1799] = {
		name = "Priestess of the Wild Sun",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Issavi Sewers, Kilmaresh Mountains, Kilmaresh Catacombs."
	},
	[1800] = {
		name = "Black Sphinx Acolyte",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Issavi Sewers, Kilmaresh Catacombs and Kilmaresh Mountains (above and under ground)."
	},
	[1824] = {
		name = "Cobra Vizier",
		class = "Human",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Cobra Bastion."
	},
	[2] = {
		name = "Orc Warlord",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Orc Fortress, Foreigner Quarter, Zao Orc Land."
	},
	[4] = {
		name = "Orc Rider",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Orc Fort, Orc Peninsula, near Dark Cathedral, Zao Orc Land."
	},
	[5] = {
		name = "Orc",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ulderek's Rock, Edron Orc Cave, Ancient Temple, Ice Islands, Venore Orc Cave, \z
		Rookgaard Orc Fortress, Rookgaard main cave, Fibula Dungeon, Elvenbane, Foreigner Quarter, Zao Orc Land."
	},
	[6] = {
		name = "Orc Shaman",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Edron Orc Cave, Temple of Xayepocax, below Point of No Return in Outlaw Camp, Venore Orc Cave, \z
		Maze of Lost Souls, Orc Fort, north west of Thais, Elvenbane, Plains Of Havoc, Foreigner Quarter, Zao Orc Land."
	},
	[7] = {
		name = "Orc Warrior",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple in Thais, Orc Fort, below Point of No Return in Outlaw Camp and inside a \z
		mountain north of it, Orc Peninsula, Folda, Edron Orc cave, Maze of Lost Souls, Elvenbane Castle, \z
		Foreigner Quarter, Zao Orc Land."
	},
	[8] = {
		name = "Orc Berserker",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Orc Fort, Dwacatra, Orc Peninsula, Elvenbane, Edron Orc Cave, Plains of Havoc, \z
		below Point of No Return in Outlaw Camp, Maze of Lost Souls, Cyclopolis, Desert Dungeon, \z
		Ancient Temple, Foreigner Quarter, Zao Orc Land."
	},
	[15] = {
		name = "Troll",
		class = "Humanoid",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In many dungeons around Tibia like the troll cave in Thais, south of Carlin (out the east \z
		exit and down the hole), Island of Destiny, Edron Troll Cave, and in Ab'Dendriel. Also found in Rookgaard."
	},
	[23] = {
		name = "Minotaur Mage",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Cyclopolis, Mintwallin, Maze of Lost Souls, Dark Pyramid, Folda (hidden cave), \z
		Kazordoon (The Horned Fox's hideout), the Plains of Havoc, Point of No Return south of Outlaw Camp, \z
		Elvenbane, the depths of Fibula Dungeon (level 50+), cave east from Dwarf Bridge, Foreigner Quarter, \z
		Rookgaard Minotaur Hell (not reachable)."
	},
	[24] = {
		name = "Minotaur Archer",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple, way to Mintwallin, Folda Underground Cave, Outlaw Camp, Plains of Havoc, \z
		Kazordoon Minotaur Tower, Daramian Minotaur Pyramid, Deeper Fibula Dungeon (level 50+ to open the door), \z
		Hero Cave, Foreigner Quarter and Elvenbane."
	},
	[25] = {
		name = "Minotaur",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Mino Hell (Rookgaard), Two outside Bear Room Quest, (Rookgaard) and also 2x on the premium side, \z
		Mintwallin, Folda, Minotaur Pyramid, Outlaw Camp, Kazordoon minotaur cave, Plains of Havoc, Elven Bane, \z
		Deeper Fibula Dungeon (level 50+ to open the door), Ancient Temple, Maze of Lost Souls, \z
		Thais Minotaur Camp, Foreigner Quarter."
	},
	[29] = {
		name = "Minotaur Guard",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple, Mintwallin, Minotaur Pyramid, Maze of Lost Souls, Folda, Cyclopolis, \z
		Deeper Fibula Dungeon (level 50+ to open the door), Hero Cave, underground of Elvenbane, \z
		Plains of Havoc, Kazordoon Minotaur Cave, Foreigner Quarter."
	},
	[50] = {
		name = "Orc Spearman",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Orc Fortress, Folda Dungeon, Edron Orc Cave and around it, Ancient Temple, \z
		Venore Orc Cave, below the Point of No Return in Outlaw Camp, Plains of Havoc, \z
		North of Thais in the Orc Peninsula, Elvenbane and Orc Camp in Foreigner Quarter. \z
		Also found in Rookgaard West plains, Zao Orc Land."
	},
	[53] = {
		name = "Frost Troll",
		class = "Humanoid",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Ice Islands, Svargrond and Edron."
	},
	[59] = {
		name = "Orc Leader",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Orc Fort, Edron Orc Cave, South of the temple in PoH, Maze of Lost Souls, Cyclopolis, Zao Orc Land."
	},
	[61] = {
		name = "Goblin",
		class = "Humanoid",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Femor Hills, north east of Carlin, Edron Goblin Cave, Rookgaard (Premium Area), \z
		Maze of Lost Souls and Fenrock."
	},
	[62] = {
		name = "Elf",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Yalahar Foreigner Quarter and Trade Quarter, Maze of Lost Souls, Orc Fort (unreachable), \z
		Hellgate, Shadowthorn, Ab'Dendriel elf caves, Elvenbane, north of Thais."
	},
	[63] = {
		name = "Elf Arcanist",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Yalahar Foreigner Quarter, Demona, Shadowthorn, northwest of Ab'Dendriel, Maze of Lost Souls, \z
		Cyclopolis, Elvenbane, near Mount Sternum."
	},
	[64] = {
		name = "Elf Scout",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Yalahar Foreigner Quarter, Shadowthorn, northwest of Ab'Dendriel, north and west of Mount Sternum, \z
		Hellgate, Maze of Lost Souls, near Knightwatch Tower in the Plains of Havoc. \z
		Two may also spawn when a Desperate White Deer or an Enraged White Deer is killed."
	},
	[66] = {
		name = "Dwarf Geomancer",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Mount Sternum Undead Cave, Dwarf Mines, Circle Room in Kazordoon, Triangle Tower, \z
		Tiquanda Dwarf Cave, Cormaya Dwarven Cave, Beregar Mines."
	},
	[69] = {
		name = "Dwarf",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Kazordoon Dwarf Mines, Dwarf Bridge, deep Elvenbane, Tiquanda Dwarf Cave, Cormaya Dwarf Cave, \z
		Island of Destiny (Knights area), Beregar."
	},
	[70] = {
		name = "Dwarf Guard",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Kazordoon Dwarf Mines, Dwacatra, Ferngrims Gate, Cyclopolis, Mount Sternum Undead Cave, \z
		Stonehome Rotworm cave (near Edron), Maze of Lost Souls, Tiquanda Dwarf Cave, Beregar, Cormaya Dwarf Cave."
	},
	[71] = {
		name = "Dwarf Soldier",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Kazordoon Dwarf Mines, Cyclopolis, Dwacatra, Ferngrims Gate, Dwarf Bridge, \z
		Mount Sternum Undead Cave, Beregar, Tiquanda Dwarf Cave, Cormaya Dwarf Cave."
	},
	[76] = {
		name = "Swamp Troll",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Port Hope Swamp Trolls, Venore Swamp Troll Cave, all around north area of Port Hope, \z
		small spawn north-west of Venore and in cave south-east of Thais, also one in Foreigner Quarter."
	},
	[214] = {
		name = "Dworc Voodoomaster",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South of Port Hope around Trapwood. There is also a group of 3 voodoomasters \z
		and 2 crypt shamblers on the shore east of Trapwood."
	},
	[215] = {
		name = "Dworc Fleshhunter",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South of Port Hope (Trapwood) on ground level and underground."
	},
	[216] = {
		name = "Dworc Venomsniper",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South of Port Hope (Trapwood) on ground level and underground and on Foreigner Quarter of Yalahar."
	},
	[277] = {
		name = "Island Troll",
		class = "Humanoid",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Goroma."
	},
	[319] = {
		name = "Chakoya Tribewarden",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Inukaya, Chyllfroest, Chakoya Iceberg, Nibelor (during a quest)."
	},
	[328] = {
		name = "Chakoya Toolshaper",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Inukaya, Chyllfroest, Chakoya Iceberg."
	},
	[329] = {
		name = "Chakoya Windcaller",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Inukaya, Chyllfroest, Chakoya Iceberg."
	},
	[377] = {
		name = "Goblin Leader",
		class = "Humanoid",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "Way to Beregar, below Femor Hills (Tower Defence Quest), near Femor Hills during Goblin raid."
	},
	[379] = {
		name = "Dwarf Henchman",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "In Kazordoon, near Talphion behind sealed door, created by the Dwarf Dispenser."
	},
	[392] = {
		name = "Troll Champion",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Edron Troll-Goblin Peninsula, Ab'dendriel Shadow Caves, Thais South-East Troll Caves, \z
		Dusalk's Troll Clan Cave, Island of Destiny in Paladin's guild."
	},
	[393] = {
		name = "Grynch Clan Goblin",
		class = "Humanoid",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 10,
		Stars = 1,
		Occurrence = 3,
		Locations = "They do not have a set respawn spot. They are announced to be stealing presents from a \z
			random Tibian city and spawn in the aforetold city. \z
			There are two or three messages that appear on each raid and three massive spawns of goblins."
	},
	[463] = {
		name = "Goblin Assassin",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Femor Hills, Edron Goblin Cave and Fenrock."
	},
	[464] = {
		name = "Goblin Scavenger",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Femor Hills, Edron Goblin Cave, and Fenrock."
	},
	[540] = {
		name = "Furious Troll",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Old Beregar mines."
	},
	[541] = {
		name = "Troll Legionnaire",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Beregar mines. In group with Furious Trolls almost all the time."
	},
	[614] = {
		name = "Orc Marauder",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zao Orc Land."
	},
	[737] = {
		name = "Firestarter",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Shadowthorn, during the Thornfire World Change."
	},
	[741] = {
		name = "Elf Overseer",
		class = "Humanoid",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Shadowthorn."
	},
	[745] = {
		name = "Troll Guard",
		class = "Humanoid",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "Rookgaard's central cave in the new western Troll tunnel, \z
		north-west of Carlin during raids and Thais Knights' Guild arena during raids on Kingsday."
	},
	[886] = {
		name = "Enslaved Dwarf",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Caves of the Lost and Lower Spike."
	},
	[888] = {
		name = "Lost Berserker",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Warzones 2 and 3."
	},
	[916] = {
		name = "Corym Charlatan",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore Corym Cave, Tiquanda Corym Cave, Corym Black Market, \z
		Carlin Corym Cave/Dwarf Mines Diggers Depths Mine, Upper Spike."
	},
	[917] = {
		name = "Corym Skirmisher",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Venore Corym Cave, Tiquanda Corym Cave, Corym Black Market, \z
		Carlin Corym Cave/Dwarf Mines Diggers Depths Mine, Upper Spike."
	},
	[918] = {
		name = "Corym Vanguard",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Venore Corym Cave, Tiquanda Corym Cave, Corym Black Market, \z
		Carlin Corym Cave/Dwarf Mines Diggers Depths Mine, Upper Spike."
	},
	[920] = {
		name = "Little Corym Charlatan",
		class = "Humanoid",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Venore marshes."
	},
	[924] = {
		name = "Lost Husher",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Caves of the Lost, Lower Spike and in the Lost Dwarf version of the Forsaken Mine."
	},
	[925] = {
		name = "Lost Basher",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Caves of the Lost, Lower Spike and in the Lost Dwarf version of the Forsaken Mine."
	},
	[926] = {
		name = "Lost Thrower",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Caves of the Lost, Lower Spike and in the Lost Dwarf version of the Forsaken Mine."
	},
	[1044] = {
		name = "Moohtant",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond Mountain Hideout, Oramond Minotaur Camp (northern camp), \z
		Underground Glooth Factory, Oramond Dungeon."
	},
	[1045] = {
		name = "Minotaur Amazon",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Underground Glooth Factory, Oramond Minotaur Camp, Oramond Dungeon."
	},
	[1046] = {
		name = "Execowtioner",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond Mountain Hideout, Oramond Minotaur Camp (northern camp), \z
		Underground Glooth Factory, Oramond Dungeon."
	},
	[1051] = {
		name = "Mooh'Tah Warrior",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond/Southern Plains, Minotaur Hills, \z
		Oramond Dungeon (depending on Magistrate votes), Underground Glooth Factory."
	},
	[1052] = {
		name = "Minotaur Hunter",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond/Southern Plains, Minotaur Hills, \z
		Oramond Dungeon (depending on Magistrate votes), Underground Glooth Factory"
	},
	[1053] = {
		name = "Worm Priestess",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond/Southern Plains, Minotaur Hills, \z
		Oramond Dungeon (depending on Magistrate votes), Underground Glooth Factory, Oramond Fury Dungeon."
	},
	[1109] = {
		name = "Minotaur Invader",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Second floor Glooth Underground Factory, east side during the Minotaurs raid."
	},
	[1321] = {
		name = "Broken Shaper",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Astral Shaper Dungeon, Old Masonry."
	},
	[1322] = {
		name = "Twisted Shaper",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Astral Shaper Dungeon, Old Masonry, small dungeon under the Formorgar Mines."
	},
	[1394] = {
		name = "Shaper Matriarch",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Masonry, small dungeon under the Formorgar Mines."
	},
	[1412] = {
		name = "Misguided Bully",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Misguided Camp accessible via Outlaw Camp's portal."
	},
	[1486] = {
		name = "Barkless Devotee",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Barkless Cult Trial Zone (below Ab'Dendriel)."
	},
	[1488] = {
		name = "Barkless Fanatic",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Barkless Cult Trial Zone (below Ab'Dendriel)."
	},
	[1503] = {
		name = "Orc Cultist",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Edron Orc Cave."
	},
	[1504] = {
		name = "Orc Cult Priest",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Edron Orc Cave."
	},
	[1505] = {
		name = "Orc Cult Inquisitor",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Edron Orc Cave."
	},
	[1506] = {
		name = "Orc Cult Fanatic",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Edron Orc Cave."
	},
	[1507] = {
		name = "Orc Cult Minion",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Edron Orc Cave."
	},
	[1508] = {
		name = "Minotaur Cult Follower",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Minotaurs Cult Cave."
	},
	[1509] = {
		name = "Minotaur Cult Prophet",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Minotaurs Cult Cave."
	},
	[1510] = {
		name = "Minotaur Cult Zealot",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Minotaurs Cult Cave."
	},
	[1529] = {
		name = "Lost Exile",
		class = "Humanoid",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "South east of the Gnome Deep Hub's entrance."
	},
	[1730] = {
		name = "Crazed Winter Vanguard",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Winter, Dream Labyrinth."
	},
	[1731] = {
		name = "Crazed Winter Rearguard",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Winter, Dream Labyrinth."
	},
	[1732] = {
		name = "Crazed Summer Vanguard",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Winter, Dream Labyrinth."
	},
	[1733] = {
		name = "Crazed Summer Rearguard",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Winter, Dream Labyrinth."
	},
	[1734] = {
		name = "Soul-Broken Harbinger",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Winter."
	},
	[1735] = {
		name = "Insane Siren",
		class = "Humanoid",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Court of Summer."
	},
	[510] = {
		name = "Werewolf",
		class = "Lycanthrope",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Vengoth Castle, Vengoth Werewolf Cave, Grimvale, were-beasts cave south-west of Edron."
	},
	[1142] = {
		name = "Werebear",
		class = "Lycanthrope",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Grimvale underground, were-beasts cave south-west of Edron and in the Last Sanctum east of Cormaya."
	},
	[1143] = {
		name = "Wereboar",
		class = "Lycanthrope",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Grimvale underground, were-beasts cave south-west of Edron and in the Last Sanctum east of Cormaya."
	},
	[1144] = {
		name = "Werebadger",
		class = "Lycanthrope",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Grimvale: -1 floor from ground level, also seen on surface during full moon (12th-14th of every month). \z
		Also in the were-beasts cave south-west of Edron and in the Last Sanctum."
	},
	[1549] = {
		name = "Werefox",
		class = "Lycanthrope",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Were-beasts cave south-west of Edron and in the Last Sanctum east of Cormaya."
	},
	[17] = {
		name = "Bonelord",
		class = "Magical",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple, Alatar Lake, Mount Sternum Undead Cave, Desert Dungeon, Hellgate, \z
		Helheim, Fibula Dungeon, Villa Scapula, Hero Cave before Dragons, Eastern Drefia, Folda hidden cave, \z
		Maze of Lost Souls, way to Mintwallin, before Kazordoon city entrance, abandoned building east of Venore, \z
		Green Claw Swamp, north of the Venore Amazon Camp, Below Point of No Return in Outlaw Camp, Vandura Bonelord Cave, \z
		Triangle Tower, Hidden cave north of Port Hope, Deeper Banuta, Dark Cathedral, Shadow Tomb, Ancient Ruins Tomb, \z
		Tarpit Tomb, Mountain Tomb, Peninsula Tomb, Oasis Tomb and beneath Fenrock."
	},
	[51] = {
		name = "Green Djinn",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Mal'ouquah, Oasis Tomb, under the Ankrahmun Library Tomb, \z
		Serpentine Tower last floor behind the Magic Walls, Deeper Banuta, Goroma underground, Magician Quarter."
	},
	[80] = {
		name = "Blue Djinn",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Kha'zeel, Magician Quarter, Forgotten Tomb."
	},
	[95] = {
		name = "Gargoyle",
		class = "Magical",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Meriana Gargoyle Cave, Ankrahmun Tombs, Mal'ouquah, Goroma, Deeper Banuta, \z
		Formorgar Mines, Vengoth, Farmine Mines, Upper Spike and Medusa Tower."
	},
	[103] = {
		name = "Efreet",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Mal'ouquah, Deeper Banuta, Goromas Cult Cave (in the classroom), Magician Quarter."
	},
	[104] = {
		name = "Marid",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Kha'zeel, Magician Quarter."
	},
	[108] = {
		name = "Elder Bonelord",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Hellgate, near the Hellgate Library, Deeper Banuta, behind piano in Cult Cave to the \z
		northeast of Liberty Bay, Vandura Bonelord Cave, Goroma, Helheim, \z
		underground of Fenrock (on the way to Beregar), Vengoth."
	},
	[109] = {
		name = "Gazer",
		class = "Magical",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Hellgate bonelord cave, Vandura Bonelord Cave, also anywhere Elder Bonelords exist, as summons."
	},
	[292] = {
		name = "Phantasm",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, The Inquisition Quest, Deeper Banuta."
	},
	[299] = {
		name = "Nightmare",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Pits of Inferno, Formorgar Mines, Cemetery Quarter, Edron \z
		(In multiple places during The Inquisition Quest), Alchemist Quarter, Vengoth Castle, Deeper Banuta, Krailos Ruins."
	},
	[330] = {
		name = "Crystal Spider",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Atop of the Formorgar Glacier and deep inside Formorgar Mines, Frost Dragon Tunnel, \z
		Ice Witch Temple, Nibelor Ice Cave, the Crystal Caves in The Inquisition Quest, Mushroom Gardens."
	},
	[460] = {
		name = "Bog Raider",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Underneath Malada and Talahu, Edron Bog Raider Cave in Stonehome, \z
		Edron Earth Elemental Cave, Alchemist Quarter, Vengoth Castle, Robson Isle. Oramond Hydra/Bog Raider Cave."
	},
	[518] = {
		name = "Nightmare Scion",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cemetery Quarter, Alchemist Quarter and in the Arena and Zoo Quarter (unreachable), \z
		Vengoth Castle, Formorgar Mines, Lower Spike, Robson Isle (single respawn), Krailos."
	},
	[520] = {
		name = "Nightstalker",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cemetery Quarter, Vengoth Castle, Vandura Mountain, Robson Isle."
	},
	[570] = {
		name = "Medusa",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Vandura Mountain (single spawn), Talahu (Medusa Cave), Deeper Banuta, Medusa Tower"
	},
	[698] = {
		name = "Midnight Panther",
		class = "Magical",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Tiquanda."
	},
	[739] = {
		name = "Thornfire Wolf",
		class = "Magical",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Shadowthorn."
	},
	[740] = {
		name = "Crystal Wolf",
		class = "Magical",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Shadowthorn."
	},
	[869] = {
		name = "Crystalcrusher",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Crystal Grounds, Mushroom Farms, Middle Spike."
	},
	[880] = {
		name = "Armadile",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Warzone 1."
	},
	[894] = {
		name = "Dragonling",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Fury Dungeon and Goroma volcano (surface floor, inner volcano) only during the \z
		Fire from the Earth Mini World Change."
	},
	[978] = {
		name = "Rorc",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "South-west of Ulderek's Rock and in the Rorc version of the Forsaken Mine."
	},
	[980] = {
		name = "Forest Fury",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Forest Fury Camp and in the Forest Fury version of the Forsaken Mine."
	},
	[1004] = {
		name = "Shock Head",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Sparsely in eastern Lower Roshamuu and southern Guzzlemaw Valley."
	},
	[1012] = {
		name = "Sight of Surrender",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Dark Grounds, Guzzlemaw Valley (if less than 100 Blowing Horns tasks \z
		have been done the day before) and the Silencer Plateau (when Silencer Resonating Chambers are used there)."
	},
	[1013] = {
		name = "Guzzlemaw",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Guzzlemaw Valley, and a single spawn in a tower in Upper Roshamuul \z
		(south of the Depot and west of the entrance to Roshamuul Prison)."
	},
	[1014] = {
		name = "Silencer",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "All over the Roshamuul surface and Nightmare Isles."
	},
	[1015] = {
		name = "Choking Fear",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "All over the surface of Upper Roshamuul and Nightmare Isles."
	},
	[1016] = {
		name = "Terrorsleep",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Roshamuul Mines, Roshamuul Cistern."
	},
	[1018] = {
		name = "Retching Horror",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "All over the surface of Upper Roshamuul and Nightmare Isles."
	},
	[1021] = {
		name = "Feversleep",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Roshamuul Mines, Roshamuul Cistern."
	},
	[1022] = {
		name = "Frazzlemaw",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Lower Roshamuul, Guzzlemaw Valley, the entrance to Upper Roshamuul."
	},
	[1137] = {
		name = "Tainted Soul",
		class = "Magical",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tainted Caves in the Green Claw Swamp."
	},
	[1138] = {
		name = "Redeemed Soul",
		class = "Magical",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tainted Caves in the Green Claw Swamp (under the right conditions)."
	},
	[1157] = {
		name = "Elder Forest Fury",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Dryad Gardens (on the hills)."
	},
	[1442] = {
		name = "Weakened Frazzlemaw",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist."
	},
	[1443] = {
		name = "Enfeebled Silencer",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Feyrist."
	},
	[1653] = {
		name = "Brain Squid",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1654] = {
		name = "Flying Book",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Secret Library."
	},
	[1655] = {
		name = "Cursed Book",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Secret Library."
	},
	[1659] = {
		name = "Guardian of Tales",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Secret Library."
	},
	[1663] = {
		name = "Burning Book",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1664] = {
		name = "Icecold Book",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1665] = {
		name = "Energetic Book",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1666] = {
		name = "Energuardian of Tales",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Secret Library."
	},
	[1668] = {
		name = "Rage Squid",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1669] = {
		name = "Squid Warden",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[1671] = {
		name = "Animated Feather",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "The Secret Library."
	},
	[1721] = {
		name = "Lumbering Carnivor",
		class = "Magical",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Carnivora's Rocks."
	},
	[1722] = {
		name = "Spiky Carnivor",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Carnivora's Rocks."
	},
	[1723] = {
		name = "Menacing Carnivor",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Carnivora's Rocks."
	},
	[1728] = {
		name = "Thanatursus",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Haunted Temple, Court of Winter, Dream Labyrinth."
	},
	[1729] = {
		name = "Arachnophobica",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Buried Cathedral, Haunted Cellar, Court of Summer, Court of Winter, Dream Labyrinth."
	},
	[1808] = {
		name = "Sphinx",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Nykri Delta, Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Kilmaresh Catacombs."
	},
	[1807] = {
		name = "Feral Sphinx",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh, south of Issavi."
	},
	[1806] = {
		name = "Lamassu",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh."
	},
	[1816] = {
		name = "Manticore",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh."
	},
	[1819] = {
		name = "Gryphon",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 1,
		Locations = "Kilmaresh Mountains."
	},
	[1805] = {
		name = "Crypt Warden",
		class = "Magical",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Catacombs."
	},
	[3] = {
		name = "War Wolf",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Orc Fort, the Orc Peninsula, Magician Tower and northwest (tower) or south \z
		(underground) of Thais, Zao steppe (encaged), Vengoth."
	},
	[13] = {
		name = "Black Sheep",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Femor Hills, cultist cave in Liberty Bay, Drefia."
	},
	[14] = {
		name = "Sheep",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In Rookgaard Sheep field, Greenshore and other farms like the one in Thais, east of Carlin. \z
		They can also be found wandering the fields of Edron, and some can be found along with a \z
		Black Sheep with the Hunter in Femur Hills."
	},
	[16] = {
		name = "Bear",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Several spawns near Kazordoon, Femor Hills, north of Thais, near the White Flower Temple, \z
		Rookgaard Bear Cave, Bear Room Quest in Rookgaard, Rookgaard Bear Mountain, South of Villa Scapula, \z
		Ferngrims Gate, North of Carlin, Fields of Glory, Edron Troll Cave, south of Venore, Desert Dungeon, \z
		first floor of the Orc Fort mountain and west of Outlaw Camp."
	},
	[21] = {
		name = "Rat",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Rookgaard and Mainland, in most sewers and caves near towns. \z
		They can be found almost everywhere in Tibia."
	},
	[27] = {
		name = "Wolf",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In almost all grass areas in Tibia, also found in Rookgaard and Dawnport."
	},
	[31] = {
		name = "Deer",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Darama (Devourer, Kha'labal), in most grassy areas of Tibia, also found in \z
		Rookgaard and on Tutorial Island. There are also 2 unreachable Deer found near Fiehonja's protection zone."
	},
	[32] = {
		name = "Dog",
		class = "Mammal",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Isle of the Kings, North of the Thais temple, Lubos house, west of Carlin (with sheep), \z
		Edron north of castle and one south towards Ivory Towers, Liberty Bay (Silverhand Manor), \z
		Mintwallin central park and on the way to the old Mintwallin area, Factory Quarter (Yalahar)."
	},
	[41] = {
		name = "Lion",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Jakundaf Desert, Darama, Arena Quarter, Venore Amazon Camp."
	},
	[42] = {
		name = "Polar Bear",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ice Islands."
	},
	[52] = {
		name = "Winter Wolf",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Ice Islands."
	},
	[56] = {
		name = "Cave Rat",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Almost everywhere in tibia, they seem to have a nest-like place in Greenshore, \z
		a semi-large spawn at the entrance to the Port Hope troll cave and in cave near Ankrahmun ship. \z
		Also appears in Rat Plague in Thais and Rat Plague in Rookgaard."
	},
	[60] = {
		name = "Pig",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Rookgaard, Orc Fort, under Femor Hills with Goblins, some farms like The McRonald's Farm, \z
		Liberty Bay slums and Nargor, Foreigner Quarter in Yalahar, Isle of the Kings, \z
		cells in Tafariel's throneroom in Pits of Inferno, Gardens of Night."
	},
	[74] = {
		name = "Rabbit",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In most grass areas of Tibia, for example on Tutorial Island."
	},
	[94] = {
		name = "Hyaena",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Desert areas like those around Ankrahmun and Darashia."
	},
	[105] = {
		name = "Badger",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Hrodmir, southern Tiquanda, unannounced raid in Ab'Dendriel and Edron."
	},
	[106] = {
		name = "Skunk",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Unannounced raid in Edron outside the depot, Tiquanda, Shattered Isles, \z
		Liberty Bay, south gate of Thais."
	},
	[110] = {
		name = "Yeti",
		class = "Mammal",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Folda, Chyllfroest, Isle of Merriment."
	},
	[116] = {
		name = "Kongra",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "In Banuta, northeast of Port Hope, Arena and Zoo Quarter."
	},
	[117] = {
		name = "Merlkin",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Banuta, north-east of Port Hope."
	},
	[118] = {
		name = "Sibang",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "In Banuta, north-east of Port Hope."
	},
	[122] = {
		name = "Bat",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Dark Cathedral, Tiquanda, Drefia, Mount Sternum, Folda, Ghostlands, Kazordoon, \z
		Femor Hills, Thais Bat Dungeon, Thais Bandit Cave and in many other caves."
	},
	[123] = {
		name = "Panda",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South of Port Hope around Trapwood, as well as a lone specimen in the Arena Quarter."
	},
	[125] = {
		name = "Tiger",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tiquanda, Meriana, Arena and Zoo Quarter. Three unreachable ones are found in the Rookgaard Academy, \z
		below Ankrahmun (during the Nomads Land Quest), and on Charles's ship."
	},
	[211] = {
		name = "Elephant",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "East of Port Hope close to Grizzly Adams, deep in the jungle, \z
		Arena and Zoo Quarter, Mammoth Shearing Factory."
	},
	[260] = {
		name = "Mammoth",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Formorgar Glacier, Tyrsung, around the Barbarian Settlements, Mammoth Shearing Factory, Chyllfroest."
	},
	[325] = {
		name = "Husky",
		class = "Mammal",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 1,
		Locations = "Svargrond and Nibelor."
	},
	[327] = {
		name = "Silver Rabbit",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "A lot of places on the Ice Islands and one on Rookgaard (unreachable)."
	},
	[384] = {
		name = "Squirrel",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "North of Carlin, Northwest of Thais, East of Kazordoon, Yalahar, Dawnport, \z
		Edron Hunters Camp, Plains of Havoc and other Tibian woods."
	},
	[387] = {
		name = "Cat",
		class = "Mammal",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Carlin, Rookgaard, Factory Quarter, Yalahar, \z
		The Witches' Cliff (only accessible during a quest), probably more areas."
	},
	[502] = {
		name = "Mutated Rat",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Alchemist Quarter, Arena and Zoo Quarter (Inside the arena with other mutated creatures), \z
		Razzachai, Vampire Castle on Vengoth, Robson's Isle, Mushroom Gardens, Souleater Mountains, \z
		Northern Zao Plantations, Middle Spike."
	},
	[509] = {
		name = "Mutated Bat",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cemetery Quarter (around 10 underground on the west side along with banshees, \z
		and 4 bats on the church roof), Alchemist Quarter (4 found on top of roofs), \z
		Arena and Zoo Quarter (2 under the arena with other mutated creatures), \z
		Razzachai, Northern Zao Plantations, Souleater Mountains, Middle Spike, Vengoth and Vengoth Castle."
	},
	[516] = {
		name = "Mutated Tiger",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Alchemist Quarter, Arena and Zoo Quarter (Inside with other mutated creatures), \z
		Muggy Plains, Souleater Mountains and Northern Zao Plantations."
	},
	[555] = {
		name = "Evil Sheep",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Isle of Evil."
	},
	[556] = {
		name = "Evil Sheep Lord",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[557] = {
		name = "Hot Dog",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[559] = {
		name = "Doom Deer",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[560] = {
		name = "Killer Rabbit",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Isle of Evil."
	},
	[630] = {
		name = "Gnarlhound",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Zao Steppe, Raging Mage Tower, Gnarlhound Caves. \z
		Four inaccessible ones can be seen in Telas's basement."
	},
	[693] = {
		name = "Boar",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Forest around Outlaw Camp."
	},
	[720] = {
		name = "White Deer",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 2,
		Locations = "Around Ab'Dendriel, Carlin (east from Lothar), Femor Hills and Ferngrims Gate, usually in pairs. \z
		They will appear when they're not overhunted."
	},
	[723] = {
		name = "Starving Wolf",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "East, west and south-west of the Femor Hills."
	},
	[730] = {
		name = "Wild Horse",
		class = "Mammal",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 10,
		Stars = 1,
		Occurrence = 3,
		Locations = "Near the Thais Troll Cave entrance during the Horse Station World Change."
	},
	[733] = {
		name = "Dromedary",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Ankrahmun near way to Darashia, Ankrahmun near sea, also in few places around Darashia."
	},
	[750] = {
		name = "Horse",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 1,
		Locations = "South-east, east and north-east of Thais depending on the Horse Station World Change; \z
		one near Roswitha in Rathleton."
	},
	[751] = {
		name = "Horse",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 2,
		Locations = "South-east, east and north-east of Thais depending on the Horse Station World Change; \z
		one in the Gardens of Night (here, unreachable); one near Roswitha in Rathleton."
	},
	[752] = {
		name = "Horse",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 1,
		Locations = "South-east, east and north-east of Thais depending on the Horse Station World Change."
	},
	[870] = {
		name = "Mushroom Sniffer",
		class = "Mammal",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Truffels Garden."
	},
	[872] = {
		name = "Water Buffalo",
		class = "Mammal",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 30,
		Stars = 2,
		Occurrence = 3,
		Locations = "It raids every four hours, starting at server save, in groups of one to three at \z
		various places around Venore swamp, especially near the southern production site."
	},
	[877] = {
		name = "Modified Gnarlhound",
		class = "Mammal",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 1,
		Locations = "South of Stonehome, deep under Telas's house."
	},
	[898] = {
		name = "Vulcongra",
		class = "Mammal",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Hot Spot (in Gnomebase Alpha) and Lower Spike."
	},
	[981] = {
		name = "Roaring Lion",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Lion's Rock a few floors down."
	},
	[1118] = {
		name = "Noble Lion",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Lion's Rock temple."
	},
	[1139] = {
		name = "Gloom Wolf",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "Tainted Caves, Poacher Caves/Gloomy."
	},
	[1174] = {
		name = "Clomp",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Krailos Steppe."
	},
	[1395] = {
		name = "Stone Rhino",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Area before final boss of Forgotten Knowledge Quest."
	},
	[1548] = {
		name = "Fox",
		class = "Mammal",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "South-west of Edron, possibly other places."
	},
	[1570] = {
		name = "Mole",
		class = "Mammal",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Warzone 4 and Warzone 6."
	},
	[1742] = {
		name = "Baleful Bunny",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Percht Island"
	},
	[1855] = {
		name = "Roast Pork",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Orcsoberfest Island"
	},
	[1856] = {
		name = "Cow",
		class = "Mammal",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Orcsoberfest Island"
	},
	[120] = {
		name = "Carniphila",
		class = "Plant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Deep inside the Tiquanda Jungle including Tiquanda Laboratory and a small cave, \z
		Forbidden Lands, Deeper Banuta, Arena and Zoo quarter in Yalahar."
	},
	[221] = {
		name = "Spit Nettle",
		class = "Plant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tiquanda, Trapwood, the outskirts of Chor and Forbidden Lands, Alchemist Quarter in Yalahar, \z
		Tiquanda Laboratory."
	},
	[511] = {
		name = "Haunted Treeling",
		class = "Plant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Vengoth surface, Vengoth Castle (Boreth's tower), Northern Zao Plantations, Tiquanda Laboratory, \z
		Dryad Gardens."
	},
	[679] = {
		name = "Bane Bringer",
		class = "Plant",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Green Claw Swamp underground, near the big witches' cauldron."
	},
	[881] = {
		name = "Humongous Fungus",
		class = "Plant",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 1, Rathleton Sewers, unreachable location in Tiquanda Laboratory."
	},
	[891] = {
		name = "Hideous Fungus",
		class = "Plant",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 1, Rathleton Sewers, unreachable location in Tiquanda Laboratory."
	},
	[919] = {
		name = "Swampling",
		class = "Plant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore swamp area, Venore Salamander Cave, Tiquanda Laboratory."
	},
	[979] = {
		name = "Leaf Golem",
		class = "Plant",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Leaf dungeon in Hellgate, Lair of the Treeling Witch, Forest Fury Camp and in the \z
		Forest Fury version of the Forsaken Mine."
	},
	[982] = {
		name = "Wilting Leaf Golem",
		class = "Plant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Forest Fury Camp, Lair of the Treeling Witch and in the Forest Fury version of the Forsaken Mine."
	},
	[1042] = {
		name = "Glooth Anemone",
		class = "Plant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Rathleton Sewers, Underground Glooth Factory, Jaccus Maxxen's Dungeon"
	},
	[1141] = {
		name = "Omnivora",
		class = "Plant",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Tiquanda Medusa Tower."
	},
	[28] = {
		name = "Snake",
		class = "Reptile",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In almost all grassy areas of Tibia. Also found in Rookgaard."
	},
	[81] = {
		name = "Cobra",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ankrahmun Library Tomb, Tarpit Tomb, Mountain Tomb, Peninsula Tomb, Darama, Tiquanda, \z
		Drefia, Forbidden Lands, Arena Quarter, Lion's Rock."
	},
	[113] = {
		name = "Lizard Templar",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Chor, the lizard city south-east from Port Hope. They can also be found in Yalahar's \z
		Foreigner Quarter and in Zzaion."
	},
	[114] = {
		name = "Lizard Sentinel",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Chor, Zzaion and Foreigner Quarter."
	},
	[115] = {
		name = "Lizard Snakecharmer",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Chor."
	},
	[119] = {
		name = "Crocodile",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "In the crocodile cave and the jungle east of Port Hope as well as the swamp to the north, \z
		Fenrock, Arena and Zoo Quarter, Trade Quarter, Talahu, also located on Meriana and Laguna Islands."
	},
	[220] = {
		name = "Serpent Spawn",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Deeper Banuta, Forbidden Islands: Talahu (Medusa Cave) and Kharos (at level -1), Razzachai, \z
		Deep below the Crystal Lakes in Foreigner Quarter, Cult's cave in the Magician Quarter, Medusa Tower."
	},
	[258] = {
		name = "Tortoise",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Laguna Islands, Fenrock, Port Hope and also can be found behind a wall below the \z
		center of Liberty Bay. These cannot be reached."
	},
	[259] = {
		name = "Thornback Tortoise",
		class = "Reptile",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Laguna Islands and one on Nargor."
	},
	[290] = {
		name = "Wyvern",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Beregar, Black Knight's Villa, Chor, Ghostlands, Chyllfroest, Crystal Gardens, \z
		Crystal Grounds, Dragon Lair (Edron), Drillworm Cave, Folda, Hero Fortress, Kazordoon, \z
		Green Djinn Tower, Mushroom Fields,Paradox Tower, Plains of Havoc, Plague Spike, \z
		Poachers' Camp (Ferngrims Gate), Stonehome, Tiquanda, Truffels Garden, \z
		Vandura Mountain, Vega, Venore, Wyvern Cave (Ferngrims Gate), Wyvern Hill and Wyvern Ulderek's Rock Cave."
	},
	[438] = {
		name = "Sea Serpent",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Sea Serpent Area and Seacrest Grounds."
	},
	[439] = {
		name = "Young Sea Serpent",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Sea Serpent Area."
	},
	[616] = {
		name = "Lizard Zaogun",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zzaion, Zao Palace, Muggy Plains, Zao Orc Land (in fort), Razzachai, Temple of Equilibrium."
	},
	[620] = {
		name = "Lizard Chosen",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Temple of Equilibrium (Zao) Hidden stairs, Fire Dragon Dojo, Corruption Hole, Razzachai."
	},
	[623] = {
		name = "Lizard Dragon Priest",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zzaion, Zao Palace and its antechambers, Muggy Plains, Corruption Hole, Razachai, \z
		Temple of Equilibrium, Northern Zao Plantations."
	},
	[624] = {
		name = "Lizard Legionnaire",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zzaion, Zao Palace and its antechambers, Muggy Plains, Zao Orc Land (in fort), \z
		Corruption Hole, Razachai, Temple of Equilibrium, Northern Zao Plantations."
	},
	[625] = {
		name = "Lizard High Guard",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zzaion, Zao Palace and its antechambers, Muggy Plains, Zao Orc Land (single spawn in fort), \z
		Corruption Hole, Razachai, Temple of Equilibrium, Northern Zao Plantations."
	},
	[627] = {
		name = "Killer Caiman",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Northern Zao Plantations, Souleater Mountains, Muggy Plains, \z
		Killer Caiman Cave in the Zao Steppe, Chyllfroest."
	},
	[655] = {
		name = "Lizard Magistratus",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Razzachai."
	},
	[656] = {
		name = "Lizard Noble",
		class = "Reptile",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Razzachai."
	},
	[694] = {
		name = "Stampor",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Stampor Cave on the Muggy Plains, Chyllfroest."
	},
	[695] = {
		name = "Draptor",
		class = "Reptile",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Zao, north east of Dragonblaze Peaks during raid. There are up to 10 draptors per raid, \z
		while 6 of them may also appear in mission 8 of Wrath of the Emperor Quest."
	},
	[1096] = {
		name = "Seacrest Serpent",
		class = "Reptile",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 2,
		Locations = "Seacrest Grounds."
	},
	[1525] = {
		name = "Stonerefiner",
		class = "Reptile",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Corym Mines."
	},
	[1817] = {
		name = "Young Goanna",
		class = "Reptile",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Green Belt."
	},
	[1818] = {
		name = "Adult Goanna",
		class = "Reptile",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Kilmaresh Central Steppe, Kilmaresh Southern Steppe, Green Belt."
	},
	[19] = {
		name = "Slime",
		class = "Slime",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple under the Rotworm area, under White Flower Temple, \z
		Mount Sternum Undead Cave on the last floor, Thais Troll Cave, Bonelord cave in Drefia, \z
		Green Claw Swamp, Dwarf Mines, Villa Scapula, Ankrahmun Tombs, Dark Cathedral, north of Port Hope, \z
		Deeper Banuta, on Folda on the floor above the Water Elementals, Hellgate, Vengoth, Alchemist Quarter, \z
		Yalahar and Carlin sewers, Ghostlands, Desert Dungeon, Dusalk's Troll Clan Cave, Nargor, \z
		and in a cave northeast of Ab'Dendriel."
	},
	[20] = {
		name = "Squidgy Slime",
		class = "Slime",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[265] = {
		name = "Son of Verminor",
		class = "Slime",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Deep in the Pits of Inferno, in Verminor's throne room. Also in the Demon Forge (The Vats and The Hive)."
	},
	[289] = {
		name = "Defiler",
		class = "Slime",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, The Vats - Edron."
	},
	[513] = {
		name = "Acid Blob",
		class = "Slime",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Alchemist Quarter, Deeper Banuta."
	},
	[514] = {
		name = "Death Blob",
		class = "Slime",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Alchemist Quarter, Drefia, Razzachai, Souleater Mountains, \z
		Northern Zao Plantations and Raging Mage tower."
	},
	[515] = {
		name = "Mercury Blob",
		class = "Slime",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Alchemist Quarter."
	},
	[584] = {
		name = "Midnight Spawn",
		class = "Slime",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Forbidden Lands."
	},
	[1054] = {
		name = "Glooth Blob",
		class = "Slime",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond/Western Plains, Lower Rathleton, Glooth Factory, Underground Glooth Factory, Rathleton Sewers."
	},
	[1056] = {
		name = "Devourer",
		class = "Slime",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Rathleton Sewers, Lower Rathleton, Oramond/Western Plains, \z
		Underground Glooth Factory, Jaccus Maxxen's Dungeon."
	},
	[1658] = {
		name = "Ink Blob",
		class = "Slime",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Secret Library."
	},
	[18] = {
		name = "Ghoul",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ancient Temple in the Skeleton area, way to Mintwallin, Old Mintwallin Quest, \z
		Alatar Lake, Magician Tower, Mount Sternum Undead Cave, Ghostlands, Hellgate, \z
		Maze of Lost Souls, below Point of No Return in Outlaw Camp, Plains of Havoc in Necromant House, \z
		Drefia and Drefia's underground caves, Edron ghoul hill, Venore Amazon Camp underground, \z
		Venore Swamp Troll cave, Ghostship between Venore and Darashia, Triangle Tower, Dark Cathedral, \z
		Ankrahmun tombs, Isle of the Kings, Treasure Island, Nargor Undead Cave, Helheim, Lion's Rock, \z
		The Witches' Cliff (only accessible during a quest) and a cave northeast of Ab'Dendriel. \z
		Also found behind a wall in both Rookgaard and Paradox Tower, although they cannot be reached."
	},
	[33] = {
		name = "Skeleton",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "In many dungeons around Tibia, like the Ancient Temple and Ghostlands. \z
		Also found in Rookgaard tombs and north east of Port Hope, in the jungle of Tiquanda, \z
		beneath Fenrock and in the desert Tombs, Vengoth Castle."
	},
	[37] = {
		name = "Demon Skeleton",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Triangle Tower, Hellgate, Draconia, Plains of Havoc, Pits of Inferno, Thais Ancient Temple, \z
		Fibula Dungeon, Mintwallin, Mount Sternum hidden cave, Drefia, Ghost Ship, Edron Hero Cave, Shadowthorn, \z
		Elvenbane, Ghostlands, Femor Hills, White Flower Temple, Isle of the Kings, Dark Cathedral, Ankrahmun Tombs, \z
		Ramoa, Helheim, Vengoth, Upper Spike, Lion's Rock."
	},
	[48] = {
		name = "Ghost",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ghost Ship, Drefia, Ankrahmun Tombs, Mount Sternum Undead Cave between Thais and Kazordoon, \z
		Dark Cathedral, under Treasure Island, Isle of the Kings, Grothmok tunnels (in Dwarven Mines), Goroma, \z
		Ramoa, Lich Hell, Upper Spike."
	},
	[65] = {
		name = "Mummy",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Drefia, Darama's Dark Pyramid, Draconia, Mount Sternum Undead Cave, Green Claw Swamp, \z
		Venore Amazon Camp underground, Helheim, Upper Spike, all Tombs, Dark Cathedral, Lion's Rock."
	},
	[68] = {
		name = "Vampire",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia, Ghost Ship between Venore and Darashia, some Ankrahmun Tombs, Lich Hell, \z
		Serpentine Tower (unreachable), Ghostlands (unreachable). House between Plains of Havoc and Dark Cathedral, \z
		Hellgate (only during Zevelon Duskbringer raid), Edron Undead Cave, Vengoth Castle (and mountains before door), \z
		Edron Vampire Crypt."
	},
	[78] = {
		name = "Banshee",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Single one under the White Flower Temple in Thais (respawn takes about 20-25 minutes), \z
		Banshee Quest area in Ghostlands (also accesible by Isle of the Kings), Demon Quest Room, Drefia, \z
		Ancient Ruins Tomb, Desert Dungeon (unreachable), Pits of Inferno in Tafariel's Throne room, \z
		Cemetery Quarter in Yalahar, Vengoth Castle, one in Robson Isle."
	},
	[99] = {
		name = "Lich",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Ankrahmun Library Tomb, Ancient Ruins Tomb, Oasis Tomb, Mountain Tomb, Drefia, Kharos, \z
		Pits of Inferno, Lich Hell in Ramoa, Cemetery Quarter in Yalahar, underground of Fenrock (on the way to Beregar). \z
		Can also be seen during an undead raid in Darashia or Carlin."
	},
	[100] = {
		name = "Crypt Shambler",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ankrahmun Tombs, Trapwood, Ramoa, Hellgate, Helheim, Mount Sternum Undead Cave, Deeper Catacombs, \z
		Cemetery Quarter, Treasure Island, Upper Spike, Lion's Rock."
	},
	[101] = {
		name = "Bonebeast",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Old Fortress, Ankrahmun Tombs, Helheim, Ramoa, Lich Hell, beneath Fenrock, Deeper Banuta, \z
		Vengoth Castle, Vandura Mountain, Robson's Isle, Middle Spike, Lion's Rock, Mother of Scarabs Lair, Caverna Exanima."
	},
	[256] = {
		name = "Pirate Skeleton",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Nargor Undead Cave, Goroma, Treasure Island, Drefia, The Cave, Chyllfroest."
	},
	[257] = {
		name = "Pirate Ghost",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Drefia, Goroma, Nargor Undead Cave, hidden caves under Treasure Island, \z
		single spawn at Liberty Bay ruins, Chyllfroest (unreachable)."
	},
	[281] = {
		name = "Hand of Cursed Fate",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, The Battlefield, The Arcanum, The Blood Halls and The Crystal Caves."
	},
	[282] = {
		name = "Undead Dragon",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Helheim (single, isolated spawn), Pits of Inferno (Ashfalor's throneroom), \z
		Demon Forge (The Shadow Nexus and The Arcanum), under Razachai (including the Inner Sanctum), \z
		Chyllfroest, Oramond Fury Dungeon."
	},
	[283] = {
		name = "Lost Soul",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, Formorgar Mines, Helheim, \z
		Roshamuul Prison and in The Arcanum (Part of the Inquisition quest)."
	},
	[284] = {
		name = "Betrayed Wraith",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, Helheim, The Inquisition Quest, Roshamuul Prison."
	},
	[286] = {
		name = "Spectre",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Pits of Inferno, The Crystal Caves and The Soul Well in The Inquisition Quest, \z
		Drefia Grim Reaper Dungeons, as well in Vengoth."
	},
	[298] = {
		name = "Blightwalker",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Pits of Inferno, Edron (In the Vats during The Inquisition Quest), Roshamuul Prison."
	},
	[321] = {
		name = "Braindeath",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Helheim, Demon Forge (The Arcanum), beneath Fenrock, Vandura Bonelord Cave, \z
		Alchemist Quarter and Cemetery Quarter."
	},
	[388] = {
		name = "Undead Jester",
		class = "Undead",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 10,
		Stars = 1,
		Occurrence = 3,
		Locations = "Ab'Dendriel, Ankrahmun, Carlin, Darashia, Edron, Kazordoon (floor -3, between entrance and depot), \z
		Liberty Bay, Port Hope (west, east and south across river from Depot), Svargrond, Thais, Venore, Yalahar."
	},
	[446] = {
		name = "Skeleton Warrior",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Island of Destiny, Drefia, Ghostland and beneath Fenrock."
	},
	[465] = {
		name = "Grim Reaper",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Drefia Grim Reaper Dungeons, deep in Drefia Wyrm Lair (after the Medusa Shield Quest), \z
		Edron (Hero Cave), Yalahar (Cemetery Quarter), Oramond Dungeon, \z
		  Abandoned Sewers and optionally in the Demon Oak Quest."
	},
	[483] = {
		name = "Vampire Bride",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia and Vampire Castle on Vengoth, Edron Vampire Crypt."
	},
	[508] = {
		name = "Undead Gladiator",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Arena and Zoo Quarter, Krailos."
	},
	[512] = {
		name = "Zombie",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Cemetery Quarter, Drefia, Vampire Castle, Treasure Island, Isle of Evil, Upper Spike."
	},
	[558] = {
		name = "Vampire Pig",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Isle of Evil on the surface."
	},
	[580] = {
		name = "Bane of Light",
		class = "Undead",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Svargrond."
	},
	[594] = {
		name = "Undead Mine Worker",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "West of Edron in the Lost Mines."
	},
	[595] = {
		name = "Undead Prospector",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 1,
		Locations = "West of Edron, in a some Lost Mines."
	},
	[675] = {
		name = "Souleater",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Razzachai, Northern Zao Plantations, Souleater Mountains, Deeper Banuta."
	},
	[696] = {
		name = "Undead Cavebear",
		class = "Undead",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Lich Hell."
	},
	[704] = {
		name = "Ghoulish Hyaena",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[707] = {
		name = "Grave Guard",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[708] = {
		name = "Tomb Servant",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[710] = {
		name = "Death Priest",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[711] = {
		name = "Elder Mummy",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb."
	},
	[712] = {
		name = "Honour Guard",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Desert north of Ankrahmun."
	},
	[958] = {
		name = "Vampire Viscount",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drefia, Edron Vampire Crypt."
	},
	[959] = {
		name = "Vicious Manbat",
		class = "Undead",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 50,
		Stars = 3,
		Occurrence = 3,
		Locations = "Deep under Drefia."
	},
	[962] = {
		name = "White Shade",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Drefia."
	},
	[975] = {
		name = "Gravedigger",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Around the higher level areas of Drefia, \z
		including the Drefia Grim Reaper Dungeons and the Drefia Vampire Crypt."
	},
	[976] = {
		name = "Tarnished Spirit",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Drefia."
	},
	[1040] = {
		name = "Blood Beast",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Oramond/Southern Plains, Lower Rathleton, Oramond/Western Plains, \z
		Underground Glooth Factory, Jaccus Maxxen's Dungeon."
	},
	[1055] = {
		name = "Rot Elemental",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Rathleton Sewers, Glooth Factory, Lower Rathleton, Oramond/Western Plains, Jaccus Maxxen's Dungeon."
	},
	[1148] = {
		name = "Ghost Wolf",
		class = "Undead",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "Poacher Caves/Gloomy."
	},
	[1415] = {
		name = "Putrid Mummy",
		class = "Undead",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Caverna Exanima."
	},
	[1646] = {
		name = "Falcon Knight",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Falcon Bastion."
	},
	[1647] = {
		name = "Falcon Paladin",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Falcon Bastion."
	},
	[1674] = {
		name = "Skeleton Elite Warrior",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Deep Desert."
	},
	[1675] = {
		name = "Undead Elite Gladiator",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Deep Desert."
	},
	[1724] = {
		name = "Ripper Spectre",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Haunted Cellar, Buried Cathedral."
	},
	[1725] = {
		name = "Gazer Spectre",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Haunted Temple, Buried Cathedral."
	},
	[1726] = {
		name = "Burster Spectre",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Haunted Tomb west of Darashia, Buried Cathedral."
	},
	[1864] = {
		name = "Flimsy Lost Soul",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Brain Grounds, Netherworld, Zarganash."
	},
	[1865] = {
		name = "Mean Lost Soul",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Brain Grounds, Netherworld, Zarganash."
	},
	[1866] = {
		name = "Freakish Lost Soul",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Brain Grounds, Netherworld, Zarganash."
	},
	[1880] = {
		name = "Cursed Prospector",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Barren Drift."
	},
	[1885] = {
		name = "Evil Prospector",
		class = "Undead",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Barren Drift"
	},
	[26] = {
		name = "Rotworm",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Almost everywhere, like Ancient Temple, Vandura, Folda dungeon, Fibula Dungeon, \z
		caves connecting Edron and Cormaya, Venore Swamp Troll cave, Thais Troll cave, Ferngrims Gate, \z
		Dwarf Mines, Hellgate, below the graves in eastern Rookgaard, spider cave in western Rookgaard, \z
		cave northeast of Ab'Dendriel, Darashia Rotworm Caves, Liberty Bay, Fenrock, \z
		below Green Claw Swamp and some other places."
	},
	[30] = {
		name = "Spider",
		class = "Vermin",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Almost everywhere, in grass areas, sewers like Carlin sewers, \z
		caves like as Ancient Temple, Rookgaard and the Tiquanda Tarantula Caves."
	},
	[36] = {
		name = "Poison Spider",
		class = "Vermin",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Found in various caves and plains around Tibia (including Rookgaard)."
	},
	[38] = {
		name = "Giant Spider",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Plains of Havoc, Point of no Return in Outlaw Camp, Ghostlands, Hellgate, \z
		Mintwallin Secret Laboratory, Mad Mage Room deep below Ancient Temple, \z
		Mount Sternum Undead Cave, Green Claw Swamp, Maze of Lost Souls, \z
		Crusader Helmet Quest in the Dwarf Mines, Mushroom Gardens, \z
		west drillworm cave, Edron Hero Cave, Edron Orc Cave, \z
		on a hill near Drefia, on a hill north-west of Ankrahmun (inaccessible), \z
		Forbidden Lands, Deeper Banuta, Malada, Ramoa, Arena and Zoo Quarter, \z
		second floor up of Cemetery Quarter, beneath Fenrock, Vengoth Castle, \z
		Vandura Mountain, in a cave in Robson Isle, Chyllfroest, Spider Caves, \z
		Second floor of Krailos Spider Lair , Caverna Exanima."
	},
	[43] = {
		name = "Scorpion",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Near Thais Troll Cave, Plague Spike, Drefia, Jakundaf Desert, \z
		Green Claw Swamp, beneath Folda, Maze of Lost Souls, Plains of Havoc, \z
		Venore and Ankrahmun Dragon Lairs, beneath Edron Graveyard, Ancient Temple, \z
		Hellgate, Mad Mage Room, Ankrahmun Tombs, Treasure Island, Mal'ouquah, Ramoa, \z
		Cyclopolis, Ghostlands, Vengoth, Lion's Rock."
	},
	[44] = {
		name = "Wasp",
		class = "Vermin",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "South of Thais, west of Ab'Dendriel, northeastern Cormaya, \z
		Green Claw Swamp between Kazordoon and Venore, Wasp Tower in Rookgaard, \z
		Wasp Towers in Darashia, all over Tiquanda, and all over Vandura."
	},
	[45] = {
		name = "Bug",
		class = "Vermin",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "In many parts around Tibia, including Rookgaard."
	},
	[79] = {
		name = "Ancient Scarab",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Ankrahmun Library Tomb, Stone Tomb, Peninsula Tomb, Mother of Scarabs Lair, \z
		Kha'zeel Scarab Lair, deep in Larva Caves (found beneath steps underground), Lion's Rock, \z
		Arena and Zoo Quarter and beneath Fenrock."
	},
	[82] = {
		name = "Larva",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ankrahmun Pharaoh Tombs, Ashta'daramai, Daramian Mountain Scarab Lair, \z
		Daramian Scarab Caves, Daramian Scarab Lairs, Deeper Drefia, Kha'zeel Mountains, Lion's Rock, \z
		Northern Darama Desert, Port Hope Surroundings, Treasure Island, Yalahar Factory Quarter."
	},
	 [83] = {
		name = "Scarab",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Ankrahmun Tombs, the sand around Ankrahmun (use a shovel), deep in Larva caves, \z
		the path leading to Chor, beneath Fenrock, Lion's Rock."
	},
	[124] = {
		name = "Centipede",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "All around Port Hope and Tiquanda, Dark Cathedral, Vandura, Meriana, Razzachai, \z
		and Slime cave east of Venore, Arena and Zoo Quarter, Gnarlhound Caves."
	},
	[213] = {
		name = "Butterfly",
		class = "Vermin",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Ab'Dendriel, Ab'Dendriel Surroundings, Carlin, Cormaya, Edron Surroundings, \z
		Feyrist Meadows, Fibula, Fields of Glory, Green Claw Swamp, Issavi, Kazordoon Surroundings, Meriana, \z
		Outlaw Camp, Port Hope Surroundings, Stonehome, Thais Surroundings, Venore Southern Swamp, Venore Surroundings"
	},
	[219] = {
		name = "Tarantula",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Tiquanda Tarantula Caves, Spider Caves, Trapwood ground level and underground, \z
		in 2 small caves South of Thais, Dark Cathedral, single spawn on top of Crocodile den north of Port Hope, \z
		Plains of Havoc, underground Liberty Bay, Nargor Undead Cave and other constituents of the Shattered Isles, \z
		Green Claw Swamp, first floor up in the big building in the Cemetery Quarter, Robson Isle, Vengoth. \z
		After the summer update of 2008, tarantulas can be seen on the beginner's island of Rookgaard."
	},
	[227] = {
		name = "Butterfly",
		class = "Vermin",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Ab'Dendriel, Carlin Surroundings, Cormaya, Feyrist Meadows, Grimvale, Issavi, \z
		Kazordoon Surroundings, Liberty Bay City, Liberty Bay Surroundings, Meriana, Plains of Havoc, \z
		Port Hope Surroundings, Yalahar Arena Quarter, Yalahar Centre, Yalahar Magician Quarter."
	},
	[228] = {
		name = "Butterfly",
		class = "Vermin",
		toKill = 25,
		FirstUnlock = 5,
		SecondUnlock = 10,
		CharmsPoints = 1,
		Stars = 0,
		Occurrence = 0,
		Locations = "Banuta, Carlin Surroundings, Feyrist Meadows, Grimvale, Liberty Bay City, \z
		Liberty Bay Surroundings, Meriana, Plains of Havoc, Port Hope Surroundings, \z
		Yalahar Arena Quarter, Yalahar Centre, Yalahar Magician Quarter."
	},
	[251] = {
		name = "Carrion Worm",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Edron, Cormaya, Drillworm Caves, Venore Swamps, Liberty Bay, Vandura, \z
		Hellgate, Fibula Dungeon, Stonehome, Kazordoon, Darashia Rotworm Caves, Port Hope, \z
		Ancient Temple, Fenrock, Arena and Zoo Quarter."
	},
	[621] = {
		name = "Insect Swarm",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Zao Steppe, Northern Zao Plantations and the Horestis Tomb \z
		(only when the curse of Horestis is not active)."
	},
	[631] = {
		name = "Terramite",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Steppe of Zao, Lion's Rock, Zao Terramite Caves, Darama Terramite Cave, \z
		Terramite Breeding Tunnels. Also raids desert north of Ankrahmun."
	},
	[632] = {
		name = "Wailing Widow",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zao Wailing Widow Cave, Northern Zao Plantations, Northern Brimstone Bug Cave, \z
		Razzachai, Chyllfroest, Krailos Spider Lair."
	},
	[633] = {
		name = "Lancer Beetle",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Zao Wailing Widow Cave, Muggy Plains (during raid), Razzachai, \z
		Northern Zao Plantations, Northern Brimstone Bug Cave, Chyllfroest."
	},
	[641] = {
		name = "Sandcrawler",
		class = "Vermin",
		toKill = 250,
		FirstUnlock = 10,
		SecondUnlock = 100,
		CharmsPoints = 5,
		Stars = 1,
		Occurrence = 0,
		Locations = "Zao Steppe, Raging Mage tower, Ankrahmun Desert, Darashia Desert, Drefia."
	},
	[674] = {
		name = "Brimstone Bug",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Beneath Razzachai, Northern Zao Plantations, Brimstone Bug Caves, Chyllfroest, Krailos Spider Lair"
	},
	[691] = {
		name = "Berrypest",
		class = "Vermin",
		toKill = 5,
		FirstUnlock = 2,
		SecondUnlock = 3,
		CharmsPoints = 5,
		Stars = 0,
		Occurrence = 3,
		Locations = "Spawns in the winterberry cellar during the Annual Autumn Vintage event."
	},
	[709] = {
		name = "Sacred Spider",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Horestis Tomb (third floor and lower)."
	},
	[731] = {
		name = "Slug",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "South-east of Venore, Swamp Troll Cave."
	},
	[732] = {
		name = "Insectoid Scout",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "West and south of Greenshore."
	},
	[778] = {
		name = "Ladybug",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 2,
		Locations = "The Hive surface during the Hive Born World Change's third stage."
	},
	[786] = {
		name = "Crawler",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Hive, Hive Outpost."
	},
	[787] = {
		name = "Spidris",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Hive, Hive Outpost."
	},
	[788] = {
		name = "Kollos",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "Hive, Hive Outpost."
	},
	[790] = {
		name = "Swarmer",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "The Hive, Hive Outpost."
	},
	[791] = {
		name = "Spitter",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "The Hive, Hive Outpost."
	},
	[792] = {
		name = "Waspoid",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "The Hive, Hive Outpost."
	},
	[796] = {
		name = "Insectoid Worker",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Hive, Hive Outpost."
	},
	[797] = {
		name = "Spidris Elite",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 2,
		Locations = "The Hive: east tower (beyond gates), west tower (including beyond gates), \z
		also anywhere Hive Overseers are found (as summons), Hive Outpost."
	},
	[801] = {
		name = "Hive Overseer",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 2,
		Locations = "The Hive towers: on the highest floor of each tower, \z
		and in many of the closed rooms accessed with pheromones; \z
		many in the large underground room of the west tower. \z
		Liberty Bay Hive Outpost: one spawn on the second floor underground."
	},
	[878] = {
		name = "Drillworm",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Drillworm Caves, Lower Spike and in the Lost Dwarf version of the Forsaken Mine."
	},
	[899] = {
		name = "Wiggler",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 0,
		Locations = "Can be found in Truffels Garden as well as the Mushroom Gardens."
	},
	[912] = {
		name = "Emerald Damselfly",
		class = "Vermin",
		toKill = 500,
		FirstUnlock = 25,
		SecondUnlock = 250,
		CharmsPoints = 15,
		Stars = 2,
		Occurrence = 0,
		Locations = "Venore Salamander Cave, Dryad Gardens."
	},
	[1531] = {
		name = "Deepworm",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Gnome Deep Hub."
	},
	[1532] = {
		name = "Diremaw",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Gnome Deep Hub (north and south tasking areas), Warzone 6."
	},
	[1544] = {
		name = "Cave Devourer",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 5."
	},
	[1545] = {
		name = "Tunnel Tyrant",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 5"
	},
	[1546] = {
		name = "Chasm Spawn",
		class = "Vermin",
		toKill = 2500,
		FirstUnlock = 100,
		SecondUnlock = 1000,
		CharmsPoints = 50,
		Stars = 4,
		Occurrence = 0,
		Locations = "Warzone 4."
	},
	[1736] = {
		name = "Lacewing Moth",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Court of Summer at day."
	},
	[1737] = {
		name = "Hibernal Moth",
		class = "Vermin",
		toKill = 1000,
		FirstUnlock = 50,
		SecondUnlock = 500,
		CharmsPoints = 25,
		Stars = 3,
		Occurrence = 1,
		Locations = "Court of Winter at night."
	},
  }

Bestiary.MonstersName = {
	["Toad"] = 262,
	["Green Frog"] = 267,
	["Azure Frog"] = 268,
	["Coral Frog"] = 269,
	["Crimson Frog"] = 270,
	["Orchid Frog"] = 271,
	["Infernal Frog"] = 563,
	["Bog Frog"] = 738,
	["Salamander"] = 913,
	["Crab"] = 112,
	["Quara Predator"] = 237,
	["Quara Predator Scout"] = 238,
	["Quara Constrictor"] = 239,
	["Quara Constrictor Scout"] = 240,
	["Quara Mantassin"] = 241,
	["Quara Mantassin Scout"] = 242,
	["Quara Hydromancer"] = 243,
	["Quara Hydromancer Scout"] = 244,
	["Quara Pincher"] = 245,
	["Quara Pincher Scout"] = 246,
	["Blood Crab"] = 261,
	["Deepsea Blood Crab"] = 437,
	["Crustacea Gigantica"] = 697,
	["Deepling Scout"] = 734,
	["Filth Toad"] = 735,
	["Deepling Warrior"] = 769,
	["Deepling Guard"] = 770,
	["Deepling Spellsinger"] = 772,
	["Manta Ray"] = 779,
	["Calamary"] = 780,
	["Jellyfish"] = 781,
	["Shark"] = 782,
	["Northern Pike"] = 783,
	["Fish"] = 784,
	["Deepling Worker"] = 795,
	["Deepling Brawler"] = 859,
	["Deepling Master Librarian"] = 860,
	["Deepling Tyrant"] = 861,
	["Deepling Elite"] = 862,
	["Renegade Quara Constrictor"] = 1097,
	["Renegade Quara Hydromancer"] = 1098,
	["Renegade Quara Mantassin"] = 1099,
	["Renegade Quara Pincher"] = 1100,
	["Renegade Quara Predator"] = 1101,
	["Abyssal Calamary"] = 1105,
	["Deathling Scout"] = 1667,
	["Deathling Spellsinger"] = 1677,
	["Chicken"] = 111,
	["Flamingo"] = 212,
	["Parrot"] = 217,
	["Terror Bird"] = 218,
	["Seagull"] = 264,
	["Penguin"] = 318,
	["Dire Penguin"] = 335,
	["Berserker Chicken"] = 561,
	["Demon Parrot"] = 562,
	["Marsh Stalker"] = 914,
	["Pigeon"] = 915,
	["Cave Parrot"] = 1307,
	["Stone Golem"] = 67,
	["Ice Golem"] = 326,
	["Worker Golem"] = 503,
	["Damaged Worker Golem"] = 524,
	["War Golem"] = 533,
	["Eternal Guardian"] = 615,
	["Cake Golem"] = 680,
	["Iron Servant"] = 700,
	["Golden Servant"] = 701,
	["Diamond Servant"] = 702,
	["Sandstone Scorpion"] = 705,
	["Clay Guardian"] = 706,
	["Enraged Crystal Golem"] = 873,
	["Damaged Crystal Golem"] = 874,
	["Stone Devourer"] = 879,
	["Weeper"] = 882,
	["Orewalker"] = 883,
	["Lava Golem"] = 884,
	["Magma Crawler"] = 885,
	["Infected Weeper"] = 897,
	["Glooth Golem"] = 1038,
	["Metal Gargoyle"] = 1039,
	["Rustheap Golem"] = 1041,
	["Walker"] = 1043,
	["Iron Servant Replica"] = 1325,
	["Diamond Servant Replica"] = 1326,
	["Golden Servant Replica"] = 1327,
	["Biting Book"] = 1656,
	["Animated Snowman"] = 1751,
	["Demon"] = 35,
	["Fire Devil"] = 40,
	["Dark Torturer"] = 285,
	["Destroyer"] = 287,
	["Diabolic Imp"] = 288,
	["Fury"] = 291,
	["Hellhound"] = 294,
	["Hellfire Fighter"] = 295,
	["Juggernaut"] = 296,
	["Plaguesmith"] = 314,
	["Hellspawn"] = 519,
	["Gozzler"] = 523,
	["Duskbringer"] = 581,
	["Shadow Hound"] = 582,
	["Herald Of Gloom"] = 586,
	["Shaburak Demon"] = 724,
	["Shaburak Lord"] = 725,
	["Shaburak Prince"] = 726,
	["Askarak Demon"] = 727,
	["Askarak Lord"] = 728,
	["Askarak Prince"] = 729,
	["Nightfiend"] = 973,
	["Demon Outcast"] = 1019,
	["Dawnfire Asura"] = 1134,
	["Midnight Asura"] = 1135,
	["Grimeleech"] = 1196,
	["Vexclaw"] = 1197,
	["Hellflayer"] = 1198,
	["Frost Flower Asura"] = 1619,
	["True Dawnfire Asura"] = 1620,
	["True Midnight Asura"] = 1621,
	["True Frost Flower Asura"] = 1622,
	["Floating Savant"] = 1637,
	["Dragon"] = 34,
	["Dragon Lord"] = 39,
	["Hydra"] = 121,
	["Frost Dragon"] = 317,
	["Dragon Hatchling"] = 385,
	["Dragon Lord Hatchling"] = 386,
	["Frost Dragon Hatchling"] = 402,
	["Wyrm"] = 461,
	["Draken Warmaster"] = 617,
	["Draken Spellweaver"] = 618,
	["Ghastly Dragon"] = 643,
	["Draken Elite"] = 672,
	["Draken Abomination"] = 673,
	["Elder Wyrm"] = 963,
	["Haunted Dragon"] = 1376,
	["Ice Dragon"] = 1380,
	["Fire Elemental"] = 49,
	["Water Elemental"] = 236,
	["Massive Water Elemental"] = 279,
	["Massive Fire Elemental"] = 313,
	["Massive Earth Elemental"] = 455,
	["Massive Energy Elemental"] = 456,
	["Energy Elemental"] = 457,
	["Earth Elemental"] = 458,
	["Cliff Stridder"] = 889,
	["Ironblight"] = 890,
	["Furious Fire Elemental"] = 1000,
	["High Voltage Elemental"] = 1116,
	["Raging Fire"] = 1121,
	["Lava Lurker"] = 1563,
	["Ravenous Lava Lurker"] = 1569,
	["Knowledge Elemental"] = 1670,
	["Yielothax"] = 717,
	["Reality Reaver"] = 1224,
	["Sparkion"] = 1234,
	["Breach Brood"] = 1235,
	["Dread Intruder"] = 1260,
	["Instable Sparkion"] = 1264,
	["Instable Breach Brood"] = 1265,
	["Stabilizing Reality Reaver"] = 1266,
	["Stabilizing Dread Intruder"] = 1267,
	["Dryad"] = 383,
	["Wisp"] = 462,
	["Faun"] = 1434,
	["Pooka"] = 1435,
	["Twisted Pooka"] = 1436,
	["Swan Maiden"] = 1437,
	["Pixie"] = 1438,
	["Boogy"] = 1439,
	["Nymph"] = 1485,
	["Dark Faun"] = 1496,
	["Arctic Faun"] = 1626,
	["Percht"] = 1740,
	["Schiach"] = 1741,
	["Cyclops"] = 22,
	["Behemoth"] = 55,
	["Frost Giant"] = 324,
	["Frost Giantess"] = 334,
	["Cyclops Smith"] = 389,
	["Cyclops Drone"] = 391,
	["Ogre Brute"] = 1161,
	["Ogre Savage"] = 1162,
	["Ogre Shaman"] = 1163,
	["Orclops Doomhauler"] = 1314,
	["Orclops Ravager"] = 1320,
	["Ogre Ruffian"] = 1820,
	["Ogre Rowdy"] = 1821,
	["Ogre Sage"] = 1822,
	["Orger"] = 1841,
	["Loricate Orger"] = 1857,
	["Bellicose Orger"] = 1858,
	["Necromancer"] = 9,
	["Warlock"] = 10,
	["Hunter"] = 11,
	["Valkyrie"] = 12,
	["Wild Warrior"] = 47,
	["Witch"] = 54,
	["Monk"] = 57,
	["Priestess"] = 58,
	["Stalker"] = 72,
	["Hero"] = 73,
	["Amazon"] = 77,
	["Smuggler"] = 222,
	["Bandit"] = 223,
	["Assassin"] = 224,
	["Dark Monk"] = 225,
	["Pirate Marauder"] = 247,
	["Pirate Cutthroat"] = 248,
	["Pirate Buccaneer"] = 249,
	["Pirate Corsair"] = 250,
	["Enlightened Of The Cult"] = 252,
	["Acolyte Of The Cult"] = 253,
	["Adept Of The Cult"] = 254,
	["Novice Of The Cult"] = 255,
	["Nomad"] = 310,
	["Barbarian Skullhunter"] = 322,
	["Barbarian Bloodwalker"] = 323,
	["Ice Witch"] = 331,
	["Barbarian Brutetamer"] = 332,
	["Barbarian Headsplitter"] = 333,
	["Dark Magician"] = 371,
	["Dark Apprentice"] = 372,
	["Poacher"] = 376,
	["Mutated Human"] = 521,
	["Crazed Beggar"] = 525,
	["Gang Member"] = 526,
	["Gladiator"] = 527,
	["Mad Scientist"] = 528,
	["Infernalist"] = 529,
	["Acolyte of Darkness"] = 578,
	["Nightslayer"] = 579,
	["Doomsday Cultist"] = 583,
	["Midnight Warrior"] = 585,
	["Bride of Night"] = 587,
	["Feverish Citizen"] = 719,
	["Nomad"] = 776,
	["Nomad"] = 777,
	["Grave Robber"] = 867,
	["Crypt Defiler"] = 868,
	["Adventurer"] = 922,
	["Shadow Pupil"] = 960,
	["Blood Priest"] = 961,
	["Blood Hand"] = 974,
	["Glooth Bandit"] = 1119,
	["Glooth Brigand"] = 1120,
	["Vicious Squire"] = 1145,
	["Renegade Knight"] = 1146,
	["Vile Grandmaster"] = 1147,
	["Misguided Thief"] = 1413,
	["Goldhanded Cultist"] = 1481,
	["Goldhanded Cultist Bride"] = 1482,
	["Cult Believer"] = 1512,
	["Cult Enforcer"] = 1513,
	["Cult Scholar"] = 1514,
	["Cobra Assassin"] = 1775,
	["Cobra Scout"] = 1776,
	["Burning Gladiator"] = 1798,
	["Priestess Of The Wild Sun"] = 1799,
	["Black Sphinx Acolyte"] = 1800,
	["Cobra Vizier"] = 1824,
	["Orc Warlord"] = 2,
	["Orc Rider"] = 4,
	["Orc"] = 5,
	["Orc Shaman"] = 6,
	["Orc Warrior"] = 7,
	["Orc Berserker"] = 8,
	["Troll"] = 15,
	["Minotaur Mage"] = 23,
	["Minotaur Archer"] = 24,
	["Minotaur"] = 25,
	["Minotaur Guard"] = 29,
	["Orc Spearman"] = 50,
	["Frost Troll"] = 53,
	["Orc Leader"] = 59,
	["Goblin"] = 61,
	["Elf"] = 62,
	["Elf Arcanist"] = 63,
	["Elf Scout"] = 64,
	["Dwarf Geomancer"] = 66,
	["Dwarf"] = 69,
	["Dwarf Guard"] = 70,
	["Dwarf Soldier"] = 71,
	["Swamp Troll"] = 76,
	["Dworc Voodoomaster"] = 214,
	["Dworc Fleshhunter"] = 215,
	["Dworc Venomsniper"] = 216,
	["Island Troll"] = 277,
	["Chakoya Tribewarden"] = 319,
	["Chakoya Toolshaper"] = 328,
	["Chakoya Windcaller"] = 329,
	["Goblin Leader"] = 377,
	["Dwarf Henchman"] = 379,
	["Troll Champion"] = 392,
	["Grynch Clan Goblin"] = 393,
	["Goblin Assassin"] = 463,
	["Goblin Scarvenger"] = 464,
	["Furious Troll"] = 540,
	["Troll Legionnaire"] = 541,
	["Orc Marauder"] = 614,
	["Firestarter"] = 737,
	["Elf Overseer"] = 741,
	["Troll Guard"] = 745,
	["Enslaved Dwarf"] = 886,
	["Lost Berserker"] = 888,
	["Corym Charlatan"] = 916,
	["Corym Skirmisher"] = 917,
	["Corym Vanguard"] = 918,
	["Little Corym Charlatan"] = 920,
	["Lost Husher"] = 924,
	["Lost Basher"] = 925,
	["Lost Thrower"] = 926,
	["Moohtant"] = 1044,
	["Minotaur Amazon"] = 1045,
	["Execowtioner"] = 1046,
	["Mooh\'tah Warrior"] = 1051,
	["Minotaur Hunter"] = 1052,
	["Worm Priestess"] = 1053,
	["Minotaur Invader"] = 1109,
	["Broken Shaper"] = 1321,
	["Twisted Shaper"] = 1322,
	["Shaper Matriarch"] = 1394,
	["Misguided Bully"] = 1412,
	["Barkless Devotee"] = 1486,
	["Barkless Fanatic"] = 1488,
	["Orc Cultist"] = 1503,
	["Orc Cult Priest"] = 1504,
	["Orc Cult Inquisitor"] = 1505,
	["Orc Cult Fanatic"] = 1506,
	["Orc Cult Minion"] = 1507,
	["Minotaur Cult Follower"] = 1508,
	["Minotaur Cult Prophet"] = 1509,
	["Minotaur Cult Zealot"] = 1510,
	["Lost Exile"] = 1529,
	["Crazed Winter Vanguard"] = 1730,
	["Crazed Winter Rearguard"] = 1731,
	["Crazed Summer Vanguard"] = 1732,
	["Crazed Summer Rearguard"] = 1733,
	["Soul-broken Harbinger"] = 1734,
	["Insane Siren"] = 1735,
	["Werewolf"] = 510,
	["Werebear"] = 1142,
	["Wereboar"] = 1143,
	["Werebadger"] = 1144,
	["Werefox"] = 1549,
	["Bonelord"] = 17,
	["Green Djinn"] = 51,
	["Blue Djinn"] = 80,
	["Gargoyle"] = 95,
	["Efreet"] = 103,
	["Marid"] = 104,
	["Elder Bonelord"] = 108,
	["Gazer"] = 109,
	["Phantasm"] = 292,
	["Nightmare"] = 299,
	["Crystal Spider"] = 330,
	["Bog Raider"] = 460,
	["Nightmare Scion"] = 518,
	["Nightstalker"] = 520,
	["Medusa"] = 570,
	["Midnight Panther"] = 698,
	["Thornfire Wolf"] = 739,
	["Crystal Wolf"] = 740,
	["Crystalcrusher"] = 869,
	["Armadille"] = 880,
	["Dragonling"] = 894,
	["Rorc"] = 978,
	["Forest Fury"] = 980,
	["Shock Head"] = 1004,
	["Sight of Surrender"] = 1012,
	["Guzzlemaw"] = 1013,
	["Silencer"] = 1014,
	["Choking Fear"] = 1015,
	["Terrorsleep"] = 1016,
	["Retching Horror"] = 1018,
	["Feversleep"] = 1021,
	["Frazzlemaw"] = 1022,
	["Tainted Soul"] = 1137,
	["Redeemed Soul"] = 1138,
	["Elder Forest Fury"] = 1157,
	["Weakened Frazzlemaw"] = 1442,
	["Enfeebled Silencer"] = 1443,
	["Brain Squid"] = 1653,
	["Flying Book"] = 1654,
	["Cursed Book"] = 1655,
	["Guardian of Tales"] = 1659,
	["Burning Book"] = 1663,
	["Icecold Book"] = 1664,
	["Energetic Book"] = 1665,
	["Energuardian Of Tales"] = 1666,
	["Rage Squid"] = 1668,
	["Squid Warden"] = 1669,
	["Animated Feather"] = 1671,
	["Lumbering Carnivor"] = 1721,
	["Spiky Carnivor"] = 1722,
	["Menacing Carnivor"] = 1723,
	["Thanatursus"] = 1728,
	["Arachnophobica"] = 1729,
	["Sphinx"] = 1808,
	["Feral Sphinx"] = 1807,
	["Lamassu"] = 1806,
	["Manticore"] = 1816,
	["Gryphon"] = 1819,
	["Crypt Warden"] = 1805,
	["War Wolf"] = 3,
	["Black  Sheep"] = 13,
	["Sheep"] = 14,
	["Bear"] = 16,
	["Rat"] = 21,
	["Wolf"] = 27,
	["Deer"] = 31,
	["Dog"] = 32,
	["Lion"] = 41,
	["Polar Bear"] = 42,
	["Winter Wolf"] = 52,
	["Cave Rat"] = 56,
	["Pig"] = 60,
	["Rabbit"] = 74,
	["Hyaena"] = 94,
	["Badger"] = 105,
	["Skunk"] = 106,
	["Yeti"] = 110,
	["Kongra"] = 116,
	["Merlkin"] = 117,
	["Sibang"] = 118,
	["Bat"] = 122,
	["Panda"] = 123,
	["Tiger"] = 125,
	["Elephant"] = 211,
	["Mammoth"] = 260,
	["Husky"] = 325,
	["Silver Rabbit"] = 327,
	["Squirrel"] = 384,
	["Cat"] = 387,
	["Mutated Rat"] = 502,
	["Mutated Bat"] = 509,
	["Mutated Tiger"] = 516,
	["Evil Sheep"] = 555,
	["Evil Sheep Lord"] = 556,
	["Hot Dog"] = 557,
	["Doom Deer"] = 559,
	["Killer Rabbit"] = 560,
	["Gnarlhound"] = 630,
	["Boar"] = 693,
	["White Deer"] = 720,
	["Starving Wolf"] = 723,
	["Wild Horse"] = 730,
	["Dromedary"] = 733,
	["Horse"] = 750,
	["Horse"] = 751,
	["Horse"] = 752,
	["Mushroom Sniffer"] = 870,
	["Water Buffalo"] = 872,
	["Modified Gnarlhound"] = 877,
	["Vulcongra"] = 898,
	["Roaring Lion"] = 981,
	["Noble Lion"] = 1118,
	["Gloom Wolf"] = 1139,
	["Clomp"] = 1174,
	["Stone Rhino"] = 1395,
	["Fox"] = 1548,
	["Mole"] = 1570,
	["Baleful Bunny"] = 1742,
	["Roast Pork"] = 1855,
	["Cow"] = 1856,
	["Carniphila"] = 120,
	["Spit Nettle"] = 221,
	["Haunted Treeling"] = 511,
	["Bane Bringer"] = 679,
	["Humongous Fungus"] = 881,
	["Hideous Fungus"] = 891,
	["Swampling"] = 919,
	["Leaf Golem"] = 979,
	["Wilting Leaf Golem"] = 982,
	["Glooth Anemone"] = 1042,
	["Omnivora"] = 1141,
	["Snake"] = 28,
	["Cobra"] = 81,
	["Lizard Templar"] = 113,
	["Lizard Sentinel"] = 114,
	["Lizard Snakecharmer"] = 115,
	["Crocodile"] = 119,
	["Serpent Spawn"] = 220,
	["Tortoise"] = 258,
	["Thornback Tortoise"] = 259,
	["Wyvern"] = 290,
	["Sea Serpent"] = 438,
	["Young Sea Serpent"] = 439,
	["Lizard Zaogun"] = 616,
	["Lizard Chosen"] = 620,
	["Lizard Dragon Priest"] = 623,
	["Lizard Legionnaire"] = 624,
	["Lizard High Guard"] = 625,
	["Killer Caiman"] = 627,
	["Lizard Magistratus"] = 655,
	["Lizard Noble"] = 656,
	["Stampor"] = 694,
	["Draptor"] = 695,
	["Seacrest Serpent"] = 1096,
	["Stonerefiner"] = 1525,
	["Young Goanna"] = 1817,
	["Adult Goanna"] = 1818,
	["Slime"] = 19,
	["Squidgy Slime"] = 20,
	["Son of Verminor"] = 265,
	["Defiler"] = 289,
	["Acid Blob"] = 513,
	["Death Blob"] = 514,
	["Mercury Blob"] = 515,
	["Midnight Spawn"] = 584,
	["Glooth Blob"] = 1054,
	["Devourer"] = 1056,
	["Ink Blob"] = 1658,
	["Ghoul"] = 18,
	["Skeleton"] = 33,
	["Demon Skeleton"] = 37,
	["Ghost"] = 48,
	["Mummy"] = 65,
	["Vampire"] = 68,
	["Banshee"] = 78,
	["Lich"] = 99,
	["Crypt Shambler"] = 100,
	["Bonebeast"] = 101,
	["Pirate Skeleton"] = 256,
	["Pirate Ghost"] = 257,
	["Hand of Cursed Fate"] = 281,
	["Undead Dragon"] = 282,
	["Lost Soul"] = 283,
	["Betrayed Wraith"] = 284,
	["Spectre"] = 286,
	["Blightwalker"] = 298,
	["Braindeath"] = 321,
	["Undead Jester"] = 388,
	["Skeleton Warrior"] = 446,
	["Grim Reaper"] = 465,
	["Vampire Bride"] = 483,
	["Undead Gladiator"] = 508,
	["Zombie"] = 512,
	["Vampire Pig"] = 558,
	["Bane of Light"] = 580,
	["Undead Mine Worker"] = 594,
	["Undead Prospector"] = 595,
	["Souleater"] = 675,
	["Undead Cavebear"] = 696,
	["Ghoulish Hyaena"] = 704,
	["Grave Guard"] = 707,
	["Tomb Servant"] = 708,
	["Death Priest"] = 710,
	["Elder Mummy"] = 711,
	["Honour Guard"] = 712,
	["Vampire Viscount"] = 958,
	["Vicious Manbat"] = 959,
	["White Shade"] = 962,
	["Gravedigger"] = 975,
	["Tarnished Spirit"] = 976,
	["Blood Beast"] = 1040,
	["Rot Elemental"] = 1055,
	["Ghost Wolf"] = 1148,
	["Putrid Mummy"] = 1415,
	["Falcon Knight"] = 1646,
	["Falcon Paladin"] = 1647,
	["Skeleton Elite Warrior"] = 1674,
	["Undead Elite Gladiator"] = 1675,
	["Ripper Spectre"] = 1724,
	["Gazer Spectre"] = 1725,
	["Burster Spectre"] = 1726,
	["Flimsy Lost Soul"] = 1864,
	["Mean Lost Soul"] = 1865,
	["Freakish Lost Soul"] = 1866,
	["Cursed Prospector"] = 1880,
	["Evil Prospector"] = 1885,
	["Rotworm"] = 26,
	["Spider"] = 30,
	["Poison Spider"] = 36,
	["Giant Spider"] = 38,
	["Scorpion"] = 43,
	["Wasp"] = 44,
	["Bug"] = 45,
	["Ancient Scarab"] = 79,
	["Larva"] = 82,
	["Scarab"] = 83,
	["Centipede"] = 124,
	["Butterfly"] = 213,
	["Tarantula"] = 219,
	["Butterfly"] = 227,
	["Butterfly"] = 228,
	["Carrion Worm"] = 251,
	["Insect Swarm"] = 621,
	["Terramite"] = 631,
	["Wailing Widow"] = 632,
	["Lancer Beetle"] = 633,
	["Sandcrawler"] = 641,
	["Brimstone Bug"] = 674,
	["Berrypest"] = 691,
	["Sacred Spider"] = 709,
	["Slug"] = 731,
	["Insectoid Scout"] = 732,
	["Ladybug"] = 778,
	["Crawler"] = 786,
	["Spidris"] = 787,
	["Kollos"] = 788,
	["Swarmer"] = 790,
	["Spitter"] = 791,
	["Waspoid"] = 792,
	["Insectoid Worker"] = 796,
	["Spidris Elite"] = 797,
	["Hive Overseer"] = 801,
	["Drillworm"] = 878,
	["Wiggler"] = 899,
	["Emerald Damselfly"] = 912,
	["Deepworm"] = 1531,
	["Diremaw"] = 1532,
	["Cave Devourer"] = 1544,
	["Tunnel Tyrant"] = 1545,
	["Chasm Spawn"] = 1546,
	["Lacewing Moth"] = 1736,
	["Hibernal Moth"] = 1737
}

--[[
Regex to parse upper table into the lower one:
Search: \[(\d{1,4})\].*name = ('|")(.*)('|"),
class.*
Replace: ["$3"] = $1,
Bestiary.CreatureEncryptionKeys = {"gnikcuf a si labolG", "!oiarac sion ", "vreSTO", "hE !tcejorp emosewa "}
Bestiary.CreatureEncryptionOrder = {3,1,4,2}
]]
