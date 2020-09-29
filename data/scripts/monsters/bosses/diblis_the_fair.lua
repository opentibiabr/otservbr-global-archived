local mType = Game.createMonsterType("Diblis The Fair")
local monster = {}

monster.description = "Diblis The Fair"
monster.experience = 1800
monster.outfit = {
	lookType = 287,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "undead"
monster.corpse = 8937
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Banshee", chance = 50, interval = 4500}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I envy you to be slain by someone as beautiful as me.", yell = false},
	{text = "I will drain your ugly corpses of the last drop of blood.", yell = false},
	{text = "Not in my face you barbarian!", yell = false},
	{text = "My brides will feast on your souls!", yell = false}
}

monster.loot = {
	{id = 2229, chance = 15000},
	{id = 7588, chance = 1500},
	{id = 2144, chance = 8900, maxCount = 2},
	{id = 2152, chance = 50000, maxCount = 5},
	{id = 2148, chance = 100000, maxCount = 99},
	{id = 9020, chance = 100000},
	{id = 2534, chance = 2100},
	{id = 8903, chance = 300}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 70, attack = 95, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 12, minDamage = 0, maxDamage = -155, type = COMBAT_DEATHDAMAGE, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 12, minDamage = 100, maxDamage = 235, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 3000, chance = 25, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
