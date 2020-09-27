local mType = Game.createMonsterType("Ferumbras Soul Splinter")
local monster = {}

monster.description = "Ferumbras Soul Splinter"
monster.experience = 12000
monster.outfit = {
	lookType = 843,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "venom"
monster.corpse = 0
monster.speed = 390
monster.summonCost = 0
monster.maxSummons = 2

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
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardboss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.events = {"FerumbrasSoulSplinter"}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Demon2", chance = 11, interval = 2000, max = 3}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 90, attack = 200, effect = CONST_ME_DRAWBLOOD},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 20, minDamage = -250, maxDamage = -520, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, target = false},
	{name ="combat", interval = 2000, chance = 16, minDamage = -225, maxDamage = -410, type = COMBAT_MANADRAIN, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 21, minDamage = -200, maxDamage = -450, type = COMBAT_LIFEDRAIN, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 20, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 17, minDamage = -590, maxDamage = -1050, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 23, minDamage = 600, maxDamage = 2490, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 3, minDamage = 20000, maxDamage = 35000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 2000, chance = 14, SpeedChange = 700, Duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -50},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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
