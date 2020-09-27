local mType = Game.createMonsterType("Evil Prospector")
local monster = {}

monster.description = "Evil Prospector"
monster.experience = 7500
monster.outfit = {
	lookType = 1268,
	lookHead = 0,
	lookBody = 13,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "undead"
monster.corpse = 37445
monster.speed = 220
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
	targetDistance = 3,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "spectral silver nugget", chance = 17110, maxCount = 2},
	{id = "wand of starstorm", chance = 13160, maxCount = 10},
	{id = "lightning pendant", chance = 9210},
	{id = "emerald bangle", chance = 3950},
	{id = "strange talisman", chance = 2630},
	{id = "wand of defiance", chance = 2630},
	{id = "lightning headband", chance = 1320}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -100, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1700, chance = 15, minDamage = -250, maxDamage = -550, shootEffect = CONST_ANI_ENVENOMEDARROW, target = true},
	{name ="combat", interval = 1700, chance = 25, minDamage = -250, maxDamage = -550, type = COMBAT_ENERGYDAMAGE, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1700, chance = 35, minDamage = -250, maxDamage = -550, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1700, chance = 35, minDamage = -250, maxDamage = -400, type = COMBAT_HOLYDAMAGE, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 1700, chance = 13, minDamage = -400, maxDamage = -450, type = COMBAT_ENERGYDAMAGE, range = 4, effect = CONST_ME_ENERGYAREA, target = true}
}

monster.defenses = {
	defense = 40,
	armor = 100
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
