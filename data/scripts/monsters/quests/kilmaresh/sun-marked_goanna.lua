local mType = Game.createMonsterType("Sun-Marked Goanna")
local monster = {}

monster.description = "a sun-marked goanna"
monster.experience = 7600
monster.outfit = {
	lookType = 1195,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7800
monster.maxHealth = 7800
monster.race = "blood"
monster.corpse = 36240
monster.speed = 190
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
	runHealth = 10,
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
	{id = "Goanna Hide with Sun Symbol", chance = 100000},
	{id = "Platinum Coin", chance = 100000, maxCount = 3},
	{id = "Envenomed Arrow", chance = 50000, maxCount = 29},
	{id = "Poison Dagger", chance = 50000},
	{id = "Scared Frog", chance = 50000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -350, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 19, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -250, maxDamage = -380, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -450, maxDamage = -550, type = COMBAT_EARTHDAMAGE, range = 3, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -210, maxDamage = -300, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 84,
	armor = 84,
	{name ="speed", interval = 2000, chance = 5, SpeedChange = 500, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 75},
	{type = COMBAT_FIREDAMAGE, percent = 0},
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
