local mType = Game.createMonsterType("Deathling Scout")
local monster = {}
monster.description = "a deathling scout"
monster.experience = 6300
monster.outfit = {
	lookType = 1073
}

monster.health = 7200
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 33373
monster.speed = 310
monster.runHealth = 20

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
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
	{id = 18304, minCount = 1, maxCount = 25, chance = 24680}, 	-- Crystalline Arrow
	{id = 15488, chance = 13980},								-- Deepling Filet
	{id = 2149, minCount = 1, maxCount = 12, chance = 21360},	-- Small Emerald
	{id = 15425, chance = 20470},								-- Deepling Warts
	{id = 15426, chance = 12120},								-- Deeptags
	{id = 7591, chance = 8510},									-- Great Health Potion
	{id = 15452, chance = 9010},								-- Deepling Ridge
	{id = 7590, chance = 8180},									-- Great Mana Potion
	{id = 15649, minCount = 2, maxCount = 25, chance = 22690},  -- Vortex Bolt
	{id = 13870, chance = 5560},								-- Eye of a Deepling
	{id = 5895, chance = 730},									-- Fish Fin
	{id = 13838, chance = 5300},								-- Heavy Trident
	{id = 15453, chance = 2420},								-- Warrior's Shield
	{id = 15451, chance = 3180},								-- Warrior's Axe
	{id = 2168, chance = 2420},									-- Life Ring
	{id = 7759, minCount = 1, maxCount = 8, chance = 11260},    -- Small Enchanted Sapphire
	{id = 15403, chance = 500},									-- Necklace of the Deep
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -330, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = 0, maxDamage = -350, shootEffect = CONST_ANI_HUNTINGSPEAR},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = 0, maxDamage = -300, radius = 1, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA},
	{name = "combat", type = COMBAT_EARTHDAMAGE, interval = 2*1000, chance = 17, radius = 4, minDamage = -340, maxDamage = -550, effect = CONST_ME_GROUNDSHAKER},
}

monster.defenses = {
	defense = 72,
	armor = 72,
}

monster.elements = {
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_DEATHDAMAGE, percent = 10},
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "ice", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = 'VBOX°', yell = false},
    {text = 'O(J-"LJ-T =|-°', yell = false},
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