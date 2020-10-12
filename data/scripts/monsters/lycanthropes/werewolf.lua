local mType = Game.createMonsterType("Werewolf")
local monster = {}

monster.description = "a werewolf"
monster.experience = 1900
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1955
monster.maxHealth = 1955
monster.race = "blood"
monster.corpse = 20380
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
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
	{name = "war wolf", chance = 40, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "GRRR", yell = true},
	{text = "GRROARR", yell = true}
}

monster.loot = {
	{id = 2148, chance = 98000, maxCount = 230},
	{id = 2169, chance = 800},
	{id = "platinum amulet", chance = 870},
	{id = "stone skin amulet", chance = 1000},
	{id = "halberd", chance = 3000},
	{id = "epee", chance = 560},
	{id = "plate shield", chance = 10340},
	{id = "brown mushroom", chance = 6940},
	{id = "troll green", chance = 1900},
	{id = "wolf paw", chance = 5200},
	{id = "relic sword", chance = 480},
	{id = "dreaded cleaver", chance = 160},
	{id = "bonebreaker", chance = 400},
	{id = "berserk potion", chance = 1200},
	{id = "strong health potion", chance = 5000},
	{id = "ultimate health potion", chance = 2400},
	{id = 9809, chance = 210},
	{id = 24708, chance = 15000},
	{id = "werewolf fur", chance = 10650}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350, effect = CONST_ME_DRAWBLOOD},
	{name ="outfit", interval = 2000, chance = 1},
	{name ="combat", interval = 2000, chance = 10, minDamage = -80, maxDamage = -200, type = COMBAT_LIFEDRAIN, length = 4, spread = 2, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_SOUND_WHITE, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_SOUND_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 15, range = 1, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, minDamage = 120, maxDamage = 225, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 400, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 65},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
