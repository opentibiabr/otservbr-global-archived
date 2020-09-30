local mType = Game.createMonsterType("Scarlett Etzel")
local monster = {}

monster.description = "a scarlett etzel"
monster.experience = 20000
monster.outfit = {
	lookType = 1201,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 36288
monster.speed = 175
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
	targetDistance = 1,
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
	{id = "Energy Bar", chance = 100000},
	{id = "Platinum Coin", chance = 87000, maxCount = 5},
	{id = "Green Gem", chance = 85000},
	{id = "Supreme Health Potion", chance = 53700, maxCount = 14},
	{id = "Ultimate Mana Potion", chance = 48150, maxCount = 20},
	{id = "Red Gem", chance = 42500},
	{id = "Ultimate Spirit Potion", chance = 34000, maxCount = 6},
	{id = "Yellow Gem", chance = 29600, maxCount = 2},
	{id = "Royal Star", chance = 26600, maxCount = 100},
	{id = 7632, chance = 24000},
	{id = "Berserk Potion", chance = 20300, maxCount = 10},
	{id = "Blue Gem", chance = 18500, maxCount = 2},
	{id = "Bullseye Potion", chance = 18500, maxCount = 10},
	{id = "Magma Coat", chance = 16600},
	{id = "Terra Rod", chance = 1100},
	{id = "Crystal Coin", chance = 9200},
	{id = "Violet Gem", chance = 9000},
	{id = "Terra Legs", chance = 8500},
	{id = "Terra Hood", chance = 7400},
	{id = "Terra Mantle", chance = 7250},
	{id = "Magma Amulet", chance = 5500},
	{id = "Silver Token", chance = 5250, maxCount = 4},
	{id = "Gold Ingot", chance = 5000},
	{id = "Terra Amulet", chance = 4800},
	{id = "Giant Sapphire", chance = 4800},
	{id = "Magma Monocle", chance = 3700},
	{id = "Cobra Club", chance = 1800},
	{id = "Cobra Axe", chance = 1650},
	{id = "Cobra Crossbow", chance = 715},
	{id = "Cobra Hood", chance = 700},
	{id = "Cobra Rod", chance = 680},
	{id = "Cobra Sword", chance = 650},
	{id = "Cobra Wand", chance = 620},
	{id = "The Cobra Amulet", chance = 350}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 16, minDamage = -400, maxDamage = -600, target = true},
	{name ="combat", interval = 2000, chance = 13, minDamage = -450, maxDamage = -640, type = COMBAT_HOLYDAMAGE, length = 7, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -480, maxDamage = -630, type = COMBAT_EARTHDAMAGE, effect = CONST_ME_EXPLOSIONHIT, target = false}
}

monster.defenses = {
	defense = 88,
	armor = 88
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
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
