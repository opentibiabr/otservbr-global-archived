local mType = Game.createMonsterType("Son of Verminor")
local monster = {}

monster.description = "a son of verminor"
monster.experience = 5900
monster.outfit = {
	lookType = 19,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "venom"
monster.corpse = 1490
monster.speed = 240
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Blubb.", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -473, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 450, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = -150, maxDamage = -200, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -350, maxDamage = -390, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -220, maxDamage = -270, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 48,
	{name ="combat", interval = 2000, chance = 20, minDamage = 250, maxDamage = 350, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 5000, chance = 10},
	{name ="outfit", interval = 5000, chance = 10},
	{name ="outfit", interval = 5000, chance = 10},
	{name ="outfit", interval = 5000, chance = 10}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
