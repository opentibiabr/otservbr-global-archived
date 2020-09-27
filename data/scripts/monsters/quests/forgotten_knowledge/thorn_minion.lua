local mType = Game.createMonsterType("Thorn Minion")
local monster = {}

monster.description = "a thorn minion"
monster.experience = 1600
monster.outfit = {
	lookType = 717,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3500
monster.maxHealth = 3500
monster.race = "venom"
monster.corpse = 0
monster.speed = 150
monster.summonCost = 290
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -60, maxDamage = -150, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 500, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -195, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -800, Duration = 30000},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -280, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -400, type = COMBAT_DEATHDAMAGE, length = 4, spread = 3, effect = CONST_ME_CARNIPHILA, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 2000, chance = 30, SpeedChange = 250, Duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -12},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 1},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
