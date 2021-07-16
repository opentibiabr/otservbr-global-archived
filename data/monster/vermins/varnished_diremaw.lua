local mType = Game.createMonsterType("Varnished Diremaw")
local monster = {}

monster.description = "You see a varnished diremaw."
monster.experience = 5900
monster.outfit = {
	lookType = 1397,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1532
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

monster.health = 9000
monster.maxHealth = 9000
monster.race = "blood"
monster.corpse = 41540
monster.speed = 120
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
	{name = "Platinum Coin", chance = 0, maxCount = 0},
	{name = "Terra Rod", chance = 0},
	{name = "Emerald Bangle", chance = 0},
	{name = "Small Diamond ", chance = 0},
	{name = "Small Emerald", chance = 0},
	{name = "Green Gem", chance = 0},  ---??? all
	{name = "Red Gem", chance = 0},
	{name = "Hailstorm Rod", chance = 0},
	{name = "Violet Crystal Shard", chance = 0},
	{name = "Green Crystal Shard ", chance = 0},
	{name = "Green Crystal Splinter", chance = 0},
	{name = "Brown Crystal Splinter", chance = 0},
	{name = "Cyan Crystal Fragment", chance = 0},
	{name = "Varnished Diremaw Brainpan", chance = 0},
	{name = "Varnished Diremaw Legs", chance = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400},
	{name ="combat", interval = 4000, chance = 12, type = COMBAT_ICEDAMAGE, minDamage = -0, maxDamage = -700, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 6000, chance = 22, type = COMBAT_HOLYDAMAGE, minDamage = -0, maxDamage = -730, range = 7, radius = 4, effect = CONST_ME_HOLYAREA, target = true},
	{name ="ice strike", interval = 2000, chance = 17, minDamage = -0, maxDamage = -800, range = 5, target = true}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 99},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -101},
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
