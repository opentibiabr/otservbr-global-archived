local mType = Game.createMonsterType("Ice Witch")
local monster = {}

monster.description = "an ice witch"
monster.experience = 580
monster.outfit = {
	lookType = 149,
	lookHead = 0,
	lookBody = 47,
	lookLegs = 105,
	lookFeet = 105,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 650
monster.maxHealth = 650
monster.race = "blood"
monster.corpse = 20423
monster.speed = 228
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
	canPushCreatures = false,
	staticAttackChance = 70,
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
	{text = "So you think you are cool?", yell = false},
	{text = "I hope it is not too cold for you! HeHeHe.", yell = false},
	{text = "Freeze!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 29630, maxCount = 90},
	{id = "clerical mace", chance = 920},
	{id = "mystic turban", chance = 430},
	{id = "green mushroom", chance = 1310},
	{id = "shard", chance = 530},
	{id = "diamond sceptre", chance = 330},
	{id = 7441, chance = 10000},
	{id = "crystal sword", chance = 400},
	{id = "pair of earmuffs", chance = 90},
	{id = "strong mana potion", chance = 820},
	{id = "glacier shoes", chance = 280}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60, effect = CONST_ME_DRAWBLOOD},
	{name ="outfit", interval = 2000, chance = 1},
	{name ="combat", interval = 2000, chance = 10, minDamage = -60, maxDamage = -130, type = COMBAT_ICEDAMAGE, length = 5, spread = 2, effect = CONST_ME_ICETORNADO, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -55, maxDamage = -115, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 20000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 25, minDamage = 90, maxDamage = 120, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
