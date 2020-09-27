local mType = Game.createMonsterType("Koshei The Deathless")
local monster = {}

monster.description = "Koshei the Deathless"
monster.experience = 0
monster.outfit = {
	lookType = 99,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "undead"
monster.corpse = 8272
monster.speed = 390
monster.summonCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	{name = "bonebeast", chance = 16, interval = 1000, max = 1}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Your pain will be beyond imagination!", yell = false},
	{text = "You can't defeat me! I will resurrect and take your soul!", yell = false},
	{text = "Death is my ally!", yell = false},
	{text = "Welcome to my domain visitor!", yell = false},
	{text = "You will be my toy on the other side!", yell = false},
	{text = "You will endure agony beyond thy death!", yell = false},
	{text = "What a disgusting smell of life!", yell = false},
	{text = "Ahhh, your life energy tastes so delicious!", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -170, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 300, interval = 4000}},
	{name ="combat", interval = 3000, chance = 9, minDamage = -60, maxDamage = -250, type = COMBAT_LIFEDRAIN, range = 1, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 1000, chance = 11, minDamage = -70, maxDamage = -135, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 9, minDamage = -50, maxDamage = -140, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="curse", interval = 3000, chance = 15, minDamage = -54, maxDamage = -54, range = 1, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -900, Duration = 30000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 30, minDamage = 150, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
