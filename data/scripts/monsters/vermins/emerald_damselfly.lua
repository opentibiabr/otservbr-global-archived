local mType = Game.createMonsterType("Emerald Damselfly")
local monster = {}

monster.description = "an emerald damselfly"
monster.experience = 35
monster.outfit = {
	lookType = 528,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 90
monster.maxHealth = 90
monster.race = "venom"
monster.corpse = 19706
monster.speed = 200
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
	illusionable = false,
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
	{text = "Bzzzzz!", yell = false}
}

monster.loot = {
	{id = 2120, chance = 4300},
	{id = "gold coin", chance = 90000, maxCount = 18},
	{id = "arrow", chance = 7570, maxCount = 5},
	{id = "health potion", chance = 3580},
	{id = "mana potion", chance = 3550},
	{id = "damselfly wing", chance = 11830},
	{id = "damselfly eye", chance = 9970}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -4, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 10, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -12, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, target = false}
}

monster.defenses = {
	defense = 10,
	armor = 10,
	{name ="combat", interval = 2000, chance = 10, minDamage = 4, maxDamage = 10, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
