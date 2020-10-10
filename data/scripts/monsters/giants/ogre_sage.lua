local mType = Game.createMonsterType("Ogre Sage")
local monster = {}

monster.description = "an ogre sage"
monster.experience = 5500
monster.outfit = {
	lookType = 1214,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4800
monster.maxHealth = 4800
monster.race = "blood"
monster.corpse = 36370
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 70,
	targetDistance = 4,
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

monster.summons = {
	{name = "Young Goanna", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 3},
	{id = "ogre ear stud", chance = 7950},
	{id = "ogre nose ring", chance = 15830},
	{id = "shamanic talisman", chance = 10230},
	{id = "broken shamanic staff", chance = 12500},
	{id = "skull fetish", chance = 9090},
	{id = "terra boots", chance = 4550},
	{id = "bone fetish", chance = 2270},
	{id = "sacred tree amulet", chance = 1140}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 24, minDamage = -50, maxDamage = -130, type = COMBAT_LIFEDRAIN, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = true},
	{name ="combat", interval = 2000, chance = 16, minDamage = -100, maxDamage = -165, type = COMBAT_ENERGYDAMAGE, range = 4, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -115, maxDamage = -200, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 13, minDamage = -200, maxDamage = -300, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_HITBYPOISON, target = true}
}

monster.defenses = {
	defense = 93,
	armor = 93,
	{name ="speed", interval = 2000, chance = 15, speedChange = 300, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -30},
	{type = COMBAT_EARTHDAMAGE, percent = 75},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
