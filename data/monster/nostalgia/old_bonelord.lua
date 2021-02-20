local mType = Game.createMonsterType("Old Bonelord")
local monster = {}

monster.name = "Bonelord"
monster.description = "a bonelord"
monster.experience = 157
monster.outfit = {
	lookType = 924,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 260
monster.maxHealth = 260
monster.race = "venom"
monster.corpse = 5992
monster.speed = 170
monster.manaCost = 0
monster.maxSummons = 4

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
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Skeleton", chance = 20, interval = 2000, max = 4}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You've got the look!", yell = false},
	{text = "Eye for eye!", yell = false},
	{text = "Here's looking at you!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 65000, maxCount = 82},
	{id = 2175, chance = 4650},
	{name = "two handed sword", chance = 3840},
	{name = "morning star", chance = 6950},
	{name = "longsword", chance = 8980},
	{name = "steel shield", chance = 4001}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -5},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_ENERGYDAMAGE, minDamage = -15, maxDamage = -45, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_FIREDAMAGE, minDamage = -25, maxDamage = -45, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -50, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -5, maxDamage = -45, range = 7, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_DEATHDAMAGE, minDamage = -5, maxDamage = -50, range = 7, shootEffect = CONST_ANI_DEATH, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -45, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -35, range = 7, target = false}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
