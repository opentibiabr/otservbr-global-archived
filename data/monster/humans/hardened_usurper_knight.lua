local mType = Game.createMonsterType("Hardened Usurper Knight")
local monster = {}

monster.description = "a hardened usurper knight"
monster.experience = 0
monster.outfit = {
	lookType = 1317,
	lookHead = 57,
	lookBody = 38,
	lookLegs = 76,
	lookFeet = 76,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 8200
monster.maxHealth = 8200
monster.race = "blood"
monster.corpse = 0
monster.speed = 170
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 0
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 28, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -500, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -250, maxDamage = -350, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -500, radius = 4, effect = CONST_ME_BIGCLOUDS, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 35},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
