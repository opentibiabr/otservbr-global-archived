local mType = Game.createMonsterType("Hand of Cursed Fate")
local monster = {}

monster.description = "a hand of cursed fate"
monster.experience = 5000
monster.outfit = {
	lookType = 230,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 281
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Pits of Inferno, The Battlefield, The Arcanum, The Blood Halls and The Crystal Caves."
	}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "blood"
monster.corpse = 6312
monster.speed = 260
monster.manaCost = 0
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 20,
	targetDistance = 1,
	runHealth = 3500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
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
	{id = "emerald bangle", chance = 3500},
	{id = "small sapphire", chance = 11000, maxCount = 4},
	{id = "gold coin", chance = 60000, maxCount = 100},
	{id = "gold coin", chance = 60000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 67},
	{id = "platinum coin", chance = 100000, maxCount = 7},
	{id = "violet gem", chance = 700},
	{id = "yellow gem", chance = 5940},
	{id = "energy ring", chance = 3150},
	{id = "platinum amulet", chance = 1005},
	{id = "mind stone", chance = 9090},
	{id = "wand of inferno", chance = 5590},
	{id = "boots of haste", chance = 540},
	{id = "protection amulet", chance = 8740},
	{id = "sudden death rune", chance = 4200, maxCount = 8},
	{id = "skull staff", chance = 700},
	{id = "knight armor", chance = 4550},
	{id = "crown armor", chance = 1400},
	{id = "mysterious voodoo skull", chance = 247},
	{id = "soul orb", chance = 31111},
	{id = 6300, chance = 1750},
	{id = "demonic essence", chance = 12000},
	{id = "concentrated demonic blood", chance = 30000, maxCount = 4},
	{id = "assassin star", chance = 7692, maxCount = 5},
	{id = "abyss hammer", chance = 495},
	{id = "great mana potion", chance = 19990, maxCount = 2},
	{id = "ultimate health potion", chance = 18000},
	{id = "gold ingot", chance = 700}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520, condition = {type = CONDITION_POISON, totalDamage = 380, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -920, range = 1, target = false},
	{name ="drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 3000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -220, maxDamage = -880, range = 1, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="speed", interval = 2000, chance = 15, speedChange = 1000, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
	{name ="invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
