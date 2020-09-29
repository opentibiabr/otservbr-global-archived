local mType = Game.createMonsterType("Massive Water Elemental")
local monster = {}

monster.description = "a massive water elemental"
monster.experience = 1100
monster.outfit = {
	lookType = 11,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1250
monster.maxHealth = 1250
monster.race = "undead"
monster.corpse = 10499
monster.speed = 430
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
	{id = "small diamond", chance = 1900, maxCount = 2},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "small emerald", chance = 1000, maxCount = 2},
	{id = "platinum coin", chance = 20000, maxCount = 2},
	{id = "energy ring", chance = 910},
	{id = "life ring", chance = 1000},
	{id = 2667, chance = 40000, maxCount = 2},
	{id = "rainbow trout", chance = 1340},
	{id = "green perch", chance = 1590},
	{id = "great mana potion", chance = 10400},
	{id = "great health potion", chance = 10000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -220, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 300, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -330, maxDamage = -450, type = COMBAT_DROWNDAMAGE, range = 7, effect = CONST_ME_LOSEENERGY, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -170, maxDamage = -210, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 20, minDamage = -355, maxDamage = -420, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 5, minDamage = 120, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
