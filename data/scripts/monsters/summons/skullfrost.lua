local mType = Game.createMonsterType("Skullfrost")
local monster = {}

monster.description = "a Skullfrost"
monster.experience = 0
monster.outfit = {
	lookType = 991,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000
monster.maxHealth = 10000
monster.race = "undead"
monster.corpse = 0
monster.speed = 309
monster.summonCost = 1000
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20
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
	hostile = false,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 17, minDamage = -300, maxDamage = -350, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -250, type = COMBAT_DEATHDAMAGE, range = 6, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 3000, chance = 25, minDamage = -180, maxDamage = -250, type = COMBAT_DEATHDAMAGE, range = 5, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 3000, chance = 25, minDamage = -180, maxDamage = -250, type = COMBAT_ICEDAMAGE, range = 5, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -250, type = COMBAT_ICEDAMAGE, range = 6, effect = CONST_ME_ICETORNADO, target = true},
	{name ="combat", interval = 2000, chance = 17, minDamage = -300, maxDamage = -350, range = 5, target = true}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name ="combat", interval = 2000, chance = 75, minDamage = 400, maxDamage = 400, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
