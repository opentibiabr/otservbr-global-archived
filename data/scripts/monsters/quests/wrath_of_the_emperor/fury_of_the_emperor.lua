local mType = Game.createMonsterType("Fury Of The Emperor")
local monster = {}

monster.description = "a fury of the emperor"
monster.experience = 550
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 51000
monster.maxHealth = 51000
monster.race = "undead"
monster.corpse = 12317
monster.speed = 450
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 366,
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
	{name = "Draken Warmaster", chance = 10, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 85, attack = 145, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 17, minDamage = -250, maxDamage = -450, type = COMBAT_PHYSICALDAMAGE, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 10, minDamage = -100, maxDamage = -700, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 10, SpeedChange = -600, Duration = 20000},
	{name ="combat", interval = 2000, chance = 21, minDamage = -400, maxDamage = -650, type = COMBAT_LIFEDRAIN, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 55,
	armor = 65
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
