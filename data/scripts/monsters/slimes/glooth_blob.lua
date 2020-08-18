local mType = Game.createMonsterType("Glooth Blob")
local monster = {}

monster.description = "a glooth blob"
monster.experience = 700
monster.outfit = {
	lookType = 614,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750
monster.maxHealth = 750
monster.race = "venom"
monster.corpse = 23479
monster.speed = 160
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 5000,
	chance = 0
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

monster.summons = {
	{name = "Glooth Blob", chance = 6, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 70},
	{id = 23553, chance = 15410},
	{id = 2146, chance = 3310, maxCount = 2},
	{id = 9970, chance = 3420, maxCount = 2},
	{id = 23554, chance = 400},
	{id = 23550, chance = 510},
	{id = 23549, chance = 580},
	{id = 23551, chance = 560}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 45, attack = 40, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 280, interval = 4000}},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 13, minDamage = -400, maxDamage = -480, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 11, minDamage = -85, maxDamage = -180, ShootEffect = CONST_ANI_ENVENOMEDARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -60, maxDamage = -105, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
