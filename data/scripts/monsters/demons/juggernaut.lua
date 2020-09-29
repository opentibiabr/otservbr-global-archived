local mType = Game.createMonsterType("Juggernaut")
local monster = {}

monster.description = "a juggernaut"
monster.experience = 4900
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "blood"
monster.corpse = 6336
monster.speed = 340
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "RAAARRR!", yell = false},
	{text = "GRRRRRR!", yell = false},
	{text = "WAHHHH!", yell = false}
}

monster.loot = {
	{id = 2136, chance = 550},
	{id = "small ruby", chance = 20000, maxCount = 4},
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "small emerald", chance = 20000, maxCount = 5},
	{id = "platinum coin", chance = 100000, maxCount = 15},
	{id = "violet gem", chance = 830},
	{id = "green gem", chance = 869},
	{id = "red gem", chance = 13850},
	{id = "dragon hammer", chance = 9000},
	{id = "heavy mace", chance = 400},
	{id = "war axe", chance = 400},
	{id = "golden armor", chance = 550},
	{id = "golden legs", chance = 500},
	{id = "knight armor", chance = 4990},
	{id = "mastermind shield", chance = 800},
	{id = 2578, chance = 280},
	{id = "ham", chance = 60000, maxCount = 8},
	{id = "soul orb", chance = 33333},
	{id = "demonic essence", chance = 45333},
	{id = "concentrated demonic blood", chance = 25000, maxCount = 4},
	{id = "onyx arrow", chance = 11111, maxCount = 15},
	{id = "assassin star", chance = 25000, maxCount = 10},
	{id = "titan axe", chance = 4430},
	{id = "spiked squelcher", chance = 7761},
	{id = "great mana potion", chance = 35000},
	{id = "great health potion", chance = 32000},
	{id = "skullcracker armor", chance = 400},
	{id = "gold ingot", chance = 7692, maxCount = 2}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -1470, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -780, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 520, Duration = 5000},
	{name ="combat", interval = 2000, chance = 15, minDamage = 400, maxDamage = 900, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
