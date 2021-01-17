local mType = Game.createMonsterType("Mazzinor")
local monster = {}

monster.description = "a mazzinor"
monster.experience = 100000
monster.outfit = {
	lookType = 1062,
	lookHead = 85,
	lookBody = 27,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 300000
monster.maxHealth = 300000
monster.race = "blood"
monster.corpse = 25151
monster.speed = 230
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4
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
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
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
	{id = "platinum coin", chance = 90000, maxCount = 38},
	{id = "crystal coin", chance = 70000, maxCount = 5},
	{id = "ultimate mana potion", chance = 70000, maxCount = 8},
	{id = "ultimate spirit potion", chance = 70000, maxCount = 4},
	{id = "supreme health potion", chance = 70000, maxCount = 4},
	{id = "berserk potion", chance = 70000, maxCount = 2},
	{id = "mastermind potion", chance = 70000, maxCount = 2},
	{id = "onyx chip", chance = 70000, maxCount = 12},
	{id = "small emerald", chance = 70000, maxCount = 12},
	{id = "demon horn", chance = 70000},
	{id = "lightning boots", chance = 70000},
	{id = "Red Gem", chance = 70000},
	{id = "violet gem", chance = 70000},
	{id = "stone skin amulet", chance = 70000},
	{id = "wand of starstorm", chance = 70000},
	{id = "gold token", chance = 30000, maxCount = 4},
	{id = "assassin dagger", chance = 30000},
	{id = "crystalline armor", chance = 30000},
	{id = "dreaded cleaver", chance = 30000},
	{id = "frozen lightning", chance = 30000},
	{id = "sinister book", chance = 1000},
	{id = "wand of dimensions", chance = 10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 90, attack = 80},
	{name ="divine missile", interval = 2000, chance = 10, minDamage = -135, maxDamage = -700, target = true},
	{name ="berserk", interval = 2000, chance = 20, minDamage = -90, maxDamage = -500, range = 7, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -135, maxDamage = -280, range = 7, radius = 5, effect = CONST_ME_MAGIC_BLUE, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -210, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -210, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
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
