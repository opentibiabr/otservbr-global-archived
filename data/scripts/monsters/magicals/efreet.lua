local mType = Game.createMonsterType("Efreet")
local monster = {}

monster.description = "an efreet"
monster.experience = 410
monster.outfit = {
	lookType = 103,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550
monster.maxHealth = 550
monster.race = "blood"
monster.corpse = 6032
monster.speed = 234
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{name = "green djinn", chance = 10, interval = 2000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I grant you a deathwish!", yell = false},
	{text = "Good wishes are for fairytales", yell = false}
}

monster.loot = {
	{id = 1860, chance = 2200},
	{id = "small oil lamp", chance = 160},
	{id = "gold coin", chance = 50000, maxCount = 75},
	{id = "gold coin", chance = 60000, maxCount = 50},
	{id = "small emerald", chance = 7000},
	{id = "green gem", chance = 200},
	{id = "wand of inferno", chance = 390},
	{id = "heavy machete", chance = 5000},
	{id = "mystic turban", chance = 160},
	{id = "pear", chance = 9390, maxCount = 5},
	{id = "green piece of cloth", chance = 3000},
	{id = "royal spear", chance = 15570, maxCount = 3},
	{id = "strong mana potion", chance = 3500},
	{id = "magma monocle", chance = 360},
	{id = "jewelled belt", chance = 8540},
	{id = "noble turban", chance = 1130}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -110, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -40, maxDamage = -110, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -30, maxDamage = -90, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -65, maxDamage = -120, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -650, Duration = 15000},
	{name ="drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="outfit", interval = 2000, chance = 1},
	{name ="combat", interval = 2000, chance = 15, range = 5, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 15, minDamage = 50, maxDamage = 80, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -8},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
