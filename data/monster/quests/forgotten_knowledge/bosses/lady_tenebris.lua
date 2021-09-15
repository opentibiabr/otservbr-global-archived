local mType = Game.createMonsterType("Lady Tenebris")
local monster = {}

monster.description = "Lady Tenebris"
monster.experience = 50000
monster.outfit = {
	lookType = 433,
	lookHead = 57,
	lookBody = 95,
	lookLegs = 38,
	lookFeet = 94,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "blood"
monster.corpse = 6560
monster.speed = 370
monster.manaCost = 0
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
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false,
	pet = false
}

monster.events = {
	"HealthForgotten"
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "May the embrace of darkness kill you!", yell = false}
}

monster.loot = {
	{id = 3031, chance = 10000, maxCount = 50},
	{id = 3035, chance = 10000, maxCount = 50},
	{id = 3033, chance = 10000, maxCount = 10},
	{id = 3028, chance = 10000, maxCount = 10},
	{id = 3030, chance = 10000, maxCount = 10},
	{id = 9057, chance = 10000, maxCount = 10},
	{id = 238, chance = 10000, maxCount = 100},
	{id = 7642, chance = 10000, maxCount = 100},
	{id = 20062, chance = 2000, maxCount = 2},
	{id = 16119, chance = 2000, maxCount = 3},
	{id = 16121, chance = 5000, maxCount = 5},
	{id = 20062, chance = 2000, maxCount = 2},
	{id = 16120, chance = 5000, maxCount = 3},
	{id = 281, chance = 6000},
	{id = 3038, chance = 2000},
	{id = 7440, chance = 2000},
	{id = 22195, chance = 2000},
	{id = 3039, chance = 1000},
	{id = 3006, chance = 2000},
	{id = 7451, chance = 2000},
	{id = 8075, chance = 1000},
	{id = 8073, chance = 1000},
	{id = 3324, chance = 1000},
	{id = 3037, chance = 1000},
	{id = 16096, chance = 1000},
	{id = 22721, chance = 100000},
	{id = 22516, chance = 100000},
	{id = 3341, chance = 200},
	{id = 24973, chance = 200},
	{id = 24974, chance = 200},
	{id = 22755, chance = 200},
	{id = 20088, chance = 200},
	{id = 24957, chance = 500, unique = true},
	{id = 3021, chance = 200},
	{id = 20089, chance = 200}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -800, maxDamage = -1300},
	{name ="combat", interval = 6000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -1500, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -600, radius = 4, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="tenebris summon", interval = 2000, chance = 14, target = false},
	{name ="tenebris ultimate", interval = 15000, chance = 30, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 2700, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
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
