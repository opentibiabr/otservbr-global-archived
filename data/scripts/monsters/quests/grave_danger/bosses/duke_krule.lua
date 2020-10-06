local mType = Game.createMonsterType("Duke Krule")
local monster = {}

monster.description = "a Duke Krule"
monster.experience = 6300
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "silver token", chance = 100000, maxCount = 2},
	{id = "platinum coin", chance = 60000, maxCount = 5},
	{id = "ultimate mana potion", chance = 60000, maxCount = 20},
	{id = "supreme health potion", chance = 48000, maxCount = 20},
	{id = "ultimate spirit potion", chance = 44000, maxCount = 20},
	{id = "yellow gem", chance = 40000},
	{id = "green gem", chance = 32000},
	{id = "red gem", chance = 32000},
	{id = "mastermind potion", chance = 32000, maxCount = 10},
	{id = "crystal coin", chance = 24000},
	{id = "bullseye potion", chance = 20000, maxCount = 10},
	{id = "crusader helmet", chance = 20000},
	{id = "flask of warrior's sweat", chance = 20000},
	{id = "piece of hell steel", chance = 16000, maxCount = 4},
	{id = 26198, chance = 16000},
	{id = 26199, chance = 16000},
	{id = "blue gem", chance = 12000},
	{id = "berserk potion", chance = 12000},
	{id = "terra hood", chance = 8000},
	{id = "chaos mace", chance = 8000},
	{id = 26187, chance = 8000},
	{id = "gold ingot", chance = 8000},
	{id = "rotten heart", chance = 4000},
	{id = "young lich worm", chance = 4000},
	{id = "giant sapphire", chance = 4000},
	{id = 26189, chance = 4000},
	{id = 26185, chance = 4000},
	{id = "ancient liche bone", chance = 4000},
	{id = "bear skin", chance = 4000},
	{id = "embrace of nature", chance = 4000},
	{id = "violet gem", chance = 4000},
	{id = "giant emerald", chance = 4000},
	{id = "noble amulet", chance = 300},
	{id = "terra helmet", chance = 150},
	{id = "final judgement", chance = 150}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1800, chance = 60, minDamage = -400, maxDamage = -1000, type = COMBAT_MANADRAIN, length = 7, spread = 2, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 1800, chance = 19, minDamage = -400, maxDamage = -1000, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 1800, chance = 40, minDamage = -300, maxDamage = -500, type = COMBAT_FIREDAMAGE, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 14, minDamage = 150, maxDamage = 350, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
