local mType = Game.createMonsterType("Tanjis")
local monster = {}

monster.description = "Tanjis"
monster.experience = 15000
monster.outfit = {
	lookType = 446,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 15228
monster.speed = 560
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50
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
	pushable = true,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 0,
	runHealth = 60,
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
	{text = "JAU QJELL, JAKHN JEH KENH!!", yell = false}
}

monster.loot = {
	{id = 15409, chance = 5000},
	{id = 15414, chance = 20000},
	{id = 15413, chance = 2000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2500, chance = 20, minDamage = -200, maxDamage = -600, type = COMBAT_MANADRAIN, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_CARNIPHILA, target = true},
	{name ="combat", interval = 3500, chance = 27, minDamage = -200, maxDamage = -400, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 3500, chance = 15, minDamage = -100, maxDamage = -400, type = COMBAT_ICEDAMAGE, range = 1, target = true},
	{name ="combat", interval = 2300, chance = 11, minDamage = -200, maxDamage = -500, type = COMBAT_DROWNDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_WATERSPLASH, target = true},
	{name ="combat", interval = 2300, chance = 14, minDamage = -200, maxDamage = -600, type = COMBAT_MANADRAIN, range = 7, effect = CONST_ME_BUBBLES, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true},
	{name ="combat", interval = 1200, chance = 7, minDamage = -300, maxDamage = -800, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 14, minDamage = -200, maxDamage = -500, type = COMBAT_ENERGYDAMAGE, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="speed", interval = 2150, chance = 16, SpeedChange = -600, Duration = 15000}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 3000, chance = 40, minDamage = 800, maxDamage = 1100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
