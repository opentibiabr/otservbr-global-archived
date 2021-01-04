local mType = Game.createMonsterType("Drume")
local monster = {}

monster.description = "Drume"
monster.experience = 25000
monster.outfit = {
	lookType = 1317,
	lookHead = 0,
	lookBody = 78,
	lookLegs = 57,
	lookFeet = 57,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 35000
monster.maxHealth = 35000
monster.race = "blood"
monster.corpse = 33364
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 3

monster.summons = {
	{name = "preceptor lazare", chance = 25, interval = 2000},
	{name = "grand commander soeren", chance = 25, interval = 2000},
	{name = "grand chaplain gaunder", chance = 25, interval = 2000}
}

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
	staticAttackChance = 70,
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
	{id = "Crystal Coin", chance = 90000, maxCount = 5},
	{id = "Platinum Coin", chance = 9000, maxCount = 25},
	{id = "Energy Bar", chance = 90000, maxCount = 5},
	{id = "Supreme Health Potion", chance = 33000, maxCount = 25},
	{id = "Ultimate Mana Potion", chance = 33000, maxCount = 15},
	{id = "Ultimate Spirit Potion", chance = 33000, maxCount = 10},
	{id = "Red Gem", chance = 880},
	{id = "Royal Star", chance = 48800, maxCount = 45},
	{id = "Bullseye Potion", chance = 5880, maxCount = 10},
	{id = "Berserk Potion", chance = 5880, maxCount = 10},
	{id = "Mastermind Potion", chance = 5880, maxCount = 10},
	{id = "Giant Shimmering Pearl", chance = 3800, maxCount = 5},
	{id = "Green Gem", chance = 880},
	{id = "Stone Skin Amulet", chance = 5500},
	{id = "Yellow Gem", chance = 3800},
	{id = "Blue Gem", chance = 4880},
	{id = "Terra legs", chance = 5500},
	{id = "Terra mantle", chance = 5500},
	{id = "Terra hood", chance = 5500},
	{id = "Terra amulet", chance = 5500},
	{id = "Terra rod", chance = 8500},
	{id = "Giant Sapphire", chance = 3800},
	{id = "Underworld Rod", chance = 4500},
	{id = "Raw Watermelon Tourmaline", chance = 1500},
	{id = "Gold Ingot", chance = 35000},
	{id = "Silver Token", chance = 25000, maxCount = 3},
	{id = "Violet Gem", chance = 3800},
	{id = "Wand of Voodoo", chance = 4500},
	{id = "Lion Amulet", chance = 160},
	{id = "Lion Axe", chance = 160},
	{id = "Lion Longbow", chance = 160},
	{id = "Lion Plate", chance = 160},
	{id = "Lion Spangenhelm", chance = 160},
	{id = "Lion Wand", chance = 160}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -750, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 6000, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -450, maxDamage = -750, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2750, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -800, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2500, chance = 22, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -500, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3300, chance = 24, type = COMBAT_ICEDAMAGE, minDamage = -250, maxDamage = -350, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -500, radius = 4, effect = CONST_ME_BIGCLOUDS, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 82,
	{name ="speed", interval = 1000, chance = 10, speedChange = 160, effect = CONST_ME_POFF, target = false, duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
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

mType.onSay = function(monster, creature, Type, message)
end

mType:register(monster)
