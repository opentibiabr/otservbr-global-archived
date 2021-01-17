local mType = Game.createMonsterType("The Baron From Below")
local monster = {}

monster.description = "The Baron From Below"
monster.experience = 40000
monster.outfit = {
	lookType = 1045,
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
monster.corpse = 30868
monster.speed = 240
monster.manaCost = 0
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
	{text = "Krrrk!", yell = false}
}

monster.loot = {
	{id = "Platinum Coin", chance = 10000, maxCount = 58},
	{id = "crystal coin", chance = 10000, maxCount = 2},
	{id = "gold ingot", chance = 10000, maxCount = 2},
	{id = "great mana potion", chance = 10000, maxCount = 10},
	{id = "great spirit potion", chance = 10000, maxCount = 18},
	{id = "mastermind potion", chance = 10000, maxCount = 2},
	{id = "small diamond", chance = 10000, maxCount = 12},
	{id = "small emerald", chance = 10000, maxCount = 12},
	{id = "small ruby", chance = 10000, maxCount = 12},
	{id = "small topaz", chance = 10000, maxCount = 12},
	{id = "ultimate health potion", chance = 10000, maxCount = 8},
	{id = "violet crystal shard", chance = 10000, maxCount = 3},
	{id = "badger boots", chance = 10000},
	{id = "blue gem", chance = 10000},
	{id = "Calopteryx Cape", chance = 10000},
	{id = 30857, chance = 10000},
	{id = "Crystal Mace", chance = 10000},
	{id = "Fire Sword", chance = 10000},
	{id = "Green Gem", chance = 10000},
	{id = "Huge Chunk of Crude Iron", chance = 10000, maxCount = 2},
	{id = "Huge Shell", chance = 10000},
	{id = "Longing Eyes", chance = 10000},
	{id = "Luminous Orb", chance = 10000},
	{id = "Magic Sulphur", chance = 10000, maxCount = 2},
	{id = "Magma Coat", chance = 10000},
	{id = "Red Gem", chance = 10000},
	{id = 9820, chance = 10000},
	{id = 9814, chance = 10000},
	{id = "Slimy Leg", chance = 10000},
	{id = "Stone Skin Amulet", chance = 10000},
	{id = "Violet Gem", chance = 10000},
	{id = "Wand of Inferno", chance = 10000},
	{id = "Yellow Gem", chance = 10000},
	{id = "Gold Token", chance = 1000},
	{id = "Silver Token", chance = 1000},
	{id = "Mallet Head", chance = 1000},
	{id = "Gnome Shield", chance = 1000},
	{id = "Gnome Sword", chance = 1000},
	{id = "plan for a makeshift armour", chance = 500},
	{id = "Gnome Armor", chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1000, radius = 8, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -1000, length = 8, spread = 5, effect = CONST_ME_YELLOW_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -1000, length = 8, spread = 9, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -1000, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -1000, radius = 5, effect = CONST_ME_SMALLPLANTS, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 60},
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
