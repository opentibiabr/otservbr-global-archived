local mType = Game.createMonsterType("Wiggler")
local monster = {}

monster.description = "a wiggler"
monster.experience = 900
monster.outfit = {
	lookType = 510,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "venom"
monster.corpse = 18483
monster.speed = 360
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 359,
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
	{text = "Zzzrp", yell = false},
	{text = "Crick! Crick!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "platinum coin", chance = 14790},
	{id = "terra rod", chance = 850},
	{id = "serpent sword", chance = 1360},
	{id = "black shield", chance = 1320},
	{id = "white mushroom", chance = 7142, maxCount = 5},
	{id = "blue piece of cloth", chance = 2080},
	{id = "yellow piece of cloth", chance = 2160},
	{id = "strong health potion", chance = 4930},
	{id = "strong mana potion", chance = 5250},
	{id = "crystalline arrow", chance = 15540, maxCount = 5},
	{id = "green crystal splinter", chance = 3600},
	{id = "green crystal fragment", chance = 2070},
	{id = "drill bolt", chance = 15260, maxCount = 5}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 500, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -180, maxDamage = -270, type = COMBAT_EARTHDAMAGE, length = 4, spread = 3, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -160, maxDamage = -200, range = 7, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -700, Duration = 30000}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 510, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
