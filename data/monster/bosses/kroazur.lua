local mType = Game.createMonsterType("Kroazur")
local monster = {}

monster.description = "Kroazur"
monster.experience = 2700
monster.outfit = {
	lookType = 842,
	lookHead = 19,
	lookBody = 114,
	lookLegs = 94,
	lookFeet = 85,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "undead"
monster.corpse = 6325
monster.speed = 500
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "fairy wings", chance = 100000},
	{id = "gold coin", chance = 100000, maxCount = 365},
	{id = "platinum coin", chance = 100000, maxCount = 7},
	{id = "strong health potion", chance = 91460, maxCount = 2},
	{id = "great health potion", chance = 76330, maxCount = 3},
	{id = "small enchanted amethyst", chance = 53560, maxCount = 5},
	{id = "ancient coin", chance = 46980, maxCount = 3},
	{id = "gemmed figurine", chance = 32030},
	{id = "small enchanted emerald", chance = 11003, maxCount = 5},
	{id = "small enchanted ruby", chance = 2000},
	{id = "silver token", chance = 10140},
	{id = "cluster of solace", chance = 9960},
	{id = "red crystal fragment", chance = 9960},
	{id = "small enchanted sapphire", chance = 8900},
	{id = "assassin star", chance = 8540},
	{id = "gold token", chance = 6580},
	{id = "gold ingot", chance = 6410},
	{id = "nightmare blade", chance = 3020}
}

monster.attacks = {
	{name ="melee", interval = 200, chance = 20, minDamage = 0, maxDamage = -650},
	{name ="combat", interval = 200, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -500, target = false},
	{name ="combat", interval = 500, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 500, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -300, radius = 8, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 400, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
