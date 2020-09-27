local mType = Game.createMonsterType("Phantasm")
local monster = {}

monster.description = "a phantasm"
monster.experience = 4400
monster.outfit = {
	lookType = 241,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3950
monster.maxHealth = 3950
monster.race = "undead"
monster.corpse = 6344
monster.speed = 340
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
	{text = "Oh my, you forgot to put your pants on!", yell = false},
	{text = "Weeheeheeheehee!", yell = false},
	{text = "Its nothing but a dream.", yell = false},
	{text = "Dream a little dream with me!", yell = false},
	{text = "Give in.", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -50, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -50, maxDamage = -80, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -5, maxDamage = -80, type = COMBAT_MANADRAIN, effect = CONST_ME_YELLOW_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 10, target = false},
	{name ="drunk", interval = 2000, chance = 5, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 0,
	{name ="combat", interval = 2000, chance = 30, minDamage = 40, maxDamage = 65, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = 500, Duration = 6000},
	{name ="invisible", interval = 2000, chance = 25, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
