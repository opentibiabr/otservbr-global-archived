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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
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
	{id = "Small Emerald", chance = 100000, maxCount = 3},
	{id = "Small Diamond", chance = 100000, maxCount = 3},
	{id = "Small Amethyst", chance = 100000, maxCount = 3},
	{id = "Platinum Coin", chance = 100000, maxCount = 3},
	{id = "Assassin Star", chance = 100000, maxCount = 5},
	{id = "Great Mana Potion", chance = 100000, maxCount = 3},
	{id = "Great Health Potion", chance = 100000, maxCount = 3},
	{id = "gold coin", chance = 100000, maxCount = 60},
	{id = "gold coin", chance = 100000, maxCount = 40},
	{id = "Soul Orb", chance = 100000, maxCount = 5},
	{id = "Demonic Essence", chance = 100000, maxCount = 5},
	{id = "Ham", chance = 100000, maxCount = 2},
	{id = "Small Ruby", chance = 700, maxCount = 3},
	{id = "red Gem", chance = 700, maxCount = 3},
	{id = "Onyx Arrow", chance = 700, maxCount = 3},
	{id = "Small Topaz", chance = 700, maxCount = 3},
	{id = "Small Diamond", chance = 7, maxCount = 3},
	{id = 7633, chance = 800},
	{id = "Violet Gem", chance = 600},
	{id = "Green Gem", chance = 600},
	{id = "Knight Armor", chance = 600},
	{id = "Titan Axe", chance = 600},
	{id = "Spiked Squelcher", chance = 600},
	{id = "Patch of Fine Cloth", chance = 500, maxCount = 3},
	{id = "Golden Armor", chance = 250},
	{id = "Mastermind Shield", chance = 200},
	{id = "Falcon Rod", chance = 100},
	{id = "Falcon Greaves", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -700, effect = CONST_ME_DRAWBLOOD},
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 5},
	{type = COMBAT_DEATHDAMAGE , percent = 55}
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
