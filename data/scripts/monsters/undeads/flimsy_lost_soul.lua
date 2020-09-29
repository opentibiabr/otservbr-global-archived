local mType = Game.createMonsterType("Flimsy Lost Soul")
local monster = {}

monster.description = "Flimsy Lost Soul"
monster.experience = 5000
monster.outfit = {
	lookType = 1268,
	lookHead = 0,
	lookBody = 26,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.race = "undead"
monster.corpse = 37445
monster.speed = 240
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
	{id = "platinum coin", chance = 100000, maxCount = 2},
	{id = "lost soul", chance = 30300},
	{id = "wand of cosmic energy", chance = 5220},
	{id = "springsprout rod", chance = 3830},
	{id = "death toll", chance = 3540},
	{id = "terra rod", chance = 3030},
	{id = "hailstorm rod", chance = 2830},
	{id = "ensouled essence", chance = 2260},
	{id = "necklace of the deep", chance = 1760},
	{id = "cursed bone", chance = 1570},
	{id = "wand of starstorm", chance = 1520},
	{id = "glacial rod", chance = 960},
	{id = "wand of voodoo", chance = 330}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -100, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1700, chance = 15, minDamage = -150, maxDamage = -550, shootEffect = CONST_ANI_ENVENOMEDARROW, target = true},
	{name ="combat", interval = 1700, chance = 25, minDamage = -150, maxDamage = -550, type = COMBAT_ENERGYDAMAGE, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1700, chance = 35, minDamage = -150, maxDamage = -550, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 79
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
