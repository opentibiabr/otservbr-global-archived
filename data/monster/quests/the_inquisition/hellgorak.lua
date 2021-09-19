local mType = Game.createMonsterType("Hellgorak")
local monster = {}

monster.description = "Hellgorak"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 96,
	lookLegs = 21,
	lookFeet = 81,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 25850
monster.maxHealth = 25850
monster.race = "blood"
monster.corpse = 6068
monster.speed = 330
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
	runHealth = 0,
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
	{text = "I'll sacrifice yours souls to seven!", yell = false},
	{text = "I'm bad news for you mortals!", yell = false},
	{text = "No man can defeat me!", yell = false},
	{text = "Your puny skills are no match for me.", yell = false},
	{text = "I smell your fear.", yell = false},
	{text = "Delicious!", yell = false}
}

monster.loot = {
	{id = 3031, chance = 100000, maxCount = 200},
	{id = 8899, chance = 49920},
	{id = 7643, chance = 41750, maxCount = 2},
	{id = 8073, chance = 31010},
	{id = 8896, chance = 30560},
	{id = 3344, chance = 29950},
	{id = 3035, chance = 21790, maxCount = 30},
	{id = 7642, chance = 21180},
	{id = 239, chance = 20570},
	{id = 3381, chance = 19670},
	{id = 238, chance = 16190},
	{id = 3027, chance = 14070, maxCount = 25},
	{id = 3026, chance = 13920, maxCount = 25},
	{id = 7456, chance = 12860},
	{id = 3028, chance = 12860, maxCount = 25},
	{id = 3030, chance = 13010, maxCount = 5},
	{id = 3008, chance = 12710},
	{id = 3033, chance = 12410, maxCount = 25},
	{id = 3016, chance = 11800},
	{id = 3029, chance = 11650, maxCount = 25},
	{id = 821, chance = 11350},
	{id = 9057, chance = 11200, maxCount = 25},
	{id = 3032, chance = 10740, maxCount = 25},
	{id = 3554, chance = 10740},
	{id = 8043, chance = 10590},
	{id = 3382, chance = 10140},
	{id = 8042, chance = 10140},
	{id = 3013, chance = 9680},
	{id = 3371, chance = 9530},
	{id = 5954, chance = 9230, maxCount = 2},
	{id = 8074, chance = 8770},
	{id = 8075, chance = 8620},
	{id = 3567, chance = 8170},
	{id = 3360, chance = 2870},
	{id = 7412, chance = 2720},
	{id = 7388, chance = 1970},
	{id = 8076, chance = 1360},
	{id = 7453, chance = 610},
	{id = 8098, chance = 450},
	{id = 3364, chance = 450},
	{id = 8051, chance = 450},
	{id = 8090, chance = 300},
	{id = 3019, chance = 150},
	{id = 3303, chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -910},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -819, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_MANADRAIN, minDamage = -90, maxDamage = -500, radius = 5, effect = CONST_ME_STUN, target = false},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -520, radius = 5, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -150, radius = 7, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 70,
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 98},
	{type = COMBAT_ENERGYDAMAGE, percent = 98},
	{type = COMBAT_EARTHDAMAGE, percent = 98},
	{type = COMBAT_FIREDAMAGE, percent = 98},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = -305},
	{type = COMBAT_ICEDAMAGE, percent = 98},
	{type = COMBAT_HOLYDAMAGE , percent = 95},
	{type = COMBAT_DEATHDAMAGE , percent = 98}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
