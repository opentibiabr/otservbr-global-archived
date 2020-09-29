local mType = Game.createMonsterType("Stonerefiner")
local monster = {}

monster.description = "a Stonerefiner"
monster.experience = 500
monster.outfit = {
	lookType = 1032,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 800
monster.maxHealth = 800
monster.race = "blood"
monster.corpse = 30771
monster.speed = 220
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
	{text = "knak knak knak", yell = false},
	{text = "nomnomnom", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 50930, maxCount = 4},
	{id = "rare earth", chance = 39750, maxCount = 2},
	{id = 13757, chance = 27980, maxCount = 5},
	{id = "glob of acid slime", chance = 23680},
	{id = "stonerefiner's skull", chance = 20110},
	{id = "poisonous slime", chance = 20040, maxCount = 3},
	{id = "half-digested stones", chance = 15210, maxCount = 5}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -70, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -40, maxDamage = -80, range = 7, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 20
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
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
