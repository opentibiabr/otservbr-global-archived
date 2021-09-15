local mType = Game.createMonsterType("Madareth")
local monster = {}

monster.description = "Madareth"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 116,
	lookLegs = 82,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.race = "fire"
monster.corpse = 7893
monster.speed = 165
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
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 1200,
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
	{text = "I am going to play with yourself!", yell = true},
	{text = "Feel my wrath!", yell = false},
	{text = "No one matches my battle prowess!", yell = false},
	{text = "You will all die!", yell = false}
}

monster.loot = {
	{id = 3031, chance = 100000, maxCount = 150},
	{id = 8899, chance = 59000},
	{id = 8896, chance = 40000},
	{id = 7443, chance = 33000},
	{id = 239, chance = 30000},
	{id = 7642, chance = 30000},
	{id = 7440, chance = 28000},
	{id = 7439, chance = 23000},
	{id = 238, chance = 21000},
	{id = 6299, chance = 19000},
	{id = 3067, chance = 19000},
	{id = 3258, chance = 19000},
	{id = 3035, chance = 19000, maxCount = 26},
	{id = 3265, chance = 19000},
	{id = 7404, chance = 16000},
	{id = 3092, chance = 16000},
	{id = 7643, chance = 16000},
	{id = 8082, chance = 16000},
	{id = 3093, chance = 14000},
	{id = 6499, chance = 14000},
	{id = 7407, chance = 14000},
	{id = 2949, chance = 14000},
	{id = 7418, chance = 14000},
	{id = 8084, chance = 14000},
	{id = 2966, chance = 14000},
	{id = 3071, chance = 11000},
	{id = 8094, chance = 11000},
	{id = 7416, chance = 9500},
	{id = 7449, chance = 9500},
	{id = 3098, chance = 9500},
	{id = 5954, chance = 7000, maxCount = 2},
	{id = 3052, chance = 7000},
	{id = 7383, chance = 7000},
	{id = 3053, chance = 7000},
	{id = 8092, chance = 7000},
	{id = 2958, chance = 7000},
	{id = 2948, chance = 7000},
	{id = 2965, chance = 4700},
	{id = 3097, chance = 4700},
	{id = 3284, chance = 4700},
	{id = 7386, chance = 4700},
	{id = 3091, chance = 4700}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -180, maxDamage = -660, radius = 4, effect = CONST_ME_PURPLEENERGY, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -850, length = 5, spread = 2, effect = CONST_ME_BLACKSMOKE, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -200, radius = 4, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -250, radius = 5, effect = CONST_ME_MAGIC_RED, target = true}
}

monster.defenses = {
	defense = 46,
	armor = 48,
	{name ="combat", interval = 3000, chance = 14, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 99},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 95}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
