local mType = Game.createMonsterType("Reflection Of Obujos")
local monster = {}

monster.description = "an reflection of obujos"
monster.experience = 20000
monster.outfit = {
	lookType = 445,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 33000
monster.maxHealth = 33000
monster.race = "blood"
monster.corpse = 15224
monster.speed = 270
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "JN OBU!!", yell = false},
	{text = "QJELL KEJH!!", yell = false}
}

monster.loot = {
	{id = 15411, chance = 100000},
	{id = 15404, chance = 1285},
	{id = 15412, chance = 1285}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1200, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 360, interval = 4000}},
	{name ="combat", interval = 3000, chance = 23, minDamage = -200, maxDamage = -800, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 3500, chance = 20, minDamage = -200, maxDamage = -600, type = COMBAT_MANADRAIN, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_BIGCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -200, maxDamage = -800, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 1200, chance = 7, minDamage = -600, maxDamage = -1300, type = COMBAT_ICEDAMAGE, length = 8, spread = 3, effect = CONST_ME_GIANTICE, target = false},
	{name ="combat", interval = 2000, chance = 14, minDamage = -600, maxDamage = -1600, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_ICETORNADO, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 1000, chance = 15, minDamage = 1000, maxDamage = 2100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
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
