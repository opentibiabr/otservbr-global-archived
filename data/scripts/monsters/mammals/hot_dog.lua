local mType = Game.createMonsterType("Hot Dog")
local monster = {}

monster.description = "a hot dog"
monster.experience = 190
monster.outfit = {
	lookType = 32,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 505
monster.maxHealth = 505
monster.race = "blood"
monster.corpse = 5971
monster.speed = 150
monster.summonCost = 220
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
	{text = "Wuff Wuff", yell = false},
	{text = "Grrr Wuff", yell = false},
	{text = "Show me how good you are without some rolled newspaper!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 75}
}

monster.attacks = {
	{name ="combat", interval = 1200, chance = 100, minDamage = 0, maxDamage = -55, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 30, minDamage = -30, maxDamage = -60, type = COMBAT_FIRE, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1000, chance = 30, minDamage = -50, maxDamage = -50, type = COMBAT_FIRE, range = 7, effect = CONST_ME_FIREATTACK, target = true}
}

monster.defenses = {
	defense = 2,
	armor = 1
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
