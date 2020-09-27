local mType = Game.createMonsterType("Rahemos")
local monster = {}

monster.description = "Rahemos"
monster.experience = 3100
monster.outfit = {
	lookType = 87,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3700
monster.maxHealth = 3700
monster.race = "undead"
monster.corpse = 6031
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Demon", chance = 12, interval = 1000, max = 1}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "It's a kind of magic.", yell = false},
	{text = "Abrah Kadabrah!", yell = false},
	{text = "Nothing hidden in my wrappings.", yell = false},
	{text = "It's not a trick, it's Rahemos.", yell = false},
	{text = "Meet my friend from hell!", yell = false},
	{text = "I will make you believe in magic.", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "gold coin", chance = 50000, maxCount = 80},
	{id = "gold coin", chance = 50000, maxCount = 60},
	{id = "small amethyst", chance = 7000, maxCount = 3},
	{id = "violet gem", chance = 500},
	{id = "orb", chance = 500},
	{id = "crystal wand", chance = 500},
	{id = "ring of healing", chance = 7000},
	{id = "ancient rune", chance = 100000},
	{id = "twin axe", chance = 200},
	{id = "magician hat", chance = 300},
	{id = "great mana potion", chance = 7000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -750, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 3000, chance = 7, minDamage = -75, maxDamage = -750, type = COMBAT_LIFEDRAIN, range = 1, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -60, maxDamage = -600, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 3000, chance = 20, minDamage = -60, maxDamage = -600, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, SpeedChange = -650, Duration = 60000},
	{name ="drunk", interval = 1000, chance = 8, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="outfit", interval = 1000, chance = 15}
}

monster.defenses = {
	defense = 35,
	armor = 30,
	{name ="combat", interval = 1000, chance = 20, minDamage = 200, maxDamage = 500, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 1000, chance = 5}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 92},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 94},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
