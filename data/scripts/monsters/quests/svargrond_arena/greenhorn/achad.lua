local mType = Game.createMonsterType("Achad")
local monster = {}

monster.description = "Achad"
monster.experience = 70
monster.outfit = {
	lookType = 146,
	lookHead = 93,
	lookBody = 93,
	lookLegs = 57,
	lookFeet = 97,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 185
monster.maxHealth = 185
monster.race = "blood"
monster.corpse = 7349
monster.speed = 185
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 0,
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
	canPushCreatures = false,
	staticAttackChance = 95,
	targetdistance = 1,
	runHealth = 55,
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
	{text = "You won't pass me.", yell = false},
	{text = "I have travelled far to fight here.", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 19,
	armor = 20
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
