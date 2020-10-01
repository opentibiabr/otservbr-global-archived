local mType = Game.createMonsterType("Dire Penguin")
local monster = {}

monster.description = "a dire penguin"
monster.experience = 119
monster.outfit = {
	lookType = 250,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 173
monster.maxHealth = 173
monster.race = "blood"
monster.corpse = 7334
monster.speed = 174
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{text = "Grrrrrr", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 78260, maxCount = 10},
	{id = "dragon hammer", chance = 200},
	{id = 2667, chance = 13040, maxCount = 4},
	{id = "rainbow trout", chance = 8000},
	{id = "green perch", chance = 7000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -35, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = -600, Duration = 9000}
}

monster.defenses = {
	defense = 16,
	armor = 16,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 310, Duration = 3000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
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
