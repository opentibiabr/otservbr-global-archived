local mType = Game.createMonsterType("Grimeleech")
local monster = {}

monster.description = "a grimeleech"
monster.experience = 6560
monster.outfit = {
	lookType = 855,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9500
monster.maxHealth = 9500
monster.race = "undead"
monster.corpse = 25436
monster.speed = 340
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 3000,
	chance = 20
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
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
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
	{text = "Death... Taste!", yell = true}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 197},
	{id = "platinum coin", chance = 100000, maxCount = 8},
	{id = "great mana potion", chance = 34850, maxCount = 3},
	{id = "great health potion", chance = 34290, maxCount = 3},
	{id = "great spirit potion", chance = 30860, maxCount = 3},
	{id = "concentrated demonic blood", chance = 23400, maxCount = 3},
	{id = "demonic essence", chance = 19240},
	{id = "some grimeleech wings", chance = 19080},
	{id = "fire mushroom", chance = 15360, maxCount = 5},
	{id = "green mushroom", chance = 14800, maxCount = 5},
	{id = "small diamond", chance = 11290, maxCount = 5},
	{id = "small ruby", chance = 10750, maxCount = 5},
	{id = "small topaz", chance = 9660, maxCount = 5},
	{id = "small amethyst", chance = 9640, maxCount = 5},
	{id = "underworld rod", chance = 6890},
	{id = "wand of voodoo", chance = 4810},
	{id = "red gem", chance = 3930},
	{id = "yellow gem", chance = 2900},
	{id = "devil helmet", chance = 1360},
	{id = "magma legs", chance = 1150},
	{id = "demon shield", chance = 1010},
	{id = "nightmare blade", chance = 930},
	{id = "blue gem", chance = 780},
	{id = "rift crossbow", chance = 720},
	{id = "steel boots", chance = 640},
	{id = "rift shield", chance = 620},
	{id = "rift lance", chance = 580},
	{id = "rift bow", chance = 370},
	{id = "abyss hammer", chance = 210},
	{id = "vile axe", chance = 180},
	{id = "magic plate armor", chance = 60}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 70, attack = 80, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 2, skill = 153, attack = 100, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 14, minDamage = 100, maxDamage = -565, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 12, minDamage = -150, maxDamage = -220, type = COMBAT_DEATHDAMAGE, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 13, minDamage = -225, maxDamage = -375, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 9, minDamage = 0, maxDamage = -300, type = COMBAT_PHYSICALDAMAGE, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 16, minDamage = 130, maxDamage = 205, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 9, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 10, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="speed", interval = 2000, chance = 12, SpeedChange = 532, Duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
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
