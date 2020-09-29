local mType = Game.createMonsterType("Lisa")
local monster = {}

monster.description = "Lisa"
monster.experience = 18000
monster.outfit = {
	lookType = 604,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 55000
monster.maxHealth = 55000
monster.race = "venom"
monster.corpse = 23359
monster.speed = 200
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3
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
}

monster.loot = {
	{id = 23515, chance = 20000, maxCount = 5},
	{id = 23551, chance = 1000},
	{id = 23550, chance = 1000},
	{id = 23549, chance = 1000},
	{id = 23514, chance = 50000, maxCount = 5},
	{id = 23517, chance = 50000, maxCount = 5},
	{id = 23543, chance = 2000},
	{id = 7591, chance = 30000, maxCount = 5},
	{id = 7590, chance = 30000, maxCount = 5},
	{id = 8472, chance = 30000, maxCount = 5},
	{id = 23589, chance = 800},
	{id = 23568, chance = 100000, maxCount = 3},
	{id = 2150, chance = 50000, maxCount = 5},
	{id = 2147, chance = 50000, maxCount = 5},
	{id = 9970, chance = 50000, maxCount = 5}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 150, attack = 100, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 900, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -400, type = COMBAT_LIFEDRAIN, range = 7, shootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_BIGPLANTS, target = true},
	{name ="combat", interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_PLANTATTACK, target = true},
	{name ="combat", interval = 2000, chance = 13, minDamage = -100, maxDamage = -200, type = COMBAT_MANADRAIN, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 12, target = false},
	{name ="combat", interval = 2000, chance = 15, target = false},
	{name ="combat", interval = 2000, chance = 11, minDamage = -400, maxDamage = -900, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 15,
	{name ="combat", interval = 2000, chance = 5, target = false},
	{name ="combat", interval = 1000, chance = 100, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
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
