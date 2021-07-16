local mType = Game.createMonsterType("Streaked Devourer")
local monster = {}

monster.description = "You see a streaked devourer."
monster.experience = 6300
monster.outfit = {
	lookType = 1398,
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
	Locations = "Grotto of the Lost."
}

monster.health = 7000
monster.maxHealth = 7000
monster.race = "blood"
monster.corpse = 41544
monster.speed = 125
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
	{name = "Platinum Coin", maxCount = 24, chance = 100000},
	{name = "Gold Ingot", chance = 33330},
	{name = "Streaked Devourer Legs", chance = 16670},
	{name = "Streaked Devourer Maw", chance = 16670}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550},
	{name ="big death wave", interval = 2000, chance = 20, minDamage = -730, maxDamage = -770, target = false}
	--Fire Burst Arrow (580-620), Fire Berserk (800-900) ??
}

monster.defenses = {
	defense = 5,
	armor = 62
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -101},
	{type = COMBAT_ENERGYDAMAGE, percent = 99},
	{type = COMBAT_EARTHDAMAGE, percent = 99},
	{type = COMBAT_FIREDAMAGE, percent = 99},
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
