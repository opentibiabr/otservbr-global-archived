local mType = Game.createMonsterType("Nightmarish Dream")
local monster = {}

monster.description = "a Nightmarish Dream"
monster.experience = 900
monster.outfit = {
	lookType = 78,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000
monster.maxHealth = 1000
monster.race = "undead"
monster.corpse = 0
monster.speed = 200
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	runHealth = 500,
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 3, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, type = COMBAT_LIFEDRAIN, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -55, maxDamage = -350, type = COMBAT_DEATHDAMAGE, range = 1, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = -300, Duration = 15000}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, minDamage = 120, maxDamage = 190, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
