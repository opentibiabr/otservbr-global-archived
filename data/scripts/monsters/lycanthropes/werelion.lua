local mType = Game.createMonsterType("Werelion")
local monster = {}

monster.description = "a werelion"
monster.experience = 2400
monster.outfit = {
	lookType = 1301,
	lookHead = 58,
	lookBody = 2,
	lookLegs = 94,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 2800
monster.maxHealth = 2800
monster.race = "blood"
monster.corpse = 38660
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20
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
	targetDistance = 1,
	runHealth = 5,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 1,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "Platinum Coin", chance = 100000, maxCount = 5},
	{id = "Great Spirit Potion", chance = 100000, maxCount = 2},
	{id = "Small Enchanted Ruby", chance = 5000, maxCount = 2},
	{id = "Meat", chance = 5000, maxCount = 2},
	{id = "Crystal Sword", chance = 5000},
	{id = "Lion's Mane", chance = 5000},
	{id = "Silver Brooch", chance = 1500},
	{id = "Small Diamond", chance = 1500, maxCount = 2},
	{id = "War Hammer", chance = 1500},
	{id = "Doublet", chance = 1500},
	{id = "Dark Shield", chance = 1500},
	{id = "Titan Axe", chance = 1500},
	{id = "Spiked Squelcher", chance = 1500},
	{id = "Glorious Axe", chance = 1500},
	{id = "Spirit Cloak", chance = 1500},
	{id = "Onyx Chip", chance = 1500},
	{id = "Coral Brooch", chance = 1500},
	{id = "Ivory Carving", chance = 1500},
	{id = "Rainbow Quartz", chance = 1500},
	{id = "Noble Axe", chance = 500},
	{id = "White Silk Flower", chance = 500},
	{id = "Lion Figurine", chance = 100}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -150, maxDamage = -250, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -410, type = COMBAT_HOLYDAMAGE, range = 3, effect = CONST_ME_HOLYAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -170, maxDamage = -350, type = COMBAT_HOLYDAMAGE, range = 3, shootEffect = CONST_ANI_HOLY, target = true}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 20, minDamage = 100, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 45}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
