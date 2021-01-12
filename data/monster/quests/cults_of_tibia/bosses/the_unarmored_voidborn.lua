local mType = Game.createMonsterType("The Unarmored Voidborn")
local monster = {}

monster.description = "The Unarmored Voidborn"
monster.experience = 15000
monster.outfit = {
	lookType = 987,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "undead"
monster.corpse = 29369
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 50
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "CHHRRR!", yell = false}
}

monster.loot = {
	{id = "magic sulphur", chance = 8920, maxCount = 10},
	{id = "gold ingot", chance = 21200, maxCount = 10},
	{id = 7633, chance = 26900},
	{id = "berserker", chance = 8920},
	{id = "abyss hammer", chance = 7620},
	{id = "skull helmet", chance = 9700},
	{id = "silver token", chance = 2732},
	{id = "gold token", chance = 1532},
	{id = "gold coin", chance = 100000, maxCount = 200},
	{id = "platinum coin", chance = 29840, maxCount = 25},
	{id = "yellow gem", chance = 29460},
	{id = "blue gem", chance = 21892},
	{id = "skull fetish", chance = 7270},
	{id = "bonebreaker", chance = 9510},
	{id = "mysterious remains", chance = 100000},
	{id = "small diamond", chance = 12760, maxCount = 10},
	{id = "small amethyst", chance = 14700, maxCount = 10},
	{id = "small topaz", chance = 11520, maxCount = 10},
	{id = "small sapphire", chance = 13790, maxCount = 10},
	{id = "small emerald", chance = 14700, maxCount = 10},
	{id = "small amethyst", chance = 12259, maxCount = 10},
	{id = "energy bar", chance = 16872, maxCount = 3},
	{id = "ultimate health potion", chance = 27652, maxCount = 10},
	{id = "great mana potion", chance = 33721, maxCount = 10},
	{id = "great spirit potion", chance = 25690, maxCount = 5},
	{id = 26198, chance = 12798},-- collar of blue plasma
	{id = "piece of royal steel", chance = 15890},
	{id = "shadow sceptre", chance = 7890},
	{id = 26189, chance = 14542},
	{id = "terra hood", chance = 16892}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -400, length = 7, spread = 5, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -440, radius = 5, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 50
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -300},
	{type = COMBAT_ENERGYDAMAGE, percent = -300},
	{type = COMBAT_EARTHDAMAGE, percent = -300},
	{type = COMBAT_FIREDAMAGE, percent = -300},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -300},
	{type = COMBAT_HOLYDAMAGE , percent = -300},
	{type = COMBAT_DEATHDAMAGE , percent = -300}
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
