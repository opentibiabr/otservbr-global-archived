local mType = Game.createMonsterType("Frazzlemaw")
local monster = {}

monster.description = "a frazzlemaw"
monster.experience = 3740
monster.outfit = {
	lookType = 594,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4100
monster.maxHealth = 4100
monster.race = "blood"
monster.corpse = 22567
monster.speed = 400
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
	{text = "Mwaaaahnducate youuuuuu *gurgle*, mwaaah!", yell = false},
	{text = "Mwaaahgod! Overmwaaaaah! *gurgle*", yell = false},
	{text = "MMMWAHMWAHMWAHMWAAAAH!", yell = false},
	{text = "Mmmwhamwhamwhah, mwaaah!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "platinum coin", chance = 100000, maxCount = 7},
	{id = "banana skin", chance = 9500},
	{id = "piece of iron", chance = 10400},
	{id = "fishbone", chance = 10000},
	{id = 2229, chance = 12680},
	{id = 2230, chance = 10000},
	{id = 2231, chance = 5500},
	{id = "two handed sword", chance = 3200},
	{id = 2667, chance = 6750, maxCount = 3},
	{id = "ham", chance = 6000, maxCount = 2},
	{id = "iron ore", chance = 3000},
	{id = "fish fin", chance = 4700},
	{id = "hardened bone", chance = 5000},
	{id = 5951, chance = 10800},
	{id = "assassin dagger", chance = 1000},
	{id = "haunted blade", chance = 2240},
	{id = "nightmare blade", chance = 1100},
	{id = "great mana potion", chance = 15000, maxCount = 3},
	{id = "great health potion", chance = 15000, maxCount = 2},
	{id = "gold ingot", chance = 2300},
	{id = "sai", chance = 1460},
	{id = "violet crystal shard", chance = 3000},
	{id = "brown crystal splinter", chance = 16000},
	{id = "red crystal fragment", chance = 7600},
	{id = 33539, chance = 10000},
	{id = "cluster of solace", chance = 450},
	{id = "frazzle tongue", chance = 18760},
	{id = "frazzle skin", chance = 16000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD},
	-- bleed
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 10, minDamage = -300, maxDamage = -400, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -700, type = COMBAT_PHYSICALDAMAGE, length = 5, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 15000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -80, maxDamage = -150, type = COMBAT_MANADRAIN, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 15, minDamage = 250, maxDamage = 425, type = COMBAT_HEALING, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
