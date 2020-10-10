local mType = Game.createMonsterType("Brimstone Bug")
local monster = {}

monster.description = "a brimstone bug"
monster.experience = 900
monster.outfit = {
	lookType = 352,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1300
monster.maxHealth = 1300
monster.race = "venom"
monster.corpse = 12527
monster.speed = 240
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
	canPushCreatures = false,
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
	{text = "Chrrr!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "small emerald", chance = 2702, maxCount = 4},
	{id = "stealth ring", chance = 892},
	{id = "platinum amulet", chance = 110},
	{id = "magic sulphur", chance = 1639},
	{id = "strong health potion", chance = 9003},
	{id = "strong mana potion", chance = 9025},
	{id = "poisonous slime", chance = 50000},
	{id = "lump of earth", chance = 20000},
	{id = "sulphurous stone", chance = 14970},
	{id = "brimstone fangs", chance = 5710},
	{id = "brimstone shell", chance = 10000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -213, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 400, interval = 4000}},
	{name ="speed", interval = 2000, chance = 20, speedChange = -600, duration = 10000},
	{name ="combat", interval = 2000, chance = 5, minDamage = -140, maxDamage = -310, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -200, type = COMBAT_MANADRAIN, length = 6, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -80, maxDamage = -120, type = COMBAT_EARTHDAMAGE, length = 8, spread = 3, effect = CONST_ME_YELLOW_RINGS, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
