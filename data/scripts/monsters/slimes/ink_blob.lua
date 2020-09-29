local mType = Game.createMonsterType("Ink Blob")
local monster = {}

monster.description = "an ink blob"
monster.experience = 14450
monster.outfit = {
	lookType = 1064,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9500
monster.maxHealth = 9500
monster.race = "undead"
monster.corpse = 33345
monster.speed = 380
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 85,
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
}

monster.loot = {
	{id = "Platinum Coin", chance = 120000, maxCount = 4},
	{id = "Envenomed Arrow", chance = 1200, maxCount = 14},
	{id = 33315, chance = 1200, maxCount = 4},
	{id = "Poisonous Slime", chance = 1200, maxCount = 4},
	{id = "Small Diamond", chance = 1200, maxCount = 4},
	{id = "Small Topaz", chance = 1200, maxCount = 4},
	{id = 7633, chance = 900, maxCount = 4},
	{id = "Blue Gem", chance = 950, maxCount = 4},
	{id = "Terra Boots", chance = 850, maxCount = 4},
	{id = "Terra Hood", chance = 980, maxCount = 4},
	{id = "Protection Amulet", chance = 1200, maxCount = 4},
	{id = "Sacred Tree Amulet", chance = 1200, maxCount = 4},
	{id = "Springsprout Rod", chance = 790, maxCount = 4},
	{id = "Stone Skin Amulet", chance = 1200, maxCount = 4},
	{id = "Terra Legs", chance = 650, maxCount = 4},
	{id = "Terra Mantle", chance = 550, maxCount = 4},
	{id = "Clay Lump", chance = 1200, maxCount = 4},
	{id = "Terra Amulet", chance = 1200, maxCount = 4}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 45, attack = 40, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 280, interval = 4000}},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 13, minDamage = -400, maxDamage = -580, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 11, minDamage = -285, maxDamage = -480, shootEffect = CONST_ANI_ENVENOMEDARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -260, maxDamage = -505, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 5, minDamage = 20, maxDamage = 30, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
