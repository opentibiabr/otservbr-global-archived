local mType = Game.createMonsterType("Magma Crawler")
local monster = {}

monster.description = "a magma crawler"
monster.experience = 2700
monster.outfit = {
	lookType = 492,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 885
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Warzone 2."
		}

monster.health = 4800
monster.maxHealth = 4800
monster.race = "fire"
monster.corpse = 17336
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 300,
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
	{text = "Crrroak!", yell = false}
}

monster.loot = {
	{id = "small diamond", chance = 8800, maxCount = 3},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 99},
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "yellow gem", chance = 1030},
	{id = "energy ring", chance = 1650},
	{id = "fire sword", chance = 1680},
	{id = "black shield", chance = 1550},
	{id = "iron ore", chance = 4280},
	{id = "white piece of cloth", chance = 2310},
	{id = "red piece of cloth", chance = 930},
	{id = "yellow piece of cloth", chance = 2980},
	{id = "great mana potion", chance = 6500},
	{id = "great health potion", chance = 7270},
	{id = "magma amulet", chance = 3120},
	{id = "magma boots", chance = 1820},
	{id = "wand of draconia", chance = 4280},
	{id = "fiery heart", chance = 7810},
	{id = 13757, chance = 1675},
	{id = "crystalline arrow", chance = 5950, maxCount = 10},
	{id = "wand of everblazing", chance = 690},
	{id = "blue crystal shard", chance = 3930, maxCount = 2},
	{id = "brown crystal splinter", chance = 8500, maxCount = 2},
	{id = "green crystal fragment", chance = 7000},
	{id = "magma clump", chance = 11600},
	{id = "blazing bone", chance = 11500},
	{id = "blazing bone", chance = 12220}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -203},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -1100, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -290, maxDamage = -800, length = 3, spread = 2, effect = CONST_ME_FIREATTACK, target = false},
	{name ="magma crawler soulfire", interval = 2000, chance = 20, target = false},
	{name ="soulfire", interval = 2000, chance = 10, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -140, maxDamage = -180, radius = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="speed", interval = 2000, chance = 10, speedChange = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
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
