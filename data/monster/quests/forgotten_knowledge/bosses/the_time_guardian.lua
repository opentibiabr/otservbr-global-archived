local mType = Game.createMonsterType("The Time Guardian")
local monster = {}

monster.description = "the time guardian"
monster.experience = 50000
monster.outfit = {
	lookType = 945,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "undead"
monster.corpse = 27753
monster.speed = 340
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "This place is sacred!", yell = false}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 100},
	{id = 2148, chance = 100000, maxCount = 100},
	{id = 2152, chance = 100000, maxCount = 25},
	{id = 2150, chance = 100000, maxCount = 10},
	{id = 2145, chance = 100000, maxCount = 10},
	{id = 2149, chance = 100000, maxCount = 10},
	{id = 2147, chance = 100000, maxCount = 10},
	{id = 9970, chance = 100000, maxCount = 10},
	{id = 7590, chance = 100000, maxCount = 5},
	{id = 8472, chance = 100000, maxCount = 10},
	{id = 8473, chance = 100000, maxCount = 10},
	{id = 18413, chance = 100000, maxCount = 3},
	{id = 18415, chance = 100000, maxCount = 3},
	{id = 18414, chance = 100000, maxCount = 3},
	{id = 7439, chance = 100000},
	{id = 2158, chance = 100000},
	{id = 2155, chance = 100000},
	{id = 13293, chance = 2000},
	{id = 12410, chance = 2000},
	{id = 5904, chance = 2000},
	{id = 7894, chance = 1000},
	{id = 7440, chance = 2000},
	{id = 2214, chance = 2000},
	{id = 2153, chance = 2000},
	{id = 2154, chance = 2000},
	{id = 11240, chance = 1000},
	{id = 2436, chance = 1000},
	{id = 2197, chance = 1000},
	{id = 11240, chance = 1000},
	{id = 27624, chance = 500, unique = true},
	{id = 8904, chance = 1000},
	{id = 5809, chance = 100, unique = true},
	{id = 2539, chance = 100},
	{id = 7417, chance = 100},
	{id = 25377, chance = 100000},
	{id = 25172, chance = 100000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 190, attack = 300},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -780, range = 7, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -780, length = 9, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -780, length = 9, spread = 3, effect = CONST_ME_ENERGYAREA, target = false},
	-- energy damage
	{name ="condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -2000, maxDamage = -2000, radius = 7, effect = CONST_ME_BLOCKHIT, target = false},
	-- bleed
	{name ="condition", type = CONDITION_BLEEDING, interval = 2000, chance = 20, minDamage = -2000, maxDamage = -2000, length = 9, spread = 3, effect = CONST_ME_BLOCKHIT, target = false}
}

monster.defenses = {
	defense = 70,
	armor = 70,
	{name ="time guardian", interval = 2000, chance = 10, target = false},
	{name ="time guardiann", interval = 2000, chance = 10, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 70},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 70},
	{type = COMBAT_HOLYDAMAGE , percent = 70},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
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
