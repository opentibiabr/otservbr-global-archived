local mType = Game.createMonsterType("Nymph")
local monster = {}

monster.description = "a nymph"
monster.experience = 850
monster.outfit = {
	lookType = 989,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 900
monster.maxHealth = 900
monster.race = "blood"
monster.corpse = 29094
monster.speed = 228
monster.summonCost = 450
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
	isSummonable = true,
	isAttackable = true,
	isHostile = true,
	isConvinceable = true,
	isPushable = false,
	rewardboss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 20,
	isHealthHidden = false,
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
	{text = "Looking at a nymph can blind you. Be careful, mortal being!", yell = false},
	{text = "Come here, sweetheart! I won't hurt you! *giggle*", yell = false},
	{text = "Are you one of those evil nightmare creatures? Leave this realm alone!", yell = false},
	{text = "I'm just protecting nature's beauty!", yell = false}
}

monster.loot = {
	{id = 2745, chance = 400},
	{id = 2195, chance = 150},
	{id = 29000, chance = 12000},
	{id = 2127, chance = 1800},
	{id = 9927, chance = 500},
	{id = 28996, chance = 15000, maxCount = 2},
	{id = 2148, chance = 65000, maxCount = 110},
	{id = 7590, chance = 3000},
	{id = 8873, chance = 650},
	{id = 10219, chance = 1000},
	{id = 7762, chance = 2000, maxCount = 2},
	{id = 9970, chance = 2500, maxCount = 2},
	{id = 7589, chance = 1000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -205, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -85, maxDamage = -135, type = COMBAT_ENERGY, range = 7, ShootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -85, maxDamage = -135, type = COMBAT_ENERGY, range = 4, ShootEffect = CONST_ANI_ENERGY, effect = CONST_ME_HEARTS, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -85, maxDamage = -135, type = COMBAT_EARTH, range = 7, effect = CONST_ME_HEARTS, target = true}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="combat", interval = 2000, chance = 15, minDamage = 75, maxDamage = 90, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 40},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
