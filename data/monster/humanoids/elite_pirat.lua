local mType = Game.createMonsterType("Elite Pirat")
local monster = {}

monster.description = "a Elite Pirat"
monster.experience = 18000
monster.outfit = {
	lookType = 534,
	lookHead = 79,
	lookBody = 79,
	lookLegs = 94,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 917
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "The Wreckoning"
	}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "blood"
monster.corpse = 19726
monster.speed = 200
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = true,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Squeak! Squeak!", yell = false},
	{text = "sniff", yell = false}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 120},
	{id = 8472, chance = 100000, maxCount = 2},
	{id = 40407, chance = 10000},
	{id = 7886, chance = 4761},
	{id = 7886, chance = 4761},
	{id = 20092, chance = 5000},
	{id = 20093, chance = 5000},
	{id = 20097, chance = 16666},
	{id = 20098, chance = 3846},
	{id = 40431, chance = 11111},
	{id = 20100, chance = 14285},
	{id = 20101, chance = 14285},
	{id = 7893, chance = 1612},
	{id = 7891, chance = 3225}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 400, maxDamage = -210},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 80, maxDamage = -110, range = 7, shootEffect = CONST_ANI_WHIRLWINDCLUB, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -110},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = -130},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 30},
	{type = COMBAT_MANADRAIN, percent = 30},
	{type = COMBAT_DROWNDAMAGE, percent = 30},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
