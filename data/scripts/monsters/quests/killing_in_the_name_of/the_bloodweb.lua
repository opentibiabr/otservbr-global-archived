local mType = Game.createMonsterType("The Bloodweb")
local monster = {}

monster.description = "the Bloodweb"
monster.experience = 1450
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1750
monster.maxHealth = 1750
monster.race = "undead"
monster.corpse = 7344
monster.speed = 340
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 20000,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 60,
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
	{text = "Screeech!", yell = false}
}

monster.loot = {
	{id = 7589, chance = 100000},
	{id = 5879, chance = 50000},
	{id = 7902, chance = 33333},
	{id = 7896, chance = 33333},
	{id = 11306, chance = 20000},
	{id = 7437, chance = 20000},
	{id = 5801, chance = 7692},
	{id = 2476, chance = 7692},
	{id = 2477, chance = 5555},
	{id = 7290, chance = 3703},
	{id = 2169, chance = 3703}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 40, attack = 100, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 8, interval = 4000}},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -850, Duration = 8000},
	{name ="combat", interval = 1000, chance = 25, minDamage = -60, maxDamage = -150, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="speed", interval = 3000, chance = 40, SpeedChange = 380, Duration = 80000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
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
