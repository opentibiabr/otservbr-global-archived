local mType = Game.createMonsterType("Hive Overseer")
local monster = {}

monster.description = "a hive overseer"
monster.experience = 5500
monster.outfit = {
	lookType = 458,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "venom"
monster.corpse = 15354
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 2

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
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 4,
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
	{name = "Spidris Elite", chance = 40, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Zopp!", yell = false},
	{text = "Kropp!", yell = false}
}

monster.loot = {
	{id = "small ruby", chance = 16000, maxCount = 2},
	{id = "gold coin", chance = 40000, maxCount = 100},
	{id = "gold coin", chance = 58000, maxCount = 98},
	{id = "platinum coin", chance = 84000, maxCount = 6},
	{id = "steel boots", chance = 550},
	{id = "great mana potion", chance = 18000},
	{id = 7632, chance = 6000},
	{id = "ultimate health potion", chance = 12000},
	{id = "gold ingot", chance = 29000},
	{id = "kollos shell", chance = 28000},
	{id = "compound eye", chance = 16000},
	{id = "calopteryx cape", chance = 830},
	{id = "carapace shield", chance = 920},
	{id = "hive scythe", chance = 1650},
	{id = "gooey mass", chance = 13000, maxCount = 2},
	{id = "hive bow", chance = 830}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -60, maxDamage = -80, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_POISONAREA, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 20, minDamage = -600, maxDamage = -1000, effect = CONST_ME_GREEN_RINGS, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="combat", interval = 2000, chance = 50, minDamage = 50, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = 500, maxDamage = 700, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
