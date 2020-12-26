local mType = Game.createMonsterType("Sir Baeloc")
local monster = {}

monster.description = "a Sir Baeloc"
monster.experience = 48300
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
monster.manaCost = 0
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
	{name = "Retainer of Baeloc", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "platinum coin", minCount = 1, maxCount = 5, chance = 100000},
	{id = "crystal coin", minCount = 0, maxCount = 2, chance = 50000},
	{id = "supreme health potion", minCount = 0, maxCount = 6, chance = 35000},
	{id = "ultimate mana potion", minCount = 0, maxCount = 20, chance = 32000},
	{id = "ultimate spirit potion", minCount = 0, maxCount = 20, chance = 32000},
	{id = "mastermind potion", minCount = 0, maxCount = 10, chance = 12000},
	{id = "berserk potion", minCount = 0, maxCount = 10, chance = 12000},
	{id = "piece of draconian steel", minCount = 0, maxCount = 4, chance = 9000},
	{id = "red gem", minCount = 0, maxCount = 1, chance = 12000},
	{id = "silver token", minCount = 0, maxCount = 2, chance = 9500},
	{id = 26198, chance = 5200},-- collar of blue plasma
	{id = 26200, chance = 5200},-- collar of red plasma
	{id = "knight legs", chance = 11000},
	{id = "gold ingot", minCount = 0, maxCount = 1, chance = 10000},
	{id = "violet gem", minCount = 0, maxCount = 1, chance = 10000},
	{id = "yellow gem", minCount = 0, maxCount = 1, chance = 10000},
	{id = 26185, chance = 5000},-- ring of blue plasma
	{id = 26189, chance = 5000},-- ring of red plasma
	{id = "skull staff", chance = 9000},
	{id = "young lich worm", chance = 5800},
	{id = "embrace of nature", chance = 1400},
	{id = 36427, chance = 1800},
	{id = "terra helmet", chance = 750},
	{id = "final judgement", chance = 450},
}

monster.attacks = {
	{name ="combat", interval = 1800, chance = 40, type = COMBAT_MANADRAIN, minDamage = -300, maxDamage = -500, radius = 5, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1800, chance = 89, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1200, length = 7, spread = 3, target = false}
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
