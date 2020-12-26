local mType = Game.createMonsterType("Shaburak Lord")
local monster = {}

monster.description = "a shaburak lord"
monster.experience = 1200
monster.outfit = {
	lookType = 409,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 725
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 2,
	Locations = "Demonwar Crypt."
		}

monster.health = 2100
monster.maxHealth = 2100
monster.race = "fire"
monster.corpse = 13958
monster.speed = 240
monster.summonCost = 0
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
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
	{text = "GREEN IS MEAN!", yell = true},
	{text = "WE RULE!", yell = true},
	{text = "POWER TO THE SHABURAK!", yell = true},
	{text = "DEATH TO THE ASKARAK!", yell = false},
	{text = "ONLY WE ARE TRUE DEMONS!", yell = false}
}

monster.loot = {
	{id = "small ruby", chance = 6120, maxCount = 5},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 78},
	{id = "platinum coin", chance = 33333, maxCount = 2},
	{id = "energy ring", chance = 1652},
	{id = "wand of inferno", chance = 800},
	{id = "steel boots", chance = 160},
	{id = "brown mushroom", chance = 5346},
	{id = "magic sulphur", chance = 620},
	{id = "bullseye potion", chance = 400},
	{id = "strong health potion", chance = 7000},
	{id = "strong mana potion", chance = 7000},
	{id = "magma coat", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -251},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -75, range = 7, radius = 6, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -170, length = 4, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -140, maxDamage = -200, length = 4, spread = 3, effect = CONST_ME_FIREATTACK, target = false},
	{name ="speed", interval = 2000, chance = 10, speedChange = -650, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = -30},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
