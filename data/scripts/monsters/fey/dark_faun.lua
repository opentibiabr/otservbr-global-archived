local mType = Game.createMonsterType("Dark Faun")
local monster = {}

monster.description = "a dark faun"
monster.experience = 900
monster.outfit = {
	lookType = 980,
	lookHead = 94,
	lookBody = 114,
	lookLegs = 57,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1300
monster.maxHealth = 1300
monster.race = "blood"
monster.corpse = 29101
monster.speed = 216
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.changeStrategies = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	respawnType = "night"
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Blood, fight and rage!", yell = false},
	{text = "This will be your last dance!", yell = false},
	{text = "You're a threat to this realm! You have to die!", yell = false},
	{text = "This is a nightmare and you won't wake up!", yell = false}
}

monster.loot = {
	{id = "gold coin", maxCount = 11, chance = 30000},
	{id = "wood cape", chance = 492},
	{id = "wooden spellbook", chance = 92},
	{id = "mandrake", chance = 50},
	{id = "leaf legs", chance = 492},
	{id = "small stone", maxCount = 4, chance = 492},
	{id = "small enchanted sapphire", maxCount = 2, chance = 492},
	{id = "shimmering beetles", chance = 492},
	{id = "cave turnip", maxCount = 4, chance = 55000},
	{id = "leaf legs", chance = 719},
	{id = "dark mushroom", chance = 719},
	{id = "panpipes", chance = 719},
	{id = "prismatic quartz", chance = 719},
	{id = "leaf star", maxCount = 8, chance = 10000},
	{id = "strong health potion", maxCount = 2, chance = 6800},
	{id = "goat grass", chance = 5155},
	{id = "great health potion", chance = 591}
}

monster.attacks = {
	{name ="melee", interval = 2000, minDamage = 0, maxDamage = -515},
	-- earth damage
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, range = 7, minDamage = -60, maxDamage = -115, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="drunk", interval = 2000, chance = 11, minDamage = -60, maxDamage = -115, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 450, Duration = 5000},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = 110, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 40},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
