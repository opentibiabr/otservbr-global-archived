local mType = Game.createMonsterType("Clubarc The Plunderer")
local monster = {}

monster.description = "Clubarc The Plunderer"
monster.experience = 400
monster.outfit = {
	lookType = 342,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400
monster.maxHealth = 400
monster.race = "blood"
monster.corpse = 11254
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	targetDistance = 4,
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
	{text = "Orc arga Huummmak!", yell = false}
}

monster.loot = {
	{id = 2148, chance = 58000, maxCount = 78},
	{id = 2666, chance = 24600},
	{id = 2428, chance = 21000},
	{id = 11324, chance = 13000},
	{id = 11338, chance = 6000},
	{id = 2456, chance = 4600},
	{id = 8857, chance = 3070},
	{id = 11113, chance = 1500}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -130, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 50, minDamage = 0, maxDamage = -85, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_ONYXARROW, target = false},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 11, minDamage = -8, maxDamage = -8, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 350, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = -2},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 2},
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
