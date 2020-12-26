local mType = Game.createMonsterType("Orc Leader")
local monster = {}

monster.description = "an orc leader"
monster.experience = 270
monster.outfit = {
	lookType = 59,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 59
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Orc Fort, Edron Orc Cave, South of the temple in PoH, Maze of Lost Souls, Cyclopolis, Zao Orc Land."
	}

monster.health = 450
monster.maxHealth = 450
monster.race = "blood"
monster.corpse = 6001
monster.speed = 230
monster.manaCost = 640
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 15,
	damage = 15,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
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
	{text = "Ulderek futgyr human!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 28000, maxCount = 35},
	{id = "sword ring", chance = 3920},
	{id = "longsword", chance = 2800},
	{id = "throwing knife", chance = 9950, maxCount = 4},
	{id = "broadsword", chance = 610},
	{id = 2419, chance = 1860},
	{id = "plate armor", chance = 1650},
	{id = "warrior helmet", chance = 180},
	{id = "brass legs", chance = 3100},
	{id = "plate shield", chance = 1650},
	{id = "plate legs", chance = 440},
	{id = 2667, chance = 29400},
	{id = "brown mushroom", chance = 9650},
	{id = "royal spear", chance = 2400},
	{id = "health potion", chance = 550},
	{id = "orc tooth", chance = 1030},
	{id = "orc leather", chance = 19510},
	{id = "skull belt", chance = 2008}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -185},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -70, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
