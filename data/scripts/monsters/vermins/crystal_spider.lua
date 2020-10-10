local mType = Game.createMonsterType("Crystal Spider")
local monster = {}

monster.description = "a crystal spider"
monster.experience = 900
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1250
monster.maxHealth = 1250
monster.race = "venom"
monster.corpse = 7344
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
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
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Screeech!", yell = false}
}

monster.loot = {
	{id = 2124, chance = 1560},
	{id = "crystal necklace", chance = 1640},
	{id = "gold coin", chance = 99998, maxCount = 100},
	{id = "gold coin", chance = 99998, maxCount = 92},
	{id = 2169, chance = 1480},
	{id = "platinum amulet", chance = 130},
	{id = "steel helmet", chance = 5200},
	{id = "plate armor", chance = 9993},
	{id = "knight armor", chance = 560},
	{id = "knight legs", chance = 760},
	{id = "jewelled backpack", chance = 80},
	{id = "spider silk", chance = 2010},
	{id = "shard", chance = 740},
	{id = "sniper arrow", chance = 5840, maxCount = 6},
	{id = "sapphire hammer", chance = 140},
	{id = "crystal sword", chance = 2490},
	{id = "strong mana potion", chance = 14950},
	{id = "glacier mask", chance = 670}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 160, interval = 4000}},
	{name ="speed", interval = 2000, chance = 15, speedChange = -800, duration = 15000},
	{name ="combat", interval = 2000, chance = 15, minDamage = -50, maxDamage = -100, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, duration = 10000}
}

monster.defenses = {
	defense = 0,
	armor = 43,
	{name ="speed", interval = 2000, chance = 15, speedChange = 250, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
