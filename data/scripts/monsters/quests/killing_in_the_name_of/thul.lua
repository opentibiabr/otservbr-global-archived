local mType = Game.createMonsterType("Thul")
local monster = {}

monster.description = "Thul"
monster.experience = 2700
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2950
monster.maxHealth = 2950
monster.race = "blood"
monster.corpse = 6065
monster.speed = 520
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 40,
	isHealthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Massive Water Elemental", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Gaaahhh!", yell = false},
	{text = "Boohaa!", yell = false}
}

monster.loot = {
	{id = 5895, chance = 100000},
	{id = 2152, chance = 88000, maxCount = 10},
	{id = 7963, chance = 67000},
	{id = 7590, chance = 46000},
	{id = 2150, chance = 38000, maxCount = 4},
	{id = 7383, chance = 35000},
	{id = 2497, chance = 16000},
	{id = 2487, chance = 10000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -285, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 7, minDamage = -108, maxDamage = -137, type = COMBAT_ICE, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = 0, maxDamage = -170, type = COMBAT_PHYSICAL, effect = CONST_ME_HITAREA, target = false},
	{name ="poisonfield", interval = 2000, chance = 19, ShootEffect = CONST_ANI_POISON, target = false},
	{name ="speed", interval = 2000, chance = 18, SpeedChange = -360, Duration = 5000}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 10, minDamage = 25, maxDamage = 75, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
