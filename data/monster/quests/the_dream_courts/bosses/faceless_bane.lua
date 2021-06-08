local mType = Game.createMonsterType("Faceless Bane")
local monster = {}

monster.description = "a Faceless Bane"
monster.experience = 30000
monster.outfit = {
	lookType = 1122,
	lookHead = 0,
	lookBody = 4,
	lookLegs = 95,
	lookFeet = 4,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 35000
monster.maxHealth = 35000
monster.race = "blood"
monster.corpse = 34651
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	canWalkOnFire = false,
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
	{name = "platinum coin", minCount = 1, maxCount = 10, chance = 100000},
	{name = "Combat Knife", chance = 50000},
	{name = "Crowbar", chance = 45000},
	{name = "Ice Rapier", chance = 42000},
	{name = "Hailstorm Rod", chance = 42000},
	{name = "Violet Crystal Shard", chance = 22000},
	{name = "Red Gem", chance = 22000},
	{name = "Red Crystal Fragment", chance = 18000},
	{name = "Small Sapphire", minCount = 1, maxCount = 3, chance = 25000},
	{name = "Knife", chance = 19000},
	{name = "Snakebite Rod", chance = 18500},
	{name = "Necrotic Rod", chance = 18500},
	{name = "Life Crystal", chance = 16800},
	{name = "Violet Gem", chance = 15200},
	{name = "Underworld Rod", chance = 15200},
	{name = "Spear", minCount = 0, maxCount = 3, chance = 18000},
	{name = "Dagger", chance = 18200},
	{name = "Moonlight Rod", chance = 12000},
	{name = "Terra Rod", chance = 12000},
	{name = "Cyan Crystal Fragment", chance = 5500},
	{name = "Green Crystal Shard", chance = 1300},
	{name = "Ectoplasmic Shield", chance = 600},
	{name = "Book Backpack", chance = 550},
	{name = "Spirit Guide", chance = 530},
	{id = 34983, chance = 500}, --- Enchanted Pendulet
}

monster.attacks = {
    {name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2000, minDamage = 0, maxDamage = -575},
	{name ="combat", interval = 2000, chance = 65, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -500, radius = 3, Effect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_DEATHDAMAGE, minDamage = -335, maxDamage = -450, radius = 4, Effect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -330, maxDamage = -380, length = 7, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -410, range = 4, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -385, maxDamage = -535, range = 4, radius = 1, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 99}
}

monster.heals = {
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
