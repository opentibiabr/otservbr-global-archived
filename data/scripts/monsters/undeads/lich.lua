local mType = Game.createMonsterType("Lich")
local monster = {}

monster.description = "a lich"
monster.experience = 900
monster.outfit = {
	lookType = 99,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 880
monster.maxHealth = 880
monster.race = "undead"
monster.corpse = 6028
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Bonebeast", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Doomed be the living!", yell = false},
	{text = "Death awaits all!", yell = false},
	{text = "Thy living flesh offends me!", yell = false},
	{text = "Death and Decay!", yell = false},
	{text = "You will endure agony beyond thy death!", yell = false},
	{text = "Pain sweet pain!", yell = false},
	{text = "Come to me my children!", yell = false}
}

monster.loot = {
	{id = "white pearl", chance = 5000},
	{id = "black pearl", chance = 5960, maxCount = 3},
	{id = "gold coin", chance = 100000, maxCount = 139},
	{id = "small emerald", chance = 2230, maxCount = 3},
	{id = "platinum coin", chance = 19720},
	{id = "yellow gem", chance = 690},
	{id = "platinum amulet", chance = 450},
	{id = 2175, chance = 10000},
	{id = "mind stone", chance = 350},
	{id = "ring of healing", chance = 1540},
	{id = "skull staff", chance = 550},
	{id = "strange helmet", chance = 740},
	{id = "ancient shield", chance = 2422},
	{id = "castle shield", chance = 350},
	{id = "blue robe", chance = 150},
	{id = "strong mana potion", chance = 7500},
	{id = "lightning boots", chance = 200},
	{id = "small topaz", chance = 2430, maxCount = 3},
	{id = "maxilla maximus", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -75, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -140, maxDamage = -190, type = COMBAT_LIFEDRAIN, length = 7, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -300, maxDamage = -400, length = 7, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -245, type = COMBAT_LIFEDRAIN, range = 1, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -300, Duration = 30000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -195, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, minDamage = 80, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
