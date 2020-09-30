local mType = Game.createMonsterType("Sir Baeloc")
local monster = {}

monster.description = "a Sir Baeloc"
monster.experience = 6300
monster.outfit = {
	lookType = 1222,
	lookHead = 19,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Retainer of Baeloc", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "silver token", chance = 100000, maxCount = 2},
	{id = "platinum coin", chance = 95830, maxCount = 5},
	{id = "ultimate mana potion", chance = 54170, maxCount = 20},
	{id = "ultimate spirit potion", chance = 50000, maxCount = 20},
	{id = "supreme health potion", chance = 37500, maxCount = 20},
	{id = "green gem", chance = 33330},
	{id = "gold ingot", chance = 29170},
	{id = "piece of hell steel", chance = 29170, maxCount = 4},
	{id = "yellow gem", chance = 29170},
	{id = "blue gem", chance = 25000},
	{id = "bullseye potion", chance = 25000, maxCount = 10},
	{id = "skull staff", chance = 25000},
	{id = "magma monocle", chance = 20830},
	{id = "berserk potion", chance = 20830, maxCount = 10},
	{id = "red gem", chance = 20830},
	{id = 26198, chance = 16670},
	{id = "mastermind potion", chance = 16670, maxCount = 10},
	{id = "young lich worm", chance = 12500},
	{id = 26199, chance = 4170},
	{id = "violet gem", chance = 4170},
	{id = "terra helmet", chance = 4170},
	{id = "final judgement", chance = 400},
	{id = 36427, chance = 150}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 1800, chance = 40, minDamage = -300, maxDamage = -500, type = COMBAT_MANADRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1800, chance = 89, minDamage = -400, maxDamage = -1200, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 78,
	{name ="combat", interval = 2000, chance = 35, minDamage = 350, maxDamage = 550, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
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
