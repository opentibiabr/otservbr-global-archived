local mType = Game.createMonsterType("Usurper Knight")
local monster = {}

monster.description = "a usurper knight"
monster.experience = 6900
monster.outfit = {
	lookType = 1317,
	lookHead = 57,
	lookBody = 38,
	lookLegs = 76,
	lookFeet = 76,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 1972
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Bounac, the Order of the Lion settlement."
		}

monster.health = 8200
monster.maxHealth = 8200
monster.race = "blood"
monster.corpse = 38812
monster.speed = 170
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
	{text = "This town is ours now!", yell = false},
	{text = "You don't deserv Bounac!", yell = false},
	{text = "My power is fueled by a just cause!", yell = false},
	{text = "This will be the last thing you witness!", yell = false},
	{text = "Change of guard! High time ...!", yell = false},
	{text = "Do you really think you can stand?", yell = false},
	{text = "'Holding breath'", yell = false},
	{text = "Die in the flames of true righteousness.", yell = false}
}

monster.loot = {
	{id = "Platinum Coin", chance = 90000, maxCount = 5},
	{id = "Leather legs", chance = 35000},
	{id = "Knight Legs", chance = 6000},
	{id = "Violet Gem", chance = 3800},
	{id = "Lion Crest", chance = 730},
	{id = "Lion Cloak Patch", chance = 4180},
	{id = "Meat", chance = 7500, maxCount = 3},
	{id = "Great Mana Potion", chance = 33000, maxCount = 3},
	{id = "Gold Ingot", chance = 1250, maxCount = 3},
	{id = "Blue Gem", chance = 880},
	{id = "Green Gem", chance = 880},
	{id = "Magma legs", chance = 5500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 28, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -300, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -300, radius = 4, effect = CONST_ME_BIGCLOUDS, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 35},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
