local mType = Game.createMonsterType("Animated Snowman")
local monster = {}

monster.description = "an animated snowman"
monster.experience = 400
monster.outfit = {
	lookType = 1159,
	lookHead = 19,
	lookBody = 10,
	lookLegs = 19,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 450
monster.maxHealth = 450
monster.race = "venom"
monster.corpse = 35162
monster.speed = 230
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
	{id = "gold coin", chance = 100000, maxCount = 50},
	{id = "Twig Arms", chance = 91770},
	{id = "Shiver Arrow", chance = 7310},
	{id = "Ice Rapier", chance = 4750},
	{id = "Glacier Mask", chance = 4570},
	{id = "Snowball", chance = 4000, maxCount = 5},
	{id = "Hailstorm Rod", chance = 3470},
	{id = "Glacier Mask", chance = 250},
	{id = "Glacier Amulet", chance = 3290},
	{id = "Moonlight Rod", chance = 1830},
	{id = "Glacier Kilt", chance = 1100}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -20, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -10, maxDamage = -40, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
