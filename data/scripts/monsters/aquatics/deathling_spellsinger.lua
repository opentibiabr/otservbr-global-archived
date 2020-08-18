local mType = Game.createMonsterType("Deathling Spellsinger")
local monster = {}
monster.description = "a deathling spellsinger"
monster.experience = 6400
monster.outfit = {
	lookType = 1088
}

monster.health = 7200
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 32549
monster.speed = 310

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
	{id = 2152, minCount = 1, maxCount = 14, chance = 83670},	-- Platinum Coin
	{id = 18304, minCount = 1, maxCount = 25, chance = 26650},	-- Crystalline Arrow
	{id = 15488, chance = 13040},								-- Deepling Filet
	{id = 2149, minCount = 1, maxCount = 14, chance = 12610},	-- Small Emerald
	{id = 15425, chance = 9890},								-- Deepling Warts
	{id = 7591, chance = 9310},									-- Great Health Potion
	{id = 15452, chance = 8450},								-- Deepling Ridge
	{id = 7590, chance = 6880},									-- Great Mana Potion
	{id = 15649, minCount = 2, maxCount = 25, chance = 6590},	-- Vortex Bolt
	{id = 13870, chance = 4870},								-- Eye of a Deepling
	{id = 5895, chance = 3870},									-- Fish Fin
	{id = 13838, chance = 3720},								-- Heavy Trident
	{id = 15453, chance = 3150},								-- Warrior's Shield
	{id = 15451, chance = 2870},								-- Warrior's Axe
	{id = 2168, chance = 2290},									-- Life Ring
	{id = 7759, minCount = 1, maxCount = 4, chance = 1720},		-- Small Enchanted Sapphire
	{id = 15403, chance = 290},									-- Necklace of the Deep
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -380, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 10, range = 5, target = true, minDamage = 0, maxDamage = -300, shootEffect = CONST_ANI_HUNTINGSPEAR},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = -220, maxDamage = -340, radius = 1, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA},
	{name = "combat", type = COMBAT_HOLYDAMAGE, interval = 2*1000, chance = 17, length = 6, spread = 0, minDamage = -500, maxDamage = -720, effect = CONST_ME_HOLYAREA},
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
	{text = 'BOQOL "°', yell = false},
    {text = 'QOL" VBOXCL°', yell = false},
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