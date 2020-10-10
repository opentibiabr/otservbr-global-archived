local mType = Game.createMonsterType("General Murius")
local monster = {}

monster.description = "General Murius"
monster.experience = 450
monster.outfit = {
	lookType = 611,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550
monster.maxHealth = 550
monster.race = "blood"
monster.corpse = 23462
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 20,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Minotaur Archer", chance = 15, interval = 1000, max = 2},
	{name = "Minotaur Guard", chance = 12, interval = 1000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will get what you deserve!", yell = false},
	{text = "Feel the power of the Mooh'Tah!", yell = false},
	{text = "For the king!", yell = false},
	{text = "Guards!", yell = false}
}

monster.loot = {
	{id = 2148, chance = 100000, maxCount = 90},
	{id = 12428, chance = 100000},
	{id = 5878, chance = 100000},
	{id = 2152, chance = 80000, maxCount = 3},
	{id = 2513, chance = 40000},
	{id = 2465, chance = 60000},
	{id = 2648, chance = 40000},
	{id = 2387, chance = 60000},
	{id = 7401, chance = 40000},
	{id = 7363, chance = 40000, maxCount = 7},
	{id = 2666, chance = 20000, maxCount = 3},
	{id = 2547, chance = 20000, maxCount = 7},
	{id = 7588, chance = 20000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -170, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 12, minDamage = 0, maxDamage = -120, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_BOLT, target = false},
	{name ="combat", interval = 1000, chance = 10, minDamage = 0, maxDamage = -80, type = COMBAT_PHYSICALDAMAGE, effect = CONST_ME_HITAREA, target = false}
}

monster.defenses = {
	defense = 22,
	armor = 16,
	{name ="combat", interval = 1000, chance = 15, minDamage = 50, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 275, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
