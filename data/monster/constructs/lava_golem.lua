local mType = Game.createMonsterType("Lava Golem")
local monster = {}

monster.description = "a lava golem"
monster.experience = 6200
monster.outfit = {
	lookType = 491,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 884
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Warzone 2."
		}

monster.health = 9000
monster.maxHealth = 9000
monster.race = "fire"
monster.corpse = 17333
monster.speed = 420
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	canWalkOnFire = true,
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
	{text = "Grrrrunt", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 199},
	{id = "platinum coin", chance = 100000, maxCount = 11},
	{id = "yellow gem", chance = 6480},
	{id = "red gem", chance = 1180},
	{id = "wand of inferno", chance = 2950},
	{id = "fire sword", chance = 1710},
	{id = "fire axe", chance = 1560},
	{id = "crown shield", chance = 1180},
	{id = "iron ore", chance = 11570},
	{id = "white piece of cloth", chance = 4810},
	{id = "red piece of cloth", chance = 3530},
	{id = "yellow piece of cloth", chance = 7230},
	{id = "strong health potion", chance = 18830, maxCount = 2},
	{id = "strong mana potion", chance = 18150, maxCount = 2},
	{id = "great mana potion", chance = 16030, maxCount = 2},
	{id = "mana potion", chance = 20720, maxCount = 2},
	{id = "magma amulet", chance = 2900},
	{id = "magma boots", chance = 2650},
	{id = "magma coat", chance = 430},
	{id = "ultimate health potion", chance = 15390},
	{id = "spellbook of mind control", chance = 450},
	{id = "fiery heart", chance = 13510},
	{id = "wand of everblazing", chance = 1390},
	{id = "violet crystal shard", chance = 6200},
	{id = "green crystal splinter", chance = 13990, maxCount = 2},
	{id = "red crystal fragment", chance = 10990},
	{id = "magma clump", chance = 15370, maxCount = 2},
	{id = "blazing bone", chance = 15200},
	{id = "prismatic bolt", chance = 12580, maxCount = 5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -1300, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="lava golem soulfire", interval = 2000, chance = 15, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -220, maxDamage = -350, radius = 4, effect = CONST_ME_FIREAREA, target = true},
	{name ="speed", interval = 2000, chance = 10, speedChange = -800, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -280, maxDamage = -350, radius = 3, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 60
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
