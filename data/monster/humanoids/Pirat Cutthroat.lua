local mType = Game.createMonsterType("Pirat Cutthroat")
local monster = {}

monster.description = "a pirat Cutthroat"
monster.experience = 1800
monster.outfit = {
	lookType = 1346,
	lookHead = 0,
	lookBody = 96,
	lookLegs = 0,
	lookFeet = 96,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 918
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	}

monster.health = 2600
monster.maxHealth = 2600
monster.race = "blood"
monster.corpse = 40207
monster.speed = 175
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 50,
	healthHidden = false,
	isBlockable = true,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{name = "Great Health Potion", chance = 20000, maxCount =4},
	{name = "Pirate Coin", chance = 6000, maxCount =10},
	{name = "Ice Rapier", chance = 10000},
	{name = "Crystal Sword", chance = 8000},
	{name = "Pirat's Tail", chance = 5000},
	{name = "Crowbar", chance = 4000},
	{name = "Knight Axe", chance = 4000},
	{name = "Shark Fins", chance = 4000},
	{name = "Knight Armor", chance = 2000},
	{name = "Focus Cape", chance = 1999},
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 11, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -140, length = 1, spread = 0, effect = CONST_ME_SMOKE, target = false},
	{name ="energy beam", interval = 2000, chance = 10, minDamage = -120, maxDamage = -160, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 72,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = -130},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
