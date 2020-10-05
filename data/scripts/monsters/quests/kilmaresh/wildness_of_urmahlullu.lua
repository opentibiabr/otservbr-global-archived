local mType = Game.createMonsterType("Wildness of Urmahlullu")
local monster = {}

monster.description = "wildness of urmahlullu"
monster.experience = 0
monster.outfit = {
	lookType = 570,
	lookHead = 57,
	lookBody = 75,
	lookLegs = 38,
	lookFeet = 86,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 90000
monster.maxHealth = 90000
monster.race = "blood"
monster.corpse = 0
monster.speed = 190
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
	runHealth = 10,
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
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -1300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 20, minDamage = -500, maxDamage = -800, type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -550, maxDamage = -800, type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -550, maxDamage = -800, type = COMBAT_ENERGYDAMAGE, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 18, minDamage = -450, maxDamage = -600, target = false}
}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
