local mType = Game.createMonsterType("Snake Thing")
local monster = {}

monster.description = "Snake Thing"
monster.experience = 8400
monster.outfit = {
	lookType = 220,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 70000
monster.maxHealth = 70000
monster.race = "venom"
monster.corpse = 0
monster.speed = 240
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
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
	{text = "POWER! I SEED MORE POWER!", yell = true}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 35, minDamage = 0, maxDamage = -500, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -2398, type = COMBAT_MANADRAIN, length = 8, spread = 3, effect = CONST_ME_SOUND_RED, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 30, minDamage = -30, maxDamage = -60, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 45,
	{name ="combat", interval = 2000, chance = 25, minDamage = 150, maxDamage = 450, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
