local mType = Game.createMonsterType("Dragon Lord")
local monster = {}

monster.description = "a dragon lord"
monster.experience = 2100
monster.outfit = {
	lookType = 39,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 5984
monster.speed = 200
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "ZCHHHHHHH", yell = true},
	{text = "YOU WILL BURN!", yell = true}
}

monster.loot = {
	{id = 1976, chance = 9000},
	{id = "golden mug", chance = 3190},
	{id = "small sapphire", chance = 5300},
	{id = "gold coin", chance = 33750, maxCount = 100},
	{id = "gold coin", chance = 33750, maxCount = 100},
	{id = "gold coin", chance = 33750, maxCount = 45},
	{id = "energy ring", chance = 5250},
	{id = "life crystal", chance = 680},
	{id = "fire sword", chance = 290},
	{id = "strange helmet", chance = 360},
	{id = "dragon scale mail", chance = 170},
	{id = "royal helmet", chance = 280},
	{id = "tower shield", chance = 250},
	{id = "power bolt", chance = 6700, maxCount = 7},
	{id = "dragon ham", chance = 80000, maxCount = 5},
	{id = "green mushroom", chance = 12000},
	{id = "red dragon scale", chance = 1920},
	{id = "red dragon leather", chance = 1040},
	{id = "royal spear", chance = 8800, maxCount = 3},
	{id = "dragon lord trophy", chance = 80},
	{id = "dragon slayer", chance = 100},
	{id = "strong health potion", chance = 970}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -230, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -200, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 2000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -230, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 57, maxDamage = 93, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
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
