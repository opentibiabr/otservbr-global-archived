local mType = Game.createMonsterType("Custodian")
local monster = {}

monster.description = "a custodian"
monster.experience = 27500
monster.outfit = {
	lookType = 1217,
	lookHead = 1,
	lookBody = 1,
	lookLegs = 19,
	lookFeet = 19,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 47000
monster.maxHealth = 47000
monster.race = "blood"
monster.corpse = 36758
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	runHealth = 0,
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
	{id = "Platinum Coin", chance = 25000, maxCount = 13},
	{id = "Small Sapphire", chance = 33500},
	{id = "Small Topaz", chance = 33500},
	{id = "Small Diamond", chance = 33500}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 14, minDamage = -450, maxDamage = -600, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -400, maxDamage = -610, type = COMBAT_PHYSICAL, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -500, maxDamage = -730, type = COMBAT_FIRE, effect = CONST_ME_FIREATTACK, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
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
