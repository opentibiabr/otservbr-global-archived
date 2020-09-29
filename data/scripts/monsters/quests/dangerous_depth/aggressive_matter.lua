local mType = Game.createMonsterType("Aggressive Matter")
local monster = {}

monster.description = "a agressive matter"
monster.experience = 0
monster.outfit = {
	lookType = 615,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "venom"
monster.corpse = 0
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 0,
	chance = 0
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

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 58, attack = 50, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 280, interval = 4000}},
	{name ="combat", interval = 2000, chance = 13, minDamage = -150, maxDamage = -250, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_GLOOTHSPEAR, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -150, maxDamage = -230, type = COMBAT_EARTHDAMAGE, length = 6, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 11, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{name ="combat", interval = 2000, chance = 7, minDamage = 40, maxDamage = 60, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 9, SpeedChange = 470, Duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
