local mType = Game.createMonsterType("Dharalion")
local monster = {}

monster.description = "Dharalion"
monster.experience = 380
monster.outfit = {
	lookType = 203,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 380
monster.maxHealth = 380
monster.race = "blood"
monster.corpse = 6011
monster.speed = 240
monster.manaCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 10,
	health = 10,
	damage = 20,
	random = 60,
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
	targetDistance = 4,
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
	{name = "demon skeleton", chance = 6, interval = 1000, max = 2}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Feel my wrath!", yell = false},
	{text = "No one will stop my ascension!", yell = false},
	{text = "You desecrated this temple!", yell = false},
	{text = "Muahahaha!", yell = false},
	{text = "My powers are divine!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "holy orchid", chance = 100000},
	{id = "elvish talisman", chance = 88000},
	{id = "elven astral observer", chance = 82000},
	{id = "yellow gem", chance = 41790},
	{id = "blank rune", chance = 25370, maxCount = 1},
	{id = "melon", chance = 22390},
	{id = "bread", chance = 16420},
	{id = "elven amulet", chance = 14930},
	{id = "great mana potion", chance = 13430},
	{id = "life crystal", chance = 13430},
	{id = "sling herb", chance = 8960},
	{id = 2369, chance = 7460},-- cornucopia
	{id = "green tunic", chance = 4480},
	{id = "royal spear", chance = 1490, maxCount = 2}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 30, attack = 28},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -30, maxDamage = -60, range = 7, target = false},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -70, maxDamage = -90, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -151, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, target = false},
	{name ="effect", interval = 1000, chance = 13, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 15,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 90, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 7, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
