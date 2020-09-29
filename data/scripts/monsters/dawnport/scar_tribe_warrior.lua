local mType = Game.createMonsterType("Scar Tribe Warrior")
local monster = {}

monster.description = "a scar tribe warrior"
monster.experience = 85
monster.outfit = {
	lookType = 7
}

monster.health = 125
monster.maxHealth = 125
monster.race = "blood"
monster.corpse = 5979
monster.speed = 160

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	canPushItems = false,
	canPushCreatures = false,
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
	{text = "Alk!", yell = false},
	{text = "Trak grrrr brik.", yell = false},
	{text = "Grow truk grrrr.", yell = false}
}

monster.loot = {
	{id = "Gold Coin", minCount = 1, maxCount = 8, chance = 100000},
	{id = "Meat", chance = 9570},
	{id = "Studded Legs", chance = 8700},
	{id = "Chain Armor", chance = 7830},
	{id = "Broken Helmet", chance = 5770},
	{id = "Orc Leather", chance = 5220},
	{id = "Plate Shield", chance = 1740},
	{id = "Orc Tooth", chance = 1120},
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 10, attack = 25, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 10,
	armor = 5
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
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
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
