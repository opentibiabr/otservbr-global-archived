local mType = Game.createMonsterType("Twisted Pooka")
local monster = {}

monster.description = "a twisted pooka"
monster.experience = 600
monster.outfit = {
	lookType = 978,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700
monster.maxHealth = 700
monster.race = "blood"
monster.corpse = 29114
monster.speed = 230
monster.summonCost = 450
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
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
	{text = "*sniff sniff* Mhmmm ... mortal flesh.", yell = false},
	{text = "Hoppel-di-hopp!", yell = false},
	{text = "I'll gnaw away your toes!", yell = false}
}

monster.loot = {
	{id = "carrot on a stick", chance = 20},
	{id = "small stone", chance = 200, maxCount = 5},
	{id = "gold coin", chance = 30000, maxCount = 100},
	{id = "stealth ring", chance = 492},
	{id = 2684, chance = 55000, maxCount = 3},
	{id = "strong health potion", chance = 719},
	{id = "orange mushroom", chance = 10000},
	{id = "fairy wings", chance = 30100},
	{id = "orange mushroom", chance = 5155},
	{id = "Shimmering Beetles", chance = 591},
	{id = "Small Enchanted Ruby", chance = 3400, maxCount = 2}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -120, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -50, type = COMBAT_EARTHDAMAGE, range = 4, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_STONES, target = true},
	-- earth damage
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -50, maxDamage = -100, range = 3, effect = CONST_ME_POISONAREA, target = true},
	{name ="drunk", interval = 2000, chance = 11, length = 4, spread = 2, effect = CONST_ME_STUN, target = false}
}

monster.defenses = {
	defense = 38,
	armor = 38,
	{name ="combat", interval = 2000, chance = 25, minDamage = 40, maxDamage = 60, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
