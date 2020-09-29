local mType = Game.createMonsterType("Askarak Demon")
local monster = {}

monster.description = "an askarak demon"
monster.experience = 900
monster.outfit = {
	lookType = 420,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "venom"
monster.corpse = 13815
monster.speed = 230
monster.summonCost = 0
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
	staticAttackChance = 80,
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
	{text = "DEATH TO THE SHABURAK!", yell = false},
	{text = "GREEN WILL RULE!", yell = false},
	{text = "ONLY WE ARE TRUE DEMONS!", yell = false},
	{text = "RED IS MAD!", yell = false},
	{text = "WE RULE!", yell = false}
}

monster.loot = {
	{id = "piggy bank", chance = 1052},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 40000, maxCount = 35},
	{id = "small emerald", chance = 6250, maxCount = 4},
	{id = "energy ring", chance = 961},
	{id = "brown mushroom", chance = 3846, maxCount = 5},
	{id = "magic sulphur", chance = 102},
	{id = "assassin star", chance = 4761, maxCount = 5},
	{id = "mastermind potion", chance = 431},
	{id = "strong health potion", chance = 5263},
	{id = "strong mana potion", chance = 5263},
	{id = "terra legs", chance = 123},
	{id = "springsprout rod", chance = 512}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -143, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -20, maxDamage = -60, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -75, maxDamage = -140, type = COMBAT_EARTHDAMAGE, length = 4, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -170, type = COMBAT_EARTHDAMAGE, length = 4, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = -600, Duration = 15000}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
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
