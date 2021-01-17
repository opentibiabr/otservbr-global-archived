local mType = Game.createMonsterType("The Souldespoiler")
local monster = {}

monster.description = "The Souldespoiler"
monster.experience = 0
monster.outfit = {
	lookType = 875,
	lookHead = 11,
	lookBody = 0,
	lookLegs = 94,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 26220
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 5

monster.changeTarget = {
	interval = 6000,
	chance = 30
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Freed Soul", chance = 5, interval = 5000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Urrg! I will not lose this soul!", yell = false},
	{text = "All souls shall be mine alone!", yell = false}
}

monster.loot = {
	{id = "curious matter", chance = 8920, maxCount = 10},
	{id = "spark sphere", chance = 21200, maxCount = 10},
	{id = 7633, chance = 26900},
	{id = "wand of defiance", chance = 8920},
	{id = "rift lance", chance = 13200},
	{id = "rift crossbow", chance = 7620},
	{id = "haunted blade", chance = 9700},
	{id = "silver token", chance = 2320},
	{id = "gold token", chance = 1532},
	{id = "sapphire hammer", chance = 14000},
	{id = "gold coin", chance = 100000, maxCount = 200},
	{id = "platinum coin", chance = 29840, maxCount = 35},
	{id = "wand of defiance", chance = 8723},
	{id = "yellow gem", chance = 29460},
	{id = "blue gem", chance = 21892},
	{id = "medusa shield", chance = 7270},
	{id = "underworld rod", chance = 9510},
	{id = "mysterious remains", chance = 100000},
	{id = "prismatic quartz", chance = 13390, maxCount = 10},
	{id = "small diamond", chance = 12760, maxCount = 10},
	{id = "small amethyst", chance = 14700, maxCount = 10},
	{id = "small topaz", chance = 11520, maxCount = 10},
	{id = "small sapphire", chance = 13790, maxCount = 10},
	{id = "small emerald", chance = 14700, maxCount = 10},
	{id = "small amethyst", chance = 12259, maxCount = 10},
	{id = "odd organ", chance = 100000},
	{id = "energy bar", chance = 16872, maxCount = 3},
	{id = "ultimate health potion", chance = 27652, maxCount = 10},
	{id = "great mana potion", chance = 33721, maxCount = 10},
	{id = "great spirit potion", chance = 25690, maxCount = 10},
	{id = "blade of corruption", chance = 3775},
	{id = "magma boots", chance = 15890},
	{id = "spellbook of lost souls", chance = 7890},
	{id = "shield of corruption", chance = 150},
	{id = "plasma pearls", chance = 100000},
	{id = "spiked squelcher", chance = 16892, maxCount = 2}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -783},
	{name ="combat", interval = 2000, chance = 60, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -181, range = 7, radius = 3, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -210, maxDamage = -538, length = 7, spread = 2, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_DROWNDAMAGE, minDamage = -125, maxDamage = -640, length = 9, spread = 3, effect = CONST_ME_LOSEENERGY, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 7000, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
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
