local mType = Game.createMonsterType("Lisa")
local monster = {}

monster.description = "Lisa"
monster.experience = 18000
monster.outfit = {
	lookType = 604,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 65000
monster.maxHealth = 65000
monster.race = "venom"
monster.corpse = 23359
monster.speed = 200
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3
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
}

monster.loot = {
	{id = "bowl of glooth soup", chance = 55000, maxCount = 5},
	{id = "glooth sandwich", chance = 34500, maxCount = 5},
	{id = "great health potion", chance = 33000, maxCount = 5},
	{id = "great mana potion", chance = 33000, maxCount = 5},
	{id = "great spirit potion", chance = 33000, maxCount = 5},
	{id = "glooth steak", chance = 28000, maxCount = 5},
	{id = "slimy leaf tentacle", chance = 22000, maxCount = 3},
	{id = "small amethyst", chance = 21000, maxCount = 5},
	{id = "small diamond", chance = 18000, maxCount = 5},
	{id = "small ruby", chance = 16000, maxCount = 5},
	{id = "small topaz", chance = 14800, maxCount = 5},
	{id = "glooth club", chance = 10500},
	{id = "glooth spear", chance = 9900},
	{id = "glooth whip", chance = 9500},
	{id = "glooth amulet", chance = 9000},
	{id = "glooth axe", chance = 8000},
	{id = "glooth blade", chance = 7000},
	{id = "glooth cape", chance = 6000},
	{id = "red gem", chance = 2600},
	{id = "yellow gem", chance = 2500},
	{id = "lisa's doll", chance = 300}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 150, attack = 100, condition = {type = CONDITION_POISON, totalDamage = 900, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -400, range = 7, radius = 1, shootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_MORTAREA, target = true},
	{name ="effect", interval = 2000, chance = 15, range = 7, radius = 6, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_BIGPLANTS, target = true},
	{name ="effect", interval = 2000, chance = 15, range = 7, radius = 6, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_PLANTATTACK, target = true},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -200, radius = 8, effect = CONST_ME_POISONAREA, target = false},
	{name ="lisa paralyze", interval = 2000, chance = 12, target = false},
	{name ="lisa skill reducer", interval = 2000, chance = 15, target = false},
	{name ="lisa wave", interval = 2000, chance = 11, minDamage = -400, maxDamage = -900, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 15,
	{name ="lisa summon", interval = 2000, chance = 5, target = false},
	{name ="lisa heal", interval = 1000, chance = 100, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
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
