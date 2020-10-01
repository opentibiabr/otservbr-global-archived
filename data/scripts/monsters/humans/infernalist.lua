local mType = Game.createMonsterType("Infernalist")
local monster = {}

monster.description = "an infernalist"
monster.experience = 4000
monster.outfit = {
	lookType = 130,
	lookHead = 78,
	lookBody = 76,
	lookLegs = 94,
	lookFeet = 115,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 3650
monster.maxHealth = 3650
monster.race = "blood"
monster.corpse = 20427
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 1

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
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 4,
	runHealth = 900,
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
	{name = "fire elemental", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Nothing will remain but your scorched bones!", yell = false},
	{text = "Some like it hot!", yell = false},
	{text = "It's cooking time!", yell = false},
	{text = "Feel the heat of battle!", yell = false}
}

monster.loot = {
	{id = "red tome", chance = 300},
	{id = "piggy bank", chance = 220},
	{id = "gold coin", chance = 56500, maxCount = 100},
	{id = "gold coin", chance = 40000, maxCount = 47},
	{id = "energy ring", chance = 1800},
	{id = "skull staff", chance = 6500},
	{id = "magic sulphur", chance = 600},
	{id = "red piece of cloth", chance = 1420},
	{id = "great mana potion", chance = 19700},
	{id = "great health potion", chance = 1900},
	{id = "small enchanted ruby", chance = 4250},
	{id = "magma boots", chance = 300},
	{id = "raspberry", chance = 8500, maxCount = 5},
	{id = "spellbook of mind control", chance = 370},
	{id = "royal tapestry", chance = 520},
	{id = "black skull", chance = 820},
	{id = "gold ingot", chance = 70},
	{id = "crystal of power", chance = 220}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 40, minDamage = -65, maxDamage = -180, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -90, maxDamage = -180, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -53, maxDamage = -120, type = COMBAT_MANADRAIN, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_TELEPORT, target = true},
	{name ="firefield", interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -150, maxDamage = -250, type = COMBAT_FIREDAMAGE, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -100, maxDamage = -150, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_EXPLOSIONAREA, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 15, minDamage = 60, maxDamage = 230, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 95},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
