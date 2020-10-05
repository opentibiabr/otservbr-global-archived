local mType = Game.createMonsterType("Deathling Spellsinger")
local monster = {}

monster.description = "a deathling spellsinger"
monster.experience = 6400
monster.outfit = {
	lookType = 1088
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "blood"
monster.corpse = 32549
monster.speed = 310
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 0,
	runHealth = 20,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 14},
	{id = "crystalline arrow", chance = 29000, maxCount = 25},
	{id = "Small Emerald", chance = 15000, maxCount = 14},
	{id = "Deepling Filet", chance = 14630},
	{id = "Deeptags", chance = 14100},
	{id = "Deepling Ridge", chance = 11240},
	{id = "Great Mana Potion", chance = 10000},
	{id = "Great Health Potion", chance = 10000},
	{id = "Deepling Warts", chance = 10000},
	{id = "Vortex Bolt", chance = 6500, maxCount = 25},
	{id = "Eye of a Deepling", chance = 6070},
	{id = "Warrior's Shield", chance = 4200},
	{id = "Heavy Trident", chance = 4000},
	{id = "Warrior's Axe", chance = 4000},
	{id = "Fish Fin", chance = 3650},
	{id = "Life Ring", chance = 2870},
	{id = "Small Enchanted Sapphire", chance = 2220, maxCount = 4},
	{id = "Necklace of the Deep", chance = 330}
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -380, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 10, range = 5, target = true, minDamage = 0, maxDamage = -300, shootEffect = CONST_ANI_HUNTINGSPEAR},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = -220, maxDamage = -340, radius = 1, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA},
	{name = "combat", type = COMBAT_HOLYDAMAGE, interval = 2*1000, chance = 17, length = 6, spread = 0, minDamage = -500, maxDamage = -720, effect = CONST_ME_HOLYAREA},
}

monster.defenses = {
	defense = 72,
	armor = 72
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = 'BOQOL"°', yell = false},
	{text = 'QOL" VBOXCL°', yell = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
