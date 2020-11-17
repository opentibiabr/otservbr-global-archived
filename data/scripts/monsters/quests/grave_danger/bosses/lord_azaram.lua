local mType = Game.createMonsterType("Lord Azaram")
local monster = {}

monster.description = "a Lord Azaram"
monster.experience = 6300
monster.outfit = {
	lookType = 1223,
	lookHead = 0,
	lookBody = 38,
	lookLegs = 94,
	lookFeet = 82,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 3

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
	{name = "Condensed Sins", chance = 50, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "silver token", chance = 100000, maxCount = 2},
	{name = "ultimate spirit potion", chance = 70370, maxCount = 20},
	{name = "ultimate mana potion", chance = 55560, maxCount = 14},
	{name = "supreme health potion", chance = 51850, maxCount = 14},
	{name = "red gem", chance = 40740},
	{name = "blue gem", chance = 29630},
	{name = "yellow gem", chance = 29630},
	{name = "bullseye potion", chance = 25930, maxCount = 10},
	{name = "knight armor", chance = 22220},
	{name = "green gem", chance = 22220, maxCount = 2},
	{name = "mastermind potion", chance = 18520, maxCount = 10},
	{id = 26199, chance = 18520},
	{name = "lightning headband", chance = 18520},
	{name = "berserk potion", chance = 14810, maxCount = 10},
	{name = "crystal coin", chance = 14810},
	{id = 26187, chance = 11110},
	{name = "gold ingot", chance = 11110},
	{id = 26200, chance = 11110},
	{id = 26189, chance = 11110},
	{name = "huge chunk of crude iron", chance = 7410},
	{name = "haunted blade", chance = 7410},
	{name = "bear skin", chance = 3700},
	{id = 26198, chance = 3700},
	{name = "giant ruby", chance = 3700},
	{name = "violet gem", chance = 3700},
	{name = "young lich worm", chance = 3700},
	{name = "rotten heart", chance = 3700},
	{id = 26185, chance = 3700},
	{name = "giant emerald", chance = 3700},
	{name = "embrace of nature", chance = 1090},
	{name = "terra helmet", chance = 400},
	{name = "ancient liche bone", chance = 185},
	{name = "final judgement", chance = 155},
	{name = "noble cape", chance = 155}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_STONES, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 150, maxDamage = 550, effect = CONST_ME_MAGIC_BLUE, target = false}
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
