local mType = Game.createMonsterType("Werebear")
local monster = {}

monster.description = "a werebear"
monster.experience = 2100
monster.outfit = {
	lookType = 720,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2400
monster.maxHealth = 2400
monster.race = "blood"
monster.corpse = 24666
monster.speed = 220
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 275,
	healthHidden = false,
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
	{text = "GROOOWL", yell = false},
	{text = "GRRR", yell = false}
}

monster.loot = {
	{id = 2148, chance = 97000, maxCount = 242},
	{id = 2152, chance = 18200, maxCount = 5},
	{id = 7591, chance = 1200, maxCount = 2},
	{id = 8473, chance = 2210},
	{id = 7590, chance = 1200},
	{id = 5896, chance = 800},
	{id = 2671, chance = 1900, maxCount = 2},
	{id = 5902, chance = 450},
	{id = 24713, chance = 580},
	{id = 7439, chance = 800},
	{id = 24712, chance = 560},
	{id = 2197, chance = 430},
	{id = 7419, chance = 120},
	{id = 24741, chance = 300},
	{id = 7432, chance = 400},
	{id = 24716, chance = 100},
	{id = 7383, chance = 200},
	{id = 7452, chance = 300},
	{id = 2169, chance = 400},
	{id = 24759, chance = 200},
	{id = 24739, chance = 200}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 50, maxDamage = -485, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 4000, chance = 20, speedChange = -100, duration = 10000},
	{name ="combat", interval = 2000, chance = 15, minDamage = -65, maxDamage = -335, type = COMBAT_LIFEDRAIN, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 25, minDamage = 50, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
