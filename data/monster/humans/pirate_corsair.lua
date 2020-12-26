local mType = Game.createMonsterType("Pirate Corsair")
local monster = {}

monster.description = "a pirate corsair"
monster.experience = 350
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 250
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Nargor, Trade Quarter, Foreigner Quarter (Dock), Krailos Steppe."
	}

monster.health = 675
monster.maxHealth = 675
monster.race = "blood"
monster.corpse = 20475
monster.speed = 238
monster.manaCost = 775
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 40,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Give up!", yell = false},
	{text = "Hiyaa!", yell = false},
	{text = "Plundeeeeer!", yell = false}
}

monster.loot = {
	{id = "piggy bank", chance = 150},
	{id = "gold coin", chance = 50000, maxCount = 88},
	{id = "sabre", chance = 10000},
	{id = "throwing star", chance = 8400, maxCount = 12},
	{id = "dark armor", chance = 1650},
	{id = "dark shield", chance = 1000},
	{id = "pirate boots", chance = 220},
	{id = "rum flask", chance = 130},
	{id = 5813, chance = 130},
	{id = "pirate backpack", chance = 930},
	{id = "pirate hat", chance = 1150},
	{id = "hook", chance = 600},
	{id = "eye patch", chance = 500},
	{id = "peg leg", chance = 600},
	{id = "strong health potion", chance = 820},
	{id = "compass", chance = 11050},
	{id = "compass", chance = 11020}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -170},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, range = 7, shootEffect = CONST_ANI_THROWINGSTAR, target = false},
	{name ="pirate corsair skill reducer", interval = 2000, chance = 5, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
