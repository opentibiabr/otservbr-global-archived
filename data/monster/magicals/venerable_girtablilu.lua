local mType = Game.createMonsterType("Venerable Girtablilu")
local monster = {}

monster.description = "You see a venerable girtablilu."
monster.experience = 5300
monster.outfit = {
	lookType = 1407,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0, ---??? color
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 1729
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Ruins of Nuur"
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 0 ---???
monster.speed = 180
monster.manaCost = 0
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
	{name = "platinum coin", chance = 100000, maxCount = 18},
	{name = "gold ingot", chance = 30770},
	{name = "blue gem", chance = 15380},
	{name = "northwind rod", chance = 15380},
	{name = "cyan crystal fragment", chance = 7690},
	{name = "violet crystal shard", chance = 7690}
}

monster.attacks = {
	---?
}

monster.defenses = {
	defense = 0,
	armor = 80,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -110},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -120},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
