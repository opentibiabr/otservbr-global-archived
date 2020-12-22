local mType = Game.createMonsterType("Spitter")
local monster = {}

monster.description = "a spitter"
monster.experience = 1100
monster.outfit = {
	lookType = 461,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 791
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "The Hive, Hive Outpost."
		}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 15392
monster.speed = 270
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 0,
	runHealth = 40,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
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
	{text = "Spotz!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "small amethyst", chance = 8000, maxCount = 2},
	{id = "platinum coin", chance = 75250},
	{id = "green gem", chance = 210},
	{id = 2169, chance = 2400},
	{id = "platinum amulet", chance = 260},
	{id = "crusader helmet", chance = 230},
	{id = "brown mushroom", chance = 7500, maxCount = 3},
	{id = "mastermind potion", chance = 310},
	{id = "crystal sword", chance = 2000},
	{id = "great mana potion", chance = 8000},
	{id = "great health potion", chance = 5000},
	{id = "spitter nose", chance = 18000},
	{id = "compound eye", chance = 15000},
	{id = "calopteryx cape", chance = 240},
	{id = "grasshopper legs", chance = 130}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150, condition = {type = CONDITION_POISON, totalDamage = 240, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -160, range = 7, radius = 3, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="speed", interval = 2000, chance = 15, speedChange = -600, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 15000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 2000, chance = 15, speedChange = 400, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
