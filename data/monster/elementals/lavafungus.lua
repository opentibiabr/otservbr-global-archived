local mType = Game.createMonsterType("Lavafungus")
local monster = {}

monster.description = "You see a lavafungus."
monster.experience = 4000
monster.outfit = {
	lookType = 1405,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1563
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Grotto of the Lost."
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "fire"
monster.corpse = 41616
monster.speed = 115
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
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 17},
	{name = "Blue Crystal Shard", chance = 13330},
	{name = "Onyx Chip", chance = 13330},
	{name = "Rainbow Quartz", chance = 13330},
	{name = "Red Gem", chance = 13330},
	{name = "Spellbook of Warding", chance = 13330},
	{name = "Yellow Gem", chance = 13330},
	{name = "Focus Cape", chance = 6670},
	{name = "Lavafungus Head", chance = 6670},
	{name = "Lavafungus Ring", chance = 6670},
	{name = "Terra Rod", chance = 6670},
	{name = "Violet Crystal Shard", chance = 6670},
	{name = "Wand of Inferno", chance = 6670},
	{name = "Wand of Starstorm", chance = 6670},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -810},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -560, maxDamage = -650, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -720, maxDamage = -810, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -610, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -490, maxDamage = -720, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -640, maxDamage = -730, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true},
}

monster.defenses = {
	defense = 33,
	armor = 70
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 99},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -101},
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
