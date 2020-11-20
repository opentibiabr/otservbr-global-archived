local mType = Game.createMonsterType("Duke Krule")
local monster = {}

monster.description = "a Duke Krule"
monster.experience = 46300
monster.outfit = {
	lookType = 1221,
	lookHead = 19,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

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
	{id = "Berserk Potion", minCount = 0, maxCount = 10, chance = 12000},--comum
	{id = "Piece of draconian steel", minCount = 0, maxCount = 3, chance = 9000},--comum
	{id = "Green Gem", minCount = 0, maxCount = 2, chance = 12000},--comum
	{id = "Silver Token", minCount = 0, maxCount = 2, chance = 9500},--semiraro
	{id = "Blue Gem", chance = 11000},--semiraro
	{id = "Crusader Helmet", chance = 6400},--semiraro
	{id = "Gold Ingot", minCount = 0, maxCount = 1, chance = 10000},--semiraro
	{id = "Red Gem", chance = 11000},--semiraro
	{id = "Terra hood", chance = 7800},--semiraro
	{id = "Yellow Gem", chance = 9500},--semiraro
	{id = "Young Lich Worm", chance = 5800},--semiraro
	{id = "Bear Skin", chance = 1800},--raro
	{id = "Noble Amulet", chance = 1100},--raro
	{id = "Rotten Heart", chance = 1700},--raro
	{id = "Terra helmet", chance = 700},--raro
	{id = "Final Judgement", chance = 460},--muitoraro
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600},
	{name ="combat", interval = 1800, chance = 60, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -1000, length = 7, spread = 2, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 1800, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 1800, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -500, radius = 10, effect = CONST_ME_HITBYFIRE, target = false}
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
