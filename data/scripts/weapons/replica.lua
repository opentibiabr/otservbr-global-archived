-- replica swords
local replicaSword = Weapon(WEAPON_SWORD)
replicaSword:id(25915,25916,25917,25918,25919,25930,25931,25932,25933,25934,25945,25946,25947,25948,25949,25960,25961,25962,25963,25964,25983,25984,25985,25986,25987,25988,26014,26015,26016,26017,26018,26019,26044,26045,26046,26047,26048,26049)
replicaSword:attack(5)
replicaSword:defense(5)
replicaSword:register()

-- replica axes
local replicaAxe = Weapon(WEAPON_AXE)
replicaSword:id(25920,25921,25922,25923,25924,25935,25936,25937,25938,25939,25950,25951,25952,25953,25954,25965,25966,25967,25968,25969,25989,25990,25991,25992,25993,25994,26020,26021,26022,26023,26024,26025,26050,26051,26052,26053,26054,26055)
replicaSword:attack(5)
replicaSword:defense(5)
replicaSword:register()

-- replica clubs
local replicaClub = Weapon(WEAPON_CLUB)
replicaClub:id(25925,25926,25927,25928,25929,25940,25941,25942,25943,25944,25955,25956,25957,25958,25959,25970,25971,25972,25973,25974,25995,25996,25997,25998,25999,26000,26026,26027,26028,26029,26030,26031,26056,26057,26058,26059,26060,26061)
replicaClub:attack(5)
replicaClub:defense(5)
replicaClub:register()

-- replica distance (bows/crossbows)
local replicaDistance = Weapon(WEAPON_DISTANCE)
replicaDistance:id(26001,26002,26003,26004,26005,26006,26032,26033,26034,26035,26036,26037,26062,26063,26064,26065,26066,26067)
replicaDistance:range(6)
replicaDistance:slotType("two-handed")
replicaDistance:register()

-- replica wands
local replicaWands = Weapon(WEAPON_WAND)
replicaWands:id(26007,26008,26009,26038,26039,26040,26068,26069,26070)
replicaWands:damage(0, 10)
replicaWands:element("energy")
replicaWands:mana(5)
replicaWands:range(3)
replicaWands:vocation("sorcerer", true, true)
replicaWands:vocation("master sorcerer")
replicaWands:register()

-- replica rods
local replicaRods = Weapon(WEAPON_WAND)
replicaRods:id(26010,26011,26012,26041,26042,26043,26071,26072,26073)
replicaRods:damage(0, 10)
replicaRods:element("ice")
replicaRods:mana(5)
replicaRods:range(3)
replicaRods:vocation("druid", true, true)
replicaRods:vocation("elder druid")
replicaRods:register()

