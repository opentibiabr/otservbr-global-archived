local mType = Game.createMonsterType("Animated Guzzlemaw")
local monster = {}

monster.description = "an animated guzzlemaw"
monster.experience = 5500
monster.outfit = {
	lookType = 584,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6400
monster.maxHealth = 6400
monster.race = "blood"
monster.corpse = 22485
monster.speed = 270
monster.manaCost = 0
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
	staticAttackChance = 80,
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
	{text = "Gmmmooooh! *chomp*", yell = false},
	{text = "MWAAAH! *gurgle*", yell = false},
	{text = "*chomp* Mmmoh! *chomp*", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "platinum coin", chance = 100000, maxCount = 7},
	{id = "banana skin", chance = 10700},
	{id = "piece of iron", chance = 10500},
	{id = "fishbone", chance = 9500},
	{id = 2229, chance = 10400},
	{id = 2230, chance = 9200},
	{id = 2231, chance = 4500},
	{id = "remains of a fish", chance = 10110},
	{id = "two handed sword", chance = 2700},
	{id = 2667, chance = 7000, maxCount = 3},
	{id = "ham", chance = 10000},
	{id = "iron ore", chance = 3000},
	{id = "fish fin", chance = 5000},
	{id = "hardened bone", chance = 5700},
	{id = "assassin dagger", chance = 1000},
	{id = "haunted blade", chance = 2000},
	{id = "nightmare blade", chance = 380},
	{id = "great mana potion", chance = 17000, maxCount = 3},
	{id = "great health potion", chance = 18500, maxCount = 2},
	{id = "sai", chance = 1200},
	{id = "violet crystal shard", chance = 3000},
	{id = "brown crystal splinter", chance = 12000, maxCount = 2},
	{id = "red crystal fragment", chance = 7600},
	{id = 33539, chance = 12000},
	{id = "cluster of solace", chance = 920},
	{id = "frazzle tongue", chance = 15000},
	{id = "frazzle skin", chance = 14000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -499},
	-- bleed
	{name ="condition", type = CONDITION_BLEEDING, interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, radius = 3, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -900, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -500, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true},
	{name ="speed", interval = 2000, chance = 15, speedChange = -800, radius = 6, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 250, maxDamage = 425, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
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
