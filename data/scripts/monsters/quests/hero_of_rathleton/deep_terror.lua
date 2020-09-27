local mType = Game.createMonsterType("Deep Terror")
local monster = {}

monster.description = "Deep Terror"
monster.experience = 35000
monster.outfit = {
	lookType = 676,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 24269
monster.speed = 200
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
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

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 24268, chance = 10000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 130, attack = 100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 32, minDamage = -200, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 2000, chance = 19, minDamage = -300, maxDamage = -700, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_CARNIPHILA, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -500, maxDamage = -1000, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 2000, chance = 11, minDamage = 500, maxDamage = 1000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
