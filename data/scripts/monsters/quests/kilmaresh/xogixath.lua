local mType = Game.createMonsterType("Xogixath")
local monster = {}

monster.description = "xogixath"
monster.experience = 22000
monster.outfit = {
	lookType = 842,
	lookHead = 3,
	lookBody = 16,
	lookLegs = 75,
	lookFeet = 19,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 28000
monster.maxHealth = 28000
monster.race = "fire"
monster.corpse = 13973
monster.speed = 190
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "Platinum Coin", chance = 100000, maxCount = 9},
	{id = "Red Gem", chance = 65000, maxCount = 2},
	{id = "Green Crystal Shard", chance = 16000},
	{id = "Sea Horse Figurine", chance = 2400},
	{id = "Winged Boots", chance = 120},
	{id = "Small Sapphire", chance = 48000, maxCount = 3},
	{id = "Stone Skin Amulet", chance = 54000},
	{id = 36204, chance = 6500},
	{id = "Fire Axe", chance = 34000},
	{id = 36392, chance = 520}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -650, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 16, minDamage = -450, maxDamage = -550, range = 5, target = true},
	{name ="combat", interval = 2000, chance = 14, minDamage = -400, maxDamage = -480, type = COMBAT_FIREDAMAGE, range = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -400, maxDamage = -550, type = COMBAT_FIREDAMAGE, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -420, maxDamage = -600, type = COMBAT_FIREDAMAGE, length = 5, spread = 3, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
