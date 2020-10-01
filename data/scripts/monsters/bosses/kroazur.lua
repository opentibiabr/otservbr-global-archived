local mType = Game.createMonsterType("Kroazur")
local monster = {}

monster.description = "Kroazur"
monster.experience = 2700
monster.outfit = {
	lookType = 842,
	lookHead = 19,
	lookBody = 114,
	lookLegs = 94,
	lookFeet = 85,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "undead"
monster.corpse = 6325
monster.speed = 500
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20
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
	staticAttackChance = 98,
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
	{id = 2152, chance = 10000, maxCount = 7},
	{id = 2148, chance = 10000, maxCount = 300},
	{id = 27058, chance = 10000, maxCount = 3},
	{id = 7368, chance = 10000, maxCount = 3},
	{id = 7591, chance = 10000, maxCount = 2},
	{id = 7588, chance = 10000, maxCount = 2},
	{id = 18420, chance = 2000, maxCount = 3},
	{id = 7762, chance = 3000, maxCount = 5},
	{id = 27060, chance = 2000},
	{id = 9971, chance = 3000},
	{id = 7418, chance = 3000},
	{id = 22396, chance = 800},
	{id = 25377, chance = 300},
	{id = 25172, chance = 300}
}

monster.attacks = {
	{name ="melee", interval = 200, chance = 20, minDamage = 0, maxDamage = -650, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 200, chance = 20, minDamage = -300, maxDamage = -500, type = COMBAT_DEATHDAMAGE, target = false},
	{name ="combat", interval = 500, chance = 10, minDamage = -200, maxDamage = -300, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 500, chance = 10, minDamage = -250, maxDamage = -300, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, minDamage = 400, maxDamage = 500, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 320, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
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
