local mType = Game.createMonsterType("Moohtant")
local monster = {}

monster.description = "a moohtant"
monster.experience = 2600
monster.outfit = {
	lookType = 607,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1044
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Oramond Mountain Hideout, Oramond Minotaur Camp (northern camp), \z
		Underground Glooth Factory, Oramond Dungeon."
		}

monster.health = 3200
monster.maxHealth = 3200
monster.race = "blood"
monster.corpse = 23367
monster.speed = 260
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3
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
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	pet = false
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
	{id = 2148, chance = 100000, maxCount = 195},
	{id = 2152, chance = 58160, maxCount = 2},
	{id = 23571, chance = 2740, maxCount = 2},
	{id = 23570, chance = 1770},
	{id = 7591, chance = 7380, maxCount = 3},
	{id = 7590, chance = 7230, maxCount = 3},
	{id = 2666, chance = 6520},
	{id = 2147, chance = 4680, maxCount = 2},
	{id = 5878, chance = 4110},
	{id = 2145, chance = 4400, maxCount = 2},
	{id = 2214, chance = 2410},
	{id = 5911, chance = 900},
	{id = 23544, chance = 860},
	{id = 2154, chance = 710},
	{id = 7452, chance = 430},
	{id = 7427, chance = 280},
	{id = 9971, chance = 280},
	{id = 7401, chance = 280}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 110, attack = 50},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -230, length = 3, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -200, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 19, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -225, radius = 5, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -235, range = 7, radius = 4, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 50, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 1},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 1},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
