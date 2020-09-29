local mType = Game.createMonsterType("Renegade Quara Pincher")
local monster = {}

monster.description = "a renegade quara pincher"
monster.experience = 2200
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2800
monster.maxHealth = 2800
monster.race = "blood"
monster.corpse = 6063
monster.speed = 396
monster.summonCost = 330
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	{id = 2152, chance = 100000, maxCount = 5},
	{id = 12446, chance = 20000},
	{id = 2145, chance = 11111, maxCount = 2},
	{id = 7591, chance = 10000, maxCount = 2},
	{id = 7590, chance = 10000, maxCount = 2},
	{id = 2147, chance = 9090, maxCount = 2},
	{id = 2670, chance = 7692},
	{id = 15649, chance = 5000, maxCount = 4},
	{id = 2156, chance = 5000},
	{id = 2178, chance = 4166},
	{id = 5895, chance = 1666},
	{id = 2475, chance = 840},
	{id = 2169, chance = 840},
	{id = 2487, chance = 840}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 90, attack = 60, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -300, Duration = 3000}
}

monster.defenses = {
	defense = 50,
	armor = 50
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = -1},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
