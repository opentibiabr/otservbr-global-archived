local mType = Game.createMonsterType("Salamander")
local monster = {}

monster.description = "a salamander"
monster.experience = 25
monster.outfit = {
	lookType = 529,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 70
monster.maxHealth = 70
monster.race = "blood"
monster.corpse = 19707
monster.speed = 120
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Chrrch!", yell = false}
}

monster.loot = {
	{id = 2120, chance = 5070},
	{id = "gold coin", chance = 72000, maxCount = 15},
	{id = "mace", chance = 3780},
	{id = 2419, chance = 490},
	{id = "bow", chance = 740},
	{id = "brass helmet", chance = 2180},
	{id = "arrow", chance = 7890, maxCount = 3},
	{id = "health potion", chance = 1480},
	{id = 19737, chance = 34920, maxCount = 5}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 10, interval = 4000}}
}

monster.defenses = {
	defense = 5,
	armor = 5,
	{name ="combat", interval = 6000, chance = 20, minDamage = 0, maxDamage = 4, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
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
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
