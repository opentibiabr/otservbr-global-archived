local mType = Game.createMonsterType("Dragon Essence")
local monster = {}

monster.description = "a dragon essence"
monster.experience = 0
monster.outfit = {
	lookType = 248,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "undead"
monster.corpse = 0
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 250,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.events = {"Dragon Essence Death"}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 80, attack = 110, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 18, minDamage = -850, maxDamage = -1250, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -450, maxDamage = -720, type = COMBAT_FIREDAMAGE, range = 7, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -750, maxDamage = -880, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 2000, chance = 16, minDamage = 150, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 262, duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
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
