local mType = Game.createMonsterType("Fetter")
local monster = {}

monster.description = "a Fetter"
monster.experience = 0
monster.outfit = {
	lookType = 235,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 13500
monster.maxHealth = 13500
monster.race = "undead"
monster.corpse = 0
monster.speed = 280
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -308, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 300, interval = 4000}},
	{name ="drunk", interval = 2000, chance = 15, effect = CONST_ME_SOUND_PURPLE, target = false},
	{name ="combat", interval = 2000, chance = 15, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -600, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -300, maxDamage = -850, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 20, minDamage = 100, maxDamage = 700, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 290, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 90},
	{type = COMBAT_ENERGYDAMAGE, percent = -8},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -8},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 1},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
