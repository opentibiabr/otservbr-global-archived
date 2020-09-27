local mType = Game.createMonsterType("Haunted Dragon")
local monster = {}

monster.description = "a haunted dragon"
monster.experience = 6500
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6500
monster.maxHealth = 6500
monster.race = "undead"
monster.corpse = 6306
monster.speed = 280
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
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
	{id = "black pearl", chance = 22780, maxCount = 2},
	{id = "small sapphire", chance = 28370, maxCount = 2},
	{id = "gold coin", chance = 35500, maxCount = 100},
	{id = "gold coin", chance = 55500, maxCount = 98},
	{id = "platinum coin", chance = 52000, maxCount = 5},
	{id = "life crystal", chance = 2500},
	{id = "hardened bone", chance = 14180},
	{id = 6300, chance = 1150},
	{id = "demonic essence", chance = 12460},
	{id = "assassin star", chance = 26650, maxCount = 5},
	{id = "dragon slayer", chance = 860},
	{id = "dragonbone staff", chance = 4000},
	{id = "great mana potion", chance = 21490},
	{id = "great health potion", chance = 21200},
	{id = "skullcracker armor", chance = 290},
	{id = "gold ingot", chance = 570},
	{id = "unholy bone", chance = 33380},
	{id = "spellweaver's robe", chance = 860}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -480, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 5, minDamage = -300, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, range = 7, effect = CONST_ME_DRAWBLOOD, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -125, maxDamage = -600, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -100, maxDamage = -390, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -180, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -150, maxDamage = -690, type = COMBAT_EARTHDAMAGE, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -700, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -200, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
