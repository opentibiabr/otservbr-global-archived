local mType = Game.createMonsterType("Jaul")
local monster = {}

monster.description = "Jaul"
monster.experience = 30000
monster.outfit = {
	lookType = 444,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 90000
monster.maxHealth = 90000
monster.race = "blood"
monster.corpse = 15220
monster.speed = 440
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50
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
	pushable = true,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 0,
	runHealth = 60,
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
	{text = "QJELL AFAR GOU JEY!!", yell = false},
	{text = "DIE!! KENH!!", yell = false}
}

monster.loot = {
	{id = 15413, chance = 3100},
	{id = 15408, chance = 5333},
	{id = 15404, chance = 5000},
	{id = 15406, chance = 25000},
	{id = 15407, chance = 4000},
	{id = 15410, chance = 2285},
	{id = 15414, chance = 4285},
	{id = 15412, chance = 3142}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, totalDamage = 870, interval = 4000}},
	{name ="combat", interval = 2200, chance = 19, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -1000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 32, type = COMBAT_MANADRAIN, minDamage = -200, maxDamage = -800, range = 7, radius = 7, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1300, chance = 27, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -600, radius = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 1200, chance = 6, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -900, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_ICEDAMAGE, minDamage = -1000, maxDamage = -2000, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="speed", interval = 1900, chance = 14, speedChange = -600, range = 7, radius = 1, target = true, duration = 15000}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 2300, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 5500, chance = 10, type = COMBAT_HEALING, minDamage = 14000, maxDamage = 21000, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -1}
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
