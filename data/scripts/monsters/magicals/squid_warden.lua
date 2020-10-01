local mType = Game.createMonsterType("Squid Warden")
local monster = {}

monster.description = "a squid warden"
monster.experience = 15300
monster.outfit = {
	lookType = 1059,
	lookHead = 9,
	lookBody = 21,
	lookLegs = 41,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 16500
monster.maxHealth = 16500
monster.race = "undead"
monster.corpse = 32486
monster.speed = 430
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	{id = "Platinum Coin", chance = 11000, maxCount = 57},
	{id = "Glowing Rune", chance = 800, maxCount = 4},
	{id = "Small Sapphire", chance = 900, maxCount = 4},
	{id = "Frosty Heart", chance = 11000, maxCount = 4},
	{id = 7441, chance = 20000},
	{id = 33315, chance = 20000},
	{id = "Ultimate Health Potion", chance = 10003, maxCount = 4},
	{id = "Ultimate Mana Potion", chance = 10003, maxCount = 4},
	{id = "Ice Rapier", chance = 500},
	{id = "Glacier Mask", chance = 400},
	{id = "Piece of Dead Brain", chance = 10001, maxCount = 4},
	{id = "Crystal Sword", chance = 300},
	{id = "Glacier Robe", chance = 150},
	{id = "Glacier Kilt", chance = 150},
	{id = "Slime Heart", chance = 10002, maxCount = 4}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -680, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -375, type = COMBAT_ICEDAMAGE, length = 3, spread = 2, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -230, maxDamage = -480, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICETORNADO, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 78
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
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
