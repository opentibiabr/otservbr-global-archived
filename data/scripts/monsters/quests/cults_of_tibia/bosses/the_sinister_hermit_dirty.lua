local mType = Game.createMonsterType("The Sinister Hermit")
local monster = {}

monster.description = "The Sinister Hermit"
monster.experience = 0
monster.outfit = {
	lookType = 153,
	lookHead = 1,
	lookBody = 63,
	lookLegs = 1,
	lookFeet = 63,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 0
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 4000,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 0,
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
	{name = "Vermin Swarm", chance = 100, interval = 20000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -120, maxDamage = -488, type = COMBAT_EARTHDAMAGE, length = 7, spread = 8, effect = CONST_ME_SMALLPLANTS, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 35,
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = 800, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 30, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
