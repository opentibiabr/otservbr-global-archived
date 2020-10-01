local mType = Game.createMonsterType("The Evil Eye")
local monster = {}

monster.description = "the Evil Eye"
monster.experience = 750
monster.outfit = {
	lookType = 210,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 6037
monster.speed = 240
monster.summonCost = 0
monster.maxSummons = 5

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 3,
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

monster.summons = {
	{name = "demon skeleton", chance = 13, interval = 1000, max = 5},
	{name = "ghost", chance = 12, interval = 1000, max = 4}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Inferior creatures, bow before my power!", yell = false},
	{text = "653768764!", yell = false}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 45},
	{id = 5898, chance = 5000},
	{id = 2148, chance = 80000, maxCount = 90}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 65, attack = 24, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = -60, maxDamage = -130, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 1000, chance = 13, minDamage = -85, maxDamage = -115, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 1000, chance = 17, minDamage = -135, maxDamage = -175, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 15, minDamage = -40, maxDamage = -120, range = 7, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 1000, chance = 12, minDamage = -110, maxDamage = -130, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="speed", interval = 1000, chance = 10, SpeedChange = -850, Duration = 20000},
	{name ="combat", interval = 1000, chance = 8, minDamage = -35, maxDamage = -85, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 1000, chance = 6, minDamage = -75, maxDamage = -85, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1000, chance = 9, minDamage = -150, maxDamage = -250, type = COMBAT_MANADRAIN, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY, target = false}
}

monster.defenses = {
	defense = 23,
	armor = 19,
	{name ="combat", interval = 1000, chance = 9, minDamage = 1, maxDamage = 219, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
	{type = COMBAT_HOLYDAMAGE , percent = -20},
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
