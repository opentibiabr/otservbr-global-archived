local mType = Game.createMonsterType("Barbarian Brutetamer")
local monster = {}

monster.description = "a barbarian brutetamer"
monster.experience = 90
monster.outfit = {
	lookType = 264,
	lookHead = 78,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 121,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 145
monster.maxHealth = 145
monster.race = "blood"
monster.corpse = 20339
monster.speed = 178
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetdistance = 4,
	runHealth = 10,
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
	{name = "War Wolf", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "To me, creatures of the wild!", yell = false},
	{text = "Feel the power of the beast!", yell = false},
	{text = "My instincts tell me about your cowardice.", yell = false}
}

monster.loot = {
	{id = 1958, chance = 4750},
	{id = "gold coin", chance = 90230, maxCount = 15},
	{id = 2401, chance = 6550},
	{id = "chain armor", chance = 9300},
	{id = "corncob", chance = 10940, maxCount = 2},
	{id = "hunting spear", chance = 5200},
	{id = "fur bag", chance = 7590},
	{id = "brutetamer's staff", chance = 340},
	{id = "fur boots", chance = 170},
	{id = "mammoth fur cape", chance = 150},
	{id = "mammoth fur shorts", chance = 90},
	{id = "mana potion", chance = 580}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -34, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_SNOWBALL, target = true},
	{name ="combat", interval = 2000, chance = 15, range = 5, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 7,
	{name ="combat", interval = 2000, chance = 40, minDamage = 50, maxDamage = 80, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
