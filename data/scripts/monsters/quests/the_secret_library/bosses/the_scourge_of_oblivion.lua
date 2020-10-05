local mType = Game.createMonsterType("The Scourge Of Oblivion")
local monster = {}

monster.description = "The Scourge Of Oblivion"
monster.experience = 50000
monster.outfit = {
	lookType = 875,
	lookHead = 79,
	lookBody = 79,
	lookLegs = 60,
	lookFeet = 79,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 800000
monster.maxHealth = 800000
monster.race = "venom"
monster.corpse = 26217
monster.speed = 450
monster.summonCost = 0
monster.maxSummons = 8

monster.changeTarget = {
	interval = 2000,
	chance = 25
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

monster.summons = {
	{name = "Charger", chance = 15, interval = 1000, max = 3},
	{name = "Spark of Destruction", chance = 15, interval = 1000, max = 5}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I AM DEVOURER!", yell = true}
}

monster.loot = {
	{id = "Platinum Coin", chance = 100000, maxCount = 15},
	{id = "Crystal Coin", chance = 100000, maxCount = 7},
	{id = "Green Crystal Shard", chance = 100000, maxCount = 3},
	{id = "Violet Crystal Shard", chance = 100000, maxCount = 3},
	{id = "Spark Sphere", chance = 100000},
	{id = "Plasmatic Lightning", chance = 100000},
	{id = "Emerald Bangle", chance = 100000},
	{id = "Royal Star", chance = 66666, maxCount = 100},
	{id = "Small Amethyst", chance = 66666, maxCount = 12},
	{id = "Silver Token", chance = 66666, maxCount = 12},
	{id = "Mastermind Potion", chance = 66666, maxCount = 10},
	{id = "Ultimate Mana Potion", chance = 66666, maxCount = 6},
	{id = "Giant Emerald", chance = 66666},
	{id = "Red Gem", chance = 66666},
	{id = "Small Ruby", chance = 33333, maxCount = 12},
	{id = "Bullseye Potion", chance = 33333, maxCount = 10},
	{id = "Gold Token", chance = 33333, maxCount = 8},
	{id = "Supreme Health Potion", chance = 33333, maxCount = 6},
	{id = "Blue Crystal Shard", chance = 33333, maxCount = 3},
	{id = "Giant Sapphire", chance = 33333},
	{id = "Green Gem", chance = 33333},
	{id = 26198, chance = 33333},
	{id = "Huge Chunk of Crude Iron", chance = 33333},
	{id = "Magic Sulphur", chance = 33333},
	{id = "Ring of the Sky", chance = 33333},
	{id = "Ultimate Spirit Potion", chance = 15000, maxCount = 20},
	{id = "Small Diamond", chance = 15000, maxCount = 12},
	{id = "Small Emerald", chance = 15000, maxCount = 12},
	{id = "Rift Shield", chance = 5000},
	{id = 7632, chance = 5000},
	{id = "Arcane Staff", chance = 5000},
	{id = "Skullcracker Armor", chance = 5000},
	{id = "Chaos Mace", chance = 5000},
	{id = "Cat's Paw", chance = 5000},
	{id = "Piggy Bank", chance = 5000},
	{id = "Mysterious Remains", chance = 5000},
	{id = "Energy Bar", chance = 5000},
	{id = "Library Ticket", chance = 500},
	{id = "Calamity", chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 250, attack = 350, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 7, minDamage = -900, maxDamage = -1500, type = COMBAT_MANADRAIN, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false},
	{name ="drunk", interval = 2000, chance = 20, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 1000, chance = 9, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = -2000, maxDamage = -2700, range = 1, target = false},
	{name ="combat", interval = 2000, chance = 8, minDamage = -1550, maxDamage = -2550, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -1075, maxDamage = -2405, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 1000, chance = 20, minDamage = -600, maxDamage = -1500, type = COMBAT_LIFEDRAIN, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -750, maxDamage = -1200, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 30, target = false},
	{name ="combat", interval = 2000, chance = 20, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -450, maxDamage = -1400, type = COMBAT_DEATHDAMAGE, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 10, minDamage = -800, maxDamage = -2300, type = COMBAT_MANADRAIN, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 12, SpeedChange = -1900, Duration = 60000},
	{name ="combat", interval = 1000, chance = 8, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, minDamage = -100, maxDamage = -700, type = COMBAT_FIREDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 15, minDamage = -300, maxDamage = -950, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="combat", interval = 6000, chance = 25, minDamage = 2000, maxDamage = 5000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, SpeedChange = 1901, Duration = 5000},
	{name ="invisible", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 1000, chance = 17, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
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
