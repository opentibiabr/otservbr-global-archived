local mType = Game.createMonsterType("Brittle Skeleton")
local monster = {}

monster.description = "a brittle skeleton"
monster.experience = 35
monster.outfit = {
	lookType = 33,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50
monster.maxHealth = 50
monster.race = "undead"
monster.corpse = 5972
monster.speed = 146
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = true,
	rewardboss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
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
}

monster.loot = {
	{id = 2230, chance = 49870},
	{id = 2511, chance = 2920},
	{id = 2148, chance = 100000, maxCount = 5},
	{id = 2388, chance = 4770},
	{id = 2398, chance = 4770},
	{id = 12437, chance = 9280},
	{id = 2484, chance = 2920},
	{id = 2376, chance = 6100},
	{id = 2050, chance = 10610},
	{id = 2473, chance = 3980}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 10, attack = 18, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 8, minDamage = -7, maxDamage = -13, type = COMBAT_LIFEDRAIN, range = 7, ShootEffect = CONST_ANI_SUDDENDEATH, target = false}
}

monster.defenses = {
	defense = 9,
	armor = 2
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
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
