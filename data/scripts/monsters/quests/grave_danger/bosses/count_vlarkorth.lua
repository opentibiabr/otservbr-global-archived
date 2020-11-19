local mType = Game.createMonsterType("Count Vlarkorth")
local monster = {}

monster.description = "Count Vlarkorth"
monster.experience = 6300
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
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "silver token", chance = 100000, maxCount = 2},
	{id = "supreme health potion", chance = 72000, maxCount = 20},
	{id = "ultimate mana potion", chance = 52000, maxCount = 20},
	{id = "ultimate spirit potion", chance = 44000, maxCount = 20},
	{id = "knight legs", chance = 36000},
	{id = "crystal coin", chance = 28000, maxCount = 2},
	{id = "yellow gem", chance = 28000},
	{id = "red gem", chance = 28000},
	{id = "berserk potion", chance = 24000, maxCount = 10},
	{id = "bullseye potion", chance = 24000, maxCount = 10},
	{id = 26199, chance = 20000},
	{id = "green gem", chance = 20000, maxCount = 2},
	{id = 26187, chance = 16000},
	{id = 26200, chance = 16000},
	{id = "blue gem", chance = 12000},
	{id = "mastermind potion", chance = 12000, maxCount = 10},
	{id = "skull staff", chance = 12000},
	{id = "gold ingot", chance = 8000},
	{id = 26189, chance = 8000},
	{id = "magma boots", chance = 8000},
	{id = 26185, chance = 6000},
	{id = "violet gem", chance = 4000},
	{id = "young lich worm", chance = 4000},
	{id = "magic sulphur", chance = 4000},
	{id = 26198, chance = 4000},
	{id = "rotten heart", chance = 4000},
	{id = "medal of valiance", chance = 550},
	{id = "terra helmet", chance = 400},
	{id = "final judgement", chance = 190},
	{id = "embrace of nature", chance = 185},
	{id = "ancient liche bone", chance = 155},
	{id = "bear skin", chance = 145}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
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
