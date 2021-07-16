local mType = Game.createMonsterType("Eyeless Devourer")
local monster = {}

monster.description = "You see an eyeless devourer"
monster.experience = 6000
monster.outfit = {
	lookType = 1399,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1544
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Antrum of the Fallen."
}

monster.health = 10000
monster.maxHealth = 10000
monster.race = "blood"
monster.corpse = 41548
monster.speed = 165
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
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

monster.loot = {
	{name = "Platinum Coin", chance = 100000},
	{name = "Ultimate Health Potion", chance = 2500},
	{name = "Eyeless Devourer Maw", chance = 2000},
	{name = "Green Gem", chance = 1000},
	{name = "Violet Crystal Shard", chance = 1000},
	{name = "Blue Crystal Shard", chance = 5000},
	{name = "Eyeless Devourer Legs", chance = 5000},
	{name = "Eyeless Devourer Tongue", chance = 5000},
	{name = "Glacier Amulet", chance = 5000},
	{name = "Mercenary Sword", chance = 5000},
	{name = "Noble Axe", chance = 5000},
	{name = "Ornate Crossbow", chance = 5000},
	{name = "Sacred Tree Amulet", chance = 5000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -700, radius = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 25, minDamage = -500, maxDamage = -560, length = 7, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -800, range = 7, shootEffect = CONST_ANI_ENERGY, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 63
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -101},
	{type = COMBAT_ENERGYDAMAGE, percent = 99},
	{type = COMBAT_EARTHDAMAGE, percent = 99},
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
