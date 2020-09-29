local mType = Game.createMonsterType("Zanakeph")
local monster = {}

monster.description = "Zanakeph"
monster.experience = 9900
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 13000
monster.maxHealth = 13000
monster.race = "undead"
monster.corpse = 6306
monster.speed = 330
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 6
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 700,
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
	{text = "FEEEED MY ETERNAL HUNGER!", yell = true},
	{text = "I SENSE LIFE", yell = true}
}

monster.loot = {
	{id = 6300, chance = 100000},
	{id = 7430, chance = 100000},
	{id = 2148, chance = 100000, maxCount = 100},
	{id = 2033, chance = 100000},
	{id = 2152, chance = 100000, maxCount = 10},
	{id = 11233, chance = 100000, maxCount = 3},
	{id = 9971, chance = 78000},
	{id = 6500, chance = 56000},
	{id = 2476, chance = 47270},
	{id = 2491, chance = 40000},
	{id = 8472, chance = 37000, maxCount = 3},
	{id = 5925, chance = 37000, maxCount = 5},
	{id = 11368, chance = 37000},
	{id = 7591, chance = 35000, maxCount = 4},
	{id = 9810, chance = 35000},
	{id = 2149, chance = 33000, maxCount = 5},
	{id = 2146, chance = 33000, maxCount = 5},
	{id = 7590, chance = 25000, maxCount = 3},
	{id = 2466, chance = 13500},
	{id = 13291, chance = 6780},
	{id = 5741, chance = 5000},
	{id = 8885, chance = 3390},
	{id = 2498, chance = 1690}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 90, attack = 96, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 5, minDamage = -300, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, range = 7, effect = CONST_ME_DRAWBLOOD, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -125, maxDamage = -600, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -100, maxDamage = -390, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -180, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -150, maxDamage = -690, type = COMBAT_EARTHDAMAGE, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -700, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -200, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
