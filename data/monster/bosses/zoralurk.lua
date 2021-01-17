local mType = Game.createMonsterType("Zoralurk")
local monster = {}

monster.description = "Zoralurk"
monster.experience = 30000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 98,
	lookLegs = 86,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 55000
monster.maxHealth = 55000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 400
monster.manaCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 10000,
	chance = 20
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

monster.summons = {
	{name = "demon", chance = 50, interval = 4000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I AM ZORALURK, THE DEMON WITH A THOUSAND FACES!", yell = true},
	{text = "BRING IT, COCKROACHES!", yell = true}
}

monster.loot = {
	{id = "white pearl", chance = 10000, maxCount = 5},
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "boots of haste", chance = 16033},
	{id = "giant sword", chance = 60000},
	{id = "bright sword", chance = 20000},
	{id = "bright sword", chance = 20000},
	{id = "warlord sword", chance = 6000},
	{id = "patched boots", chance = 7000},
	{id = 6530, chance = 16000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1013},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -900, radius = 7, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -800, radius = 7, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -500, maxDamage = -800, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 300, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 440, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_CRAPS, target = false, duration = 10000, outfitMonster = "behemoth"},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_CRAPS, target = false, duration = 10000, outfitMonster = "fire devil"},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_CRAPS, target = false, duration = 10000, outfitMonster = "giant spider"},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_CRAPS, target = false, duration = 10000, outfitMonster = "undead dragon"},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_CRAPS, target = false, duration = 10000, outfitMonster = "lost soul"}
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
	{type = "outfit", condition = true},
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
