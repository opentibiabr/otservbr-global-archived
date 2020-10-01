local mType = Game.createMonsterType("Mercury Blob")
local monster = {}

monster.description = "a mercury blob"
monster.experience = 180
monster.outfit = {
	lookType = 316,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.race = "undead"
monster.corpse = 9961
monster.speed = 150
monster.summonCost = 0
monster.maxSummons = 3

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
	canPushCreatures = false,
	staticAttackChance = 85,
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
	{name = "Mercury Blob", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Crackle", yell = false}
}

monster.loot = {
	{id = "glob of mercury", chance = 18750}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -75, effect = CONST_ME_DRAWBLOOD},
	{name ="drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_STUN, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -10, maxDamage = -30, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 1,
	armor = 1,
	{name ="combat", interval = 2000, chance = 5, minDamage = 20, maxDamage = 30, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 65},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 80},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 65},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
