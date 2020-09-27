local mType = Game.createMonsterType("Renegade Quara Constrictor")
local monster = {}

monster.description = "a renegade quara constrictor"
monster.experience = 1250
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 6065
monster.speed = 380
monster.summonCost = 670
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
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
	{id = 2152, chance = 100000, maxCount = 3},
	{id = 12443, chance = 16666},
	{id = 15649, chance = 16666, maxCount = 10},
	{id = 2147, chance = 14285, maxCount = 2},
	{id = 7368, chance = 7142, maxCount = 5},
	{id = 2214, chance = 6250},
	{id = 2670, chance = 5555},
	{id = 2178, chance = 4761},
	{id = 2150, chance = 4000},
	{id = 7590, chance = 4000},
	{id = 5895, chance = 806}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 60, attack = 40, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, target = false},
	{name ="combat", interval = 2000, chance = 10, range = 1, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 3000, chance = 35, minDamage = 150, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = -1},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
