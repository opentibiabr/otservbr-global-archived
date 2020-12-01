local mType = Game.createMonsterType("Swarmer")
local monster = {}

monster.description = "a swarmer"
monster.experience = 350
monster.outfit = {
	lookType = 460,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 460
monster.maxHealth = 460
monster.race = "venom"
monster.corpse = 15388
monster.speed = 256
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 95,
	targetDistance = 0,
	runHealth = 50,
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
	{text = "Flzlzlzlzlzlzlz!", yell = false},
	{text = "Rzlrzlrzlrzlrzlrzl!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 75},
	{id = "small emerald", chance = 920},
	{id = "epee", chance = 450},
	{id = "swarmer antenna", chance = 15300},
	{id = "compound eye", chance = 12500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -102, condition = {type = CONDITION_POISON, totalDamage = 80, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -110, range = 7, effect = CONST_ME_MAGIC_RED, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 10,
	{name ="speed", interval = 2000, chance = 15, speedChange = 220, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 75},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -1},
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
