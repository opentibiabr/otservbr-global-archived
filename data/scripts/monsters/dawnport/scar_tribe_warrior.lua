local mType = Game.createMonsterType("Scar Tribe Warrior")
local monster = {}
monster.description = "a scar tribe warrior"
monster.experience = 85
monster.outfit = {
	lookType = 7
}

monster.health = 125
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 5979
monster.speed = 160

monster.changeTarget = {
	interval = 2*1000,
	chance = 0
}

monster.flags = {
	summonable = false,
	attackable = true,
	rewardboss = false,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	preyable = false,
	targetDistance = 1,
	staticAttackChance = 80,
	respawnType = RESPAWN_IN_ALL
}

monster.loot = {
	{id = 2148, minCount = 1, maxCount = 8, chance = 100000},   -- Gold Coin
	{id = 2666, chance = 9570}, 								-- Meat
	{id = 2468, chance = 8700}, 								-- Studded Legs
	{id = 2464, chance = 7830}, 								-- Chain Armor
	{id = 12409, chance = 5770}, 								-- Broken Helmet
	{id = 12435, chance = 5220}, 								-- Orc Leather
	{id = 2510, chance = 1740}, 							    -- Plate Shield
	{id = 11113, chance = 1120}, 								-- Orc Tooth
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -30, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
}

monster.defenses = {
	defense = 10,
	armor = 5,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Alk!", yell = false},
	{text = "Trak grrrr brik.", yell = false},
	{text = "Grow truk grrrr.", yell = false},
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