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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "silver token", chance = 100000, maxCount = 2},
	{id = "ultimate spirit potion", chance = 70370, maxCount = 20},
	{id = "ultimate mana potion", chance = 55560, maxCount = 14},
	{id = "supreme health potion", chance = 51850, maxCount = 14},
	{id = "red gem", chance = 40740},
	{id = "blue gem", chance = 29630},
	{id = "yellow gem", chance = 29630},
	{id = "bullseye potion", chance = 25930, maxCount = 10},
	{id = "knight armor", chance = 22220},
	{id = "green gem", chance = 22220, maxCount = 2},
	{id = "mastermind potion", chance = 18520, maxCount = 10},
	{id = 26199, chance = 18520},
	{id = "lightning headband", chance = 18520},
	{id = "berserk potion", chance = 14810, maxCount = 10},
	{id = "crystal coin", chance = 14810},
	{id = 26187, chance = 11110},
	{id = "gold ingot", chance = 11110},
	{id = 26200, chance = 11110},
	{id = 26189, chance = 11110},
	{id = "huge chunk of crude iron", chance = 7410},
	{id = "haunted blade", chance = 7410},
	{id = "bear skin", chance = 3700},
	{id = 26198, chance = 3700},
	{id = "giant ruby", chance = 3700},
	{id = "violet gem", chance = 3700},
	{id = "young lich worm", chance = 3700},
	{id = "rotten heart", chance = 3700},
	{id = 26185, chance = 3700},
	{id = "giant emerald", chance = 3700},
	{id = "embrace of nature", chance = 1090},
	{id = "terra helmet", chance = 400},
	{id = "ancient liche bone", chance = 185},
	{id = "final judgement", chance = 155},
	{id = "noble cape", chance = 155}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -200, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -400, maxDamage = -1000, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_STONES, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 50, minDamage = 150, maxDamage = 550, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
