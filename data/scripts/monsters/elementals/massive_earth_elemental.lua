local mType = Game.createMonsterType("Massive Earth Elemental")
local monster = {}

monster.description = "a massive earth elemental"
monster.experience = 950
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1330
monster.maxHealth = 1330
monster.race = "undead"
monster.corpse = 8933
monster.speed = 370
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
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
}

monster.loot = {
	{id = "small stone", chance = 25280, maxCount = 10},
	{id = "gold coin", chance = 32000, maxCount = 100},
	{id = "gold coin", chance = 32000, maxCount = 100},
	{id = "gold coin", chance = 32000, maxCount = 41},
	{id = "stone skin amulet", chance = 980},
	{id = "protection amulet", chance = 1580},
	{id = "dwarven ring", chance = 2790},
	{id = "diamond sceptre", chance = 150},
	{id = "terra amulet", chance = 500},
	{id = 9809, chance = 3300},
	{id = "small topaz", chance = 5280, maxCount = 2},
	{id = "lump of earth", chance = 40680},
	{id = "clay lump", chance = 480},
	{id = 13757, chance = 430}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -110, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -99, maxDamage = -145, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -95, maxDamage = -169, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_POFF, target = true},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -300, maxDamage = -320, length = 6, spread = 3, effect = CONST_ME_BIGPLANTS, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -200, maxDamage = -220, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -330, Duration = 5000}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 5, minDamage = 150, maxDamage = 180, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 45}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
