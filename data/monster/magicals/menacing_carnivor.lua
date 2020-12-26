local mType = Game.createMonsterType("Menacing Carnivor")
local monster = {}

monster.description = "a Menacing Carnivor"
monster.experience = 2112
monster.outfit = {
	lookType = 1139,
	lookHead = 128,
	lookBody = 128,
	lookLegs = 81,
	lookFeet = 91,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 1723
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Carnivora's Rocks."
	}

monster.health = 3500
monster.maxHealth = 3500
monster.race = "blood"
monster.corpse = 34741
monster.speed = 340
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

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 6},
	{id = "Morning Star", chance = 100000},
	{id = "Terra Rod", chance = 15550},
	{id = "Small Ruby", chance = 15000},
	{id = "Crystal Sword", chance = 25000},
	{id = "Ultimate Mana Potion", chance = 50000},
	{id = "Wand of Dragonbreath", chance = 15000},
	{id = "Machete", chance = 30000},
	{id = "Iron Helmet", chance = 20000},
	{id = "Serpent Sword", chance = 18000},
	{id = "Heavy Machete", chance = 17000},
	{id = "Terra Legs", chance = 6000},
	{id = "Knight Legs", chance = 4500},
	{id = "Wand of Starstorm", chance = 8000},
	{id = "Wand of Voodoo", chance = 7100},
	{id = "Violet Glass Plate", chance = 6200},
	{id = "Small Enchanted Ruby", chance = 1400},
	{id = "Green Crystal Fragment", chance = 1600},
	{id = "Onyx Chip", chance = 9800},
	{id = "Opal", chance = 2000},
	{id = "Tiger Eye", chance = 3000},
	{id = "Wand of Decay", chance = 8700}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -450},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -180, length = 4, spread = 3, effect = CONST_ME_SMOKE, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -200, length = 4, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -330, radius = 4, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 68,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.reflects = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
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
