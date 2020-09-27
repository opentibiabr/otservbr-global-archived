local mType = Game.createMonsterType("Slick Water Elemental")
local monster = {}

monster.description = "a slick water elemental"
monster.experience = 450
monster.outfit = {
	lookType = 286,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550
monster.maxHealth = 550
monster.race = "undead"
monster.corpse = 8965
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 20000,
	chance = 15
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
	canPushCreatures = false,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 1,
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
	{text = "BLUUUUB", yell = false},
	{text = "SPLISH SPLASH", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 22500, maxCount = 70},
	{id = "gold coin", chance = 22500, maxCount = 60},
	{id = "shiver arrow", chance = 2575, maxCount = 3},
	{id = "iced soil", chance = 6000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -175, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -130, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_EARTH, target = true},
	{name ="combat", interval = 1000, chance = 10, minDamage = 0, maxDamage = -220, type = COMBAT_ICEDAMAGE, range = 6, shootEffect = CONST_ANI_SNOWBALL, target = true},
	{name ="combat", interval = 2000, chance = 18, minDamage = 0, maxDamage = -103, type = COMBAT_ICEDAMAGE, range = 4, shootEffect = CONST_ANI_SMALLICE, target = true}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 15, minDamage = 90, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
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
