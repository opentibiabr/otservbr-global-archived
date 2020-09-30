local mType = Game.createMonsterType("Hirintror")
local monster = {}

monster.description = "Hirintror"
monster.experience = 800
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "undead"
monster.corpse = 7282
monster.speed = 190
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{text = "Srk.", yell = false},
	{text = "Krss!", yell = false},
	{text = "Chrrk! Krk!", yell = false}
}

monster.loot = {
	{id = 21697, chance = 200},
	{id = 2148, chance = 70000, maxCount = 100},
	{id = 21400, chance = 200},
	{id = 21696, chance = 200},
	{id = 2479, chance = 1200},
	{id = 2396, chance = 2200},
	{id = 7290, chance = 4200},
	{id = 7441, chance = 2200},
	{id = 7892, chance = 3200},
	{id = 7902, chance = 1200},
	{id = 7449, chance = 900},
	{id = 5912, chance = 900},
	{id = 7589, chance = 20000, maxCount = 5},
	{id = 7588, chance = 2000, maxCount = 5},
	{id = 2145, chance = 2000, maxCount = 5},
	{id = 2152, chance = 20000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 140, attack = 40, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -75, maxDamage = -150, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_BLOCKHIT, target = true},
	{name ="combat", interval = 2000, chance = 11, target = false},
	{name ="combat", interval = 2000, chance = 10, target = false}
}

monster.defenses = {
	defense = 26,
	armor = 25,
	{name ="combat", interval = 2000, chance = 18, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
