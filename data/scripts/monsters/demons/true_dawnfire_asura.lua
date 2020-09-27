local mType = Game.createMonsterType("True Dawnfire Asura")
local monster = {}

monster.description = "a true dawnfire asura"
monster.experience = 7475
monster.outfit = {
	lookType = 1068,
	lookHead = 79,
	lookBody = 94,
	lookLegs = 120,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 33404
monster.speed = 360
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
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

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 2148, chance = 97000, maxCount = 242},
	{id = 2152, chance = 18200, maxCount = 6},
	{id = 6558, chance = 2000},
	{id = 7590, chance = 2000},
	{id = 2150, chance = 210, maxCount = 3},
	{id = 2145, chance = 300, maxCount = 3},
	{id = 2149, chance = 300, maxCount = 3},
	{id = 2147, chance = 350, maxCount = 3},
	{id = 9970, chance = 280, maxCount = 3},
	{id = 2158, chance = 400},
	{id = 6300, chance = 460},
	{id = 6500, chance = 430},
	{id = 8871, chance = 520},
	{id = 24630, chance = 800},
	{id = 7899, chance = 400},
	{id = 2194, chance = 400},
	{id = 2663, chance = 400},
	{id = 24637, chance = 400},
	{id = 24631, chance = 600},
	{id = 5911, chance = 300},
	{id = 2133, chance = 400},
	{id = 5944, chance = 400},
	{id = 8902, chance = 400},
	{id = 2187, chance = 400}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -269, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -100, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -50, maxDamage = -200, type = COMBAT_LIFEDRAIN, length = 4, spread = 2, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1000, chance = 15, minDamage = 120, maxDamage = 450, type = COMBAT_FIREDAMAGE, length = 1, spread = 0, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1000, chance = 10, minDamage = 150, maxDamage = 350, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = 100, maxDamage = 300, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_BLACKSMOKE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -100, Duration = 30000}
}

monster.defenses = {
	defense = 55,
	armor = 77,
	{name ="combat", interval = 2000, chance = 15, minDamage = 50, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 320, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
