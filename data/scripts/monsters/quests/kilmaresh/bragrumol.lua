local mType = Game.createMonsterType("Bragrumol")
local monster = {}
monster.description = "Bragrumol"
monster.experience = 18000
monster.outfit = {
	lookType = 856
}

monster.health = 38000
monster.maxHealth = monster.health
monster.race = "fire"
monster.corpse = 13973
monster.speed = 220

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
}

monster.flags = {
	summonable = false,
	attackable = true,
	rewardBoss = true,
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
	{id = 2152, minCount = 1, maxCount = 8, chance = 100000},	-- Platinum Coin
	{id = 2156, chance = 88150},								-- Red Gem
	{id = 7840, minCount = 2, maxCount = 12, chance = 60000},	-- Flaming Arrow
	{id = 2197, chance = 54000},								-- Stone Skin Amulet
	{id = 7899, chance = 48000},								-- Magma Coat
	{id = 36158, chance = 5540},								-- Sea Horse Figurine
	{id = 36452, chance = 220},									-- Winged Boots
	{id = 36159, chance = 5760},								-- Golden Mask
	{id = 35238, chance = 220},									-- Enchanted Theurgic Amulet
	{id = 31621, chance = 110},									-- Enchanted Blister Ring
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "combat", type = COMBAT_DEATHDAMAGE,  interval = 2*1000, chance = 17, range = 4, target = true, minDamage = -300, maxDamage = -600, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH , effect = CONST_ME_MORTAREA},
	{name = "combat", type = COMBAT_DEATHDAMAGE,  interval = 2*1000, chance = 15, minDamage = -300, maxDamage = -600, radius = 4, effect = CONST_ME_MORTAREA},
	{name = "combat", type = COMBAT_FIREDAMAGE,  interval = 2*1000, chance = 20, range = 4, target = true, minDamage = -300, maxDamage = -600, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
}

monster.defenses = {
	defense = 84,
	armor = 84,
}

monster.elements = {
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_DEATHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 70},
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true}
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