local mType = Game.createMonsterType("Gaffir")
local monster = {}

monster.description = "a gaffir"
monster.experience = 25000
monster.outfit = {
	lookType = 1217,
	lookHead = 34,
	lookBody = 129,
	lookLegs = 113,
	lookFeet = 19,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 48500
monster.maxHealth = 48500
monster.race = "blood"
monster.corpse = 36142
monster.speed = 190
monster.summonCost = 0
monster.maxSummons = 1

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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Black Cobra", chance = 10, interval = 2000, max = 1}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 17},
	{name = "Small Ruby", chance = 33500, maxCount = 2},
	{name = "Small Sapphire", chance = 33500},
	{name = "Small Topaz", chance = 33500},
	{name = "Small Diamond", chance = 33500},
	{name = "Terra Rod", chance = 26000, maxCount = 3},
	{name = "Springsprout Rod", chance = 19000},
	{name = "Great Spirit Potion", chance = 16400},
	{name = "Spellbook of Warding", chance = 9500},
	{name = "Ring of Healing", chance = 6400},
	{name = "Cobra Crest", chance = 560}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -450, maxDamage = -650, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -580, length = 5, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 3000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -750, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 16, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -620, radius = 4, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -320, maxDamage = -500, radius = 2, effect = CONST_ME_GREEN_RINGS, target = false}
}

monster.defenses = {
	defense = 83,
	armor = 83
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
