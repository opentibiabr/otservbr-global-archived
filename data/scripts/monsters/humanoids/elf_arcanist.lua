local mType = Game.createMonsterType("Elf Arcanist")
local monster = {}

monster.description = "an elf arcanist"
monster.experience = 175
monster.outfit = {
	lookType = 63,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220
monster.maxHealth = 220
monster.race = "blood"
monster.corpse = 6011
monster.speed = 220
monster.summonCost = 0
monster.maxSummons = 0

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
	targetDistance = 4,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Feel my wrath!", yell = false},
	{text = "For the Daughter of the Stars!", yell = false},
	{text = "I'll bring balance upon you!", yell = false},
	{text = "Tha'shi Cenath", yell = false},
	{text = "Vihil Ealuel", yell = false}
}

monster.loot = {
	{id = 1949, chance = 31000},
	{id = "candlestick", chance = 2100},
	{id = "gold coin", chance = 37000, maxCount = 47},
	{id = "yellow gem", chance = 50},
	{id = "life crystal", chance = 970},
	{id = "wand of cosmic energy", chance = 1160},
	{id = "elven amulet", chance = 1999},
	{id = "blank rune", chance = 18000},
	{id = "arrow", chance = 6000, maxCount = 3},
	{id = 2600, chance = 1000},
	{id = "sandals", chance = 950},
	{id = "green tunic", chance = 7000},
	{id = "melon", chance = 22000},
	{id = "bread", chance = 14000},
	{id = "grave flower", chance = 880},
	{id = "sling herb", chance = 5000},
	{id = "holy orchid", chance = 2100},
	{id = "strong mana potion", chance = 3000},
	{id = "health potion", chance = 4000},
	{id = "elvish talisman", chance = 10000},
	{id = "elven astral observer", chance = 7710}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -35, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -70, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_ARROW, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -30, maxDamage = -50, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -70, maxDamage = -85, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 15, minDamage = 40, maxDamage = 60, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
