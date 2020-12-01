local mType = Game.createMonsterType("Count Vlarkorth")
local monster = {}

monster.description = "Count Vlarkorth"
monster.experience = 41300
monster.outfit = {
	lookType = 1221,
	lookHead = 10,
	lookBody = 19,
	lookLegs = 19,
	lookFeet = 19,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 6

monster.changeTarget = {
	interval = 4000,
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

monster.summons = {
	{name = "Soulless Minion", chance = 70, interval = 1800}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "Platinum Coin", minCount = 1, maxCount = 5, chance = 100000},--comum
	{id = "Crystal Coin", minCount = 0, maxCount = 2, chance = 50000},--comum
	{id = "Supreme Health Potion", minCount = 0, maxCount = 6, chance = 35000},--comum
	{id = "Ultimate Mana Potion", minCount = 0, maxCount = 20, chance = 32000},--comum
	{id = "Ultimate Spirit Potion", minCount = 0, maxCount = 20, chance = 32000},--comum
	{id = "Bullseye Potion", minCount = 0, maxCount = 10, chance = 12000},--comum
	{id = "Mastermind Potion", minCount = 0, maxCount = 10, chance = 12000},--comum
	{id = "Silver Token", minCount = 0, maxCount = 2, chance = 8000},--semiraro
	{id = "Blue Gem", chance = 9000},--semiraro
	{id = "Collar of blue plasma", chance = 5200},--semiraro
	{id = "Collar of red plasma", chance = 5200},--semiraro
	{id = "Blue Gem", chance = 8500},--semiraro
	{id = "Gold Ingot", minCount = 0, maxCount = 1, chance = 10000},--semiraro
	{id = "Green Gem", chance = 8200},--semiraro
	{id = "Magic Sulphur", chance = 6500},--semiraro
	{id = "Red Gem", chance = 8000},--semiraro
	{id = "Ring of blue plasma", chance = 5000},--semiraro
	{id = "Ring of red plasma", chance = 5000},--semiraro
	{id = "Ring of green plasma", chance = 5000},--semiraro
	{id = "Skull staff", chance = 7000},--semiraro
	{id = "Yellow Gem", chance = 8500},--semiraro
	{id = "Young Lich Worm", chance = 5500},--semiraro
	{id = "Bear Skin", chance = 1600},--raro
	{id = "Embrace of Nature", chance = 1100},--raro
	{id = "Giant Emerald", chance = 1700},--raro
	{id = "Giant Ruby", chance = 1900},--raro
	{id = "Giant Sapphire", chance = 1800},--raro
	{id = "Medal of Valiance", chance = 1200},--raro
	{id = "Terra helmet", chance = 700},--raro
	{id = "Final Judgement", chance = 400},--muitoraro
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_YELLOW_ENERGY_SPARK, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -500, length = 7, spread = 3, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HEALING, minDamage = 150, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
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
