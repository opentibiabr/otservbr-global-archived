local mType = Game.createMonsterType("Manticore")
local monster = {}

monster.description = "a manticore"
monster.experience = 5100
monster.outfit = {
	lookType = 1189,
	lookHead = 116,
	lookBody = 97,
	lookLegs = 113,
	lookFeet = 20,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6700
monster.maxHealth = 6700
monster.race = "blood"
monster.corpse = 36225
monster.speed = 300
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
	targetDistance = 4,
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
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 3},
	{id = "flaming arrow", chance = 4090, maxCount = 11},
	{id = "royal star", chance = 1120, maxCount = 4},
	{id = "manticore tail", chance = 8550},
	{id = "manticore ear", chance = 6690},
	{id = "magma legs", chance = 740},
	{id = "magma monocle", chance = 1860},
	{id = "magma boots", chance = 370},
	{id = "magma coat", chance = 2970},
	{id = "wand of everblazing", chance = 1120},
	{id = "wand of dragonbreath", chance = 740},
	{id = "wand of draconia", chance = 370}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 13, minDamage = -350, maxDamage = -450, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 4000, chance = 15, minDamage = -300, maxDamage = -400, shootEffect = CONST_ANI_ENVENOMEDARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 22, minDamage = -300, maxDamage = -500, type = COMBAT_FIREDAMAGE, range = 4, shootEffect = CONST_ANI_BURSTARROW, target = true}
}

monster.defenses = {
	defense = 78,
	armor = 78
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
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
