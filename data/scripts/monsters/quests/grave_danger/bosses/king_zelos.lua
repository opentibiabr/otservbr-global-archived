local mType = Game.createMonsterType("King Zelos")
local monster = {}

monster.description = "King Zelos"
monster.experience = 251300
monster.outfit = {
	lookType = 1224,
	lookHead = 10,
	lookBody = 19,
	lookLegs = 19,
	lookFeet = 19,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 125000
monster.maxHealth = monster.health
monster.race = "venom"
monster.corpse = 36443
monster.speed = 425
monster.maxSummons = 6

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canWalkOnPoison = true,
	pet = false
}

monster.loot = {
	{id = "Platinum Coin", minCount = 1, maxCount = 5, chance = 100000},--comum
	{id = "Crystal Coin", minCount = 0, maxCount = 5, chance = 50000},--comum
	{id = "Supreme Health Potion", minCount = 0, maxCount = 20, chance = 45000},--comum
	{id = "Ultimate Mana Potion", minCount = 0, maxCount = 6, chance = 42000},--comum
	{id = "Ultimate Spirit Potion", minCount = 0, maxCount = 14, chance = 42000},--comum
	{id = "Bullseye Potion", minCount = 0, maxCount = 10, chance = 22000},--comum
	{id = "Berserk Potion", minCount = 0, maxCount = 10, chance = 22000},--comum
	{id = "Gold Token", minCount = 0, maxCount = 3, chance = 18000},--semiraro
	{id = "Silver Token", minCount = 0, maxCount = 3, chance = 25000},--semiraro
	{id = "Green Gem", chance = 19000},--semiraro
	{id = "Red Gem", chance = 18500},--semiraro
	{id = "Yellow Gem", chance = 18500},--semiraro
	{id = "Giant Sapphire", chance = 16800},--semiraro
	{id = "Collar of green plasma", chance = 15200},--semiraro
	{id = "Magma Coat", chance = 15200},--semiraro
	{id = "Gold Ingot", minCount = 0, maxCount = 1, chance = 18000},--semiraro
	{id = "Red Tome", chance = 18200},--semiraro
	{id = "Ring of blue plasma", chance = 12000},--semiraro
	{id = "Ring of red plasma", chance = 12000},--semiraro
	{id = "Young Lich Worm", chance = 5500},--semiraro
	{id = "Mortal Mace", chance = 1300},--raro
	{id = "Golden Hyaena Pendant", chance = 1100},--raro
	{id = "Bow of Cataclysm", chance = 600},--muitoraro
	{id = "Galea Mortis", chance = 550},--muitoraro
	{id = "Shadow Cowl", chance = 530},--muitoraro
	{id = "Toga Mortis", chance = 500},--muitoraro
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2000, minDamage = -900, maxDamage = -2700},
	{name = "combat", type = COMBAT_FIREDAMAGE, interval = 2000, chance = 15, length = 8, spread = 0, minDamage = -1200, maxDamage = -3200, effect = CONST_ME_HITBYFIRE},
	{name = "combat", type = COMBAT_LIFEDRAIN, interval = 2000, chance = 10, length = 8, spread = 3, minDamage = -600, maxDamage = -1600, effect = CONST_ME_SMALLCLOUDS},
}

monster.defenses = {
	defense = 78,
	armor = 78,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2000, minDamage = 1450, maxDamage = 5350, effect = CONST_ME_MAGIC_BLUE},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 3},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Feel the power of death unleashed!", yell = false},
	{text = "I will rule again and my realm of death will span the world!", yell = false},
	{text = "My lich-knights will conquer this world for me!", yell = false},
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