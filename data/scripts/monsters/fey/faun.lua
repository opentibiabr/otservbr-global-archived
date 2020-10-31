local mType = Game.createMonsterType("Faun")
local monster = {}
monster.description = "a faun"
monster.experience = 800
monster.outfit = {
	lookType = 980, lookHead = 61, lookBody = 96, lookLegs = 95, lookFeet = 43
}

monster.health = 900
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 29102
monster.speed = 210

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
}

monster.respawnType = {
	period = RESPAWNPERIOD_DAY,
	underground = false
}

monster.flags = {
	summonable = false,
	attackable = true,
	rewardBoss = false,
	hostile = true,
	convinceable = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	targetDistance = 1,
	staticAttackChance = 80,
}

monster.loot = {
	{id = "Gold Coin", minCount = 1, maxCount = 154, chance = 100000},
	{id = "Dandelion Seeds", chance = 15450},
	{id = "Strong Health Potion", minCount = 1, maxCount = 2, chance = 12100},
	{id = "Shimmering Beetles", chance = 9760},
	{id = "Fresh Fruit", chance = 9100},
	{id = "Goat Grass", chance = 8350},
	{id = "Leaf Star", minCount = 1, maxCount = 7, chance = 7560},
	{id = "Cookie", minCount = 1, maxCount = 5, chance = 6050},
	{id = "Panpipes", chance = 5220},
	{id = "Small Stone", minCount = 1, maxCount = 5, chance = 5160},
	{id = "Grapes", chance = 5050},
	{id = "Rainbow Quartz", minCount = 1, maxCount = 3, chance = 4960},
	{id = "Great Health Potion", minCount = 1, maxCount = 2, chance = 3260},
	{id = "Small Enchanted Sapphire", minCount = 1, maxCount = 2, chance = 2540},
	{id = "Wood Cape", chance = 1880},
	{id = "Leaf Legs", chance = 580},
	{id = "Wooden Spellbook", chance = 400},
	{id = "Die", chance = 150},
	{id = "Mandrake", chance = 40},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -370, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -115, type = COMBAT_EARTHDAMAGE, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="drunk", interval = 2000, chance = 11, length = 4, spread = 2, effect = CONST_ME_SOUND_PURPLE, target = false},
	{name ="combat", interval = 2000, chance = 30, minDamage = 0, maxDamage = -100, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_LEAFSTAR, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="combat", interval = 2000, chance = 15, minDamage = 75, maxDamage = 90, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_DEATHDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Are you posing a threat to this realm? I suppose so.", yell = false},
	{text = "Dance with me!", yell = false},
	{text = "In vino veritas! Hahaha!", yell = false},
	{text = "Wine, women and song!", yell = false}
}

monster.immunities = {
	{type = "invisible", condition = true}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
