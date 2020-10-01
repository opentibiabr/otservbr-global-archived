local mType = Game.createMonsterType("Draptor")
local monster = {}

monster.description = "a draptor"
monster.experience = 2400
monster.outfit = {
	lookType = 382,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "blood"
monster.corpse = 13316
monster.speed = 680
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
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 350,
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
	{text = "EEHEEHEEHEEH", yell = false},
	{text = "SCREEEEECH", yell = false},
	{text = "GRRR", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 33750, maxCount = 90},
	{id = "gold coin", chance = 33750, maxCount = 60},
	{id = "strong health potion", chance = 3150},
	{id = "strong mana potion", chance = 4150},
	{id = "dragon robe", chance = 950},
	{id = "draptor scales", chance = 6650}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 30, minDamage = -130, maxDamage = -310, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_YELLOWENERGY, target = false},
	{name ="combat", interval = 3000, chance = 35, minDamage = -200, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 2500, chance = 17, minDamage = -70, maxDamage = -250, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 37,
	armor = 23,
	{name ="combat", interval = 1000, chance = 25, minDamage = 57, maxDamage = 93, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 12, SpeedChange = 457, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
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
