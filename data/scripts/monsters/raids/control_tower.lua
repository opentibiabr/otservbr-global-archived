local mType = Game.createMonsterType("Control Tower")
local monster = {}

monster.description = "a control tower"
monster.experience = 3000
monster.outfit = {
	lookTypeEx = 23265
}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "venom"
monster.corpse = 24309
monster.speed = 0
monster.summonCost = 330
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	isSummonable = true,
	isAttackable = true,
	isHostile = true,
	isConvinceable = true,
	isPushable = false,
	isBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = true,
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
	{id = 2152, chance = 100000, maxCount = 5},
	{id = 7590, chance = 14285},
	{id = 7591, chance = 14285}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 55},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
