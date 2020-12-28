local mType = Game.createMonsterType("Ghazbaran")
local monster = {}

monster.description = "Ghazbaran"
monster.experience = 15000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 123,
	lookLegs = 97,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 400
monster.manaCost = 0
monster.maxSummons = 4

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
	runHealth = 3500,
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
	{name = "Deathslicer", chance = 20, interval = 4000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "COME AND GIVE ME SOME AMUSEMENT", yell = false},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true},
	{text = "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL.", yell = true},
	{text = "FLAWLESS VICTORY!", yell = true}
}

monster.loot = {
	{id = "blue tome", chance = 20000},
	{id = "teddy bear", chance = 12500},
	{id = 2124, chance = 8333},
	{id = "white pearl", chance = 25000, maxCount = 15},
	{id = "black pearl", chance = 11111, maxCount = 14},
	{id = "small diamond", chance = 25000, maxCount = 5},
	{id = "small sapphire", chance = 25000, maxCount = 10},
	{id = "small emerald", chance = 25000, maxCount = 10},
	{id = "small amethyst", chance = 25000, maxCount = 17},
	{id = "talon", chance = 12500, maxCount = 7},
	{id = "platinum coin", chance = 100000, maxCount = 69},
	{id = "green gem", chance = 20000},
	{id = "blue gem", chance = 14285},
	{id = "might ring", chance = 12500},
	{id = "stealth ring", chance = 12500},
	{id = "strange symbol", chance = 11111},
	{id = "life crystal", chance = 12500},
	{id = "mind stone", chance = 20000},
	{id = "gold ring", chance = 20000},
	{id = "ring of healing", chance = 20000},
	{id = "twin axe", chance = 11111},
	{id = "golden armor", chance = 8333},
	{id = "magic plate armor", chance = 8333},
	{id = "demon shield", chance = 12500},
	{id = "golden boots", chance = 8333},
	{id = "demon horn", chance = 33333, maxCount = 2},
	{id = 6300, chance = 25000},
	{id = "demonic essence", chance = 100000},
	{id = "ruthless axe", chance = 14285},
	{id = "assassin star", chance = 12500, maxCount = 44},
	{id = "havoc blade", chance = 16666},
	{id = "ravenwing", chance = 14285},
	{id = "great mana potion", chance = 20000},
	{id = "great health potion", chance = 20000},
	{id = "glacier kilt", chance = 8333},
	{id = "great spirit potion", chance = 25000},
	{id = "ultimate health potion", chance = 25000},
	{id = "oceanborn leviathan armor", chance = 16666},
	{id = "frozen plate", chance = 8333},
	{id = "spellbook of warding", chance = 20000},
	{id = "spellbook of mind control", chance = 11111},
	{id = "spellbook of lost souls", chance = 16666},
	{id = "spellscroll of prophecies", chance = 25000},
	{id = "spellbook of dark mysteries", chance = 20000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2191},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, range = 7, radius = 6, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -120, maxDamage = -500, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 14, radius = 5, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -650, range = 7, radius = 13, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 4000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -600, radius = 14, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 300, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 440, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
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
