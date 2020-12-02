local mType = Game.createMonsterType("Preceptor Lazare")
local monster = {}

monster.description = "Preceptor Lazare"
monster.experience = 9200
monster.outfit = {
	lookType = 1078,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 33384
monster.speed = 210
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
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
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 90},--comum
	{id = "gold coin", chance = 100000, maxCount = 45},--comum
	{id = "Platinum Coin", chance = 100000, maxCount = 3},--comum
	{id = "Great Mana Potion", chance = 100000, maxCount = 3},--comum
	{id = "Demonic Essence", chance = 100000, maxCount = 5},--comum
	{id = "red Gem", chance = 700, maxCount = 3},--comum
	{id = "Assassin Star", chance = 100000, maxCount = 5},--incomum
	{id = "Concentrated Demonic Blood", chance = 100000, maxCount = 3},--incomum
	{id = "Ham", chance = 100000, maxCount = 2},--incomum
	{id = "Small Emerald", chance = 100000, maxCount = 5},--incomum
	{id = "Small Diamond", chance = 100000, maxCount = 4},--incomum
	{id = "Small Amethyst", chance = 100000, maxCount = 3},--incomum
	{id = "Knight Armor", chance = 3100},--semiraro
	{id = "Golden Armor", chance = 2200},--semiraro
	{id = "Patch of Fine Cloth", chance = 1800, maxCount = 3},--semiraro
	{id = "Violet Gem", chance = 1800},--semiraro
	{id = "Titan Axe", chance = 1600},--semiraro
	{id = "War Axe", chance = 1400},--semiraro
	{id = "Demonbone Amulet", chance = 800},--raro
	{id = "Heavy Mace", chance = 600},--raro
	{id = "Mastermind Shield", chance = 500},--raro
	{id = "Falcon Rod", chance = 200},--muitoraro
	{id = "Falcon Greaves", chance = 110}--muitoraro
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -700},
	{name ="combat", interval = 1400, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -800, range = 7, shootEffect = CONST_ANI_INFERNALBOLT, target = false},
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_POWERBOLT, target = false},
	{name ="combat", interval = 1600, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -720, range = 7, shootEffect = CONST_ANI_ENERGYBALL, target = false},
	{name ="combat", interval = 1500, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -1000, range = 7, radius = 4, effect = CONST_ME_HOLYDAMAGE, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 86,
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
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
