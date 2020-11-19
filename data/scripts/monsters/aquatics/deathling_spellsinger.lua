local mType = Game.createMonsterType("Deathling Spellsinger")
local monster = {}

monster.description = "a deathling spellsinger"
monster.experience = 6400
monster.outfit = {
	lookType = 1088,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "blood"
monster.corpse = 32549
monster.speed = 310
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
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 0,
	runHealth = 20,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "BOQOL\"°", yell = false},
	{text = "QOL\" VBOXCL°", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 14},
	{id = "crystalline arrow", chance = 29000, maxCount = 25},
	{id = "Small Emerald", chance = 15000, maxCount = 14},
	{id = "Deepling Filet", chance = 14630},
	{id = "Deeptags", chance = 14100},
	{id = "Deepling Ridge", chance = 11240},
	{id = "Great Mana Potion", chance = 10000},
	{id = "Great Health Potion", chance = 10000},
	{id = "Deepling Warts", chance = 10000},
	{id = "Vortex Bolt", chance = 6500, maxCount = 25},
	{id = "Eye of a Deepling", chance = 6070},
	{id = "Warrior's Shield", chance = 4200},
	{id = "Heavy Trident", chance = 4000},
	{id = "Warrior's Axe", chance = 4000},
	{id = "Fish Fin", chance = 3650},
	{id = "Life Ring", chance = 2870},
	{id = "Small Enchanted Sapphire", chance = 2220, maxCount = 4},
	{id = "Necklace of the Deep", chance = 330}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -400, range = 5, shootEffect = CONST_ANI_HUNTINGSPEAR, target = false},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -300, range = 5, shootEffect = CONST_ANI_LARGEROCK, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -400, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false}
}

monster.defenses = {
	defense = 72,
	armor = 72
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
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
