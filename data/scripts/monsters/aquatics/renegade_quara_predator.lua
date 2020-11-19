local mType = Game.createMonsterType("Renegade Quara Predator")
local monster = {}

monster.description = "a renegade quara predator"
monster.experience = 2700
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3250
monster.maxHealth = 3250
monster.race = "blood"
monster.corpse = 6067
monster.speed = 450
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
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
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
	{id = 2152, chance = 100000, maxCount = 4},
	{id = 7378, chance = 50000, maxCount = 7},
	{id = 7368, chance = 50000, maxCount = 10},
	{id = 12447, chance = 10000},
	{id = 2145, chance = 8333, maxCount = 2},
	{id = 7591, chance = 8333, maxCount = 2},
	{id = 2178, chance = 7692},
	{id = 2670, chance = 4761},
	{id = 5895, chance = 3703},
	{id = 7383, chance = 2777},
	{id = 7897, chance = 1851},
	{id = 18413, chance = 934}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 82, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="speed", interval = 2000, chance = 15, speedChange = 30, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 5000},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
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
