local mType = Game.createMonsterType("Quara Pincher")
local monster = {}

monster.description = "a quara pincher"
monster.experience = 1200
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 6063
monster.speed = 396
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
	canPushCreatures = false,
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
	{text = "Clank! Clank!", yell = false},
	{text = "Clap!", yell = false},
	{text = "Crrrk! Crrrk!", yell = false}
}

monster.loot = {
	{id = "small ruby", chance = 7761, maxCount = 2},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 49},
	{id = "platinum coin", chance = 40000},
	{id = "halberd", chance = 6861},
	{id = "warrior helmet", chance = 1350},
	{id = "crown armor", chance = 350},
	{id = "shrimp", chance = 5245, maxCount = 5},
	{id = "fish fin", chance = 1600},
	{id = "great health potion", chance = 10630},
	{id = "glacier robe", chance = 140},
	{id = "quara pincers", chance = 14285},
	{id = "giant shrimp", chance = 80}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -342, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -600, Duration = 3000}
}

monster.defenses = {
	defense = 50,
	armor = 50
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
