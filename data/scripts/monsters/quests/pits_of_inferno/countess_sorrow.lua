local mType = Game.createMonsterType("Countess Sorrow")
local monster = {}

monster.description = "Countess Sorrow"
monster.experience = 13000
monster.outfit = {
	lookType = 241,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6500
monster.maxHealth = 6500
monster.race = "undead"
monster.corpse = 6344
monster.speed = 400
monster.summonCost = 0
monster.maxSummons = 3

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 540,
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
	{name = "Phantasm", chance = 7,000000000000001, interval = 2000, max = 3},
	{name = "Phantasm summon", chance = 7,000000000000001, interval = 2000, max = 3}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I'm so sorry ... for youuu!", yell = false},
	{text = "You won't rest in peace! Never ever!", yell = false},
	{text = "Sleep ... for eternity!", yell = false},
	{text = "Dreams can come true. As my dream of killing you.", yell = false}
}

monster.loot = {
	{id = 6536, chance = 100000},
	{id = 6500, chance = 20590},
	{id = 2148, chance = 82350, maxCount = 169},
	{id = 2152, chance = 55880, maxCount = 4},
	{id = 5944, chance = 85290},
	{id = 2656, chance = 32350},
	{id = 2424, chance = 4210},
	{id = 2647, chance = 8820},
	{id = 2200, chance = 23530},
	{id = 2165, chance = 5880},
	{id = 2238, chance = 47060}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 156, attack = 100, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 920, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -420, maxDamage = -980, type = COMBAT_LIFEDRAIN, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true},
	{name ="combat", interval = 2000, chance = 12, minDamage = -45, maxDamage = -90, type = COMBAT_MANADRAIN, effect = CONST_ME_YELLOW_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 20, target = false},
	{name ="drunk", interval = 2000, chance = 15, range = 7, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="combat", interval = 2000, chance = 26, minDamage = 415, maxDamage = 625, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_POFF},
	{name ="speed", interval = 2000, chance = 11, SpeedChange = 736, Duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
