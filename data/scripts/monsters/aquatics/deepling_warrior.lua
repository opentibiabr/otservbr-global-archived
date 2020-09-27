local mType = Game.createMonsterType("Deepling Warrior")
local monster = {}

monster.description = "a deepling warrior"
monster.experience = 1500
monster.outfit = {
	lookType = 441,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "blood"
monster.corpse = 15175
monster.speed = 290
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
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 0,
	runHealth = 30,
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
	{text = "Jou wjil ajll djie!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 60000, maxCount = 100},
	{id = "gold coin", chance = 60000, maxCount = 80},
	{id = "small emerald", chance = 2854},
	{id = "life ring", chance = 2941},
	{id = "fish fin", chance = 961},
	{id = "great mana potion", chance = 9090},
	{id = "great health potion", chance = 11111},
	{id = "heavy trident", chance = 1030},
	{id = "eye of a deepling", chance = 574},
	{id = "deepling warts", chance = 10000},
	{id = "deeptags", chance = 14285},
	{id = "warrior's axe", chance = 534},
	{id = "deepling ridge", chance = 11111},
	{id = "warrior's shield", chance = 684},
	{id = "deepling filet", chance = 14285},
	{id = "vortex bolt", chance = 3571, maxCount = 5}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -290, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, minDamage = 50, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
