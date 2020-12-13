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
	{name = "Platinum Coin", chance = 100000, maxCount = 15},
	{name = "Crystal Coin", chance = 100000, maxCount = 7},
	{name = "Green Crystal Shard", chance = 100000, maxCount = 3},
	{name = "Violet Crystal Shard", chance = 100000, maxCount = 3},
	{name = "Spark Sphere", chance = 100000},
	{name = "Plasmatic Lightning", chance = 100000},
	{name = "Emerald Bangle", chance = 100000},
	{name = "Royal Star", chance = 66666, maxCount = 100},
	{name = "Small Amethyst", chance = 66666, maxCount = 12},
	{name = "Silver Token", chance = 66666, maxCount = 12},
	{name = "Mastermind Potion", chance = 66666, maxCount = 10},
	{name = "Ultimate Mana Potion", chance = 66666, maxCount = 6},
	{name = "Giant Emerald", chance = 66666},
	{name = "Red Gem", chance = 66666},
	{name = "Small Ruby", chance = 33333, maxCount = 12},
	{name = "Bullseye Potion", chance = 33333, maxCount = 10},
	{name = "Gold Token", chance = 33333, maxCount = 8},
	{name = "Supreme Health Potion", chance = 33333, maxCount = 6},
	{name = "Blue Crystal Shard", chance = 33333, maxCount = 3},
	{name = "Giant Sapphire", chance = 33333},
	{name = "Green Gem", chance = 33333},
	{id = 26198, chance = 33333},
	{name = "Huge Chunk of Crude Iron", chance = 33333},
	{name = "Magic Sulphur", chance = 33333},
	{name = "Ring of the Sky", chance = 33333},
	{name = "Ultimate Spirit Potion", chance = 15000, maxCount = 20},
	{name = "Small Diamond", chance = 15000, maxCount = 12},
	{name = "Small Emerald", chance = 15000, maxCount = 12},
	{name = "Rift Shield", chance = 5000},
	{id = 7632, chance = 5000},
	{name = "Arcane Staff", chance = 5000},
	{name = "Skullcracker Armor", chance = 5000},
	{name = "Chaos Mace", chance = 5000},
	{name = "Cat's Paw", chance = 5000},
	{name = "Piggy Bank", chance = 5000},
	{name = "Mysterious Remains", chance = 5000},
	{name = "Energy Bar", chance = 5000},
	{name = "Library Ticket", chance = 500},
	{name = "Calamity", chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 250, attack = 350},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_MANADRAIN, minDamage = -900, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false},
	{name ="drunk", interval = 2000, chance = 20, radius = 5, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 9000},
	{name ="strength", interval = 1000, chance = 9, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="energy strike", interval = 2000, chance = 30, minDamage = -2000, maxDamage = -2700, range = 1, target = false},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_FIREDAMAGE, minDamage = -1550, maxDamage = -2550, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -1075, maxDamage = -2405, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1500, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -750, maxDamage = -1200, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="renegade knight", interval = 2000, chance = 30, target = false},
	{name ="choking fear drown", interval = 2000, chance = 20, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -450, maxDamage = -1400, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -2300, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -1900, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 8, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -700, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -950, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="combat", interval = 6000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 5000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
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
