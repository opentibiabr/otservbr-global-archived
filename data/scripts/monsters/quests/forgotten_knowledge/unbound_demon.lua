local mType = Game.createMonsterType("Unbound Demon")
local monster = {}

monster.description = "an unbound demon"
monster.experience = 5000
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "fire"
monster.corpse = 5995
monster.speed = 256
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 70, attack = 130, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 13, minDamage = -60, maxDamage = -120, type = COMBAT_MANADRAIN, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 33, minDamage = -150, maxDamage = -250, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 7, minDamage = -210, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, range = 1, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="firefield", interval = 2000, chance = 14, range = 7, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 10, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -480, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 40,
	{name ="combat", interval = 2000, chance = 14, minDamage = 150, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 8, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = 388, Duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
