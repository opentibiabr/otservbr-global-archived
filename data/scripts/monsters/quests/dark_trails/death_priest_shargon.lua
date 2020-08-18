local mType = Game.createMonsterType("Death Priest Shargon")
local monster = {}

monster.description = "Death Priest Shargon"
monster.experience = 20000
monster.outfit = {
	lookType = 278,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 65000
monster.maxHealth = 65000
monster.race = "blood"
monster.corpse = 23494
monster.speed = 340
monster.summonCost = 0
monster.maxSummons = 6

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
	{name = "Lesser Death Minion", chance = 30, interval = 2000, max = 2},
	{name = "Superior Death Minion", chance = 30, interval = 2000, max = 2},
	{name = "Greater Death Minion", chance = 30, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 99},
	{id = 7591, chance = 100000, maxCount = 3},
	{id = 2185, chance = 100000},
	{id = 2152, chance = 100000, maxCount = 13},
	{id = 7590, chance = 10000, maxCount = 4},
	{id = 9971, chance = 25000},
	{id = 9969, chance = 9090},
	{id = 9447, chance = 9090}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 200, attack = 150, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 12, minDamage = 0, maxDamage = -660, type = COMBAT_DEATH, range = 7, ShootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, minDamage = -350, maxDamage = -1000, type = COMBAT_HOLY, length = 6, spread = 2, effect = CONST_ME_PURPLEENERGY, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = 699, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
