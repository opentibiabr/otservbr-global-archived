local mType = Game.createMonsterType("Apocalypse")
local monster = {}

monster.description = "Apocalypse"
monster.experience = 550000
monster.outfit = {
	lookType = 12,
	lookHead = 38,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 160000
monster.maxHealth = 160000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 380
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 40
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
	{text = "BOW TO THE POWER OF THE RUTHLESS SEVEN!", yell = true},
	{text = "DESTRUCTION!", yell = true},
	{text = "CHAOS!", yell = true},
	{text = "DEATH TO ALL!", yell = true}
}

monster.loot = {
	{id = "ancient amulet", chance = 13500},
	{id = 2231, chance = 19000}, -- big bone
	{id = "black pearl", chance = 15000, maxCount = 35},
	{id = "boots of haste", chance = 14000},
	{id = 2192, chance = 22500}, -- crystal ball
	{id = "crystal necklace", chance = 21500},
	{id = 2124, chance = 15500}, -- crystal ring
	{id = "demon shield", chance = 15500},
	{id = "devil helmet", chance = 11000},
	{id = "dragon hammer", chance = 34500},
	{id = "energy ring", chance = 13500},
	{id = "fire axe", chance = 17000},
	{id = "giant sword", chance = 12500},
	{id = "platinum coin", chance = 69900, maxCount = 100},
	{id = "platinum coin", chance = 68800, maxCount = 100},
	{id = "crystal coin", chance = 47700, maxCount = 40},
	{id = "crystal coin", chance = 36600, maxCount = 15},
	{id = "gold ring", chance = 28000},
	{id = "golden legs", chance = 15000},
	{id = "giant ruby", chance = 31500},
	{id = "giant sapphire", chance = 31500},
	{id = "giant emerald", chance = 31500},
	{id = "ice rapier", chance = 27500},
	{id = "magic plate armor", chance = 13000},
	{id = "mastermind shield", chance = 17500},
	{id = "purple tome", chance = 12600},
	{id = "ring of the sky", chance = 13500},
	{id = "silver dagger", chance = 15500},
	{id = "skull staff", chance = 25000},
	{id = "talon", chance = 14000, maxCount = 27},
	{id = "teddy bear", chance = 10500},
	{id = "thunder hammer", chance = 3500},
	{id = 3955, chance = 5100}, -- voodoo doll
	{id = "white pearl", chance = 12500, maxCount = 35}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 230, attack = 210},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -800, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -1000, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1200, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 145,
	armor = 188,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
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
