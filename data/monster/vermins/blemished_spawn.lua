local mType = Game.createMonsterType("Blemished Spawn")
local monster = {}

monster.description = "You see a blemished spawn"
monster.experience = 5300
monster.outfit = {
	lookType = 1401,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1546
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Antrum of the Fallen."
}

monster.health = 9000
monster.maxHealth = 9000
monster.race = "blood"
monster.corpse = 41553
monster.speed = 140
monster.manaCost = 0
monster.maxSummons = 0

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
	runHealth = 0,
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
	{text = "tzzzz tzzzz tzzzz!", yell = false},
	{text = "sloap sloap sloap!", yell = false}
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 16},
	{name = "Hailstorm Rod", chance = 10710},
	{name = "Terra Rod", chance = 10710},
	{name = "Blemished Spawn Head", chance = 7140},
	{name = "Diamond Sceptre", chance = 7140},
	{name = "Fur Armor", chance = 7140},
	{name = "Blemished Spawn Abdomen", chance = 3570},
	{name = "Blue Crystal Shard", chance = 3570},
	{name = "Cyan Crystal Fragment", chance = 3570},
	{name = "Dragonbone Staff", chance = 3570},
	{name = "Giant Shimmering Pearl", chance = 3570},
	{name = "Northwind Rod", chance = 3570},
	{name = "Springsprout Rod", chance = 3570},
    {name = "Wand of Starstorm", chance = 3570},
    {name = "Yellow Gem", chance = 3570}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -510, maxDamage = -610, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 12, minDamage = -700, maxDamage = -750, range = 7, shootEffect = CONST_ANI_POISON, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 61
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -101},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 99}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
