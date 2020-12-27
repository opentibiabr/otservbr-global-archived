local mType = Game.createMonsterType("Ushuriel")
local monster = {}

monster.description = "Ushuriel"
monster.experience = 10000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 95,
	lookLegs = 19,
	lookFeet = 112,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 31500
monster.maxHealth = 31500
monster.race = "fire"
monster.corpse = 6068
monster.speed = 440
monster.manaCost = 0
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
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You can't run or hide forever!", yell = false},
	{text = "I'm the executioner of the Seven!", yell = false},
	{text = "The final punishment awaits you!", yell = false},
	{text = "The judgement is guilty! The sentence is death!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 190},
	{id = "platinum coin", chance = 20000, maxCount = 26},
	{id = "orb", chance = 16666},
	{id = "life crystal", chance = 16666},
	{id = "mind stone", chance = 20000},
	{id = "spike sword", chance = 9090},
	{id = "fire sword", chance = 14285},
	{id = "giant sword", chance = 7692},
	{id = 2419, chance = 11111},
	{id = "warrior helmet", chance = 20000},
	{id = "strange helmet", chance = 8333},
	{id = "crown helmet", chance = 6250},
	{id = "royal helmet", chance = 20000},
	{id = "brown mushroom", chance = 50000, maxCount = 30},
	{id = "mysterious voodoo skull", chance = 12500},
	{id = "skull helmet", chance = 20000},
	{id = "iron ore", chance = 33333},
	{id = "spirit container", chance = 4761},
	{id = "flask of warrior's sweat", chance = 5555},
	{id = "enchanted chicken wing", chance = 7692},
	{id = "huge chunk of crude iron", chance = 14285},
	{id = "hardened bone", chance = 25000, maxCount = 20},
	{id = "demon horn", chance = 8333, maxCount = 2},
	{id = 6103, chance = 2063},
	{id = "demonic essence", chance = 100000},
	{id = 7385, chance = 10000},
	{id = "thaian sword", chance = 25000},
	{id = "dragon slayer", chance = 8333},
	{id = "runed sword", chance = 6666},
	{id = "great mana potion", chance = 20000},
	{id = "great health potion", chance = 20000},
	{id = "great spirit potion", chance = 20000},
	{id = "ultimate health potion", chance = 20000},
	{id = 9808, chance = 20000},
	{id = "gold ingot", chance = 16666}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1088},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, length = 10, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -760, radius = 5, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -585, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -430, radius = 6, effect = CONST_ME_ICETORNADO, target = false},
	{name ="drunk", interval = 3000, chance = 11, radius = 6, effect = CONST_ME_SOUND_PURPLE, target = false},
	-- energy damage
	{name ="condition", type = CONDITION_ENERGY, interval = 2000, chance = 15, minDamage = -250, maxDamage = -250, radius = 4, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 50,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 4, speedChange = 400, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
