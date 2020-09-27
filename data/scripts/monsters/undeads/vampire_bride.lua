local mType = Game.createMonsterType("Vampire Bride")
local monster = {}

monster.description = "a vampire bride"
monster.experience = 1050
monster.outfit = {
	lookType = 312,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 9660
monster.speed = 200
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	{text = "Kneel before your Mistress!", yell = false},
	{text = "Dead is the new alive.", yell = false},
	{text = "Come, let me kiss you, darling. Oh wait, I meant kill.", yell = false},
	{text = "Enjoy the pain - I know you love it.", yell = false},
	{text = "Are you suffering nicely enough?", yell = false},
	{text = "You won't regret you came to me, sweetheart.", yell = false}
}

monster.loot = {
	{id = "emerald bangle", chance = 1100},
	{id = "small diamond", chance = 1020, maxCount = 2},
	{id = "gold coin", chance = 90000, maxCount = 149},
	{id = "platinum coin", chance = 9910},
	{id = "moonlight rod", chance = 5500},
	{id = "boots of haste", chance = 220},
	{id = "strong health potion", chance = 5000},
	{id = "strong mana potion", chance = 10210},
	{id = 7733, chance = 200},
	{id = "hibiscus dress", chance = 1030},
	{id = "blood goblet", chance = 60},
	{id = 9809, chance = 1010},
	{id = 9837, chance = 970},
	{id = "vampire teeth", chance = 10000},
	{id = "blood preservation", chance = 4950},
	{id = "leather whip", chance = 20}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -190, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 15, minDamage = -60, maxDamage = -130, type = COMBAT_LIFEDRAIN, range = 1, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -60, maxDamage = -150, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 4000, chance = 5, minDamage = -60, maxDamage = -150, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_HEARTS, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -150, type = COMBAT_ENERGYDAMAGE, range = 7, shootEffect = CONST_ANI_ENERGY, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 15, minDamage = 40, maxDamage = 80, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 10},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
