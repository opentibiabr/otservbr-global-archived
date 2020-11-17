local mType = Game.createMonsterType("Earl Osam")
local monster = {}

monster.description = "Earl Osam"
monster.experience = 6300
monster.outfit = {
	lookType = 1223,
	lookHead = 95,
	lookBody = 38,
	lookLegs = 60,
	lookFeet = 76,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 5

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
	{name = "Frozen Soul", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "silver token", chance = 100000, maxCount = 2},
	{name = "platinum coin", chance = 96770, maxCount = 5},
	{name = "ultimate spirit potion", chance = 64520, maxCount = 20},
	{name = "ultimate mana potion", chance = 51610, maxCount = 20},
	{name = "supreme health potion", chance = 45160, maxCount = 20},
	{name = "crystal coin", chance = 35480, maxCount = 3},
	{name = "piece of draconian steel", chance = 32260, maxCount = 3},
	{name = "bullseye potion", chance = 29030, maxCount = 10},
	{name = "red gem", chance = 29030},
	{name = "blue gem", chance = 25810},
	{name = "yellow gem", chance = 22580, maxCount = 2},
	{id = 26199, chance = 19350},
	{name = "green gem", chance = 19350, maxCount = 2},
	{name = "glacier mask", chance = 19350},
	{name = "warrior helmet", chance = 19350},
	{id = 26200, chance = 19350},
	{name = "berserk potion", chance = 16130, maxCount = 10},
	{id = 26189, chance = 16130},
	{name = "mastermind potion", chance = 12900, maxCount = 10},
	{name = "gold ingot", chance = 12900},
	{name = "violet gem", chance = 12900},
	{id = 26198, chance = 9680},
	{name = "piece of hell steel", chance = 9680, maxCount = 4},
	{name = "young lich worm", chance = 6450},
	{id = 26187, chance = 3230},
	{name = "rotten heart", chance = 400},
	{name = "embrace of nature", chance = 400},
	{name = "terra helmet", chance = 150},
	{name = "final judgement", chance = 150}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 1800, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 2, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -260, maxDamage = -420, range = 3, effect = CONST_ME_BLUE_ENERGY_SPARK, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 350, maxDamage = 550, effect = CONST_ME_MAGIC_BLUE, target = false}
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
