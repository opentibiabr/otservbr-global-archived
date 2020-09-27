local mType = Game.createMonsterType("Realityquake")
local monster = {}

monster.description = "Realityquake"
monster.experience = 80000
monster.outfit = {
	lookTypeEx = 1387
}

monster.health = 110000
monster.maxHealth = 110000
monster.race = "venom"
monster.corpse = 26223
monster.speed = 400
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 3000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
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

monster.events = {"HeartBossDeath"}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 200},
	{id = 7590, chance = 8000, maxCount = 5},
	{id = 8472, chance = 8000, maxCount = 5},
	{id = 8473, chance = 8000, maxCount = 5},
	{id = 26191, chance = 8000, maxCount = 5},
	{id = 18413, chance = 8000, maxCount = 3},
	{id = 18415, chance = 8000, maxCount = 3},
	{id = 2149, chance = 8000, maxCount = 5},
	{id = 2147, chance = 8000, maxCount = 5},
	{id = 18414, chance = 8000, maxCount = 3},
	{id = 26163, chance = 8000},
	{id = 26164, chance = 8000},
	{id = 2156, chance = 8000},
	{id = 25377, chance = 100000},
	{id = 26165, chance = 100000},
	{id = 26166, chance = 100000},
	{id = 7632, chance = 4000},
	{id = 7633, chance = 4000},
	{id = 2189, chance = 8000},
	{id = 26187, chance = 6000},
	{id = 26189, chance = 6000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -800, type = COMBAT_ENERGY, length = 10, spread = 3, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -800, type = COMBAT_PHYSICAL, length = 10, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -240, maxDamage = -600, type = COMBAT_PHYSICAL, effect = CONST_ME_POFF, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -240, maxDamage = -600, type = COMBAT_HOLY, ShootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -200, maxDamage = -450, type = COMBAT_EARTH, length = 4, spread = 2, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -240, maxDamage = -600, type = COMBAT_DEATH, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 40, target = false}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, effect = CONST_ME_POFF, target = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
