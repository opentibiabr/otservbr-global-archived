local weapons = {
	{
		itemId = 35902,
		type = WEAPON_AMMO,
		level = 150,
		unproperly = true,
		action = "removecount"
	}, -- spectral bolt (no decay)
	{
		itemId = 35522,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 150,
		mana = 19,
		damage = {80, 100},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- jungle wand
	{
		itemId = 35521,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 150,
		mana = 19,
		damage = {80, 100},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- jungle rod
	{
		itemId = 35518,
		type = WEAPON_DISTANCE,
		level = 150,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- jungle bow
	{
		itemId = 35515,
		type = WEAPON_AXE,
		level = 150,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- throwing axe
	{
		itemId = 35514,
		type = WEAPON_CLUB,
		level = 150,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- jungle flail
	{
		itemId = 34155,
		type = WEAPON_SWORD,
		level = 270,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- lion longsword
	{
		itemId = 34254,
		type = WEAPON_CLUB,
		level = 270,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- lion hammer
	{
		itemId = 34253,
		type = WEAPON_AXE,
		level = 270,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- lion axe
	{
		itemId = 34152,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 220,
		mana = 21,
		damage = {89, 109},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- lion wand
	{
		itemId = 34151,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 270,
		mana = 20,
		damage = {85, 105},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- lion rod
	{
		itemId = 34150,
		type = WEAPON_DISTANCE,
		level = 270,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- lion longbow
	{
		itemId = 34091,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 400,
		mana = 21,
		damage = {98, 118},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- soulhexer rod
	{
		itemId = 34090,
		type = WEAPON_WAND,
		wandType = "death",
		level = 400,
		mana = 21,
		damage = {100, 120},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- soultainter wand
	{
		itemId = 34089,
		type = WEAPON_DISTANCE,
		level = 400,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- soulpiercer crossbow
	{
		itemId = 34088,
		type = WEAPON_DISTANCE,
		level = 400,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- soulbleeder bow
	{
		itemId = 34087,
		type = WEAPON_CLUB,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- soulmaimer club
	{
		itemId = 34086,
		type = WEAPON_CLUB,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- soulcrusher club
	{
		itemId = 34085,
		type = WEAPON_AXE,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- souleater axe
	{
		itemId = 34084,
		type = WEAPON_AXE,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- soulbiter axe
	{
		itemId = 34083,
		type = WEAPON_SWORD,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- soulshredder sword
	{
		itemId = 34082,
		type = WEAPON_SWORD,
		level = 400,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- soulcutter sword
	{
		itemId = 32616,
		type = WEAPON_AXE,
		level = 180,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- phantasmal axe
	{
		itemId = 32093,
		type = WEAPON_CLUB
	}, -- meat hammer
	{
		itemId = 31614,
		type = WEAPON_SWORD,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- tagralt blade
	{
		itemId = 31581,
		type = WEAPON_DISTANCE,
		level = 250,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- bow of cataclysm
	{
		itemId = 31580,
		type = WEAPON_CLUB,
		level = 220,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mortal mace
	{
		itemId = 30400,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 220,
		mana = 21,
		damage = {70, 110},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- cobra rod
	{
		itemId = 30399,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 270,
		mana = 22,
		damage = {94, 100},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- cobra wand
	{
		itemId = 30398,
		type = WEAPON_SWORD,
		level = 220,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- cobra sword
	{
		itemId = 30396,
		type = WEAPON_AXE,
		level = 220,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- cobra axe
	{
		itemId = 30395,
		type = WEAPON_CLUB,
		level = 220,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- cobra club
	{
		itemId = 30393,
		type = WEAPON_DISTANCE,
		level = 220,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- cobra crossbow
	{
		itemId = 30283,
		type = WEAPON_AXE
	}, -- ice hatchet
	{
		itemId = 29425,
		type = WEAPON_WAND,
		wandType = "fire",
		level = 180,
		mana = 24,
		damage = {88, 108},
		vocation = {
			{"Sorcerer", true},
			{"Druid", true, true},
			{"Master Sorcerer"},
			{"Elder Druid"}
		}
	}, -- energized limb
	{
		itemId = 29422,
		type = WEAPON_SWORD,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- winterblade
	{
		itemId = 29421,
		type = WEAPON_SWORD,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- summerblade
	{
		itemId = 29419,
		type = WEAPON_CLUB,
		level = 230,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- resizer
	{
		itemId = 29417,
		type = WEAPON_DISTANCE,
		level = 220,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- living vine bow
	{
		itemId = 29286,
		type = WEAPON_AXE
	}, -- golden axe
	{
		itemId = 28479,
		type = WEAPON_WAND
	}, -- wand of destruction test
	{
		itemId = 28478,
		type = WEAPON_DISTANCE
	}, -- umbral master bow test
	{
		itemId = 28466,
		type = WEAPON_WAND
	}, -- sorcerer test weapon
	{
		itemId = 28465,
		type = WEAPON_DISTANCE
	}, -- bow of destruction test
	{
		itemId = 28464,
		type = WEAPON_SWORD
	}, -- test weapon for knights
	{
		itemId = 28832,
		type = WEAPON_CLUB,
		level = 80,
		unproperly = true
	}, -- sulphurous demonbone
	{
		itemId = 28831,
		type = WEAPON_CLUB,
		level = 80,
		unproperly = true
	}, -- unliving demonbone
	{
		itemId = 28830,
		type = WEAPON_CLUB,
		level = 80,
		unproperly = true
	}, -- energized demonbone
	{
		itemId = 28829,
		type = WEAPON_CLUB,
		level = 80,
		unproperly = true
	}, -- rotten demonbone
	{
		itemId = 28826,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 230,
		mana = 23,
		damage = {80, 120},
		vocation = {
			{"Sorcerer", true},
			{"Druid", true, true},
			{"Master Sorcerer"},
			{"Elder Druid"}
		}
	}, -- deepling fork
	{
		itemId = 28825,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 180,
		mana = 23,
		damage = {86, 98},
		vocation = {
			{"Sorcerer", true},
			{"Druid", true, true},
			{"Master Sorcerer"},
			{"Elder Druid"}
		}
	}, -- deepling ceremonial dagger
	{
		itemId = 28725,
		type = WEAPON_CLUB,
		level = 300,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- falcon mace
	{
		itemId = 28724,
		type = WEAPON_AXE,
		level = 300,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- falcon battleaxe
	{
		itemId = 28723,
		type = WEAPON_SWORD,
		level = 300,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- falcon longsword
	{
		itemId = 28718,
		type = WEAPON_DISTANCE,
		level = 300,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- falcon bow
	{
		itemId = 28717,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 300,
		mana = 21,
		damage = {86, 102},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- falcon wand
	{
		itemId = 28716,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 300,
		mana = 20,
		damage = {87, 101},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- falcon rod
	{
		itemId = 27651,
		type = WEAPON_SWORD,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- gnome sword
	{
		itemId = 27525,
		type = WEAPON_CLUB
	}, -- mallet handle
	{
		itemId = 27523,
		type = WEAPON_CLUB
	}, -- strange mallet
	{
		itemId = 27458,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 200,
		mana = 20,
		damage = {80, 110},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- rod of destruction
	{
		itemId = 27457,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 200,
		mana = 20,
		damage = {80, 110},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of destruction
	{
		itemId = 27456,
		type = WEAPON_DISTANCE,
		level = 200,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crossbow of destruction
	{
		itemId = 27455,
		type = WEAPON_DISTANCE,
		level = 200,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- bow of destruction
	{
		itemId = 27454,
		type = WEAPON_CLUB,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of destruction
	{
		itemId = 27453,
		type = WEAPON_CLUB,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mace of destruction
	{
		itemId = 27452,
		type = WEAPON_AXE,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- chopper of destruction
	{
		itemId = 27451,
		type = WEAPON_AXE,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- axe of destruction
	{
		itemId = 27450,
		type = WEAPON_SWORD,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- slayer of destruction
	{
		itemId = 27449,
		type = WEAPON_SWORD,
		level = 200,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- blade of destruction
	{
		itemId = 26061,
		type = WEAPON_CLUB
	}, -- ornate carving hammer
	{
		itemId = 26060,
		type = WEAPON_CLUB
	}, -- valuable carving hammer
	{
		itemId = 26059,
		type = WEAPON_CLUB
	}, -- plain carving hammer
	{
		itemId = 26058,
		type = WEAPON_CLUB
	}, -- ornate carving mace
	{
		itemId = 26057,
		type = WEAPON_CLUB
	}, -- valuable carving mace
	{
		itemId = 26056,
		type = WEAPON_CLUB
	}, -- plain carving mace
	{
		itemId = 26055,
		type = WEAPON_AXE
	}, -- ornate carving chopper
	{
		itemId = 26054,
		type = WEAPON_AXE
	}, -- valuable carving chopper
	{
		itemId = 26053,
		type = WEAPON_AXE
	}, -- plain carving chopper
	{
		itemId = 26052,
		type = WEAPON_AXE
	}, -- ornate carving axe
	{
		itemId = 26051,
		type = WEAPON_AXE
	}, -- valuable carving axe
	{
		itemId = 26050,
		type = WEAPON_AXE
	}, -- plain carving axe
	{
		itemId = 26049,
		type = WEAPON_SWORD
	}, -- ornate carving slayer
	{
		itemId = 26048,
		type = WEAPON_SWORD
	}, -- valuable carving slayer
	{
		itemId = 26047,
		type = WEAPON_SWORD
	}, -- plain carving slayer
	{
		itemId = 26046,
		type = WEAPON_SWORD
	}, -- ornate carving blade
	{
		itemId = 26045,
		type = WEAPON_SWORD
	}, -- valuable carving blade
	{
		itemId = 26044,
		type = WEAPON_SWORD
	}, -- plain carving blade
	{
		itemId = 26031,
		type = WEAPON_CLUB
	}, -- ornate remedy hammer
	{
		itemId = 26030,
		type = WEAPON_CLUB
	}, -- valuable remedy hammer
	{
		itemId = 26029,
		type = WEAPON_CLUB
	}, -- plain remedy hammer
	{
		itemId = 26028,
		type = WEAPON_CLUB
	}, -- ornate remedy mace
	{
		itemId = 26027,
		type = WEAPON_CLUB
	}, -- valuable remedy mace
	{
		itemId = 26026,
		type = WEAPON_CLUB
	}, -- plain remedy mace
	{
		itemId = 26025,
		type = WEAPON_AXE
	}, -- ornate remedy chopper
	{
		itemId = 26024,
		type = WEAPON_AXE
	}, -- valuable remedy chopper
	{
		itemId = 26023,
		type = WEAPON_AXE
	}, -- plain remedy chopper
	{
		itemId = 26022,
		type = WEAPON_AXE
	}, -- ornate remedy axe
	{
		itemId = 26021,
		type = WEAPON_AXE
	}, -- valuable remedy axe
	{
		itemId = 26020,
		type = WEAPON_AXE
	}, -- plain remedy axe
	{
		itemId = 26019,
		type = WEAPON_SWORD
	}, -- ornate remedy slayer
	{
		itemId = 26018,
		type = WEAPON_SWORD
	}, -- valuable remedy slayer
	{
		itemId = 26017,
		type = WEAPON_SWORD
	}, -- plain remedy slayer
	{
		itemId = 26016,
		type = WEAPON_SWORD
	}, -- ornate remedy blade
	{
		itemId = 26015,
		type = WEAPON_SWORD
	}, -- valuable remedy blade
	{
		itemId = 26014,
		type = WEAPON_SWORD
	}, -- plain remedy blade
	{
		itemId = 26000,
		type = WEAPON_CLUB
	}, -- ornate mayhem hammer
	{
		itemId = 25999,
		type = WEAPON_CLUB
	}, -- valuable mayhem hammer
	{
		itemId = 25998,
		type = WEAPON_CLUB
	}, -- plain mayhem hammer
	{
		itemId = 25997,
		type = WEAPON_CLUB
	}, -- ornate mayhem mace
	{
		itemId = 25996,
		type = WEAPON_CLUB
	}, -- valuable mayhem mace
	{
		itemId = 25995,
		type = WEAPON_CLUB
	}, -- plain mayhem mace
	{
		itemId = 25994,
		type = WEAPON_AXE
	}, -- ornate mayhem chopper
	{
		itemId = 25993,
		type = WEAPON_AXE
	}, -- valuable mayhem chopper
	{
		itemId = 25992,
		type = WEAPON_AXE
	}, -- plain mayhem chopper
	{
		itemId = 25991,
		type = WEAPON_AXE
	}, -- ornate mayhem axe
	{
		itemId = 25990,
		type = WEAPON_AXE
	}, -- valuable mayhem axe
	{
		itemId = 25989,
		type = WEAPON_AXE
	}, -- plain mayhem axe
	{
		itemId = 25988,
		type = WEAPON_SWORD
	}, -- ornate mayhem slayer
	{
		itemId = 25987,
		type = WEAPON_SWORD
	}, -- valuable mayhem slayer
	{
		itemId = 25986,
		type = WEAPON_SWORD
	}, -- plain mayhem slayer
	{
		itemId = 25985,
		type = WEAPON_SWORD
	}, -- ornate mayhem blade
	{
		itemId = 25984,
		type = WEAPON_SWORD
	}, -- valuable mayhem blade
	{
		itemId = 25983,
		type = WEAPON_SWORD
	}, -- plain mayhem blade
	{
		itemId = 25974,
		type = WEAPON_CLUB
	}, -- energy war hammer replica
	{
		itemId = 25973,
		type = WEAPON_CLUB
	}, -- energy orcish maul replica
	{
		itemId = 25972,
		type = WEAPON_CLUB
	}, -- energy basher replica
	{
		itemId = 25971,
		type = WEAPON_CLUB
	}, -- energy crystal mace replica
	{
		itemId = 25970,
		type = WEAPON_CLUB
	}, -- energy clerical mace replica
	{
		itemId = 25969,
		type = WEAPON_AXE
	}, -- energy war axe replica
	{
		itemId = 25968,
		type = WEAPON_AXE
	}, -- energy headchopper replica
	{
		itemId = 25967,
		type = WEAPON_AXE
	}, -- energy heroic axe replica
	{
		itemId = 25966,
		type = WEAPON_AXE
	}, -- energy knight axe replica
	{
		itemId = 25965,
		type = WEAPON_AXE
	}, -- energy barbarian axe replica
	{
		itemId = 25964,
		type = WEAPON_SWORD
	}, -- energy dragon slayer replica
	{
		itemId = 25963,
		type = WEAPON_SWORD
	}, -- energy blacksteel replica
	{
		itemId = 25962,
		type = WEAPON_SWORD
	}, -- energy mystic blade replica
	{
		itemId = 25961,
		type = WEAPON_SWORD
	}, -- energy relic sword replica
	{
		itemId = 25960,
		type = WEAPON_SWORD
	}, -- energy spike sword replica
	{
		itemId = 25959,
		type = WEAPON_CLUB
	}, -- earth war hammer replica
	{
		itemId = 25958,
		type = WEAPON_CLUB
	}, -- earth orcish maul replica
	{
		itemId = 25957,
		type = WEAPON_CLUB
	}, -- earth basher replica
	{
		itemId = 25956,
		type = WEAPON_CLUB
	}, -- earth crystal mace replica
	{
		itemId = 25955,
		type = WEAPON_CLUB
	}, -- earth clerical mace replica
	{
		itemId = 25954,
		type = WEAPON_AXE
	}, -- earth war axe replica
	{
		itemId = 25953,
		type = WEAPON_AXE
	}, -- earth headchopper replica
	{
		itemId = 25952,
		type = WEAPON_AXE
	}, -- earth heroic axe replica
	{
		itemId = 25951,
		type = WEAPON_AXE
	}, -- earth knight axe replica
	{
		itemId = 25950,
		type = WEAPON_AXE
	}, -- earth barbarian axe replica
	{
		itemId = 25949,
		type = WEAPON_SWORD
	}, -- earth dragon slayer replica
	{
		itemId = 25948,
		type = WEAPON_SWORD
	}, -- earth blacksteel replica
	{
		itemId = 25947,
		type = WEAPON_SWORD
	}, -- earth mystic blade replica
	{
		itemId = 25946,
		type = WEAPON_SWORD
	}, -- earth relic sword replica
	{
		itemId = 25945,
		type = WEAPON_SWORD
	}, -- earth spike sword replica
	{
		itemId = 25944,
		type = WEAPON_CLUB
	}, -- icy war hammer replica
	{
		itemId = 25943,
		type = WEAPON_CLUB
	}, -- icy orcish maul replica
	{
		itemId = 25942,
		type = WEAPON_CLUB
	}, -- icy basher replica
	{
		itemId = 25941,
		type = WEAPON_CLUB
	}, -- icy crystal mace replica
	{
		itemId = 25940,
		type = WEAPON_CLUB
	}, -- icy clerical mace replica
	{
		itemId = 25939,
		type = WEAPON_AXE
	}, -- icy war axe replica
	{
		itemId = 25938,
		type = WEAPON_AXE
	}, -- icy headchopper replica
	{
		itemId = 25937,
		type = WEAPON_AXE
	}, -- icy heroic axe replica
	{
		itemId = 25936,
		type = WEAPON_AXE
	}, -- icy knight axe replica
	{
		itemId = 25935,
		type = WEAPON_AXE
	}, -- icy barbarian axe replica
	{
		itemId = 25934,
		type = WEAPON_SWORD
	}, -- icy dragon slayer replica
	{
		itemId = 25933,
		type = WEAPON_SWORD
	}, -- icy blacksteel replica
	{
		itemId = 25932,
		type = WEAPON_SWORD
	}, -- icy mystic blade replica
	{
		itemId = 25931,
		type = WEAPON_SWORD
	}, -- icy relic sword replica
	{
		itemId = 25930,
		type = WEAPON_SWORD
	}, -- icy spike sword replica
	{
		itemId = 25929,
		type = WEAPON_CLUB
	}, -- fiery war hammer replica
	{
		itemId = 25928,
		type = WEAPON_CLUB
	}, -- fiery orcish maul replica
	{
		itemId = 25927,
		type = WEAPON_CLUB
	}, -- fiery basher replica
	{
		itemId = 25926,
		type = WEAPON_CLUB
	}, -- fiery crystal mace replica
	{
		itemId = 25925,
		type = WEAPON_CLUB
	}, -- fiery clerical mace replica
	{
		itemId = 25924,
		type = WEAPON_AXE
	}, -- fiery war axe replica
	{
		itemId = 25923,
		type = WEAPON_AXE
	}, -- fiery headchopper replica
	{
		itemId = 25922,
		type = WEAPON_AXE
	}, -- fiery heroic axe replica
	{
		itemId = 25921,
		type = WEAPON_AXE
	}, -- fiery knight axe replica
	{
		itemId = 25920,
		type = WEAPON_AXE
	}, -- fiery barbarian axe replica
	{
		itemId = 25919,
		type = WEAPON_SWORD
	}, -- fiery dragon slayer replica
	{
		itemId = 25918,
		type = WEAPON_SWORD
	}, -- fiery blacksteel replica
	{
		itemId = 25917,
		type = WEAPON_SWORD
	}, -- fiery mystic blade replica
	{
		itemId = 25916,
		type = WEAPON_SWORD
	}, -- fiery relic sword replica
	{
		itemId = 25915,
		type = WEAPON_SWORD
	}, -- fiery spike sword replica
	{
		itemId = 25760,
		type = WEAPON_WAND,
		wandType = "death",
		level = 41,
		mana = 15,
		damage = {75, 95},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of darkness
	{
		itemId = 25759,
		type = WEAPON_DISTANCE,
		level = 120,
		unproperly = true,
		breakChance = 30
	}, -- royal star
	{
		itemId = 25758,
		type = WEAPON_AMMO,
		level = 150,
		unproperly = true,
		action = "removecount"
	}, -- spectral bolt
	{
		itemId = 25735,
		type = WEAPON_DISTANCE,
		level = 60,
		unproperly = true,
		breakChance = 40
	}, -- leaf star
	{
		itemId = 25700,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 80,
		mana = 18,
		damage = {63, 77},
		vocation = {
			{"Sorcerer", true},
			{"Druid", true, true},
			{"Master Sorcerer"},
			{"Elder Druid"}
		}
	}, -- dream blossom staff
	{
		itemId = 23339,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- rod of carving
	{
		itemId = 23335,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of carving
	{
		itemId = 23331,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crossbow of carving
	{
		itemId = 23327,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- bow of carving
	{
		itemId = 23323,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of carving
	{
		itemId = 23319,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mace of carving
	{
		itemId = 23315,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- chopper of carving
	{
		itemId = 23311,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- axe of carving
	{
		itemId = 23307,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- slayer of carving
	{
		itemId = 23303,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- blade of carving
	{
		itemId = 23299,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- rod of remedy
	{
		itemId = 23295,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of remedy
	{
		itemId = 23291,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crossbow of remedy
	{
		itemId = 23287,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- bow of remedy
	{
		itemId = 23283,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of remedy
	{
		itemId = 23279,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mace of remedy
	{
		itemId = 23275,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- chopper of remedy
	{
		itemId = 23271,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- axe of remedy
	{
		itemId = 23267,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- slayer of remedy
	{
		itemId = 23263,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- blade of remedy
	{
		itemId = 23232,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- rod of mayhem
	{
		itemId = 23231,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 100,
		mana = 18,
		damage = {70, 105},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of mayhem
	{
		itemId = 23230,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crossbow of mayhem
	{
		itemId = 23229,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- bow of mayhem
	{
		itemId = 23228,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of mayhem
	{
		itemId = 23227,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mace of mayhem
	{
		itemId = 23226,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- chopper of mayhem
	{
		itemId = 23225,
		type = WEAPON_AXE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- axe of mayhem
	{
		itemId = 23224,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- slayer of mayhem
	{
		itemId = 23223,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- blade of mayhem
	{
		itemId = 22867,
		type = WEAPON_DISTANCE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- rift crossbow
	{
		itemId = 22866,
		type = WEAPON_DISTANCE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- rift bow
	{
		itemId = 22766,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 100,
		mana = 19,
		damage = {80, 110},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- ferumbras' staff (enchanted)
	{
		itemId = 22765,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 65,
		mana = 17,
		damage = {65, 95},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- ferumbras' staff (failed)
	{
		itemId = 22764,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true
	}, -- Ferumbras' staff
	{
		itemId = 22762,
		type = WEAPON_CLUB,
		level = 150,
		unproperly = true
	}, -- maimer
	{
		itemId = 22760,
		type = WEAPON_SWORD,
		level = 150,
		unproperly = true
	}, -- Impaler of the igniter
	{
		itemId = 22759,
		type = WEAPON_AXE,
		level = 150,
		unproperly = true
	}, -- plague bite
	{
		itemId = 22727,
		type = WEAPON_AXE,
		level = 70,
		unproperly = true
	}, -- rift lance
	{
		itemId = 22183,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 37,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- ogre sceptra
	{
		itemId = 22172,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- ogre choppa
	{
		itemId = 22171,
		type = WEAPON_AXE,
		level = 50,
		unproperly = true
	}, -- ogre klubba
	{
		itemId = 21470,
		type = WEAPON_AMMO,
		action = "removecount"
	}, -- simple arrow
	--[[
		the chiller
		{itemId = 21350}
		scripted weapon
	]]
	--[[
		the scorcher
		{itemId = 21348}
		scripted weapon
	]]
	{
		itemId = 21219,
		type = WEAPON_CLUB,
		level = 70,
		unproperly = true
	}, -- one hit wonder
	{
		itemId = 21180,
		type = WEAPON_AXE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- glooth axe
	{
		itemId = 21179,
		type = WEAPON_SWORD,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- glooth blade
	{
		itemId = 21178,
		type = WEAPON_CLUB,
		level = 75,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- glooth club
	{
		itemId = 21177,
		type = WEAPON_SWORD,
		level = 25,
		unproperly = true
	}, -- cowtana
	{
		itemId = 21176,
		type = WEAPON_AXE,
		level = 55,
		unproperly = true
	}, -- execowtioner axe
	{
		itemId = 21174,
		type = WEAPON_AXE,
		level = 45,
		unproperly = true
	}, -- mino lance
	{
		itemId = 21173,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true
	}, -- moohtant cudgel
	{
		itemId = 21172,
		type = WEAPON_CLUB,
		level = 25,
		unproperly = true
	}, -- glooth whip
	{
		itemId = 21171,
		type = WEAPON_CLUB,
		level = 55,
		unproperly = true
	}, -- metal bat
	{
		itemId = 21158,
		type = WEAPON_DISTANCE,
		level = 60,
		unproperly = true,
		breakChance = 2
	}, -- glooth spear
	{
		itemId = 20087,
		type = WEAPON_DISTANCE,
		level = 250,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- umbral master crossbow
	{
		itemId = 20086,
		type = WEAPON_DISTANCE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- umbral crossbow
	{
		itemId = 20085,
		type = WEAPON_DISTANCE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crude umbral crossbow
	{
		itemId = 20084,
		type = WEAPON_DISTANCE,
		level = 250,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- umbral master bow
	{
		itemId = 20083,
		type = WEAPON_DISTANCE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- umbral bow
	{
		itemId = 20082,
		type = WEAPON_DISTANCE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crude umbral bow
	{
		itemId = 20081,
		type = WEAPON_CLUB,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral master hammer
	{
		itemId = 20080,
		type = WEAPON_CLUB,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral hammer
	{
		itemId = 20079,
		type = WEAPON_CLUB,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crude umbral hammer
	{
		itemId = 20078,
		type = WEAPON_CLUB,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral master mace
	{
		itemId = 20077,
		type = WEAPON_CLUB,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral mace
	{
		itemId = 20076,
		type = WEAPON_CLUB,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crude umbral mace
	{
		itemId = 20075,
		type = WEAPON_AXE,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral master chopper
	{
		itemId = 20074,
		type = WEAPON_AXE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral chopper
	{
		itemId = 20073,
		type = WEAPON_AXE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- guardian halberd
	{
		itemId = 20072,
		type = WEAPON_AXE,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral master axe
	{
		itemId = 20071,
		type = WEAPON_AXE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral axe
	{
		itemId = 20070,
		type = WEAPON_AXE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crude umbral axe
	{
		itemId = 20069,
		type = WEAPON_SWORD,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral master slayer
	{
		itemId = 20068,
		type = WEAPON_SWORD,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral slayer
	{
		itemId = 20067,
		type = WEAPON_SWORD,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crude umbral slayer
	{
		itemId = 20066,
		type = WEAPON_SWORD,
		level = 250,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral masterblade
	{
		itemId = 20065,
		type = WEAPON_SWORD,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- umbral blade
	{
		itemId = 20064,
		type = WEAPON_SWORD,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crude umbral blade
	{
		itemId = 19362,
		type = WEAPON_DISTANCE,
		unproperly = true
	}, -- icicle bow
	{
		itemId = 19356,
		type = WEAPON_DISTANCE,
		level = 70,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- triple bolt crossbow
	{
		itemId = 17859,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true
	}, -- spiky club
	{
		itemId = 17828,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- pair of iron fists
	{
		itemId = 17824,
		type = WEAPON_CLUB
	}, -- swampling club
	{
		itemId = 17813,
		type = WEAPON_CLUB,
		level = 15,
		unproperly = true
	}, -- life preserver
	{
		itemId = 17812,
		type = WEAPON_SWORD,
		level = 15,
		unproperly = true
	}, -- ratana
	{
		itemId = 17111,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 1,
		mana = 2,
		damage = {8, 18},
		vocation = {
			{"None", true}
		}
	}, -- sorc and druid staff
	{
		itemId = 17110,
		type = WEAPON_DISTANCE,
		breakChance = 3,
		vocation = {
			{"None", true}
		}
	}, -- mean paladin spear
	{
		itemId = 17109,
		type = WEAPON_SWORD,
		unproperly = true,
		vocation = {
			{"None", true}
		}
	}, -- mean knight sword
	{
		itemId = 16175,
		type = WEAPON_SWORD,
		level = 120,
		unproperly = true
	}, -- shiny blade
	{
		itemId = 16164,
		type = WEAPON_DISTANCE,
		level = 105,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- mycological bow
	{
		itemId = 16163,
		type = WEAPON_DISTANCE,
		level = 90,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- crystal crossbow
	{
		itemId = 16162,
		type = WEAPON_CLUB,
		level = 120,
		unproperly = true
	}, -- mycological mace
	{
		itemId = 16161,
		type = WEAPON_AXE,
		level = 120,
		unproperly = true
	}, -- crystalline axe
	{
		itemId = 16160,
		type = WEAPON_SWORD,
		level = 62,
		unproperly = true
	}, -- crystalline sword
	{
		itemId = 16143,
		type = WEAPON_AMMO,
		level = 70,
		unproperly = true,
		action = "removecount"
	}, -- envenomed arrow
	{
		itemId = 16142,
		type = WEAPON_AMMO,
		level = 70,
		unproperly = true,
		action = "removecount"
	}, -- drill bolt
	{
		itemId = 16141,
		type = WEAPON_AMMO,
		level = 90,
		unproperly = true,
		action = "removecount"
	}, -- prismatic bolt
	{
		itemId = 16118,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 65,
		mana = 17,
		damage = {75, 95},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- glacial rod
	{
		itemId = 16117,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 65,
		mana = 17,
		damage = {75, 95},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- muck rod
	{
		itemId = 16115,
		type = WEAPON_WAND,
		wandType = "fire",
		level = 65,
		mana = 17,
		damage = {75, 95},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of everblazing
	{
		itemId = 16096,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 65,
		mana = 17,
		damage = {75, 95},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of defiance
	{
		itemId = 15793,
		type = WEAPON_AMMO,
		level = 90,
		unproperly = true,
		action = "removecount"
	}, -- crystalline arrow
	{
		itemId = 15792,
		type = WEAPON_AMMO,
		action = "removecount"
	}, -- crystal bolt
	{
		itemId = 14768,
		type = WEAPON_DISTANCE,
		level = 150,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- thorn spitter
	{
		itemId = 14252,
		type = WEAPON_AMMO,
		level = 40,
		unproperly = true,
		action = "removecount"
	}, -- vortex bolt
	{
		itemId = 14251,
		type = WEAPON_AMMO,
		level = 30,
		unproperly = true,
		action = "removecount"
	}, -- tarsal arrow
	{
		itemId = 14250,
		type = WEAPON_CLUB,
		level = 48,
		unproperly = true
	}, -- deepling squelcher
	{
		itemId = 14247,
		type = WEAPON_DISTANCE,
		level = 50,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- ornate crossbow
	{
		itemId = 14246,
		type = WEAPON_DISTANCE,
		level = 85,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- hive bow
	{
		itemId = 14089,
		type = WEAPON_AXE,
		level = 70,
		unproperly = true
	}, -- hive scythe
	{
		itemId = 14043,
		type = WEAPON_AXE,
		level = 50,
		unproperly = true
	}, -- guardian axe
	{
		itemId = 14040,
		type = WEAPON_AXE,
		level = 40,
		unproperly = true
	}, -- warrior's axe
	{
		itemId = 14001,
		type = WEAPON_CLUB,
		level = 90,
		unproperly = true
	}, -- ornate mace
	{
		itemId = 13991,
		type = WEAPON_AXE,
		level = 80,
		unproperly = true
	}, -- deepling axe
	{
		itemId = 13987,
		type = WEAPON_CLUB,
		level = 38,
		unproperly = true
	}, -- deepling staff
	{
		itemId = 12741,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 40,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- shimmer wand
	{
		itemId = 12733,
		type = WEAPON_DISTANCE,
		level = 40,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- shimmer bow
	{
		itemId = 12732,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 40,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- shimmer rod
	{
		itemId = 12731,
		type = WEAPON_SWORD,
		level = 40,
		unproperly = true
	}, -- shimmer sword
	{
		itemId = 12683,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- heavy trident
	{
		itemId = 12673,
		type = WEAPON_SWORD
	}, -- wooden sword
	{
		itemId = 12603,
		type = WEAPON_WAND,
		wandType = "death",
		level = 37,
		mana = 9,
		damage = {44, 62},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of dimensions
	{
		itemId = 11693,
		type = WEAPON_SWORD,
		level = 82,
		unproperly = true
	}, -- blade of corruption
	{
		itemId = 11692,
		type = WEAPON_CLUB,
		level = 82,
		unproperly = true
	}, -- snake god's sceptre
	{
		itemId = 11657,
		type = WEAPON_SWORD,
		level = 58,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- twiceslicer
	{
		itemId = 10406,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- Zaoan halberd
	{
		itemId = 10392,
		type = WEAPON_SWORD,
		level = 20,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- twin hooks
	{
		itemId = 10391,
		type = WEAPON_CLUB,
		level = 55,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- drachaku
	{
		itemId = 10390,
		type = WEAPON_SWORD,
		level = 55,
		unproperly = true
	}, -- Zaoan sword
	{
		itemId = 10389,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- sai
	{
		itemId = 10388,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true
	}, -- drakinata
	{
		itemId = 9396,
		type = WEAPON_SWORD
	}, -- incredible mumpiz slayer
	{
		itemId = 9387,
		type = WEAPON_SWORD
	}, -- poet's fencing quill
	{
		itemId = 9386,
		type = WEAPON_AXE
	}, -- farmer's avenger
	{
		itemId = 9385,
		type = WEAPON_CLUB
	}, -- club of the fury
	{
		itemId = 9384,
		type = WEAPON_AXE
	}, -- scythe of the reaper
	{
		itemId = 9378,
		type = WEAPON_DISTANCE
	}, -- musician's bow
	{
		itemId = 9376,
		type = WEAPON_CLUB
	}, -- stale bread of ancientness
	{
		itemId = 9375,
		type = WEAPON_SWORD
	}, -- pointed rabbitslayer
	{
		itemId = 9373,
		type = WEAPON_CLUB
	}, -- glutton's mace
	{
		itemId = 8104,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- the calamity
	{
		itemId = 8103,
		type = WEAPON_SWORD,
		level = 120,
		unproperly = true
	}, -- the epiphany
	{
		itemId = 8102,
		type = WEAPON_SWORD,
		level = 100,
		unproperly = true
	}, -- emerald sword
	{
		itemId = 8101,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- the stomper
	{
		itemId = 8100,
		type = WEAPON_CLUB,
		level = 100,
		unproperly = true
	}, -- obsidian truncheon
	{
		itemId = 8099,
		type = WEAPON_CLUB,
		level = 120,
		unproperly = true
	}, -- dark trinity mace
	{
		itemId = 8098,
		type = WEAPON_AXE,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- demonwing axe
	{
		itemId = 8097,
		type = WEAPON_AXE,
		level = 130,
		unproperly = true
	}, -- solar axe
	{
		itemId = 8096,
		type = WEAPON_AXE,
		level = 110,
		unproperly = true
	}, -- hellforged axe
	{
		itemId = 8094,
		type = WEAPON_WAND,
		wandType = "death",
		level = 42,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of voodoo
	{
		itemId = 8093,
		type = WEAPON_WAND,
		wandType = "fire",
		level = 22,
		mana = 5,
		damage = {23, 37},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of draconia
	{
		itemId = 8092,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 37,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of starmstorm
	{
		itemId = 8084,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 37,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- springsprout rod
	{
		itemId = 8083,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 22,
		mana = 5,
		damage = {23, 37},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- northwind rod
	{
		itemId = 8082,
		type = WEAPON_WAND,
		wandType = "death",
		level = 42,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- underworld rod
	{
		itemId = 8030,
		type = WEAPON_DISTANCE,
		level = 70,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- elethriel's elemental bow
	{
		itemId = 8029,
		type = WEAPON_DISTANCE,
		level = 40,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- silkweaver bow
	{
		itemId = 8028,
		type = WEAPON_DISTANCE,
		level = 60,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- yol's bow
	{
		itemId = 8027,
		type = WEAPON_DISTANCE,
		level = 50,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- composite hornbow
	{
		itemId = 8026,
		type = WEAPON_DISTANCE,
		level = 80,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- warsinger bow
	{
		itemId = 8025,
		type = WEAPON_DISTANCE,
		level = 80,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- ironworker
	{
		itemId = 8024,
		type = WEAPON_DISTANCE,
		level = 100,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- devileye
	{
		itemId = 8023,
		type = WEAPON_DISTANCE,
		level = 130,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- royal crossbow
	{
		itemId = 8022,
		type = WEAPON_DISTANCE,
		level = 60,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- chain bolter
	{
		itemId = 8021,
		type = WEAPON_DISTANCE,
		level = 45,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- modified crossbow
	{
		itemId = 7774,
		type = WEAPON_SWORD
	}, -- jagged sword
	{
		itemId = 7773,
		type = WEAPON_AXE
	}, -- steel axe
	{
		itemId = 860,
		type = WEAPON_SWORD
	}, -- crimson sword
	{
		itemId = 810,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- energy war hammer
	{
		itemId = 809,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- energy orcish maul
	{
		itemId = 808,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- energy cranial basher
	{
		itemId = 807,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- energy crystal mace
	{
		itemId = 806,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- energy clerical mace
	{
		itemId = 805,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- energy war axe
	{
		itemId = 804,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- energy headchopper
	{
		itemId = 803,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- energy heroic axe
	{
		itemId = 802,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		action = "removecharge"
	}, -- energy knight axe
	{
		itemId = 801,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- energy barbarian axe
	{
		itemId = 798,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- energy dragon slayer
	{
		itemId = 797,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- energy blacksteel sword
	{
		itemId = 796,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- energy mystic blade
	{
		itemId = 795,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		action = "removecharge"
	}, -- energy relic sword
	{
		itemId = 794,
		type = WEAPON_SWORD,
		action = "removecharge"
	}, -- energy spike sword
	{
		itemId = 793,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- earth war hammer
	{
		itemId = 792,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- earth orcish maul
	{
		itemId = 791,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- earth cranial basher
	{
		itemId = 790,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- earth crystal mace
	{
		itemId = 789,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- earth clerical mace
	{
		itemId = 788,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- earth war axe
	{
		itemId = 787,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- earth headchopper
	{
		itemId = 786,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- earth heroic axe
	{
		itemId = 785,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		action = "removecharge"
	}, -- earth knight axe
	{
		itemId = 784,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- earth barbarian axe
	{
		itemId = 783,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- earth dragon slayer
	{
		itemId = 782,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- earth blacksteel sword
	{
		itemId = 781,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- earth mystic blade
	{
		itemId = 780,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		action = "removecharge"
	}, -- earth relic sword
	{
		itemId = 779,
		type = WEAPON_SWORD,
		action = "removecharge"
	}, -- earth spike sword
	{
		itemId = 774,
		type = WEAPON_AMMO,
		level = 20,
		unproperly = true,
		action = "removecount"
	}, -- earth arrow
	{
		itemId = 763,
		type = WEAPON_AMMO,
		level = 20,
		unproperly = true,
		action = "removecount"
	}, -- flaming arrow
	{
		itemId = 762,
		type = WEAPON_AMMO,
		level = 20,
		unproperly = true,
		action = "removecount"
	}, -- shiver arrow
	{
		itemId = 761,
		type = WEAPON_AMMO,
		level = 20,
		unproperly = true,
		action = "removecount"
	}, -- flash arrow
	{
		itemId = 693,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- icy war hammer
	{
		itemId = 692,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- icy orcish maul
	{
		itemId = 691,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- icy cranial basher
	{
		itemId = 690,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- icy crystal mace
	{
		itemId = 689,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- icy clerical mace
	{
		itemId = 688,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- icy war axe
	{
		itemId = 687,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- icy headchopper
	{
		itemId = 686,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- icy heroic axe
	{
		itemId = 685,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		action = "removecharge"
	}, -- icy knight axe
	{
		itemId = 684,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- icy barbarian axe
	{
		itemId = 683,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- icy dragon slayer
	{
		itemId = 682,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- icy blacksteel sword
	{
		itemId = 681,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- icy mystic blade
	{
		itemId = 680,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		action = "removecharge"
	}, -- icy relic sword
	{
		itemId = 679,
		type = WEAPON_SWORD,
		action = "removecharge"
	}, -- icy spike sword
	{
		itemId = 674,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- fiery war hammer
	{
		itemId = 673,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- fiery orcish maul
	{
		itemId = 672,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- fiery cranial basher
	{
		itemId = 671,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true,
		action = "removecharge"
	}, -- fiery crystal mace
	{
		itemId = 670,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- fiery clerical mace
	{
		itemId = 669,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- fiery war axe
	{
		itemId = 668,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- fiery headchopper
	{
		itemId = 667,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- fiery heroic axe
	{
		itemId = 666,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		action = "removecharge"
	}, -- fiery knight axe
	{
		itemId = 665,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true,
		action = "removecharge"
	}, -- fiery barbarian axe
	{
		itemId = 664,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- fiery dragon slayer
	{
		itemId = 663,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- fiery blacksteel sword
	{
		itemId = 662,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true,
		action = "removecharge"
	}, -- fiery mystic blade
	{
		itemId = 661,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		action = "removecharge"
	}, -- fiery relic sword
	{
		itemId = 660,
		type = WEAPON_SWORD,
		action = "removecharge"
	}, -- fiery spike sword
	{
		itemId = 7456,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true
	}, -- noble axe
	{
		itemId = 7455,
		type = WEAPON_AXE,
		level = 80,
		unproperly = true
	}, -- mythril axe
	{
		itemId = 7454,
		type = WEAPON_AXE,
		level = 30,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- glorious axe
	{
		itemId = 7453,
		type = WEAPON_AXE,
		level = 85,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- executioner
	{
		itemId = 7452,
		type = WEAPON_CLUB,
		level = 30,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- spiked squelcher
	{
		itemId = 7451,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true
	}, -- shadow sceptre
	{
		itemId = 7450,
		type = WEAPON_CLUB,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of prophecy
	{
		itemId = 7449,
		type = WEAPON_SWORD,
		level = 25,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- crystal sword
	{
		itemId = 7438,
		type = WEAPON_DISTANCE
	}, -- elvish bow
	{
		itemId = 7437,
		type = WEAPON_CLUB,
		level = 30,
		unproperly = true
	}, -- sapphire hammer
	{
		itemId = 7436,
		type = WEAPON_AXE,
		level = 45,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- angelic axe
	{
		itemId = 7435,
		type = WEAPON_AXE,
		level = 85,
		unproperly = true
	}, -- impaler
	{
		itemId = 7434,
		type = WEAPON_AXE,
		level = 75,
		unproperly = true
	}, -- royal axe
	{
		itemId = 7433,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true
	}, -- ravenwing
	{
		itemId = 7432,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true
	}, -- furry club
	{
		itemId = 7431,
		type = WEAPON_CLUB,
		level = 80,
		unproperly = true
	}, -- demonbone
	{
		itemId = 7430,
		type = WEAPON_CLUB,
		level = 30,
		unproperly = true
	}, -- dragonbone staff
	{
		itemId = 7429,
		type = WEAPON_CLUB,
		level = 75,
		unproperly = true
	}, -- blessed sceptre
	{
		itemId = 7428,
		type = WEAPON_CLUB,
		level = 55,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- bonebreaker
	{
		itemId = 7427,
		type = WEAPON_CLUB,
		level = 45,
		unproperly = true
	}, -- chaos mace
	{
		itemId = 7426,
		type = WEAPON_CLUB,
		level = 40,
		unproperly = true
	}, -- amber staff
	{
		itemId = 7425,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true
	}, -- taurus mace
	{
		itemId = 7424,
		type = WEAPON_CLUB,
		level = 30,
		unproperly = true
	}, -- lunar staff
	{
		itemId = 7423,
		type = WEAPON_CLUB,
		level = 85,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- skullcrusher
	{
		itemId = 7422,
		type = WEAPON_CLUB,
		level = 70,
		unproperly = true
	}, -- jade hammer
	{
		itemId = 7421,
		type = WEAPON_CLUB,
		level = 65,
		unproperly = true
	}, -- onyx flail
	{
		itemId = 7420,
		type = WEAPON_AXE,
		level = 70,
		unproperly = true
	}, -- reaper's axe
	{
		itemId = 7419,
		type = WEAPON_AXE,
		level = 40,
		unproperly = true
	}, -- dreaded cleaver
	{
		itemId = 7418,
		type = WEAPON_SWORD,
		level = 70,
		unproperly = true
	}, -- nightmare blade
	{
		itemId = 7417,
		type = WEAPON_SWORD,
		level = 65,
		unproperly = true
	}, -- runed sword
	{
		itemId = 7416,
		type = WEAPON_SWORD,
		level = 55,
		unproperly = true
	}, -- bloody edge
	{
		itemId = 7415,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true
	}, -- cranial basher
	{
		itemId = 7414,
		type = WEAPON_CLUB,
		level = 60,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- abyss hammer
	{
		itemId = 7413,
		type = WEAPON_AXE,
		level = 40,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- titan axe
	{
		itemId = 7412,
		type = WEAPON_AXE,
		level = 45,
		unproperly = true
	}, -- butcher's axe
	{
		itemId = 7411,
		type = WEAPON_AXE,
		level = 50,
		unproperly = true
	}, -- ornamented axe
	{
		itemId = 7410,
		type = WEAPON_CLUB,
		level = 55,
		unproperly = true
	}, -- queen's sceptre
	{
		itemId = 7409,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true
	}, -- northern star
	{
		itemId = 7408,
		type = WEAPON_SWORD,
		level = 25,
		unproperly = true
	}, -- wyvern fang
	{
		itemId = 7407,
		type = WEAPON_SWORD,
		level = 30,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- haunted blade
	{
		itemId = 7406,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- blacksteel sword
	{
		itemId = 7405,
		type = WEAPON_SWORD,
		level = 70,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- havoc blade
	{
		itemId = 7404,
		type = WEAPON_SWORD,
		level = 40,
		unproperly = true
	}, -- assassin dagger
	{
		itemId = 7403,
		type = WEAPON_SWORD,
		level = 65,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- berserker
	{
		itemId = 7402,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- dragon slayer
	{
		itemId = 7392,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true
	}, -- orcish maul
	{
		itemId = 7391,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- thaian sword
	{
		itemId = 7390,
		type = WEAPON_SWORD,
		level = 75,
		unproperly = true
	}, -- the justice seeker
	{
		itemId = 7389,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true
	}, -- heroic axe
	{
		itemId = 7388,
		type = WEAPON_AXE,
		level = 55,
		unproperly = true
	}, -- vile axe
	{
		itemId = 7387,
		type = WEAPON_CLUB,
		level = 25,
		unproperly = true
	}, -- diamond sceptre
	{
		itemId = 7386,
		type = WEAPON_SWORD,
		level = 40,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- mercenary sword
	{
		itemId = 7385,
		type = WEAPON_SWORD,
		level = 20,
		unproperly = true
	}, -- crimson sword
	{
		itemId = 7384,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true
	}, -- mystic blade
	{
		itemId = 7383,
		type = WEAPON_SWORD,
		level = 50,
		unproperly = true
	}, -- relic sword
	{
		itemId = 7382,
		type = WEAPON_SWORD,
		level = 60,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- demonrage sword
	{
		itemId = 7381,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true
	}, -- mammoth whopper
	{
		itemId = 7380,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- headchopper
	{
		itemId = 7379,
		type = WEAPON_CLUB,
		level = 25,
		unproperly = true
	}, -- brutetamer's staff
	{
		itemId = 7378,
		type = WEAPON_DISTANCE,
		level = 25,
		unproperly = true,
		breakChance = 3
	}, -- royal spear
	{
		itemId = 7368,
		type = WEAPON_DISTANCE,
		level = 80,
		unproperly = true,
		breakChance = 33
	}, -- assassin star
	{
		itemId = 7367,
		type = WEAPON_DISTANCE,
		level = 42,
		unproperly = true,
		breakChance = 1
	}, -- enchanted spear
	{
		itemId = 7365,
		type = WEAPON_AMMO,
		level = 40,
		unproperly = true,
		action = "removecount"
	}, -- onyx arrow
	{
		itemId = 7364,
		type = WEAPON_AMMO,
		level = 20,
		unproperly = true,
		action = "removecount"
	}, -- sniper arrow
	{
		itemId = 7363,
		type = WEAPON_AMMO,
		level = 30,
		unproperly = true,
		action = "removecount"
	}, -- piercing bolt
	{
		itemId = 6553,
		type = WEAPON_AXE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- ruthless axe
	{
		itemId = 6528,
		type = WEAPON_AMMO,
		level = 110,
		unproperly = true,
		action = "removecount"
	}, -- infernal bolt
	{
		itemId = 6527,
		type = WEAPON_SWORD,
		level = 75,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- the avenger
	{
		itemId = 6101,
		type = WEAPON_SWORD
	}, -- Ron the Ripper's sabre
	{
		itemId = 5803,
		type = WEAPON_DISTANCE,
		level = 75,
		unproperly = true,
		vocation = {
			{"Paladin", true},
			{"Royal Paladin"}
		}
	}, -- arbalest
	{
		itemId = 3348,
		type = WEAPON_CLUB
	}, -- banana staff
	{
		itemId = 3347,
		type = WEAPON_DISTANCE,
		level = 20,
		unproperly = true,
		breakChance = 6
	}, -- hunting spear
	{
		itemId = 3346,
		type = WEAPON_AXE
	}, -- ripper lance
	{
		itemId = 3345,
		type = WEAPON_SWORD
	}, -- templar scytheblade
	{
		itemId = 3344,
		type = WEAPON_AXE,
		level = 30,
		unproperly = true
	}, -- beastslayer axe
	{
		itemId = 3343,
		type = WEAPON_CLUB,
		level = 40,
		unproperly = true
	}, -- lich staff
	{
		itemId = 3453,
		type = WEAPON_CLUB
	}, -- scythe
	{
		itemId = 3450,
		type = WEAPON_AMMO,
		level = 55,
		unproperly = true,
		action = "removecount"
	}, -- power bolt
	{
		itemId = 3447,
		type = WEAPON_AMMO,
		action = "removecount"
	}, -- arrow
	{
		itemId = 3446,
		type = WEAPON_AMMO,
		action = "removecount"
	}, -- bolt
	{
		itemId = 3350,
		type = WEAPON_DISTANCE
	}, -- bow
	{
		itemId = 3349,
		type = WEAPON_DISTANCE
	}, -- crossbow
	{
		itemId = 3342,
		type = WEAPON_AXE,
		level = 65,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- war axe
	{
		itemId = 3341,
		type = WEAPON_CLUB,
		level = 75,
		unproperly = true
	}, -- arcane staff
	{
		itemId = 3340,
		type = WEAPON_CLUB,
		level = 70,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- heavy mace
	{
		itemId = 3339,
		type = WEAPON_SWORD,
		level = 35,
		unproperly = true
	}, -- djinn blade
	{
		itemId = 3338,
		type = WEAPON_SWORD
	}, -- bone sword
	{
		itemId = 3337,
		type = WEAPON_CLUB
	}, -- bone club
	{
		itemId = 3336,
		type = WEAPON_CLUB
	}, -- studded club
	{
		itemId = 3335,
		type = WEAPON_AXE,
		level = 50,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- twin axe
	{
		itemId = 3334,
		type = WEAPON_SWORD,
		level = 45,
		unproperly = true
	}, -- pharaoh sword
	{
		itemId = 3333,
		type = WEAPON_CLUB,
		level = 35,
		unproperly = true
	}, -- crystal mace
	{
		itemId = 3332,
		type = WEAPON_CLUB,
		level = 65,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- hammer of wrath
	{
		itemId = 3331,
		type = WEAPON_AXE,
		level = 70,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- ravager's axe
	{
		itemId = 3330,
		type = WEAPON_SWORD
	}, -- heavy machete
	{
		itemId = 3329,
		type = WEAPON_AXE
	}, -- daramian axe
	{
		itemId = 3328,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- daramian waraxe
	{
		itemId = 3327,
		type = WEAPON_CLUB
	}, -- daramian mace
	{
		itemId = 3326,
		type = WEAPON_SWORD,
		level = 30,
		unproperly = true
	}, -- epee
	{
		itemId = 3325,
		type = WEAPON_CLUB
	}, -- light mace
	{
		itemId = 3324,
		type = WEAPON_CLUB,
		level = 30,
		unproperly = true
	}, -- skull staff
	{
		itemId = 3323,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true
	}, -- dwarven axe
	{
		itemId = 3322,
		type = WEAPON_CLUB,
		level = 25,
		unproperly = true
	}, -- dragon hammer
	{
		itemId = 3321,
		type = WEAPON_CLUB
	}, -- enchanted staff
	{
		itemId = 3320,
		type = WEAPON_AXE,
		level = 35,
		unproperly = true
	}, -- fire axe
	{
		itemId = 3319,
		type = WEAPON_AXE,
		level = 90,
		unproperly = true
	}, -- stonecutter axe
	{
		itemId = 3318,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- knight axe
	{
		itemId = 3317,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true
	}, -- barbarian axe
	{
		itemId = 3316,
		type = WEAPON_AXE
	}, -- orcish axe
	{
		itemId = 3315,
		type = WEAPON_AXE,
		level = 55,
		unproperly = true
	}, -- guardian halberd
	{
		itemId = 3314,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- naginata
	{
		itemId = 3313,
		type = WEAPON_AXE,
		level = 20,
		unproperly = true
	}, -- obsidian lance
	{
		itemId = 3312,
		type = WEAPON_CLUB,
		level = 45,
		unproperly = true
	}, -- silver mace
	{
		itemId = 3311,
		type = WEAPON_CLUB,
		level = 20,
		unproperly = true
	}, -- clerical mace
	{
		itemId = 3310,
		type = WEAPON_CLUB
	}, -- iron hammer
	{
		itemId = 3309,
		type = WEAPON_CLUB,
		level = 85,
		unproperly = true
	}, -- thunder hammer
	{
		itemId = 3308,
		type = WEAPON_SWORD
	}, -- machete
	{
		itemId = 3307,
		type = WEAPON_SWORD
	}, -- scimitar
	{
		itemId = 3306,
		type = WEAPON_AXE
	}, -- golden sickle
	{
		itemId = 3305,
		type = WEAPON_CLUB
	}, -- battle hammer
	{
		itemId = 3304,
		type = WEAPON_CLUB
	}, -- crowbar
	{
		itemId = 3303,
		type = WEAPON_AXE,
		level = 95,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- great axe
	{
		itemId = 3302,
		type = WEAPON_AXE,
		level = 60,
		unproperly = true
	}, -- dragon lance
	{
		itemId = 3301,
		type = WEAPON_SWORD,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- broadsword
	{
		itemId = 3300,
		type = WEAPON_SWORD
	}, -- katana
	{
		itemId = 3299,
		type = WEAPON_SWORD
	}, -- poison dagger
	{
		itemId = 3298,
		type = WEAPON_DISTANCE,
		breakChance = 7
	}, -- throwing knife
	{
		itemId = 3297,
		type = WEAPON_SWORD
	}, -- serpent sword
	{
		itemId = 3296,
		type = WEAPON_SWORD,
		level = 120,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- warlord sword
	{
		itemId = 3295,
		type = WEAPON_SWORD,
		level = 30,
		unproperly = true
	}, -- bright sword
	{
		itemId = 3294,
		type = WEAPON_SWORD
	}, -- short sword
	{
		itemId = 3293,
		type = WEAPON_AXE
	}, -- sickle
	{
		itemId = 3292,
		type = WEAPON_SWORD
	}, -- combat knife
	{
		itemId = 3291,
		type = WEAPON_SWORD
	}, -- knife
	{
		itemId = 3290,
		type = WEAPON_SWORD
	}, -- silver dagger
	{
		itemId = 3289,
		type = WEAPON_CLUB
	}, -- staff
	{
		itemId = 3288,
		type = WEAPON_SWORD,
		level = 80,
		unproperly = true
	}, -- magic sword
	{
		itemId = 3287,
		type = WEAPON_DISTANCE,
		breakChance = 10
	}, -- throwing star
	{
		itemId = 3286,
		type = WEAPON_CLUB
	}, -- mace
	{
		itemId = 3285,
		type = WEAPON_SWORD
	}, -- longsword
	{
		itemId = 3284,
		type = WEAPON_SWORD,
		action = "removecharge",
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- ice rapier
	{
		itemId = 3283,
		type = WEAPON_SWORD
	}, -- carlin sword
	{
		itemId = 3282,
		type = WEAPON_CLUB
	}, -- morning star
	{
		itemId = 3281,
		type = WEAPON_SWORD,
		level = 55,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- giant sword
	{
		itemId = 3280,
		type = WEAPON_SWORD,
		level = 30,
		unproperly = true
	}, -- fire sword
	{
		itemId = 3279,
		type = WEAPON_CLUB,
		level = 50,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- war hammer
	{
		itemId = 3278,
		type = WEAPON_SWORD,
		level = 140,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- magic longsword
	{
		itemId = 3277,
		type = WEAPON_DISTANCE,
		breakChance = 3
	}, -- spear
	{
		itemId = 3276,
		type = WEAPON_AXE
	}, -- hatchet
	{
		itemId = 3275,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- double axe
	{
		itemId = 3274,
		type = WEAPON_AXE
	}, -- axe
	{
		itemId = 3273,
		type = WEAPON_SWORD
	}, -- sabre
	{
		itemId = 3272,
		type = WEAPON_SWORD
	}, -- rapier
	{
		itemId = 3271,
		type = WEAPON_SWORD
	}, -- spike sword
	{
		itemId = 3270,
		type = WEAPON_CLUB
	}, -- club
	{
		itemId = 3269,
		type = WEAPON_AXE,
		level = 25,
		unproperly = true
	}, -- halberd
	{
		itemId = 3268,
		type = WEAPON_AXE
	}, -- hand axe
	{
		itemId = 3267,
		type = WEAPON_SWORD
	}, -- dagger
	{
		itemId = 3266,
		type = WEAPON_AXE,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- battle axe
	{
		itemId = 3265,
		type = WEAPON_SWORD,
		level = 20,
		unproperly = true,
		vocation = {
			{"Knight", true},
			{"Elite Knight"}
		}
	}, -- two handed sword
	{
		itemId = 3264,
		type = WEAPON_SWORD
	}, -- sword
	{
		itemId = 12510,
		type = WEAPON_CLUB
	}, -- giant smithhammer
	{
		itemId = 3075,
		type = WEAPON_WAND,
		wandType = "fire",
		level = 13,
		mana = 3,
		damage = {13, 25},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of dragonbreath
	{
		itemId = 3074,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 6,
		mana = 1,
		damage = {8, 18},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of vortex
	{
		itemId = 3073,
		type = WEAPON_WAND,
		wandType = "energy",
		level = 26,
		mana = 8,
		damage = {37, 53},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of cosmic energy
	{
		itemId = 3072,
		type = WEAPON_WAND,
		wandType = "death",
		level = 19,
		mana = 5,
		damage = {23, 37},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of decay
	{
		itemId = 3071,
		type = WEAPON_WAND,
		wandType = "fire",
		level = 33,
		mana = 8,
		damage = {56, 74},
		vocation = {
			{"Sorcerer", true},
			{"Master Sorcerer"}
		}
	}, -- wand of inferno
	{
		itemId = 3070,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 13,
		mana = 3,
		damage = {13, 25},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- moonlight rod
	{
		itemId = 3069,
		type = WEAPON_WAND,
		wandType = "death",
		level = 19,
		mana = 5,
		damage = {23, 37},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- necrotic rod
	{
		itemId = 3067,
		type = WEAPON_WAND,
		wandType = "ice",
		level = 33,
		mana = 13,
		damage = {56, 74},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- hailstorm rod
	{
		itemId = 3066,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 6,
		mana = 2,
		damage = {8, 18},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- snakebit rod
	{
		itemId = 3065,
		type = WEAPON_WAND,
		wandType = "earth",
		level = 26,
		mana = 8,
		damage = {37, 53},
		vocation = {
			{"Druid", true},
			{"Elder Druid"}
		}
	}, -- terra rod
	{
		itemId = 2992,
		type = WEAPON_DISTANCE,
		action = "removecount"
	}, -- snowball
	{
		itemId = 1781,
		type = WEAPON_DISTANCE,
		breakChance = 3
	} -- small stone
}

for index, weaponTable in ipairs(weapons) do
	local weapon = Weapon(weaponTable.type)
	weapon:id(weaponTable.itemId)

	if(weaponTable.action) then
		weapon:action(weaponTable.action)
	end
	if(weaponTable.breakChance) then
		weapon:breakChance(weaponTable.breakChance)
	end
	if(weaponTable.level) then
		weapon:level(weaponTable.level)
	end
	if(weaponTable.mana) then
		weapon:mana(weaponTable.mana)
	end
	if(weaponTable.unproperly) then
		weapon:wieldUnproperly(weaponTable.unproperly)
	end
	if(weaponTable.damage) then
		weapon:damage(weaponTable.damage[1], weaponTable.damage[2])
	end
	if(weaponTable.wandType) then
		weapon:element(weaponTable.wandType)
	end
	if(weaponTable.vocation) then
		for index, vocation in ipairs(weaponTable.vocation) do
			weapon:vocation(vocation[1], vocation[2] or false, vocation[3] or false)
		end
	end

	weapon:register()
end
