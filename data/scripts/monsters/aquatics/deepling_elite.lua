local mType = Game.createMonsterType("Deepling Elite")
local monster = {}

monster.description = "a deepling elite"
monster.experience = 3000
monster.outfit = {
	lookType = 441,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3200
monster.maxHealth = 3200
monster.race = "blood"
monster.corpse = 15176
monster.speed = 330
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
	staticAttackChance = 90,
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
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "gold coin", chance = 100000, maxCount = 86},
	{id = "small emerald", chance = 6290, maxCount = 2},
	{id = "life ring", chance = 5360},
	{id = "fish fin", chance = 2000},
	{id = "great mana potion", chance = 24000},
	{id = "great health potion", chance = 25000},
	{id = "heavy trident", chance = 3380},
	{id = "eye of a deepling", chance = 25000},
	{id = "deepling warts", chance = 25000},
	{id = "deeptags", chance = 21700},
	{id = "warrior's axe", chance = 640},
	{id = "deepling ridge", chance = 19000},
	{id = "warrior's shield", chance = 1234},
	{id = "deepling filet", chance = 25000},
	{id = "vortex bolt", chance = 24000, maxCount = 5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -290, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="combat", interval = 2000, chance = 10, minDamage = 150, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
