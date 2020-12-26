local mType = Game.createMonsterType("The Nightmare Beast")
local monster = {}

monster.description = "a The Nightmare Beast"
monster.experience = 255000
monster.outfit = {
	lookType = 1144,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 22
monster.maxHealth = 22
monster.race = "blood"
monster.corpse = 34797
monster.speed = 250
monster.manaCost = 0
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
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "piggy bank", chance = 100000},
	{id = "mysterious remains", chance = 100000},
	{id = "energy bar", chance = 100000},
	{id = "silver token", chance = 97120, maxCount = 4},
	{id = "gold token", chance = 76980, maxCount = 3},
	{id = "ultimate spirit potion", chance = 63310, maxCount = 14},
	{id = "supreme health potion", chance = 53240, maxCount = 6},
	{id = "ultimate spirit potion", chance = 47480, maxCount = 20},
	{id = "huge chunk of crude iron", chance = 40290},
	{id = "red gem", chance = 32370},
	{id = "yellow gem", chance = 28780},
	{id = "royal star", chance = 25900, maxCount = 100},
	{id = "berserk potion", chance = 24460, maxCount = 10},
	{id = "blue gem", chance = 18710},
	{id = "mastermind potion", chance = 17990, maxCount = 10},
	{id = "green gem", chance = 17270},
	{id = "crystal coin", chance = 17270},
	{id = "skull staff", chance = 16550},
	{id = "bullseye potion", chance = 13670, maxCount = 10},
	{id = "ice shield", chance = 13670},
	{id = "chaos mace", chance = 13670},
	{id = "gold ingot", chance = 12950},
	{id = 7633, chance = 10790},
	{id = 26200, chance = 10070},
	{id = 26198, chance = 9350},-- collar of blue plasma
	{id = 26187, chance = 8630},
	{id = "ring of the sky", chance = 8630},
	{id = 26199, chance = 7910},
	{id = "beast's nightmare-cushion", chance = 6470},
	{id = "violet gem", chance = 6470},
	{id = "magic sulphur", chance = 6470},
	{id = "purple tendril lantern", chance = 5760},
	{id = 26185, chance = 5040},
	{id = 26189, chance = 5040},
	{id = "soul stone", chance = 5040},
	{id = "dragon figurine", chance = 5040},
	{id = "giant sapphire", chance = 4320},
	{id = "giant emerald", chance = 4320},
	{id = "turquoise tendril lantern", chance = 2880},
	{id = "dark whispers", chance = 2880},
	{id = "arcane staff", chance = 2880},
	{id = "giant ruby", chance = 2880},
	{id = "abyss hammer", chance = 2160},
	{id = 34981, chance = 2160},
	{id = "unicorn figurine", chance = 1000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250}
}

monster.defenses = {
	defense = 20,
	armor = 20
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
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
