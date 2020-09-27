local mType = Game.createMonsterType("Gelidrazah the Frozen")
local monster = {}

monster.description = "gelidrazah the frozen"
monster.experience = 9000
monster.outfit = {
	lookType = 947,
	lookHead = 57,
	lookBody = 11,
	lookLegs = 38,
	lookFeet = 38,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 10000
monster.maxHealth = 10000
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 400,
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
	{id = 2148, chance = 97000, maxCount = 56},
	{id = 2152, chance = 97000, maxCount = 2},
	{id = 27606, chance = 100000},
	{id = 7290, chance = 25000},
	{id = 7888, chance = 25000},
	{id = 7902, chance = 25000},
	{id = 7441, chance = 25000},
	{id = 2672, chance = 25000, maxCount = 5},
	{id = 2146, chance = 25000},
	{id = 2033, chance = 25000},
	{id = 27605, chance = 80000, maxCount = 2},
	{id = 21696, chance = 500},
	{id = 21697, chance = 500},
	{id = 7409, chance = 1500},
	{id = 18412, chance = 1500},
	{id = 27607, chance = 100000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 112, attack = 85, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -310, maxDamage = -495, type = COMBAT_ICEDAMAGE, range = 5, effect = CONST_ME_ICETORNADO, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 10000},
	{name ="combat", interval = 2000, chance = 15, minDamage = -310, maxDamage = -395, type = COMBAT_ICEDAMAGE, length = 9, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -210, maxDamage = -395, type = COMBAT_ICEDAMAGE, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -150, maxDamage = -280, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 64,
	armor = 52,
	{name ="combat", interval = 2000, chance = 15, minDamage = 150, maxDamage = 450, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = -10}
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
