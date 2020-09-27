local mType = Game.createMonsterType("Diremaw")
local monster = {}

monster.description = "a diremaw"
monster.experience = 2500
monster.outfit = {
	lookType = 1034,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 30729
monster.speed = 300
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
	canPushCreatures = true,
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
	{text = "uuaarrrrrrr", yell = false},
	{text = "clic clic clic", yell = false}
}

monster.loot = {
	{id = "Ham", chance = 40080, maxCount = 4},
	{id = "Diremaw Brainpan", chance = 24120},
	{id = "Poisonous Slime", chance = 11930, maxCount = 5},
	{id = "Blue Crystal Shard", chance = 9660},
	{id = "Violet Crystal Shard", chance = 8180},
	{id = "Green Crystal Shard", chance = 8030},
	{id = "Onyx Chip", chance = 8560, maxCount = 4},
	{id = "Diremaw Legs", chance = 9650, maxCount = 2},
	{id = "Small Enchanted Emerald", chance = 2940, maxCount = 2},
	{id = "Small Emerald", chance = 5080, maxCount = 2},
	{id = "Gold Ingot", chance = 2970},
	{id = 7632, chance = 3100},
	{id = "Suspicious Device", chance = 600},
	{id = "Mycological Bow", chance = 1200},
	{id = "Mushroom Backpack", chance = 1500}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 25, minDamage = -150, maxDamage = -200, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -150, maxDamage = -250, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POFF, target = true},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 21, minDamage = -200, maxDamage = -310, effect = CONST_ME_GREEN_RINGS, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
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
