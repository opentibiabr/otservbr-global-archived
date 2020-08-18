local mType = Game.createMonsterType("The Pale Count")
local monster = {}

monster.description = "The Pale Count"
monster.experience = 28000
monster.outfit = {
	lookType = 557,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 21270
monster.speed = 500
monster.summonCost = 0
monster.maxSummons = 4

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
	{name = "Nightfiend", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Feel the hungry kiss of death!", yell = false},
	{text = "The monsters in the mirror will come eat your dreams.", yell = false},
	{text = "Your pitiful life has come to an end!", yell = false},
	{text = "I will squish you like a maggot and suck you dry!", yell = false},
	{text = "Yield to the inevitable!", yell = false},
	{text = "Some day I shall see my beautiful face in a mirror again.", yell = false}
}

monster.loot = {
	{id = 9020, chance = 100000},
	{id = 21244, chance = 100000},
	{id = 21253, chance = 5000},
	{id = 21252, chance = 5000},
	{id = 12405, chance = 50000},
	{id = 10602, chance = 50000},
	{id = 21400, chance = 5000},
	{id = 2148, chance = 1000000, maxCount = 100},
	{id = 2152, chance = 100000, maxCount = 5},
	{id = 7589, chance = 50000, maxCount = 3},
	{id = 7588, chance = 50000, maxCount = 3},
	{id = 2165, chance = 10000},
	{id = 2214, chance = 10000},
	{id = 5909, chance = 10000},
	{id = 5911, chance = 10000},
	{id = 5912, chance = 10000},
	{id = 7427, chance = 5000},
	{id = 2438, chance = 10000},
	{id = 7419, chance = 5000},
	{id = 8903, chance = 5000},
	{id = 21707, chance = 5000},
	{id = 2534, chance = 5000},
	{id = 21708, chance = 5000},
	{id = 2145, chance = 50000, maxCount = 5},
	{id = 2144, chance = 50000, maxCount = 5},
	{id = 2146, chance = 50000, maxCount = 5},
	{id = 2149, chance = 50000, maxCount = 5},
	{id = 2153, chance = 10000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 80, attack = 120, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 1000, chance = 17, SpeedChange = -600, Duration = 1500},
	{name ="combat", interval = 2000, chance = 21, minDamage = -130, maxDamage = -350, type = COMBAT_ICE, range = 6, ShootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_GIANTICE, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -120, type = COMBAT_MANADRAIN, range = 7, ShootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = false}
}

monster.defenses = {
	defense = 75,
	armor = 75
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
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
