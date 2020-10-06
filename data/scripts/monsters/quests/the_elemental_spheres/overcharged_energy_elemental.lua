local mType = Game.createMonsterType("Overcharged Energy Elemental")
local monster = {}

monster.description = "an overcharged energy elemental"
monster.experience = 1300
monster.outfit = {
	lookType = 290
}

monster.health = 1200
monster.maxHealth = monster.health
monster.race = "energy"
monster.corpse = 8966
monster.speed = 300

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
	targetDistance = 1,
	staticAttackChance = 80,
	respawnType = RESPAWN_IN_ALL
}

monster.loot = {
	{id = 2148, minCount = 1, maxCount = 176, chance = 85090},	-- Gold Coin
	{id = 8303, chance = 14130},								-- Energy Soil
	{id = 7591, chance = 9750},									-- Great Health Potion
	{id = 2150, minCount = 1, maxCount = 2, chance = 4880},		-- Small Amethyst
	{id = 7439, chance = 1230},									-- Berserk Potion
	{id = 2214, chance = 560},									-- Ring of Healing
	{id = 8920, chance = 280},									-- Wand of Starstorm
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "combat", type = COMBAT_ENERGYDAMAGE,  interval = 2*1000, chance = 17, range = 4, target = true, minDamage = -150, maxDamage = -420, radius = 2, shootEffect = CONST_ANI_ENERGYBALL , effect = CONST_ME_ENERGYHIT},
	{name = "combat", type = COMBAT_ENERGYDAMAGE,  interval = 2*1000, chance = 15, range = 4, target = true, minDamage = -100, maxDamage = -250, radius = 1, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY},
	{name = "charged energy elemental electrify", type = CONDITION_ENERGY,  interval = 2*1000, chance = 13},
}

monster.defenses = {
	defense = 35,
	armor = 35,
}

monster.elements = {
	{type = COMBAT_EARTHDAMAGE, percent = -20},
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "energy", combat = true, condition = true},
	{type = "ice", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "BZZZZZZZZZZ", yell = false},
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