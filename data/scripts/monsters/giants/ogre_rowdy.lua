local mType = Game.createMonsterType("Ogre Rowdy")
local monster = {}

monster.description = "an ogre rowdy"
monster.experience = 4200
monster.outfit = {
	lookType = 1213,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 36366
monster.speed = 420
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	staticAttackChance = 70,
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
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 3},
	{id = "flaming arrow", chance = 22040, maxCount = 19},
	{id = "ogre ear stud", chance = 12900},
	{id = "ogre nose ring", chance = 20970},
	{id = "skull fetish", chance = 12900},
	{id = "wand of inferno", chance = 8600},
	{id = "jalapeno pepper", chance = 3760, maxCount = 3},
	{id = "wand of draconia", chance = 2150},
	{id = "wand of everblazing", chance = 1080},
	{id = "ogre choppa", chance = 540}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 13, minDamage = -250, maxDamage = -400, type = COMBAT_FIREDAMAGE, range = 5, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -450, type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, minDamage = -280, maxDamage = -420, type = COMBAT_FIREDAMAGE, range = 3, shootEffect = CONST_ANI_FLAMMINGARROW, target = true}
}

monster.defenses = {
	defense = 98,
	armor = 98
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -30},
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
