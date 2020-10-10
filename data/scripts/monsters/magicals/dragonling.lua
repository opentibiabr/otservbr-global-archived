local mType = Game.createMonsterType("Dragonling")
local monster = {}

monster.description = "a dragonling"
monster.experience = 2200
monster.outfit = {
	lookType = 505,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2600
monster.maxHealth = 2600
monster.race = "blood"
monster.corpse = 18438
monster.speed = 460
monster.summonCost = 0
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
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 900,
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
	{text = "FCHHHHH", yell = false},
	{text = "SQUAWK!", yell = false},
	{text = "FIYAH", yell = false},
	{text = "FI?", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 37500, maxCount = 100},
	{id = "gold coin", chance = 37500, maxCount = 100},
	{id = "gold coin", chance = 37500, maxCount = 27},
	{id = "strong health potion", chance = 24480, maxCount = 2},
	{id = "strong mana potion", chance = 16900, maxCount = 2},
	{id = "blazing bone", chance = 12410}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -210, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -120, maxDamage = -250, type = COMBAT_FIREDAMAGE, length = 5, spread = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -115, maxDamage = -180, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -95, maxDamage = -150, type = COMBAT_FIREDAMAGE, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = -700, duration = 16000}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, minDamage = 100, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
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
