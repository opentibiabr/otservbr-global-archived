local mType = Game.createMonsterType("Ogre Ruffian")
local monster = {}

monster.description = "an ogre ruffian"
monster.experience = 5000
monster.outfit = {
	lookType = 1212,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5500
monster.maxHealth = 5500
monster.race = "blood"
monster.corpse = 36362
monster.speed = 430
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
	{id = "ogre ear stud", chance = 17270},
	{id = "ogre nose ring", chance = 15830},
	{id = "pair of iron fists", chance = 2160},
	{id = "meat", chance = 8630, maxCount = 5},
	{id = "diamond sceptre", chance = 5760},
	{id = "war hammer", chance = 2160},
	{id = "metal spats", chance = 1440},
	{id = "skull fetish", chance = 1440},
	{id = "stone skin amulet", chance = 4320}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 13, minDamage = -250, maxDamage = -450, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -350, type = COMBAT_PHYSICALDAMAGE, range = 4, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_POFF, target = true}
}

monster.defenses = {
	defense = 102,
	armor = 102
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
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
