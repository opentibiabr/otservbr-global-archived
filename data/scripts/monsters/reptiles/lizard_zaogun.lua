local mType = Game.createMonsterType("Lizard Zaogun")
local monster = {}

monster.description = "a lizard zaogun"
monster.experience = 1700
monster.outfit = {
	lookType = 343,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2955
monster.maxHealth = 2955
monster.race = "blood"
monster.corpse = 11284
monster.speed = 276
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Hissss!", yell = false},
	{text = "Cowardzz!", yell = false},
	{text = "Softzzkinzz from zze zzouzz!", yell = false},
	{text = "Zztand and fight!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 31500, maxCount = 100},
	{id = "gold coin", chance = 31500, maxCount = 100},
	{id = "gold coin", chance = 31000, maxCount = 68},
	{id = "small emerald", chance = 4830, maxCount = 5},
	{id = "platinum coin", chance = 48900, maxCount = 2},
	{id = "tower shield", chance = 1000},
	{id = "lizard leather", chance = 14360},
	{id = "lizard scale", chance = 12520},
	{id = "strong health potion", chance = 1900},
	{id = "great health potion", chance = 7000, maxCount = 3},
	{id = "red lantern", chance = 2170},
	{id = "Zaoan armor", chance = 530},
	{id = "Zaoan shoes", chance = 1000},
	{id = "Zaoan legs", chance = 1001},
	{id = "zaogun flag", chance = 8280},
	{id = "zaogun shoulderplates", chance = 14980}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -349, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -220, maxDamage = -375, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 10, minDamage = 175, maxDamage = 275, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
