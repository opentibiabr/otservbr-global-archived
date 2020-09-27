local mType = Game.createMonsterType("Zorvorax")
local monster = {}

monster.description = "zorvorax"
monster.experience = 9000
monster.outfit = {
	lookType = 928,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000
monster.maxHealth = 10000
monster.race = "undead"
monster.corpse = 6306
monster.speed = 350
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 800,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
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
	{id = 27610, chance = 100000},
	{id = 2148, chance = 100000, maxCount = 24},
	{id = 7591, chance = 20000, maxCount = 3},
	{id = 8472, chance = 20000, maxCount = 3},
	{id = 13291, chance = 500},
	{id = 2152, chance = 40000, maxCount = 4},
	{id = 5944, chance = 100000},
	{id = 5741, chance = 25000},
	{id = 9971, chance = 25000},
	{id = 2173, chance = 25000},
	{id = 7430, chance = 25000},
	{id = 9810, chance = 26670},
	{id = 6300, chance = 13330},
	{id = 11233, chance = 50000, maxCount = 2}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 112, attack = 85, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -120, maxDamage = -650, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_BLACKSMOKE, target = true},
	{name ="combat", interval = 2000, chance = 11, minDamage = -330, maxDamage = -805, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, target = false},
	{name ="combat", interval = 2000, chance = 9, minDamage = -300, maxDamage = -780, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 64,
	armor = 52,
	{name ="combat", interval = 2000, chance = 55, minDamage = 450, maxDamage = 550, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
