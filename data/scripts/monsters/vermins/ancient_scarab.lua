local mType = Game.createMonsterType("Ancient Scarab")
local monster = {}

monster.description = "an ancient scarab"
monster.experience = 720
monster.outfit = {
	lookType = 79,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000
monster.maxHealth = 1000
monster.race = "venom"
monster.corpse = 6021
monster.speed = 218
monster.summonCost = 0
monster.maxSummons = 3

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
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
	staticAttackChance = 80,
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

monster.summons = {
	{name = "Larva", chance = 10, interval = 2000, max = 3}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "scarab amulet", chance = 3410},
	{id = "ancient amulet", chance = 2570},
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "gold coin", chance = 50000, maxCount = 97},
	{id = "small emerald", chance = 4810, maxCount = 3},
	{id = "small amethyst", chance = 5000, maxCount = 4},
	{id = "scarab coin", chance = 7692, maxCount = 2},
	{id = 2162, chance = 11480},
	{id = "daramian waraxe", chance = 420},
	{id = "plate armor", chance = 10300},
	{id = "scarab shield", chance = 480},
	{id = "strong health potion", chance = 660},
	{id = "terra hood", chance = 490},
	{id = "scarab pincers", chance = 3571}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -130, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 56, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = -15, maxDamage = -145, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -700, Duration = 25000},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 30, minDamage = -440, maxDamage = -520, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 380, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
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
