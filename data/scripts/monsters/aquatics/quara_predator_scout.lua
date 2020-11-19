local mType = Game.createMonsterType("Quara Predator Scout")
local monster = {}

monster.description = "a quara predator scout"
monster.experience = 400
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 890
monster.maxHealth = 890
monster.race = "blood"
monster.corpse = 6067
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
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
	{text = "Gnarrr!", yell = false},
	{text = "Tcharrr!", yell = false},
	{text = "Rrrah!", yell = false},
	{text = "Rraaar!", yell = false}
}

monster.loot = {
	{id = "small diamond", chance = 5520, maxCount = 2},
	{id = "gold coin", chance = 50000, maxCount = 60},
	{id = "gold coin", chance = 48000, maxCount = 69},
	{id = "two handed sword", chance = 2320},
	{id = "double axe", chance = 5800},
	{id = "scale armor", chance = 8000},
	{id = "shrimp", chance = 4700, maxCount = 5},
	{id = "fish fin", chance = 980},
	{id = "northwind rod", chance = 800},
	{id = "quara bone", chance = 10150}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -193, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
