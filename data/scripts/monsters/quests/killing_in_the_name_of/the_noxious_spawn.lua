local mType = Game.createMonsterType("The Noxious Spawn")
local monster = {}

monster.description = "The Noxious Spawn"
monster.experience = 6000
monster.outfit = {
	lookType = 220,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9500
monster.maxHealth = 9500
monster.race = "venom"
monster.corpse = 4323
monster.speed = 360
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 275,
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
	{text = "I bring you deathhhh, mortalssss", yell = false}
}

monster.loot = {
	{id = 10611, chance = 100000},
	{id = 11230, chance = 100000},
	{id = 2152, chance = 80000, maxCount = 5},
	{id = 7590, chance = 72000, maxCount = 4},
	{id = 2149, chance = 68000, maxCount = 5},
	{id = 7386, chance = 45000},
	{id = 2528, chance = 43000},
	{id = 7456, chance = 39000},
	{id = 2033, chance = 35000},
	{id = 2487, chance = 29000},
	{id = 7368, chance = 27000, maxCount = 78},
	{id = 2796, chance = 19000},
	{id = 2168, chance = 13000},
	{id = 8902, chance = 13000},
	{id = 2498, chance = 4000},
	{id = 8880, chance = 2000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -250, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 4000, chance = 20, SpeedChange = -370, Duration = 12000},
	{name ="combat", interval = 2000, chance = 7, minDamage = 0, maxDamage = -550, type = COMBAT_EARTHDAMAGE, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, minDamage = 0, maxDamage = -550, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = 0, maxDamage = -300, range = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	{name ="outfit", interval = 2000, chance = 11}
}

monster.defenses = {
	defense = 25,
	armor = 18,
	{name ="combat", interval = 2000, chance = 10, minDamage = 900, maxDamage = 1000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
