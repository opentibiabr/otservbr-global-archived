local mType = Game.createMonsterType("The Abomination")
local monster = {}

monster.description = "the Abomination"
monster.experience = 25000
monster.outfit = {
	lookType = 238,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 38050
monster.maxHealth = 38050
monster.race = "venom"
monster.corpse = 6532
monster.speed = 340
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
	rewardBoss = true,
	illusionable = true,
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
	{text = "Blubb", yell = false}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 100},
	{id = 2152, chance = 10000, maxCount = 3},
	{id = 6500, chance = 2857},
	{id = 5944, chance = 2500}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 90, attack = 120, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 1000, chance = 12, SpeedChange = -800, Duration = 10000},
	{name ="combat", interval = 1000, chance = 9, minDamage = -200, maxDamage = -650, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 11, minDamage = -400, maxDamage = -900, type = COMBAT_LIFEDRAIN, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_GREEN, target = true},
	{name ="combat", interval = 2000, chance = 19, minDamage = -350, maxDamage = -850, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, shootEffect = CONST_ANI_POISON, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 75, minDamage = 505, maxDamage = 605, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
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
