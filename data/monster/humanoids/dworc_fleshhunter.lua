local mType = Game.createMonsterType("Dworc Fleshhunter")
local monster = {}

monster.description = "a dworc fleshhunter"
monster.experience = 40
monster.outfit = {
	lookType = 215,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 215
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "South of Port Hope (Trapwood) on ground level and underground."
		}

monster.health = 85
monster.maxHealth = 85
monster.race = "blood"
monster.corpse = 6058
monster.speed = 148
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 8,
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
	{text = "Brak brrretz!", yell = false},
	{text = "Grow truk grrrrr.", yell = false},
	{text = "Prek tars, dekklep zurk.", yell = false}
}

monster.loot = {
	{id = 2050, chance = 4750},
	{id = "gold coin", chance = 69000, maxCount = 13},
	{id = 2229, chance = 3300, maxCount = 3},
	{id = "poison dagger", chance = 2250},
	{id = "bone shield", chance = 1000},
	{id = "cleaver", chance = 9750},
	{id = "ripper lance", chance = 90},
	{id = "hunting spear", chance = 2000},
	{id = "tribal mask", chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25, condition = {type = CONDITION_POISON, totalDamage = 20, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -15, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
