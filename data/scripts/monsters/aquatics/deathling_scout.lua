local mType = Game.createMonsterType("Deathling Scout")
local monster = {}

monster.description = "a deathling scout"
monster.experience = 6300
monster.outfit = {
	lookType = 1073
}

monster.health = 7200
monster.maxHealth = 7200
monster.race = "blood"
monster.corpse = 33373
monster.speed = 310

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	isConvinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
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
	{id = "crystalline arrow", chance = 29860, maxCount = 25},
	{id = "Vortex Bolt", chance = 26340, maxCount = 25},
	{id = "Small Emerald", chance = 25110, maxCount = 12},
	{id = "Deepling Warts", chance = 24480},
	{id = "Deeptags", chance = 15100},
	{id = "Deepling Filet", chance = 14630},
	{id = "Small Enchanted Sapphire", chance = 13000, maxCount = 8},
	{id = "Deepling Ridge", chance = 11240},
	{id = "Great Mana Potion", chance = 10000},
	{id = "Great Health Potion", chance = 10000},
	{id = "Heavy Trident", chance = 6620},
	{id = "Eye of a Deepling", chance = 6070},
	{id = "Warrior's Shield", chance = 3630},
	{id = "Warrior's Axe", chance = 3470},
	{id = "Life Ring", chance = 3000},
	{id = "Fish Fin", chance = 920},
	{id = "Necklace of the Deep", chance = 440}
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -330, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = 0, maxDamage = -350, shootEffect = CONST_ANI_HUNTINGSPEAR},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 13, range = 5, target = true, minDamage = 0, maxDamage = -300, radius = 1, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA},
	{name = "combat", type = COMBAT_EARTHDAMAGE, interval = 2*1000, chance = 17, radius = 4, minDamage = -340, maxDamage = -550, effect = CONST_ME_GROUNDSHAKER},
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
	{text = 'VBOX°', yell = false},
    {text = 'O(J-"LJ-T =|-°', yell = false},
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
