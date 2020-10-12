local mType = Game.createMonsterType("The Shatterer")
local monster = {}

monster.description = "The Shatterer"
monster.experience = 58000
monster.outfit = {
	lookType = 842,
	lookHead = 77,
	lookBody = 113,
	lookLegs = 21,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 320
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 2500,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "STOMP! SHAKE! SHATTERER!!", yell = false}
}

monster.loot = {
	{id = 7590, chance = 23000, maxCount = 10},
	{id = 8472, chance = 46100, maxCount = 10},
	{id = 8473, chance = 46100, maxCount = 10},
	{id = 2147, chance = 12000, maxCount = 12},
	{id = 2152, chance = 8000, maxCount = 10},
	{id = 2148, chance = 30000, maxCount = 200}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -3000, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -1000, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 3000, chance = 44, minDamage = -400, maxDamage = -2000, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = -400, duration = 15000},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -800, type = COMBAT_ICEDAMAGE, range = 7, effect = CONST_ME_BIGPLANTS, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, minDamage = 400, maxDamage = 6000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 440, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
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
