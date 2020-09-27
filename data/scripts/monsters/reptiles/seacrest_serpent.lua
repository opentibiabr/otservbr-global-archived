local mType = Game.createMonsterType("Seacrest Serpent")
local monster = {}

monster.description = "a seacrest serpent"
monster.experience = 2600
monster.outfit = {
	lookType = 675,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "venom"
monster.corpse = 24262
monster.speed = 500
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 9
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 0,
	runHealth = 0,
	isHealthHidden = false,
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
	{text = "LEAVE THESE GROUNDS...", yell = false},
	{text = "THE DARK TIDE WILL SWALLOW YOU...", yell = false}
}

monster.loot = {
	{id = 2672, chance = 13040},
	{id = 24170, chance = 12040},
	{id = 7839, chance = 7020, maxCount = 17},
	{id = 7902, chance = 2680},
	{id = 24261, chance = 400},
	{id = 2152, chance = 100000, maxCount = 5},
	{id = 7588, chance = 7020, maxCount = 2},
	{id = 7589, chance = 10370, maxCount = 2},
	{id = 24116, chance = 10030},
	{id = 2143, chance = 3680, maxCount = 2},
	{id = 2144, chance = 2340, maxCount = 3},
	{id = 7632, chance = 1000},
	{id = 5944, chance = 3340},
	{id = 2145, chance = 5020, maxCount = 3},
	{id = 24169, chance = 17390},
	{id = 7888, chance = 670},
	{id = 7896, chance = 3680},
	{id = 7892, chance = 3010},
	{id = 18390, chance = 670},
	{id = 8921, chance = 670}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 120, attack = 82, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 7, minDamage = -200, maxDamage = -260, type = COMBAT_DEATH, range = 7, ShootEffect = CONST_ANI_EARTH, effect = CONST_ME_SOUND_RED, target = true},
	{name ="combat", interval = 2000, chance = 11, minDamage = -200, maxDamage = -285, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = 0, maxDamage = -284, type = COMBAT_ICE, length = 8, spread = 3, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, type = COMBAT_PHYSICAL, length = 4, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.defenses = {
	defense = 31,
	armor = 22,
	{name ="combat", interval = 2000, chance = 15, minDamage = 145, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_SOUND_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = 0, effect = CONST_ME_DRAWBLOOD}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
