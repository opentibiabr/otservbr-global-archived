local mType = Game.createMonsterType("Energuardian of Tales")
local monster = {}

monster.description = "an energuardian of tales"
monster.experience = 11475
monster.outfit = {
	lookType = 1063,
	lookHead = 66,
	lookBody = 85,
	lookLegs = 82,
	lookFeet = 93,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 14000
monster.maxHealth = 14000
monster.race = "undead"
monster.corpse = 32571
monster.speed = 420
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
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
	{id = 33316, chance = 10000, maxCount = 5},
	{id = 33317, chance = 10000, maxCount = 5},
	{id = "Small Amethyst", chance = 10000, maxCount = 5},
	{id = "Flash Arrow", chance = 10000, maxCount = 5},
	{id = "Lightning Legs", chance = 250},
	{id = "Spellbook of Warding", chance = 350},
	{id = "Ultimate Health Potion", chance = 10000, maxCount = 5},
	{id = "Ultimate Mana Potion", chance = 10000, maxCount = 5},
	{id = "Wand of Starstorm", chance = 300}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -10, maxDamage = -550, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 13, minDamage = -100, maxDamage = -555, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
