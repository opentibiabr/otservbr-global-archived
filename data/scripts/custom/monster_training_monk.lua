local mType = Game.createMonsterType("Training Monk")
local monster = {}
monster.description = "Training Monk"
monster.experience = 0
monster.outfit = {
	lookType = 57
}

monster.health = 1000000
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 0
monster.speed = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 1*1000,
	chance = 0
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	targetDistance = 1,
	staticAttackChance = 100,
}

monster.summons = {
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Hit!", yell = false},
}

monster.loot = {
}

monster.attacks = {
	{name = "melee", attack = 130, effect = CONST_ME_DRAWBLOOD, interval = 2*1000, minDamage = -1, maxDamage = -2}
}

monster.defenses = {
	defense = 1,
	armor = 1,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 10000, maxDamage = 50000, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
}

monster.immunities = {
}

--[[
mType.onThink = function(monster, interval)
	print("I'm thinking")
end

mType.onAppear = function(monster, creature)
	if monster:getId() == creature:getId() then
		print(monster:getId(), creature:getId())
	end
end

mType.onDisappear = function(monster, creature)
	if monster:getId() == creature:getId() then
		print(monster:getId(), creature:getId())
	end
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
	if monster:getId() == creature:getId() then
		print(monster:getId(), creature:getId(), fromPosition, toPosition)
	end
end

mType.onSay = function(monster, creature, type, message)
	print(monster:getId(), creature:getId(), type, message)
end
]]

mType:register(monster)
