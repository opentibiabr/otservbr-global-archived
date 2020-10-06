local mType = Game.createMonsterType("Outburst")
local monster = {}

monster.description = "Outburst"
monster.experience = 50000
monster.outfit = {
	lookType = 876,
	lookHead = 79,
	lookBody = 0,
	lookLegs = 94,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 26220
monster.speed = 500
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
	rewardBoss = true,
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
	"OutburstCharge"
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
	{id = 2152, chance = 100000, maxCount = 10},
	{id = 18413, chance = 8000, maxCount = 3},
	{id = 7590, chance = 8000, maxCount = 10},
	{id = 18415, chance = 8000, maxCount = 3},
	{id = 2150, chance = 8000, maxCount = 10},
	{id = 2146, chance = 8000, maxCount = 5},
	{id = 8473, chance = 8000, maxCount = 5},
	{id = 18414, chance = 8000, maxCount = 3},
	{id = 25377, chance = 100000},
	{id = 26165, chance = 100000},
	{id = 2155, chance = 8000},
	{id = 7427, chance = 6000},
	{id = 26189, chance = 5000},
	{id = 26130, chance = 2000},
	{id = 26133, chance = 2000},
	{id = 18450, chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -1800, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -700, maxDamage = -1300, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -300, maxDamage = -600, type = COMBAT_DEATHDAMAGE, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -800, maxDamage = -1300, type = COMBAT_PHYSICALDAMAGE, length = 8, spread = 3, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -600, maxDamage = -900, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 25, target = false},
	{name ="combat", interval = 2000, chance = 40, target = false}
}

monster.defenses = {
	defense = 100,
	armor = 100
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
