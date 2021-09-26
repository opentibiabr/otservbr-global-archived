local mType = Game.createMonsterType("Pirat Mate")
local monster = {}

monster.description = "a pirat mate"
monster.experience = 2400
monster.outfit = {
	lookType = 1346,
	lookHead = 0,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 94,
	lookAddons = 3,
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
	Locations = "Darashia, Krailos Steppe, Liberty Bay, Port Hope, Thais, The Wreckoning."
}

monster.health = 3200
monster.maxHealth = 3200
monster.race = "blood"
monster.corpse = 40223
monster.speed = 200
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
	{name = "Pirate Coin", chance = 10000, maxCount =10},
	{name = "Cyan Crystal Fragment", chance = 10000},
	{name = "Small Diamond", chance = 10000},
	{name = "Red Crystal Fragment", chance = 10000},
	{name = "Mouldy Powder", chance = 9000},
	{name = "Pirat's Tail", chance = 7000},
	{name = "Red Gem", chance = 6000},
	{name = "Fire Sword", chance = 5000},
	{name = "Small Emerald", chance = 5000},
	{name = "Onyx Chip", chance = 4000},
	{name = "Shark Fins", chance = 4000},
	{name = "Yellow Gem", chance = 3000},
	{name = "Ice Rapier", chance = 3000},
	{name = "Green Crystal Shard", chance = 2000},
	{name = "Small Treasure Chest", chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400},
	{name ="energy beam", interval = 2000, chance = 10, minDamage = -150, maxDamage = -210, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="energy wave", interval = 2000, chance = 10, minDamage = -140, maxDamage = -80, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 75,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -110},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = -130},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 30},
	{type = COMBAT_MANADRAIN, percent = 30},
	{type = COMBAT_DROWNDAMAGE, percent = 30},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
