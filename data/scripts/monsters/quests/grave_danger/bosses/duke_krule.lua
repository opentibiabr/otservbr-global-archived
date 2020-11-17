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
	{name = "silver token", chance = 100000, maxCount = 2},
	{name = "platinum coin", chance = 60000, maxCount = 5},
	{name = "ultimate mana potion", chance = 60000, maxCount = 20},
	{name = "supreme health potion", chance = 48000, maxCount = 20},
	{name = "ultimate spirit potion", chance = 44000, maxCount = 20},
	{name = "yellow gem", chance = 40000},
	{name = "green gem", chance = 32000},
	{name = "red gem", chance = 32000},
	{name = "mastermind potion", chance = 32000, maxCount = 10},
	{name = "crystal coin", chance = 24000},
	{name = "bullseye potion", chance = 20000, maxCount = 10},
	{name = "crusader helmet", chance = 20000},
	{name = "flask of warrior's sweat", chance = 20000},
	{name = "piece of hell steel", chance = 16000, maxCount = 4},
	{id = 26198, chance = 16000},
	{id = 26199, chance = 16000},
	{name = "blue gem", chance = 12000},
	{name = "berserk potion", chance = 12000},
	{name = "terra hood", chance = 8000},
	{name = "chaos mace", chance = 8000},
	{id = 26187, chance = 8000},
	{name = "gold ingot", chance = 8000},
	{name = "rotten heart", chance = 4000},
	{name = "young lich worm", chance = 4000},
	{name = "giant sapphire", chance = 4000},
	{id = 26189, chance = 4000},
	{id = 26185, chance = 4000},
	{name = "ancient liche bone", chance = 4000},
	{name = "bear skin", chance = 4000},
	{name = "embrace of nature", chance = 4000},
	{name = "violet gem", chance = 4000},
	{name = "giant emerald", chance = 4000},
	{name = "noble amulet", chance = 300},
	{name = "terra helmet", chance = 150},
	{name = "final judgement", chance = 150}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
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
