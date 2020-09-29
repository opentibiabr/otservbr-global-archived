local mType = Game.createMonsterType("Bullwark")
local monster = {}

monster.description = "Bullwark"
monster.experience = 22000
monster.outfit = {
	lookType = 607,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 72000
monster.maxHealth = 72000
monster.race = "blood"
monster.corpse = 23367
monster.speed = 300
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
	{id = 2148, chance = 100000, maxCount = 200},
	{id = 2152, chance = 100000, maxCount = 5},
	{id = 23571, chance = 100000, maxCount = 2},
	{id = 23570, chance = 100000},
	{id = 23590, chance = 500},
	{id = 7591, chance = 50000, maxCount = 5},
	{id = 7590, chance = 50000, maxCount = 5},
	{id = 2666, chance = 50000, maxCount = 5},
	{id = 2671, chance = 50000, maxCount = 5},
	{id = 5878, chance = 100000},
	{id = 2145, chance = 30000, maxCount = 5},
	{id = 5911, chance = 5000}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 180, attack = 200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 19, minDamage = -200, maxDamage = -400, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	-- bleed
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 9, minDamage = -400, maxDamage = -600, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 8, minDamage = -250, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true},
	{name ="combat", interval = 2000, chance = 13, minDamage = -200, maxDamage = -400, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 6, target = false}
}

monster.defenses = {
	defense = 66,
	armor = 48,
	{name ="combat", interval = 2000, chance = 1, minDamage = 4000, maxDamage = 6000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 11, SpeedChange = 660, Duration = 7000},
	{name ="combat", interval = 2000, chance = 9, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 1},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 1},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
