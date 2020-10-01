local mType = Game.createMonsterType("Deepling Spellsinger")
local monster = {}

monster.description = "a deepling spellsinger"
monster.experience = 1000
monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 850
monster.maxHealth = 850
monster.race = "blood"
monster.corpse = 15208
monster.speed = 190
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
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 0,
	runHealth = 60,
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
	{text = "Jey Obu giotja!!", yell = false},
	{text = "Mmmmmoooaaaaaahaaa!!", yell = false}
}

monster.loot = {
	{id = "small sapphire", chance = 2854},
	{id = "gold coin", chance = 70000, maxCount = 60},
	{id = "platinum coin", chance = 80000},
	{id = "life ring", chance = 2439},
	{id = 2667, chance = 3448},
	{id = "fish fin", chance = 498},
	{id = "eye of a deepling", chance = 2500},
	{id = "deepling staff", chance = 2000},
	{id = "necklace of the deep", chance = 813},
	{id = "spellsinger's seal", chance = 14285},
	{id = "key to the Drowned Library", chance = 10000},
	{id = "deepling filet", chance = 14285},
	{id = "ornate crossbow", chance = 220}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -152, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -180, maxDamage = -350, type = COMBAT_ICEDAMAGE, length = 10, spread = 3, effect = CONST_ME_ICETORNADO, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -90, maxDamage = -130, type = COMBAT_DROWNDAMAGE, effect = CONST_ME_BUBBLES, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -140, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -60, maxDamage = -140, type = COMBAT_MANADRAIN, range = 7, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 5, range = 5, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
