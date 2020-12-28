local mType = Game.createMonsterType("Preceptor Lazare")
local monster = {}

monster.description = "Preceptor Lazare"
monster.experience = 9200
monster.outfit = {
	lookType = 1078,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 33384
monster.speed = 210
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	{id = "gold coin", chance = 100000, maxCount = 90},
	{id = "gold coin", chance = 100000, maxCount = 45},
	{id = "platinum coin", chance = 100000, maxCount = 3},
	{id = "great mana potion", chance = 100000, maxCount = 3},
	{id = "demonic essence", chance = 100000, maxCount = 5},
	{id = "red gem", chance = 700, maxCount = 3},
	{id = "assassin star", chance = 100000, maxCount = 5},
	{id = "concentrated demonic blood", chance = 100000, maxCount = 3},
	{id = "ham", chance = 100000, maxCount = 2},
	{id = "small emerald", chance = 100000, maxCount = 5},
	{id = "small diamond", chance = 100000, maxCount = 4},
	{id = "small amethyst", chance = 100000, maxCount = 3},
	{id = "knight armor", chance = 3100},
	{id = "golden armor", chance = 2200},
	{id = "patch of fine cloth", chance = 1800, maxCount = 3},
	{id = "violet gem", chance = 1800},
	{id = "titan axe", chance = 1600},
	{id = "war axe", chance = 1400},
	{id = "demonbone amulet", chance = 800},
	{id = "heavy mace", chance = 600},
	{id = "mastermind shield", chance = 500},
	{id = "falcon rod", chance = 200},
	{id = "falcon greaves", chance = 110}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -700},
	{name ="combat", interval = 1400, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -800, range = 7, shootEffect = CONST_ANI_INFERNALBOLT, target = false},
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -1100, range = 7, shootEffect = CONST_ANI_POWERBOLT, target = false},
	{name ="combat", interval = 1600, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -720, range = 7, shootEffect = CONST_ANI_ENERGYBALL, target = false},
	{name ="combat", interval = 1500, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -1000, range = 7, radius = 4, effect = CONST_ME_HOLYDAMAGE, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 86,
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
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
