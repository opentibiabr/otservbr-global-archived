local mType = Game.createMonsterType("Silver Rabbit")
local monster = {}

monster.description = "a silver rabbit"
monster.experience = 0
monster.outfit = {
	lookType = 262,
	lookHead = 69,
	lookBody = 66,
	lookLegs = 69,
	lookFeet = 66,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15
monster.maxHealth = 15
monster.race = "blood"
monster.corpse = 7338
monster.speed = 184
monster.summonCost = 220
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 0,
	runHealth = 15,
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
	{id = "meat", chance = 86170, maxCount = 2},
	{id = 2684, chance = 11150},
	{id = "silky fur", chance = 28670}
}

monster.defenses = {
	defense = 5,
	armor = 5
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
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
