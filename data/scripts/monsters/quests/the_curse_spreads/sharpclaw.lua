local mType = Game.createMonsterType("Sharpclaw")
local monster = {}

monster.description = "a sharpclaw"
monster.experience = 3000
monster.outfit = {
	lookType = 1031,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3300
monster.maxHealth = 3300
monster.race = "blood"
monster.corpse = 24723
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 2

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
	targetDistance = 0,
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
	{name = "Werebadger", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "The toughness of badgers will outlast the hostile!", yell = false},
	{text = "Never underestimate a badger!", yell = false}
}

monster.loot = {
	{id = "Gold Coin", chance = 13600000, maxCount = 100},
	{id = "Gold Coin", chance = 13600000, maxCount = 100},
	{id = "Platinum Coin", chance = 13600000, maxCount = 10},
	{id = "Brown Mushroom", chance = 13600000, maxCount = 9},
	{id = "Onyx Chip", chance = 13600000, maxCount = 9},
	{id = "Small Enchanted Amethyst", chance = 13600000, maxCount = 9},
	{id = "Beetroot", chance = 13600000, maxCount = 9},
	{id = "Great Mana Potion", chance = 13600000, maxCount = 9},
	{id = "Platinum Amulet", chance = 13600000},
	{id = "Ring of Healing", chance = 13600000},
	{id = "Troll Green", chance = 13600000, maxCount = 9},
	{id = "Ultimate Mana Potion", chance = 13600000, maxCount = 9},
	{id = "Werebadger Claws", chance = 13600000, maxCount = 9},
	{id = "Werebadger Skull", chance = 13600000, maxCount = 9},
	{id = "Badger Boots", chance = 400},
	{id = "Underworld Rod", chance = 400},
	{id = "Wand of Voodoo", chance = 400},
	{id = "Wolf Backpack", chance = 250}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -290, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 20, minDamage = 100, maxDamage = 720, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 20000},
	{name ="combat", interval = 1000, chance = 14, minDamage = -100, maxDamage = -700, type = COMBAT_DEATHDAMAGE, length = 5, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="outfit", interval = 1000, chance = 1},
	{name ="combat", interval = 2000, chance = 5, range = 1, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="combat", interval = 4000, chance = 15, minDamage = 150, maxDamage = 345, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
