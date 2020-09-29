local mType = Game.createMonsterType("Valkyrie")
local monster = {}

monster.description = "a valkyrie"
monster.experience = 85
monster.outfit = {
	lookType = 139,
	lookHead = 113,
	lookBody = 38,
	lookLegs = 95,
	lookFeet = 96,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 190
monster.maxHealth = 190
monster.race = "blood"
monster.corpse = 20523
monster.speed = 176
monster.summonCost = 450
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Another head for me!", yell = false},
	{text = "Head off!", yell = false},
	{text = "Your head will be mine!", yell = false},
	{text = "Stand still!", yell = false},
	{text = "One more head for me!", yell = false}
}

monster.loot = {
	{id = "spear", chance = 55000, maxCount = 3},
	{id = "gold coin", chance = 32000, maxCount = 12},
	{id = "meat", chance = 30000},
	{id = "chain armor", chance = 10000},
	{id = "red apple", chance = 7500, maxCount = 2},
	{id = "girlish hair decoration", chance = 5900},
	{id = "hunting spear", chance = 5155},
	{id = "protective charm", chance = 3200},
	{id = "protection amulet", chance = 1100},
	{id = "plate armor", chance = 830},
	{id = 2229, chance = 760},
	{id = "health potion", chance = 500},
	{id = "double axe", chance = 430},
	{id = "small diamond", chance = 130}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -70, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -50, type = COMBAT_PHYSICALDAMAGE, range = 5, shootEffect = CONST_ANI_SPEAR, target = false}
}

monster.defenses = {
	defense = 12,
	armor = 12
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 5},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
