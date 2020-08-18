local mType = Game.createMonsterType("Eshtaba The Conjurer")
local monster = {}

monster.description = "Eshtaba The Conjurer"
monster.experience = 0
monster.outfit = {
	lookType = 149,
	lookHead = 95,
	lookBody = 68,
	lookLegs = 68,
	lookFeet = 68,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 0
monster.speed = 0
monster.summonCost = 0
monster.maxSummons = 5

monster.changeTarget = {
	interval = 4000,
	chance = 20
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
	staticAttackChance = 95,
	targetdistance = 0,
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
	{name = "Dread Minion", chance = 20, interval = 2000},
	{name = "Dread Minion", chance = 30, interval = 2000},
	{name = "Dread Minion", chance = 20, interval = 2000},
	{name = "Dread Minion", chance = 30, interval = 2000},
	{name = "Dread Minion", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 50,
	armor = 35
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
