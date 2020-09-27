local mType = Game.createMonsterType("Lamassu")
local monster = {}

monster.description = "a lamassu"
monster.experience = 9000
monster.outfit = {
	lookType = 1190,
	lookHead = 50,
	lookBody = 2,
	lookLegs = 0,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8700
monster.maxHealth = 8700
monster.race = "blood"
monster.corpse = 36229
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	{id = "Platinum Coin", chance = 100000},
	{id = "Lamassu Horn", chance = 13400, maxCount = 5},
	{id = "Red Crystal Fragment", chance = 10500},
	{id = "Terra Amulet", chance = 10000},
	{id = "Lamassu Hoof", chance = 7700},
	{id = "Violet Crystal Shard", chance = 6800},
	{id = "Blue Crystal Shard", chance = 6500},
	{id = "Red Gem", chance = 6200},
	{id = "Terra Hood", chance = 5900},
	{id = "Sacred Tree Amulet", chance = 2300},
	{id = "Elven Amulet", chance = 2000},
	{id = "Violet Gem", chance = 1700}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -550, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -350, maxDamage = -490, type = COMBAT_HOLYDAMAGE, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -330, maxDamage = -410, type = COMBAT_EARTHDAMAGE, range = 5, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_SMALLPLANTS, target = true}
}

monster.defenses = {
	defense = 82,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = -30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
