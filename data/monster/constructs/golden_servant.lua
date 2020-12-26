local mType = Game.createMonsterType("Golden Servant")
local monster = {}

monster.description = "a golden servant"
monster.experience = 450
monster.outfit = {
	lookType = 396,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 701
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 5,
	FirstUnlock = 2,
	SecondUnlock = 3,
	CharmsPoints = 50,
	Stars = 3,
	Occurrence = 3,
	Locations = "Edron."
	}

monster.health = 550
monster.maxHealth = 550
monster.race = "venom"
monster.corpse = 13489
monster.speed = 210
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
	runHealth = 50,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
	{text = "Error. LOAD 'PROGRAM',8,1", yell = false},
	{text = "Remain. Obedient.", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 40000, maxCount = 100},
	{id = "gold coin", chance = 45000, maxCount = 40},
	{id = "stealth ring", chance = 450},
	{id = "gold ring", chance = 10},
	{id = "halberd", chance = 3003},
	{id = "golden armor", chance = 10},
	{id = "green mushroom", chance = 1450},
	{id = "health potion", chance = 4930},
	{id = "mana potion", chance = 4950},
	{id = "spellbook of enlightenment", chance = 520},
	{id = "gear wheel", chance = 940},
	{id = "slime mould", chance = 340},
	{id = "golden can of oil", chance = 40}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -100, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -80, maxDamage = -110, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -150, length = 5, spread = 2, effect = CONST_ME_YELLOWENERGY, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
