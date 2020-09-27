local mType = Game.createMonsterType("Bandit")
local monster = {}

monster.description = "a bandit"
monster.experience = 65
monster.outfit = {
	lookType = 129,
	lookHead = 58,
	lookBody = 59,
	lookLegs = 45,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 245
monster.maxHealth = 245
monster.race = "blood"
monster.corpse = 20331
monster.speed = 180
monster.summonCost = 450
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 25,
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
	{text = "Your money or your life!", yell = false},
	{text = "Hand me your purse!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 49000, maxCount = 30},
	{id = "axe", chance = 29900},
	{id = "mace", chance = 10100},
	{id = "chain helmet", chance = 5000},
	{id = "iron helmet", chance = 520},
	{id = "brass armor", chance = 2500},
	{id = "brass shield", chance = 16800},
	{id = "leather legs", chance = 15500},
	{id = "tomato", chance = 7630, maxCount = 2}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -45, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
