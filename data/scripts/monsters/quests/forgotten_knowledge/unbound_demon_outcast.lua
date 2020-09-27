local mType = Game.createMonsterType("Unbound Demon Outcast")
local monster = {}

monster.description = "an unbound demon outcast"
monster.experience = 6200
monster.outfit = {
	lookType = 590,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5900
monster.maxHealth = 5900
monster.race = "fire"
monster.corpse = 22549
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 2

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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "energy elemental", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 90, attack = 80, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, length = 6, spread = 3, effect = CONST_ME_PURPLEENERGY, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -250, maxDamage = -350, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_YELLOWENERGY, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 9, minDamage = -50, maxDamage = -100, type = COMBAT_MANADRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 7, range = 5, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, minDamage = 100, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = 468, Duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = -8},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
