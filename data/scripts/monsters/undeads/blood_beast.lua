local mType = Game.createMonsterType("Blood Beast")
local monster = {}

monster.description = "a blood beast"
monster.experience = 1000
monster.outfit = {
	lookType = 602,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "venom"
monster.corpse = 23351
monster.speed = 220
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Roarr!", yell = false}
}

monster.loot = {
	{id = 23549, chance = 2010},
	{id = 10557, chance = 3080},
	{id = 23517, chance = 2720},
	{id = 2148, chance = 100000, maxCount = 139},
	{id = 23565, chance = 1040},
	{id = 7588, chance = 7710},
	{id = 7366, chance = 1290, maxCount = 5},
	{id = 23554, chance = 250},
	{id = 23550, chance = 210},
	{id = 23549, chance = 210},
	{id = 23551, chance = 250},
	{id = 23529, chance = 280}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 82, attack = 50, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 260, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -65, maxDamage = -105, range = 5, ShootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_POISONAREA, target = true},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 17, minDamage = -300, maxDamage = -400, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 36,
	armor = 23,
	{name ="speed", interval = 2000, chance = 8, SpeedChange = 314, Duration = 6000},
	{name ="combat", interval = 2000, chance = 7, minDamage = 80, maxDamage = 120, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
