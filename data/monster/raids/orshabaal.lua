local mType = Game.createMonsterType("Orshabaal")
local monster = {}

monster.description = "Orshabaal"
monster.experience = 10000
monster.outfit = {
	lookType = 201,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 22500
monster.maxHealth = 22500
monster.race = "fire"
monster.corpse = 5995
monster.speed = 380
monster.manaCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 2000,
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 2500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "demon", chance = 10, interval = 1000, max = 4}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", yell = false},
	{text = "YOU ARE DOOMED!", yell = false},
	{text = "ORSHABAAL IS BACK!", yell = false},
	{text = "Be prepared for the day my masters will come for you!", yell = false},
	{text = "SOULS FOR ORSHABAAL!", yell = false}
}

monster.loot = {
	{id = "purple tome", chance = 20000},
	{id = "golden mug", chance = 12500},
	{id = "crystal necklace", chance = 20000},
	{id = "white pearl", chance = 33333, maxCount = 15},
	{id = "black pearl", chance = 25000, maxCount = 8},
	{id = "small diamond", chance = 20000, maxCount = 5},
	{id = "small sapphire", chance = 33333, maxCount = 8},
	{id = "small emerald", chance = 25000, maxCount = 7},
	{id = "small amethyst", chance = 20000, maxCount = 17},
	{id = "talon", chance = 20000, maxCount = 3},
	{id = "platinum coin", chance = 100000, maxCount = 69},
	{id = "green gem", chance = 6666},
	{id = "blue gem", chance = 20000},
	{id = 2162, chance = 6666},
	{id = "might ring", chance = 6666},
	{id = "silver amulet", chance = 20000},
	{id = "platinum amulet", chance = 12500},
	{id = "strange symbol", chance = 20000},
	{id = "orb", chance = 6666},
	{id = "life crystal", chance = 12500},
	{id = "mind stone", chance = 20000},
	{id = "boots of haste", chance = 12500},
	{id = "protection amulet", chance = 20000},
	{id = "ring of healing", chance = 33333},
	{id = "two handed sword", chance = 12500},
	{id = "giant sword", chance = 25000},
	{id = "silver dagger", chance = 6666},
	{id = "golden sickle", chance = 6666},
	{id = "fire axe", chance = 12500},
	{id = "dragon hammer", chance = 6666},
	{id = "devil helmet", chance = 33333},
	{id = "golden legs", chance = 12500},
	{id = "magic plate armor", chance = 6666},
	{id = "mastermind shield", chance = 6666},
	{id = "demon shield", chance = 25000},
	{id = "Orshabaal's brain", chance = 6666},
	{id = "thunder hammer", chance = 6666},
	{id = "demon horn", chance = 50000},
	{id = 6300, chance = 50000},
	{id = "demonic essence", chance = 100000},
	{id = "assassin star", chance = 12500, maxCount = 42},
	{id = "great mana potion", chance = 33333},
	{id = "great health potion", chance = 20000},
	{id = "great spirit potion", chance = 12500},
	{id = "ultimate health potion", chance = 33333},
	{id = "gold ingot", chance = 6666}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1990},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -300, maxDamage = -600, range = 7, target = false},
	{name ="combat", interval = 1000, chance = 6, type = COMBAT_MANADRAIN, minDamage = -150, maxDamage = -350, radius = 5, effect = CONST_ME_POISONAREA, target = false},
	{name ="effect", interval = 1000, chance = 6, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -310, maxDamage = -600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -850, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 111,
	armor = 90,
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 2500, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 5, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -1},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
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
