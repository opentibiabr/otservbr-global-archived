local mType = Game.createMonsterType("The Count Of The Core")
local monster = {}

monster.description = "The Count Of The Core"
monster.experience = 40000
monster.outfit = {
	lookType = 1046,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 30872
monster.speed = 270
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Sluuuurp! Sluuuuurp!", yell = false},
	{text = "Shluush!", yell = false}
}

monster.loot = {
	{id = "Platinum Coin", chance = 10000, maxCount = 36},
	{id = "Great Mana Potion", chance = 10000, maxCount = 18},
	{id = "Great Spirit Potion", chance = 10000, maxCount = 10},
	{id = "Green Crystal Shard", chance = 10000, maxCount = 4},
	{id = "Huge Chunk of Crude Iron", chance = 10000, maxCount = 2},
	{id = "Magic Sulphur", chance = 10000, maxCount = 2},
	{id = "Mastermind Potion", chance = 10000, maxCount = 2},
	{id = "Small Amethyst", chance = 10000, maxCount = 10},
	{id = "Small Diamond", chance = 10000, maxCount = 10},
	{id = "Small Emerald", chance = 10000, maxCount = 12},
	{id = "Small Ruby", chance = 10000, maxCount = 10},
	{id = "Small Topaz", chance = 10000, maxCount = 10},
	{id = "Ultimate Health Potion", chance = 10000, maxCount = 5},
	{id = "Amber Staff", chance = 10000},
	{id = "Blue Gem", chance = 10000},
	{id = 30861, chance = 10000},
	{id = "Crystal Coin", chance = 10000},
	{id = "Crystalline Armor", chance = 5000},
	{id = "Dragon Necklace", chance = 10000},
	{id = "Fire Axe", chance = 10000},
	{id = "Fire Sword", chance = 10000},
	{id = 7632, chance = 10000},
	{id = "Giant Sword", chance = 10000},
	{id = "Guardian Axe", chance = 10000},
	{id = "Gold Token", chance = 10000},
	{id = "Green Gem", chance = 10000},
	{id = "Harpoon of a Giant Snail", chance = 10000},
	{id = "Huge Spiky Snail Shell", chance = 10000},
	{id = "Luminous Orb", chance = 10000},
	{id = "Red Gem", chance = 10000},
	{id = "Silver Token", chance = 1000},
	{id = "Stone Skin Amulet", chance = 1000},
	{id = "Twiceslicer", chance = 1000},
	{id = "Wand of Inferno", chance = 1000},
	{id = "Yellow Gem", chance = 1000},
	{id = "Candle Stump", chance = 1000},
	{id = "Gnome Shield", chance = 1000},
	{id = "Gnome Sword", chance = 1000},
	{id = "Mallet Handle", chance = 1000},
	{id = "Tinged Pot", chance = 1000},
	{id = "Gnome Helmet", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1500},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -1500, range = 3, length = 9, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -1500, range = 3, length = 9, spread = 4, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1500, radius = 8, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -1500, radius = 8, effect = CONST_ME_BLACKSMOKE, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = -100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 60},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
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
