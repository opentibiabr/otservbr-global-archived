local mType = Game.createMonsterType("Young Sea Serpent")
local monster = {}

monster.description = "a young sea serpent"
monster.experience = 1000
monster.outfit = {
	lookType = 317,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1050
monster.maxHealth = 1050
monster.race = "blood"
monster.corpse = 9879
monster.speed = 480
monster.summonCost = 390
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 85,
	targetDistance = 0,
	runHealth = 400,
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
	{text = "CHHHRRRR", yell = false},
	{text = "HISSSS", yell = false}
}

monster.loot = {
	{id = "small sapphire", chance = 1900, maxCount = 2},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 48000, maxCount = 74},
	{id = "stealth ring", chance = 1000},
	{id = "life crystal", chance = 300},
	{id = "battle axe", chance = 8000},
	{id = "morning star", chance = 40000},
	{id = "battle hammer", chance = 5000},
	{id = "strong health potion", chance = 5000},
	{id = "strong mana potion", chance = 4000},
	{id = 9808, chance = 7940},
	{id = 9809, chance = 7940},
	{id = "sea serpent scale", chance = 5000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -10, maxDamage = -250, type = COMBAT_EARTHDAMAGE, length = 7, spread = 2, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -80, maxDamage = -250, type = COMBAT_ICEDAMAGE, length = 7, spread = 2, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 15, range = 5, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 30, minDamage = 25, maxDamage = 175, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 400, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
