local mType = Game.createMonsterType("Spiky Carnivor")
local monster = {}

monster.description = "a Spiky Carnivor"
monster.experience = 1650
monster.outfit = {
	lookType = 1133,
	lookHead = 85,
	lookBody = 39,
	lookLegs = 86,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1722
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Carnivora's Rocks."
	}

monster.health = 2800
monster.maxHealth = 2800
monster.race = "blood"
monster.corpse = 34737
monster.speed = 320
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
}

monster.loot = {
	{id = "Platinum Coin", chance = 100000, maxCount = 6},
	{id = "Green Glass Plate", chance = 12000, maxCount = 17},
	{id = "Blue Crystal Splinter", chance = 11500},
	{id = "Brown Crystal Splinter", chance = 11000},
	{id = "Dark Armor", chance = 10000},
	{id = "Guardian Shield", chance = 9000},
	{id = "Rainbow Quartz", chance = 8500},
	{id = "Blue Robe", chance = 8000},
	{id = "Glacier Amulet", chance = 7500},
	{id = "Lightning Pendant", chance = 2200},
	{id = "Prismatic Quartz", chance = 6500},
	{id = "Talon", chance = 6000},
	{id = "Terra Amulet", chance = 5500},
	{id = "Warrior Helmet", chance = 4000},
	{id = "Shockwave Amulet", chance = 2550},
	{id = "Terra Mantle", chance = 4050},
	{id = "Buckle", chance = 250},
	{id = "Doublet", chance = 250}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -230, maxDamage = -380, radius = 4, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 71,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.reflects = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
