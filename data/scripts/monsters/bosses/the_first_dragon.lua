local mType = Game.createMonsterType("The First Dragon")
local monster = {}

monster.description = "the first dragon"
monster.experience = 9000
monster.outfit = {
	lookType = 947,
	lookHead = 94,
	lookBody = 80,
	lookLegs = 120,
	lookFeet = 60,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 27733
monster.speed = 350
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 120, attack = 130, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -410, maxDamage = -695, type = COMBAT_FIREDAMAGE, range = 5, effect = CONST_ME_FIREAREA, target = true},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -600, Duration = 10000},
	{name ="combat", interval = 2000, chance = 20, minDamage = -1010, maxDamage = -1995, type = COMBAT_FIREDAMAGE, length = 9, spread = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -410, maxDamage = -595, type = COMBAT_FIREDAMAGE, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -150, maxDamage = -280, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 64,
	armor = 52,
	{name ="combat", interval = 2000, chance = 15, minDamage = 1500, maxDamage = 4500, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
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
