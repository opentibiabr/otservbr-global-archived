local mType = Game.createMonsterType("Tunnel Tyrant")
local monster = {}

monster.description = "You see a cave chimera"
monster.experience = 6800
monster.outfit = {
	lookType = 1406,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 1545
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Dwelling of the Forgotten."
}

monster.health = 8000
monster.maxHealth = 8000
monster.race = "blood"
monster.corpse = 41620
monster.speed = 115
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 10000,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 0}, --?
	{name = "Gold Ingots", chance = 0}, --?
	{name = "Great Spirit Potions", chance = 0}, --?
	{name = "Ultimate Health Potions", chance = 0}, --?
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600},
	{name ="ice strike", interval = 2000, chance = 17, minDamage = -750, maxDamage = -850, range = 5, target = true},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -560, maxDamage = -650, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false}
	--holy burst arrow ??
}

monster.defenses = {
	defense = 5,
	armor = 60
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -101},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -101}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
