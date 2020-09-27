local mType = Game.createMonsterType("Mounted Thorn Knight")
local monster = {}

monster.description = "mounted thorn knight"
monster.experience = 15000
monster.outfit = {
	lookType = 512,
	lookHead = 81,
	lookBody = 121,
	lookLegs = 121,
	lookFeet = 121,
	lookAddons = 3,
	lookMount = 626
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 0
monster.speed = 430
monster.summonCost = 290
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
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
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

monster.events = {
	"ThornKnightDeath",
	"HealthForgotten"
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
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -600, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 12, minDamage = -400, maxDamage = -700, type = COMBAT_LIFEDRAIN, length = 4, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -1400, maxDamage = -1700, type = COMBAT_MANADRAIN, length = 9, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -400, maxDamage = -700, type = COMBAT_DEATHDAMAGE, length = 9, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -250, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_BLOCKHIT, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 60,
	{name ="combat", interval = 2000, chance = 20, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = 1550, maxDamage = 2550, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 12, SpeedChange = 620, Duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 80},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
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
