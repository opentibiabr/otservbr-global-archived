local mType = Game.createMonsterType("Percht")
local monster = {}

monster.description = "an percht"
monster.experience = 600
monster.outfit = {
	lookType = 1161,
	lookHead = 95,
	lookBody = 42,
	lookLegs = 19,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 620
monster.maxHealth = 620
monster.race = "blood"
monster.corpse = 35125
monster.speed = 270
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 50,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Krikik krikik!", yell = false},
	{text = "Shzzzp shzzzp shzzp!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 60},
	{id = "fireworks capsule", chance = 12360},
	{id = "percht horns", chance = 9790},
	{id = "grainy fireworks powder", chance = 6640},
	{id = "broken bell", chance = 5390},
	{id = "versicolour fireworks powder", chance = 4220},
	{id = 35152, chance = 3190},
	{id = "green fireworks powder", chance = 2790},
	{id = "purple fireworks powder", chance = 2090},
	{id = "turquoise fireworks powder", chance = 1980},
	{id = "orange fireworks powder", chance = 1870},
	{id = "yellow fireworks powder", chance = 1870},
	{id = "red fireworks powder", chance = 1830},
	{id = "magma amulet", chance = 1320},
	{id = "magma coat", chance = 1320},
	{id = "magma monocle", chance = 950},
	{id = "magma legs", chance = 510}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 70, minDamage = -100, maxDamage = -125, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false},
	{name ="combat", interval = 2000, chance = 50, minDamage = -90, maxDamage = -250, type = COMBAT_ICEDAMAGE, length = 3, spread = 0, effect = CONST_ME_GIANTICE, target = false},
	{name ="combat", interval = 2000, chance = 50, minDamage = -100, maxDamage = -250, type = COMBAT_FIREDAMAGE, radius = 3, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 50, minDamage = -100, maxDamage = -250, type = COMBAT_FIREDAMAGE, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 50, minDamage = -100, maxDamage = -250, type = COMBAT_FIREDAMAGE, length = 3, spread = 0, effect = CONST_ME_FIREATTACK, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
