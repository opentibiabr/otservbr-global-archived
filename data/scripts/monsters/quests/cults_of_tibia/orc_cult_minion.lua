local mType = Game.createMonsterType("Orc Cult Minion")
local monster = {}

monster.description = "an orc cult minion"
monster.experience = 850
monster.outfit = {
	lookType = 50,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 5996
monster.speed = 105
monster.summonCost = 310
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
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{text = "Orc powaaa!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 166},
	{id = "strong health potion", chance = 15930},
	{id = "small topaz", chance = 1238, maxCount = 3},
	{id = "orcish axe", chance = 9190},
	{id = "cultish robe", chance = 19360},
	{id = "red mushroom", chance = 6250, maxCount = 3},
	{id = "berserk potion", chance = 860, maxCount = 2},
	{id = "meat", chance = 4780}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -230, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -120, maxDamage = -170, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SPEAR, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30
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
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
