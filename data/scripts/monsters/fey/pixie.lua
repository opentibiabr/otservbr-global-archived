local mType = Game.createMonsterType("Pixie")
local monster = {}
monster.description = "a pixie"
monster.experience = 700
monster.outfit = {
	lookType = 982
}

monster.health = 770
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 29098
monster.speed = 240

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
}

monster.flags = {
	summonable = false,
	attackable = true,
	rewardBoss = false,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	preyable = false,
	targetDistance = 4,
	staticAttackChance = 70,
	runHealth = 30,
	respawnType = RESPAWN_IN_ALL
}

monster.loot = {
	{id = "Gold Coin", minCount = 1, maxCount = 90, chance = 60700},
	{id = "Wild Flowers", chance = 17760},
	{id = "Dandelion Seeds", chance = 14410},
	{id = "Fresh Fruit", chance = 10160},
	{id = "Colorful Snail Shell", chance = 9670},
	{id = "Leaf Star", minCount = 1, maxCount = 5, chance = 8910},
	{id = "Star Herb", chance = 4640},
	{id = 2162, chance = 4480}, -- Magic Light Wand
	{id = "Great Mana Potion", chance = 3250},
	{id = "Rainbow Quartz", minCount = 1, maxCount = 3, chance = 3110},
	{id = "Red Rose", chance = 3050},
	{id = "Small Enchanted Amethyst", minCount = 1, maxCount = 2, chance = 2090},
	{id = "Green Mushroom", chance = 1750},
	{id = "Strong Mana Potion", chance = 740},
	{id = "Butterfly Ring", chance = 740},
	{id = "Dream Blossom Staff", chance = 680},
	{id = "Wooden Spellbook", chance = 230},
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "combat", type = COMBAT_ENERGYDAMAGE,  interval = 2*1000, chance = 13, target = true, range = 4, minDamage = -70, maxDamage = -96, shootEffect = CONST_ANI_LEAFSTAR, effect = CONST_ME_ENERGYHIT},
	{name = "speed", type = CONDITION_PARAM_SPEED, chance = 20, interval = 2*1000, length = 4, spread = 3, speed = -220, effect = CONST_ME_MAGIC_GREEN},
	{name = "pixie skill reducer", chance = 15, interval = 2*1000},
}

monster.defenses = {
	defense = 52,
	armor = 52,
	{name = "combat", type = COMBAT_HEALING, interval = 2*1000, chance = 10, minDamage = 45, maxDamage = 75, effect = CONST_ME_MAGIC_BLUE},
}

monster.elements = {
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_HOLYDAMAGE, percent = 60},
	{type = COMBAT_DEATHDAMAGE, percent = 30},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = -10}
}

monster.voices = {
	interval = 2000,
	chance = 10,
	{text = "Sweet dreams!", yell = false},
	{text = "Let's try a step or two!", yell = false},
	{text = "Glamour, glitter, glistering things! Do you have any of those?", yell = false},
	{text = "You might be a threat! I'm sorry but I can't allow you to linger here.", yell = false},
}

monster.immunities = {
	{type = "paralyze", condition = true},
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