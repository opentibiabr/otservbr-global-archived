local mType = Game.createMonsterType("Crystalcrusher")
local monster = {}

monster.description = "a crystalcrusher"
monster.experience = 500
monster.outfit = {
	lookType = 511,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 570
monster.maxHealth = 570
monster.race = "venom"
monster.corpse = 18487
monster.speed = 390
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
	staticAttackChance = 80,
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
	{text = "Creak!", yell = false},
	{text = "Crackle!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 85000, maxCount = 90},
	{id = "crystalline arrow", chance = 5000, maxCount = 3},
	{id = "green crystal splinter", chance = 4920},
	{id = "brown crystal splinter", chance = 5250},
	{id = "blue crystal splinter", chance = 5000},
	{id = "crystalline spikes", chance = 3690}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -167, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -110, maxDamage = -260, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_GREEN_RINGS, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 30, minDamage = 5, maxDamage = 15, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 129, maxDamage = 175, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -3},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
