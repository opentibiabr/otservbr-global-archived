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
	{name = "Platinum Coin", minCount = 1, maxCount = 5, chance = 100000},--comum
	{name = "Crystal Coin", minCount = 0, maxCount = 2, chance = 50000},--comum
	{name = "Supreme Health Potion", minCount = 0, maxCount = 6, chance = 35000},--comum
	{name = "Ultimate Mana Potion", minCount = 0, maxCount = 20, chance = 32000},--comum
	{name = "Ultimate Spirit Potion", minCount = 0, maxCount = 20, chance = 32000},--comum
	{name = "Bullseye Potion", minCount = 0, maxCount = 10, chance = 12000},--comum
	{name = "Mastermind Potion", minCount = 0, maxCount = 10, chance = 12000},--comum
	{name = "Silver Token", minCount = 0, maxCount = 2, chance = 8000},--semiraro
	{name = "Blue Gem", chance = 9000},--semiraro
	{name = "Collar of blue plasma", chance = 5200},--semiraro
	{name = "Collar of red plasma", chance = 5200},--semiraro
	{name = "Blue Gem", chance = 8500},--semiraro
	{name = "Gold Ingot", minCount = 0, maxCount = 1, chance = 10000},--semiraro
	{name = "Green Gem", chance = 8200},--semiraro
	{name = "Magic Sulphur", chance = 6500},--semiraro
	{name = "Red Gem", chance = 8000},--semiraro
	{name = "Ring of blue plasma", chance = 5000},--semiraro
	{name = "Ring of red plasma", chance = 5000},--semiraro
	{name = "Ring of green plasma", chance = 5000},--semiraro
	{name = "Skull staff", chance = 7000},--semiraro
	{name = "Yellow Gem", chance = 8500},--semiraro
	{name = "Young Lich Worm", chance = 5500},--semiraro
	{name = "Bear Skin", chance = 1600},--raro
	{name = "Embrace of Nature", chance = 1100},--raro
	{name = "Giant Emerald", chance = 1700},--raro
	{name = "Giant Ruby", chance = 1900},--raro
	{name = "Giant Sapphire", chance = 1800},--raro
	{name = "Medal of Valiance", chance = 1200},--raro
	{name = "Terra helmet", chance = 700},--raro
	{name = "Final Judgement", chance = 400},--muitoraro
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
