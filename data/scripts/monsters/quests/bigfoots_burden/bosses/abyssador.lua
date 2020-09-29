local mType = Game.createMonsterType("Abyssador")
local monster = {}

monster.description = "Abyssador"
monster.experience = 50000
monster.outfit = {
	lookType = 495,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 340000
monster.maxHealth = 340000
monster.race = "blood"
monster.corpse = 17412
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
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
	{text = "*** STEALTH ***", yell = false},
	{text = "*** TIME ***", yell = false},
	{text = "*** IMPORTANT ***", yell = false},
	{text = "*** BRAINS *** SMALL ***", yell = false},
	{text = "*** DEATH ***", yell = false},
	{text = "*** FIRE *** HOME *** VICTORY ***", yell = false},
	{text = "*** EXISTENCE *** FUTILE ***", yell = false}
}

monster.loot = {
	{id = 18496, chance = 100000},
	{id = 18453, chance = 8333},
	{id = 18451, chance = 7333},
	{id = 18465, chance = 5333},
	{id = 18450, chance = 6666},
	{id = 18454, chance = 6263},
	{id = 18449, chance = 2754},
	{id = 18452, chance = 2754}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 3000, chance = 100, skill = 300, attack = 150, effect = CONST_ME_DRAWBLOOD},
	-- energy damage
	{name ="combat", type = COMBAT_ENERGYDAMAGE, interval = 1000, chance = 10, minDamage = -800, maxDamage = -800, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -500, maxDamage = -1600, type = COMBAT_ENERGYDAMAGE, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1000, chance = 20, minDamage = -1000, maxDamage = -1800, length = 5, spread = 2, effect = CONST_ME_PLANTATTACK, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 1, minDamage = 0, maxDamage = 300000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 5000, chance = 30, minDamage = 1000, maxDamage = 1000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 25, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
