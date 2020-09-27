local mType = Game.createMonsterType("Arctic Faun")
local monster = {}

monster.description = "an arctic faun"
monster.experience = 300
monster.outfit = {
	lookType = 980,
	lookHead = 85,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 300
monster.maxHealth = 300
monster.race = "blood"
monster.corpse = 33423
monster.speed = 210
monster.summonCost = 0
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
	targetdistance = 1,
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
	{text = "Dance with me!", yell = false},
	{text = "In vino veritas! Hahaha!", yell = false},
	{text = "Wine, women and song!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 105},
	{id = "dandelion seeds", chance = 14870},
	{id = "strong health potion", chance = 11760},
	{id = "fresh fruit", chance = 10290},
	{id = "shimmering beetles", chance = 9330},
	{id = "leaf star", chance = 8720, maxCount = 3},
	{id = "goat grass", chance = 7280},
	{id = "cookie", chance = 6150, maxCount = 5},
	{id = "grapes", chance = 5400},
	{id = "rainbow quartz", chance = 5260, maxCount = 2},
	{id = "small stone", chance = 5260, maxCount = 2},
	{id = "panpipes", chance = 4510},
	{id = "great health potion", chance = 3590},
	{id = "wood cape", chance = 820},
	{id = "leaf legs", chance = 340},
	{id = "wooden spellbook", chance = 210},
	{id = 5792, chance = 140}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = 0, maxDamage = -180, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 1000, chance = 12, minDamage = 0, maxDamage = -175, type = COMBAT_ENERGY, length = 3, spread = 3, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
