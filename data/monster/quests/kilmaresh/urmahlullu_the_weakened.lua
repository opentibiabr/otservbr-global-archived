local mType = Game.createMonsterType("Urmahlullu the Weakened")
local monster = {}

monster.description = "urmahlullu the weakened"
monster.experience = 85000
monster.outfit = {
	lookType = 1197,
	lookHead = 57,
	lookBody = 75,
	lookLegs = 38,
	lookFeet = 86,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 512000
monster.race = "blood"
monster.corpse = 36248
monster.speed = 190
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.events = {
	"WeakenedDeath"
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will regret this!", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 96000, maxCount = 6},
	{id = "ultimate mana potion", chance = 51000, maxCount = 20},
	{id = "red gem", chance = 39000, maxCount = 2},
	{id = "berserk potion", chance = 15000, maxCount = 10},
	{id = "flash arrow", chance = 30000, maxCount = 100},
	{id = "crystal coin", chance = 12000, maxCount = 3},
	{id = "silver token", chance = 9000, maxCount = 3},
	{id = "mastermind potion", chance = 12000, maxCount = 10},
	{id = "supreme health potion", chance = 51000, maxCount = 20},
	{id = "ultimate spirit potion", chance = 42000, maxCount = 20},
	{id = "royal star", chance = 30000, maxCount = 100},
	{id = "bullseye potion", chance = 18000, maxCount = 10},
	{id = "lightning pendant", chance = 27000},
	{id = "giant ruby", chance = 6000},
	{id = "urmahlullu's mane", chance = 6000},
	{id = "urmahlullu's paw", chance = 6000},
	{id = "urmahlullu's tail", chance = 6000},
	{id = "tagralt blade", chance = 500},
	{id = "winged boots", chance = 500},
	{id = "energy bar", chance = 93000},
	{id = "yellow gem", chance = 46000},
	{id = "green gem", chance = 21000},
	{id = "magma coat", chance = 6000},
	{id = 7632, chance = 12000},
	{id = "violet gem", chance = 6000},
	{id = "magma monocle", chance = 3000},
	{id = 36392, chance = 3000},
	{id = "blue gem", chance = 12000},
	{id = "magma amulet", chance = 12000},
	{id = "gold ingot", chance = 9000},
	{id = "giant emerald", chance = 6000},
	{id = 36098, chance = 100000},
	{id = "rainbow necklace", chance = 6000},
	{id = "giant sapphire", chance = 6000},
	{id = "winged backpack", chance = 250},
	{id = "rainbow necklace", chance = 160},
	{id = 35238, chance = 160},
	{id = "Sun Medal", chance = 160},
	{id = "Sunray Emblem", chance = 160}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -1100},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -800, radius = 4, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -800, radius = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="urmahlulluring", interval = 2000, chance = 18, minDamage = -450, maxDamage = -600, target = false}
}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
