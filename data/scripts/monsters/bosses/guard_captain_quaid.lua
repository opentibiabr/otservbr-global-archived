local mType = Game.createMonsterType("Guard Captain Quaid")
local monster = {}

monster.description = "a guard captain quaid"
monster.experience = 28000
monster.outfit = {
	lookType = 1217,
	lookHead = 38,
	lookBody = 57,
	lookLegs = 21,
	lookFeet = 2,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 55000
monster.maxHealth = 55000
monster.race = "blood"
monster.corpse = 36489
monster.speed = 185
monster.summonCost = 0
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
	targetDistance = 4,
	runHealth = 0,
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
}

monster.loot = {
	{id = "Platinum Coin", chance = 85000, maxCount = 20},
	{id = "Small Sapphire", chance = 95000},
	{id = "Yellow Gem", chance = 61000},
	{id = "Red Gem", chance = 56000},
	{id = "Gold Ingot", chance = 36000},
	{id = 7632, chance = 28000},
	{id = "Cobra Crest", chance = 22000},
	{id = "Blue Gem", chance = 21500},
	{id = "Green Gem", chance = 18150},
	{id = "Terra Hood", chance = 14500},
	{id = "Crossbow", chance = 12520},
	{id = "Bow", chance = 11200},
	{id = "Hunting Spear", chance = 10400},
	{id = "Blue Crystal Shard", chance = 9600},
	{id = "Throwing Star", chance = 9100, maxCount = 6},
	{id = "Green Crystal Shard", chance = 8600},
	{id = "Small Topaz", chance = 8000},
	{id = "Sacred Tree Amulet", chance = 6800},
	{id = "Magma Monocle", chance = 6100},
	{id = "Wood Cape", chance = 5250},
	{id = 26185, chance = 3800},
	{id = "Cobra Boots", chance = 315},
	{id = "Cobra Crossbow", chance = 225}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -580, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 18, minDamage = -500, maxDamage = -620, type = COMBAT_EARTHDAMAGE, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_GREEN_RINGS, target = true},
	{name ="combat", interval = 2000, chance = 22, minDamage = -450, maxDamage = -700, type = COMBAT_PHYSICALDAMAGE, shootEffect = CONST_ANI_THROWINGKNIFE, target = true},
	{name ="combat", interval = 2000, chance = 14, minDamage = -350, maxDamage = -550, type = COMBAT_PHYSICALDAMAGE, length = 5, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -400, maxDamage = -550, type = COMBAT_FIREDAMAGE, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 12, minDamage = -300, maxDamage = -480, type = COMBAT_EARTHDAMAGE, length = 5, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -450, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_GREEN_RINGS, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 85},
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
