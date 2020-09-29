local mType = Game.createMonsterType("Grim Reaper")
local monster = {}

monster.description = "a grim reaper"
monster.experience = 5500
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3900
monster.maxHealth = 3900
monster.race = "undead"
monster.corpse = 8955
monster.speed = 320
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
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
	{text = "Death!", yell = false},
	{text = "Come a little closer!", yell = false},
	{text = "The end is near!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 99000, maxCount = 263},
	{id = "platinum coin", chance = 5200, maxCount = 4},
	{id = 2162, chance = 4850},
	{id = "dark shield", chance = 3000},
	{id = "scythe", chance = 9000},
	{id = "orichalcum pearl", chance = 1400, maxCount = 4},
	{id = 6300, chance = 330},
	{id = "demonic essence", chance = 10600},
	{id = "concentrated demonic blood", chance = 35000},
	{id = "nightmare blade", chance = 880},
	{id = "great mana potion", chance = 10000},
	{id = "glacier kilt", chance = 330},
	{id = "ultimate health potion", chance = 9600},
	{id = "skullcracker armor", chance = 270},
	{id = "underworld rod", chance = 910},
	{id = 9810, chance = 2500},
	{id = "mystical hourglass", chance = 5300}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -320, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -165, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -350, maxDamage = -720, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -300, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -225, maxDamage = -275, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_DRAWBLOOD, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, minDamage = 130, maxDamage = 205, type = COMBAT_HEALING, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 450, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 65},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
