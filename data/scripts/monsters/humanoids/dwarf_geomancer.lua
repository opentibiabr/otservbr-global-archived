local mType = Game.createMonsterType("Dwarf Geomancer")
local monster = {}

monster.description = "a dwarf geomancer"
monster.experience = 265
monster.outfit = {
	lookType = 66,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 380
monster.maxHealth = 380
monster.race = "blood"
monster.corpse = 6015
monster.speed = 200
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 4,
	runHealth = 110,
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
	{text = "Hail Durin!", yell = false},
	{text = "Earth is the strongest element.", yell = false},
	{text = "Dust to dust.", yell = false}
}

monster.loot = {
	{id = "small sapphire", chance = 710},
	{id = "gold coin", chance = 50000, maxCount = 35},
	{id = 2162, chance = 14000},
	{id = 2175, chance = 360},
	{id = "dwarven ring", chance = 530},
	{id = "blank rune", chance = 33000},
	{id = "clerical mace", chance = 1120},
	{id = "pear", chance = 25000},
	{id = "white mushroom", chance = 60000, maxCount = 2},
	{id = "iron ore", chance = 120},
	{id = "terra boots", chance = 470},
	{id = "geomancer's robe", chance = 8000},
	{id = "geomancer's staff", chance = 7000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 20, minDamage = -50, maxDamage = -110, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -50, maxDamage = -80, type = COMBAT_MANADRAIN, range = 7, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 40, minDamage = 75, maxDamage = 125, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 60},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -1}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
