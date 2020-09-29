local mType = Game.createMonsterType("Draken Abomination")
local monster = {}

monster.description = "a draken abomination"
monster.experience = 3800
monster.outfit = {
	lookType = 357,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6250
monster.maxHealth = 6250
monster.race = "venom"
monster.corpse = 12623
monster.speed = 270
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
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
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

monster.summons = {
	{name = "Death Blob", chance = 10, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Uhhhg!", yell = false},
	{text = "Hmmnn!", yell = false},
	{text = "Aaag!", yell = false},
	{text = "Gll", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 47000, maxCount = 98},
	{id = "platinum coin", chance = 50590, maxCount = 8},
	{id = "meat", chance = 50450, maxCount = 4},
	{id = "great mana potion", chance = 9950, maxCount = 3},
	{id = "terra hood", chance = 8730},
	{id = "great spirit potion", chance = 4905, maxCount = 3},
	{id = "ultimate health potion", chance = 9400, maxCount = 3},
	{id = "wand of voodoo", chance = 1020},
	{id = "small topaz", chance = 2900, maxCount = 4},
	{id = "Zaoan armor", chance = 470},
	{id = "Zaoan helmet", chance = 560},
	{id = "Zaoan legs", chance = 780},
	{id = "eye of corruption", chance = 12110},
	{id = "tail of corruption", chance = 6240},
	{id = "scale of corruption", chance = 10940},
	{id = "shield of corruption", chance = 10},
	{id = "draken boots", chance = 540},
	{id = "snake god's wristguard", chance = 10},
	{id = "bamboo leaves", chance = 360}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -420, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -310, maxDamage = -630, type = COMBAT_FIREDAMAGE, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 10, range = 5, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -170, maxDamage = -370, type = COMBAT_DEATHDAMAGE, length = 4, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="drunk", interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, range = 7, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 15, minDamage = 650, maxDamage = 700, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
