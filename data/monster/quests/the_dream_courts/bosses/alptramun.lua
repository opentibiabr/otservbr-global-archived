local mType = Game.createMonsterType("Alptramun")
local monster = {}

monster.description = "Alptramun"
monster.experience = 55000
monster.outfit = {
	lookType = 1143,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 34793
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
}

monster.loot = {
	{id = "silver token", chance = 100000000, maxCount = 5},
	{id = "skull staff", chance = 100000000, maxCount = 5},
	{id = "energy bar", chance = 100000000, maxCount = 5},
	{id = "Purple Tendril Lantern", chance = 100000000},
	{id = "crystal coin", chance = 100000000, maxCount = 2},
	{id = "blue gem", chance = 100000000},
	{id = "platinum coin", chance = 29580, maxCount = 5},
	{id = "supreme health potion", chance = 21540, maxCount = 20},
	{id = "ultimate spirit potion", chance = 22540, maxCount = 20},
	{id = "royal star", chance = 26540, maxCount = 100},
	{id = 7632, chance = 28540},
	{id = "Gold Token", chance = 15000, maxCount = 2},
	{id = "berserk potion", chance = 8050, maxCount = 10},
	{id = "bullseye potion", chance = 6780, maxCount = 10},
	{id = 26198, chance = 23520},-- collar of blue plasma
	{id = 26200, chance = 10590},
	{id = "Gold Ingot", chance = 7630},
	{id = "Huge Chunk of Crude Iron", chance = 8900},
	{id = "Mysterious Remains", chance = 90000},
	{id = "Piggy Bank", chance = 13770, maxCount = 4},
	{id = "green gem", chance = 2740},
	{id = "red gem", chance = 2580},
	{id = "Crunor Idol", chance = 2640},
	{id = "Giant Ruby", chance = 2840},
	{id = "Magic Sulphur", chance = 2740},
	{id = "yellow gem", chance = 2900},
	{id = "mastermind potion", chance = 2900, maxCount = 10},
	{id = "violet gem", chance = 1500},
	{id = "Alptramun's Toothbrush", chance = 520},
	{id = "Dream Shroud", chance = 620},
	{id = "Pair of Dreamwalkers", chance = 720},
	{id = "Soul Stone", chance = 820},
	{id = 26185, chance = 10590},
	{id = "Pomegranate", chance = 880},
	{id = "Dream Shroud", chance = 980},
	{id = 26186, chance = 10590}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -190, maxDamage = -300, range = 7, length = 6, spread = 3, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -70, maxDamage = -160, range = 3, length = 6, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -90, maxDamage = -160, range = 3, length = 6, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="stone shower", interval = 2000, chance = 10, minDamage = -230, maxDamage = -450, range = 7, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.heals = {
	{type = COMBAT_DEATHDAMAGE , percent = 500}
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
