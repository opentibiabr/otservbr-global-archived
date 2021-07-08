local mType = Game.createMonsterType("Pirat Artillerist")
local monster = {}

monster.description = "a pirat artillerist"
monster.experience = 2800
monster.outfit = {
	lookType = 1346,
	lookHead = 126,
	lookBody = 94,
	lookLegs = 86,
	lookFeet = 94,
	lookAddons = 2,
	lookMount = 0
}

monster.raceId = 918
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 35,
	Stars = 3,
	Occurrence = 0,
	Locations = "The Wreckoning"
	}

monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 40207
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 50,
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
	{text = "Gimme! Gimme!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = 450, maxDamage = -140},
	{name ="corym vanguard wave", interval = 2000, chance = 10, minDamage = -50, maxDamage = -100, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -40, maxDamage = -70, radius = 4, effect = CONST_ME_MORTAREA, target = true}
}

monster.defenses = {
	defense = 65,
	armor = 65,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false}
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
