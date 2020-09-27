local mType = Game.createMonsterType("Ethershreck")
local monster = {}

monster.description = "Ethershreck"
monster.experience = 5600
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9500
monster.maxHealth = 9500
monster.race = "undead"
monster.corpse = 11362
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetdistance = 1,
	runHealth = 366,
	isHealthHidden = false,
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
	{text = "EMBRACE MY GIFTS!", yell = true}
}

monster.loot = {
	{id = 11366, chance = 100000},
	{id = 2148, chance = 100000, maxCount = 230},
	{id = 2152, chance = 100000, maxCount = 15},
	{id = 11367, chance = 100000},
	{id = 6500, chance = 97000},
	{id = 7632, chance = 45000},
	{id = 7633, chance = 45000},
	{id = 9970, chance = 97000, maxCount = 10},
	{id = 11323, chance = 76000},
	{id = 8473, chance = 60000},
	{id = 11227, chance = 45000},
	{id = 11368, chance = 37000},
	{id = 7591, chance = 34000, maxCount = 3},
	{id = 11303, chance = 30000},
	{id = 7590, chance = 26000, maxCount = 3},
	{id = 8472, chance = 26000, maxCount = 3},
	{id = 11355, chance = 21000},
	{id = 11304, chance = 15000},
	{id = 11301, chance = 13000},
	{id = 11302, chance = 13000},
	{id = 11306, chance = 10000},
	{id = 11305, chance = 8700},
	{id = 13938, chance = 2170}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 80, attack = 100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -80, maxDamage = -230, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 10, range = 7, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -920, maxDamage = -1260, range = 7, ShootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -90, maxDamage = -350, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 13, minDamage = -70, maxDamage = -180, type = COMBAT_DEATH, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 45,
	{name ="combat", interval = 2000, chance = 9, minDamage = 70, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
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
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
