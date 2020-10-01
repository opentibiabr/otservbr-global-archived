local mType = Game.createMonsterType("Crystal Wolf")
local monster = {}

monster.description = "a crystal wolf"
monster.experience = 275
monster.outfit = {
	lookType = 391,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750
monster.maxHealth = 750
monster.race = "undead"
monster.corpse = 13584
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 0

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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
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
	{text = "Raaarrr!", yell = false},
	{text = "Aaaauuuuuooooooo!!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 56000, maxCount = 52},
	{id = "hailstorm rod", chance = 7400},
	{id = "meat", chance = 52000, maxCount = 4},
	{id = "wolf paw", chance = 3700},
	{id = "shiver arrow", chance = 11000, maxCount = 10},
	{id = "crystalline armor", chance = 3700}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -130, type = COMBAT_EARTHDAMAGE, length = 3, spread = 2, effect = CONST_ME_STONES, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -80, maxDamage = -150, type = COMBAT_ICEDAMAGE, range = 6, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_GIANTICE, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -25, maxDamage = -80, type = COMBAT_MANADRAIN, range = 7, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 5, minDamage = 15, maxDamage = 55, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
