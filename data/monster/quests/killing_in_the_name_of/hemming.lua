local mType = Game.createMonsterType("Hemming")
local monster = {}

monster.description = "Hemming"
monster.experience = 2850
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "blood"
monster.corpse = 18289
monster.speed = 210
monster.manaCost = 0
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
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

monster.summons = {
	{name = "War Wolf", chance = 100, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "GRRR", yell = false},
	{text = "GRROARR", yell = false}
}

monster.loot = {
	{id = 3031, chance = 100000, maxCount = 99},
	{id = 10317, chance = 100000},
	{id = 5897, chance = 100000},
	{id = 7643, chance = 98000},
	{id = 3725, chance = 94000, maxCount = 5},
	{id = 3035, chance = 94000, maxCount = 10},
	{id = 7439, chance = 82000},
	{id = 3081, chance = 70000},
	{id = 3027, chance = 62000, maxCount = 5},
	{id = 5479, chance = 31000},
	{id = 3741, chance = 21000},
	{id = 10389, chance = 15000},
	{id = 7419, chance = 9800},
	{id = 3053, chance = 6000},
	{id = 7428, chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -180, maxDamage = -265, radius = 3, effect = CONST_ME_SOUND_RED, target = false},
	{name ="outfit", interval = 2000, chance = 5, effect = CONST_ME_SOUND_BLUE, target = false, duration = 2000, outfitMonster = "Werewolf"},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, radius = 3, effect = CONST_ME_SOUND_WHITE, target = false},
	{name ="werewolf skill reducer", interval = 2000, chance = 15, range = 1, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 200, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 300, range = 7, effect = CONST_ME_SOUND_PURPLE, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
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
