local mType = Game.createMonsterType("The Lord of the Lice")
local monster = {}

monster.description = "the lord of the lice"
monster.experience = 600
monster.outfit = {
	lookType = 305,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80000
monster.maxHealth = 80000
monster.race = "blood"
monster.corpse = 9871
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	runHealth = 0,
	healthHidden = false,
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
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 170},
	{id = 10585, chance = 100000},
	{id = 2152, chance = 94830, maxCount = 10},
	{id = 8473, chance = 94830, maxCount = 10},
	{id = 7590, chance = 94830, maxCount = 10},
	{id = 7591, chance = 94830, maxCount = 10},
	{id = 2214, chance = 100000},
	{id = 2438, chance = 25860},
	{id = 7884, chance = 86200}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 100, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 100, interval = 4000}},
	{name ="combat", interval = 2000, chance = 30, minDamage = -120, maxDamage = -310, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 22, minDamage = -1000, maxDamage = -1800, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -80, maxDamage = -80, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -300, maxDamage = -420, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, range = 7, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 9, minDamage = 250, maxDamage = 550, type = COMBAT_HEALING, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
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
