local mType = Game.createMonsterType("Wilting Leaf Golem")
local monster = {}

monster.description = "a wilting leaf golem"
monster.experience = 145
monster.outfit = {
	lookType = 573,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 380
monster.maxHealth = 380
monster.race = "blood"
monster.corpse = 21434
monster.speed = 148
monster.summonCost = 390
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
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "*crackle*", yell = false},
	{text = "*swwwwishhhh*", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 97540, maxCount = 45},
	{id = "fir cone", chance = 14950},
	{id = "dowser", chance = 11880},
	{id = "small emerald", chance = 1050},
	{id = "white mushroom", chance = 5040, maxCount = 3},
	{id = "swampling club", chance = 4890}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 1500, chance = 100, minDamage = 0, maxDamage = -120, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 300, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -50, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONHIT, target = true},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -150, maxDamage = -200, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -600, Duration = 15000}
}

monster.defenses = {
	defense = 0,
	armor = 20
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
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
