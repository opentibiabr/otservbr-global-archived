local mType = Game.createMonsterType("Quara Hydromancer")
local monster = {}

monster.description = "a quara hydromancer"
monster.experience = 800
monster.outfit = {
	lookType = 47,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 6066
monster.speed = 490
monster.summonCost = 0
monster.maxSummons = 0

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
	targetDistance = 1,
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
	{text = "Qua hah tsh!", yell = false},
	{text = "Teech tsha tshul!", yell = false},
	{text = "Quara tsha Fach!", yell = false},
	{text = "Tssssha Quara!", yell = false},
	{text = "Blubber.", yell = false},
	{text = "Blup.", yell = false}
}

monster.loot = {
	{id = "white pearl", chance = 5250},
	{id = "black pearl", chance = 3150},
	{id = "gold coin", chance = 50000, maxCount = 50},
	{id = "gold coin", chance = 50000, maxCount = 60},
	{id = "small emerald", chance = 5111, maxCount = 2},
	{id = "wand of cosmic energy", chance = 900},
	{id = "ring of healing", chance = 1008},
	{id = "knight armor", chance = 200},
	{id = "shrimp", chance = 4545, maxCount = 5},
	{id = "fish fin", chance = 1280},
	{id = "great mana potion", chance = 3100},
	{id = "quara eye", chance = 15930}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 100, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -180, type = COMBAT_ICEDAMAGE, length = 8, spread = 3, effect = CONST_ME_BUBBLES, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -90, maxDamage = -150, type = COMBAT_ICEDAMAGE, effect = CONST_ME_BUBBLES, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -170, maxDamage = -240, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -170, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 15000}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 15, minDamage = 100, maxDamage = 120, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
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
