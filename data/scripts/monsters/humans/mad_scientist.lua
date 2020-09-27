local mType = Game.createMonsterType("Mad Scientist")
local monster = {}

monster.description = "a mad scientist"
monster.experience = 205
monster.outfit = {
	lookType = 133,
	lookHead = 97,
	lookBody = 0,
	lookLegs = 38,
	lookFeet = 97,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 325
monster.maxHealth = 325
monster.race = "blood"
monster.corpse = 20439
monster.speed = 180
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
	{text = "Die in the name of Science!", yell = false},
	{text = "You will regret interrupting my studies!", yell = false},
	{text = "Let me test this!", yell = false},
	{text = "I will study your corpse!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 30000, maxCount = 65},
	{id = "gold coin", chance = 30000, maxCount = 50},
	{id = 2162, chance = 2000},
	{id = "life crystal", chance = 2000},
	{id = "cookie", chance = 1200, maxCount = 5},
	{id = "white mushroom", chance = 8000, maxCount = 3},
	{id = "mastermind potion", chance = 130},
	{id = "health potion", chance = 19000},
	{id = "mana potion", chance = 19000},
	{id = "small enchanted amethyst", chance = 470}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -35, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -20, maxDamage = -56, type = COMBAT_DROWNDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_POFF, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -20, maxDamage = -36, type = COMBAT_EARTHDAMAGE, shootEffect = CONST_ANI_POISON, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = -300, Duration = 2000}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 15, minDamage = 10, maxDamage = 30, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
