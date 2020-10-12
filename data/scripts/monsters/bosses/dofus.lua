local mType = Game.createMonsterType("Dofus")
local monster = {}

monster.description = "Dofus"
monster.experience = 11800
monster.outfit = {
	lookType = 88,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 6031
monster.speed = 390
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	{id = 3954, chance = 1000},
	{id = 6512, chance = 1000},
	{id = 6579, chance = 1000},
	{id = 9693, chance = 1000},
	{id = 10306, chance = 1000},
	{id = 11256, chance = 1000},
	{id = 12666, chance = 1000},
	{id = 13559, chance = 1000},
	{id = 13560, chance = 1000},
	{id = 13581, chance = 1000},
	{id = 16107, chance = 1000},
	{id = 20105, chance = 1000},
	{id = 20624, chance = 1000},
	{id = 20625, chance = 1000},
	{id = 23589, chance = 1000},
	{id = 23806, chance = 1000},
	{id = 24331, chance = 1000},
	{id = 21400, chance = 1000},
	{id = 21399, chance = 1000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 150, attack = 150, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 24, minDamage = -480, maxDamage = -800, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false},
	{name ="combat", interval = 2000, chance = 100, minDamage = -820, maxDamage = -950, type = COMBAT_FIREDAMAGE, range = 7, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 2000, chance = 12, speedChange = 380, duration = 4000},
	{name ="combat", interval = 1000, chance = 25, minDamage = 1000, maxDamage = 2000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
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
