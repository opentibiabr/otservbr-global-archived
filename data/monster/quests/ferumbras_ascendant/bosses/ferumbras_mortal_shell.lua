local mType = Game.createMonsterType("Ferumbras Mortal Shell")
local monster = {}

monster.description = "ferumbras mortal shell"
monster.experience = 42000
monster.outfit = {
	lookType = 229,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 390
monster.manaCost = 0
monster.maxSummons = 3

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
	runHealth = 2500,
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

monster.summons = {
	{name = "Demon2", chance = 11, interval = 2000, max = 3}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "INSECTS!", yell = true},
	{text = "I' STILL POWERFUL ENOUGH TO CRUSH YOU!", yell = true},
	{text = "If you strike me down, I shall become more powerful than you could possibly imagine!", yell = false}
}

monster.loot = {
	{id = 822, chance = 800},
	{id = 8041, chance = 400},
	{id = 3029, chance = 10000, maxCount = 10},
	{id = 7416, chance = 800},
	{id = 7427, chance = 800},
	{id = 3360, chance = 800},
	{id = 8102, chance = 400},
	{id = 22773, chance = 800},
	{id = 3031, chance = 100000, maxCount = 100},
	{id = 3032, chance = 10000, maxCount = 10},
	{id = 281, chance = 1000},
	{id = 3039, chance = 1000},
	{id = 8040, chance = 300},
	{id = 3010, chance = 1000},
	{id = 7423, chance = 300},
	{id = 3033, chance = 10000, maxCount = 10},
	{id = 22764, chance = 800},
	{id = 7422, chance = 800},
	{id = 3026, chance = 10000, maxCount = 5},
	{id = 7418, chance = 600},
	{id = 3439, chance = 800},
	{id = 3420, chance = 800},
	{id = 30146, chance = 150},
	{id = 3031, chance = 100000, maxCount = 100},
	{id = 823, chance = 800},
	{id = 3366, chance = 400},
	{id = 22758, chance = 100, unique = true},
	{id = 7403, chance = 800},
	{id = 22866, chance = 500},
	{id = 8098, chance = 300},
	{id = 22731, chance = 3000},
	{id = 7410, chance = 800},
	{id = 3041, chance = 800},
	{id = 3035, chance = 100000, maxCount = 25},
	{id = 8100, chance = 400},
	{id = 7414, chance = 800},
	{id = 5903, chance = 100, unique = true},
	{id = 22769, chance = 800},
	{id = 7382, chance = 800},
	{id = 3038, chance = 4000},
	{id = 3414, chance = 600},
	{id = 7435, chance = 800},
	{id = 22516, chance = 1000000, maxCount = 3},
	{id = 3027, chance = 10000, maxCount = 5},
	{id = 3028, chance = 10000, maxCount = 10},
	{id = 22771, chance = 800},
	{id = 9057, chance = 10000, maxCount = 10},
	{id = 22767, chance = 800},
	{id = 22867, chance = 500},
	{id = 8057, chance = 800},
	{id = 3303, chance = 700},
	{id = 3422, chance = 100, unique = true},
	{id = 821, chance = 800},
	{id = 9058, chance = 800},
	{id = 7405, chance = 800},
	{id = 7411, chance = 400},
	{id = 22737, chance = 3500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 90, attack = 200},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -250, maxDamage = -520, radius = 6, effect = CONST_ME_POISONAREA, target = false},
	{name ="ferumbras electrify", interval = 2000, chance = 18, target = false},
	{name ="combat", interval = 2000, chance = 16, type = COMBAT_MANADRAIN, minDamage = -225, maxDamage = -410, radius = 6, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -425, maxDamage = -810, radius = 9, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 21, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -650, radius = 9, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -450, radius = 6, effect = CONST_ME_POFF, target = false},
	{name ="ferumbras soulfire", interval = 2000, chance = 20, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -590, maxDamage = -1050, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 23, type = COMBAT_HEALING, minDamage = 600, maxDamage = 2490, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 3, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 35000, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 2000, chance = 14, speedChange = 700, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 7000},
	{name ="invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE}
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
	{type = COMBAT_HOLYDAMAGE , percent = -20},
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
