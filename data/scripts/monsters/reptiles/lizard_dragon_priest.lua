local mType = Game.createMonsterType("Lizard Dragon Priest")
local monster = {}

monster.description = "a lizard dragon priest"
monster.experience = 1320
monster.outfit = {
	lookType = 339,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1450
monster.maxHealth = 1450
monster.race = "blood"
monster.corpse = 11280
monster.speed = 256
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
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetdistance = 4,
	runHealth = 50,
	isHealthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Dragon Hatchling", chance = 20, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I ssssmell warm blood!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 5000, maxCount = 100},
	{id = "gold coin", chance = 4400, maxCount = 88},
	{id = "small amethyst", chance = 4900, maxCount = 3},
	{id = "platinum coin", chance = 4090, maxCount = 2},
	{id = "yellow gem", chance = 1000},
	{id = "life ring", chance = 770},
	{id = "terra rod", chance = 1001},
	{id = "wand of inferno", chance = 1480},
	{id = "lizard leather", chance = 980},
	{id = "lizard scale", chance = 1130},
	{id = "strong mana potion", chance = 12110},
	{id = "great mana potion", chance = 7940},
	{id = "focus cape", chance = 660},
	{id = "bunch of ripe rice", chance = 960},
	{id = "Zaoan shoes", chance = 450},
	{id = "Zaoan robe", chance = 300},
	{id = "dragon priest's wandtip", chance = 9910}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -125, maxDamage = -190, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -320, maxDamage = -400, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 30, minDamage = 200, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
