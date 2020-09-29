local mType = Game.createMonsterType("Werefox")
local monster = {}

monster.description = "a Werefox"
monster.experience = 1600
monster.outfit = {
	lookType = 1030,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 30756
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 1

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

monster.summons = {
	{name = "fox", chance = 10, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Yelp!", yell = false},
	{text = "Grrrrrr", yell = false}
}

monster.loot = {
	{id = "Gold Coin", chance = 405000, maxCount = 200},
	{id = "Platinum Coin", chance = 4050, maxCount = 2},
	{id = "Fox Paw", chance = 4050, maxCount = 2},
	{id = "Werefox Tail", chance = 4050, maxCount = 2},
	{id = "Strong Mana Potion", chance = 4050, maxCount = 2},
	{id = "Great Mana Potion", chance = 4050, maxCount = 2},
	{id = "Mana Potion", chance = 4050, maxCount = 2},
	{id = "Small Enchanted Emerald", chance = 4050, maxCount = 2},
	{id = "Emerald Bangle", chance = 4050, maxCount = 2},
	{id = "Moonlight Rod", chance = 500},
	{id = "Troll Green", chance = 500, maxCount = 2},
	{id = "Assassin Star", chance = 300, maxCount = 5},
	{id = "Platinum Amulet", chance = 130},
	{id = "Ring of Healing", chance = 200},
	{id = "Werewolf Amulet", chance = 50},
	{id = 30941, chance = 30}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -290, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -200, type = COMBAT_PHYSICALDAMAGE, shootEffect = CONST_ANI_GREENSTAR, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -225, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 14, minDamage = -100, maxDamage = -700, type = COMBAT_DEATHDAMAGE, length = 5, spread = 3, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="combat", interval = 4000, chance = 15, minDamage = 50, maxDamage = 145, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 1},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 90},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
