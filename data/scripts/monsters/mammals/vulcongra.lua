local mType = Game.createMonsterType("Vulcongra")
local monster = {}

monster.description = "a vulcongra"
monster.experience = 1100
monster.outfit = {
	lookType = 509,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "fire"
monster.corpse = 18476
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 220,
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
	{text = "Fuchah! Fuchah!", yell = false},
	{text = "Fuchah!", yell = false},
	{text = "Yag! Yag! Yag!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 7},
	{id = "platinum coin", chance = 14780},
	{id = "wand of inferno", chance = 1000},
	{id = "sword ring", chance = 2920},
	{id = "fire sword", chance = 260},
	{id = "banana", chance = 10420, maxCount = 10},
	{id = "strong health potion", chance = 7100},
	{id = "strong mana potion", chance = 7100},
	{id = "magma amulet", chance = 970},
	{id = "magma coat", chance = 140},
	{id = "fiery heart", chance = 9380},
	{id = 13757, chance = 940},
	{id = "brown crystal splinter", chance = 4850},
	{id = "red crystal fragment", chance = 2280},
	{id = "magma clump", chance = 12440},
	{id = "blazing bone", chance = 8030}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -235, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -195, maxDamage = -340, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 3000, chance = 100, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
