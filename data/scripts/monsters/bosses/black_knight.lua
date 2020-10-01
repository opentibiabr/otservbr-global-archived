local mType = Game.createMonsterType("Black Knight")
local monster = {}

monster.description = "a black knight"
monster.experience = 1600
monster.outfit = {
	lookType = 131,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 20355
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "MINE!", yell = true},
	{text = "NO PRISONERS!", yell = true},
	{text = "NO MERCY!", yell = true},
	{text = "By Bolg's blood!", yell = false},
	{text = "You're no match for me!", yell = false}
}

monster.loot = {
	{id = "piggy bank", chance = 210},
	{id = 2120, chance = 16020},
	{id = "ruby necklace", chance = 740},
	{id = "gold coin", chance = 23000, maxCount = 80},
	{id = "gold coin", chance = 23000, maxCount = 56},
	{id = "boots of haste", chance = 320},
	{id = "two handed sword", chance = 8470},
	{id = "halberd", chance = 11850},
	{id = "spear", chance = 30800, maxCount = 3},
	{id = "dragon lance", chance = 110},
	{id = "battle hammer", chance = 6980},
	{id = "knight axe", chance = 3280},
	{id = "steel helmet", chance = 11220},
	{id = "plate armor", chance = 10370},
	{id = "warrior helmet", chance = 5610},
	{id = "knight armor", chance = 320},
	{id = "knight legs", chance = 1050},
	{id = "brass legs", chance = 12200},
	{id = "dark armor", chance = 1900},
	{id = "dark helmet", chance = 2330},
	{id = "brown bread", chance = 21600, maxCount = 2},
	{id = "lightning legs", chance = 950}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -200, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SPEAR, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 95},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
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
