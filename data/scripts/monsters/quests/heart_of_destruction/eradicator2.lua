local mType = Game.createMonsterType("Eradicator")
local monster = {}

monster.description = "Eradicator"
monster.experience = 50000
monster.outfit = {
	lookType = 875,
	lookHead = 94,
	lookBody = 3,
	lookLegs = 78,
	lookFeet = 94,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 26220
monster.speed = 450
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.events = {
	"HeartBossDeath",
	"EradicatorTransform"
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
	{id = 2148, chance = 100000, maxCount = 200},
	{id = 2152, chance = 100000, maxCount = 25},
	{id = 18415, chance = 8000, maxCount = 3},
	{id = 7590, chance = 8000, maxCount = 5},
	{id = 8472, chance = 8000, maxCount = 5},
	{id = 2150, chance = 8000, maxCount = 5},
	{id = 2147, chance = 8000, maxCount = 5},
	{id = 9970, chance = 8000, maxCount = 5},
	{id = 8473, chance = 8000, maxCount = 10},
	{id = 18414, chance = 8000, maxCount = 3},
	{id = 26191, chance = 8000},
	{id = 26176, chance = 8000},
	{id = 26174, chance = 8000},
	{id = 25377, chance = 100000},
	{id = 26165, chance = 100000},
	{id = 26166, chance = 100000},
	{id = 2158, chance = 6000},
	{id = 2155, chance = 6000},
	{id = 8901, chance = 6000},
	{id = 2445, chance = 4000},
	{id = 26185, chance = 3500},
	{id = 26187, chance = 3500},
	{id = 26189, chance = 3500},
	{id = 2645, chance = 5000},
	{id = 8903, chance = 3000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -300, maxDamage = -1800, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -600, maxDamage = -1000, type = COMBAT_PHYSICALDAMAGE, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -450, maxDamage = -900, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -300, maxDamage = -600, type = COMBAT_HOLYDAMAGE, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -700, maxDamage = -1000, target = false},
	{name ="combat", interval = 2000, chance = 40, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="combat", interval = 2000, chance = 100, minDamage = 500, maxDamage = 1200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
