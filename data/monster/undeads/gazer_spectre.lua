local mType = Game.createMonsterType("Gazer Spectre")
local monster = {}

monster.description = "a Gazer Spectre"
monster.experience = 4200
monster.outfit = {
	lookType = 1122,
	lookHead = 94,
	lookBody = 20,
	lookLegs = 77,
	lookFeet = 20,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1725
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Haunted Temple, Buried Cathedral."
	}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 34805
monster.speed = 390
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{text = "Deathhh... is... a.... doooor!!", yell = false},
	{text = "Tiiimeee... is... a... windowww!", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "Brown Crystal Splinter", chance = 900},
	{id = "Red Crystal Fragment", chance = 8500},
	{id = "Small Enchanted Ruby", chance = 7500},
	{id = "Small Diamond", chance = 6000},
	{id = "Small Sapphire", chance = 5000},
	{id = "Red Gem", chance = 4000},
	{id = "Yellow Gem", chance = 3000},
	{id = 33938, chance = 1100},
	{id = "Wand of Draconia", chance = 3500},
	{id = "Wand of Inferno", chance = 1100},
	{id = 34722, chance = 700},
	{id = "Magma Coat", chance = 900},
	{id = "Prismatic Quartz", chance = 1500},
	{id = "Small Enchanted Emerald", chance = 800},
	{id = "Onyx Chip", chance = 770},
	{id = "Hexagonal Ruby", chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -480},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -350, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -350, radius = 3, effect = CONST_ME_FIREATTACK, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -250, maxDamage = -430, length = 4, spread = 3, effect = CONST_ME_YELLOWENERGY, target = false}
}

monster.defenses = {
	defense = 78,
	armor = 78,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.reflects = {
	{type = COMBAT_FIREDAMAGE, percent = 133}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 85},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -30},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
