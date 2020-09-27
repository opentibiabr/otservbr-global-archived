local mType = Game.createMonsterType("Evil Mastermind")
local monster = {}

monster.description = "Evil Mastermind"
monster.experience = 675
monster.outfit = {
	lookType = 256,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1295
monster.maxHealth = 1295
monster.race = "undead"
monster.corpse = 7256
monster.speed = 350
monster.summonCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	targetDistance = 3,
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
	{name = "vampire", chance = 40, interval = 2000, max = 3}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You won't stop my masterplan to flood the world market with fake Bonelord language dictionaries!", yell = false},
	{text = "My calculations tell me you'll die!", yell = false},
	{text = "You can't stop me!", yell = false},
	{text = "Beware! My evil monolog is coming!", yell = false}
}

monster.loot = {
	{id = 10308, chance = 10000},
	{id = 2148, chance = 100000, maxCount = 95},
	{id = 2152, chance = 93000, maxCount = 3}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 1200, chance = 100, minDamage = 0, maxDamage = -77, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 30, minDamage = -50, maxDamage = -78, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = -66, maxDamage = -72, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 30, minDamage = -36, maxDamage = -57, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = -70, maxDamage = -73, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = -59, maxDamage = -75, type = COMBAT_MANADRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 20000}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 30, minDamage = 50, maxDamage = 110, type = COMBAT_HEALING, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
