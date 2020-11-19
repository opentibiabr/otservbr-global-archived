local mType = Game.createMonsterType("Grand Chaplain Gaunder")
local monster = {}

monster.description = "Grand Chaplain Gaunder"
monster.experience = 14
monster.outfit = {
	lookType = 1071,
	lookHead = 57,
	lookBody = 75,
	lookLegs = 38,
	lookFeet = 86,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 32433
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 3000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
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
	{id = "Small Emerald", chance = 100000, maxCount = 3},
	{id = "Assassin Star", chance = 100000, maxCount = 5},
	{id = "Great Spirit Potion", chance = 100000, maxCount = 3},
	{id = "gold coin", chance = 100000, maxCount = 60},
	{id = "gold coin", chance = 100000, maxCount = 40},
	{id = "Onyx Arrow", chance = 700, maxCount = 3},
	{id = 7633, chance = 3300},
	{id = "Damaged Armor Plates", chance = 350, maxCount = 3},
	{id = "Falcon Longsword", chance = 60},
	{id = "Falcon Shield", chance = 60}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -700, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1500, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -890, range = 4, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -720, range = 7, shootEffect = CONST_ANI_ETHEREALSPEAR, target = false},
	{name ="combat", interval = 1500, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -700, range = 5, radius = 3, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 82,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 550, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 10, speedChange = 220, effect = CONST_ME_POFF, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 55}
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
