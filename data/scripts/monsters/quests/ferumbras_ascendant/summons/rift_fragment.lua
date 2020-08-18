local mType = Game.createMonsterType("Rift Fragment")
local monster = {}

monster.description = "a rift fragment"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 1491
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "venom"
monster.corpse = 0
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
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
	runHealth = 1400,
	isHealthHidden = false,
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
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 50, attack = 13, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 30, minDamage = -260, maxDamage = -320, type = COMBAT_DROWN, effect = CONST_ME_BUBBLES, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = -160, maxDamage = -320, type = COMBAT_DROWN, range = 6, effect = CONST_ME_BUBBLES, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 40
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
