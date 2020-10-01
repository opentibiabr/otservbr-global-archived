local mType = Game.createMonsterType("Braindeath")
local monster = {}

monster.description = "a braindeath"
monster.experience = 985
monster.outfit = {
	lookType = 256,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1225
monster.maxHealth = 1225
monster.race = "undead"
monster.corpse = 7256
monster.speed = 218
monster.summonCost = 0
monster.maxSummons = 2

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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Vampire", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You have disturbed my thoughts!", yell = false},
	{text = "Let me turn you into something more useful!", yell = false},
	{text = "Let me taste your brain!", yell = false},
	{text = "You will be punished!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 99470, maxCount = 89},
	{id = "bone sword", chance = 15130},
	{id = "sniper arrow", chance = 9560, maxCount = 4},
	{id = "steel shield", chance = 5940},
	{id = "piece of dead brain", chance = 5030},
	{id = "bonelord eye", chance = 2990},
	{id = "clerical mace", chance = 1970},
	{id = "haunted blade", chance = 1440},
	{id = 2175, chance = 930},
	{id = "spiked squelcher", chance = 180},
	{id = "bonelord shield", chance = 100},
	{id = "bonelord helmet", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -93, maxDamage = -170, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -75, maxDamage = -125, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -85, maxDamage = -170, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -65, maxDamage = -125, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -75, maxDamage = -85, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -155, type = COMBAT_MANADRAIN, range = 7, target = false}
}

monster.defenses = {
	defense = 12,
	armor = 12,
	{name ="combat", interval = 2000, chance = 15, minDamage = 150, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 260, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
