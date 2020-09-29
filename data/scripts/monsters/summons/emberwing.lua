local mType = Game.createMonsterType("Emberwing")
local monster = {}

monster.description = "a Emberwing"
monster.experience = 0
monster.outfit = {
	lookType = 992,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "undead"
monster.corpse = 0
monster.speed = 309
monster.summonCost = 2000
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = false,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 2,
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 18, minDamage = -200, maxDamage = -270, type = COMBAT_HOLYDAMAGE, range = 5, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true},
	{name ="combat", interval = 2000, chance = 18, minDamage = -200, maxDamage = -270, type = COMBAT_FIREDAMAGE, range = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true},
	{name ="combat", interval = 2000, chance = 18, minDamage = -170, maxDamage = -230, type = COMBAT_FIREDAMAGE, range = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true},
	{name ="combat", interval = 2000, chance = 18, minDamage = -170, maxDamage = -230, type = COMBAT_HOLYDAMAGE, range = 5, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name ="combat", interval = 2000, chance = 75, minDamage = 380, maxDamage = 380, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
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
