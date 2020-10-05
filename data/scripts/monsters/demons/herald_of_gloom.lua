local mType = Game.createMonsterType("Herald of Gloom")
local monster = {}

monster.description = "a herald of gloom"
monster.experience = 450
monster.outfit = {
	lookType = 320,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 340
monster.maxHealth = 340
monster.race = "undead"
monster.corpse = 9915
monster.speed = 170
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 0,
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
	{text = "The powers of light are waning.", yell = true},
	{text = "You will join us in eternal night!", yell = true},
	{text = "The shadows will engulf the world.", yell = true}
}

monster.loot = {
	{id = "midnight shard", chance = 1886}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 3000, chance = 10, SpeedChange = -600, Duration = 30000},
	{name ="combat", interval = 2000, chance = 24, minDamage = -90, maxDamage = -170, type = COMBAT_HOLYDAMAGE, range = 4, shootEffect = CONST_ANI_SMALLHOLY, target = false}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{name ="speed", interval = 1000, chance = 15, SpeedChange = 200, Duration = 20000},
	{name ="invisible", interval = 5000, chance = 20, effect = CONST_ME_MAGIC_RED},
	{name ="outfit", interval = 1500, chance = 20},
	{name ="outfit", interval = 1500, chance = 10},
	{name ="outfit", interval = 1500, chance = 10},
	{name ="outfit", interval = 1500, chance = 10},
	{name ="outfit", interval = 1500, chance = 10},
	{name ="outfit", interval = 1500, chance = 10}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
