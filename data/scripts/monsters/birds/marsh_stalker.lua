local mType = Game.createMonsterType("Marsh Stalker")
local monster = {}

monster.description = "a marsh stalker"
monster.experience = 50
monster.outfit = {
	lookType = 530,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 19708
monster.speed = 150
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
	runHealth = 10,
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
	{text = "Rrrawk! Rrrrawk!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 64090, maxCount = 23},
	{id = "meat", chance = 19950, maxCount = 2},
	{id = 2667, chance = 20320, maxCount = 2},
	{id = "worm", chance = 14730, maxCount = 2},
	{id = 19742, chance = 8650},
	{id = "longsword", chance = 7560},
	{id = 19741, chance = 6080},
	{id = 2120, chance = 4830},
	{id = "seeds", chance = 110}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -10, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -8, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 3,
	armor = 3
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
