local mType = Game.createMonsterType("Insane Siren")
local monster = {}

monster.description = "an insane siren"
monster.experience = 6000
monster.outfit = {
	lookType = 1137,
	lookHead = 94,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 20,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 6500
monster.maxHealth = 6500
monster.race = "blood"
monster.corpse = 34771
monster.speed = 420
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
	runHealth = 0,
	isHealthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Dream or nightmare?", yell = false}
}

monster.loot = {
	{id = "Platinum Coin", chance = 100000, maxCount = 12},
	{id = "Ultimate Health Potion", chance = 14970},
	{id = "Miraculum", chance = 13090},
	{id = "Dream Essence Egg", chance = 11980},
	{id = "Wand of Draconia", chance = 7700},
	{id = "Holy Orchid", chance = 5650},
	{id = "Magma Amulet", chance = 5130},
	{id = "Wand of Inferno", chance = 4360},
	{id = "Fire Axe", chance = 3590},
	{id = "Magma Coat", chance = 3340},
	{id = "Wand of Dragonbreath", chance = 2650},
	{id = "Sun Fruit", chance = 2570},
	{id = "Magma Legs", chance = 1200},
	{id = "Magma Monocle", chance = 260}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -530, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -270, maxDamage = -710, type = COMBAT_FIRE, length = 3, spread = 0, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -250, maxDamage = -300, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -350, maxDamage = -380, type = COMBAT_FIRE, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -350, type = COMBAT_FIRE, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 70
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
