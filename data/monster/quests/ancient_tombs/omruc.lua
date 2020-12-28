local mType = Game.createMonsterType("Omruc")
local monster = {}

monster.description = "Omruc"
monster.experience = 2950
monster.outfit = {
	lookType = 90,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4300
monster.maxHealth = 4300
monster.race = "undead"
monster.corpse = 6025
monster.speed = 370
monster.manaCost = 0
monster.maxSummons = 4

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 20,
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
	{name = "Stalker", chance = 100, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Now chhhou shhhee me ... Now chhhou don't.", yell = false},
	{text = "Chhhhou are marked ashhh my prey.", yell = false},
	{text = "Catchhhh me if chhhou can.", yell = false},
	{text = "Die!", yell = false},
	{text = "Psssst, I am over chhhere.", yell = false}
}

monster.loot = {
	{id = "small diamond", chance = 7000, maxCount = 3},
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "gold coin", chance = 50000, maxCount = 70},
	{id = "yellow gem", chance = 5000},
	{id = "stealth ring", chance = 5000},
	{id = "boots of haste", chance = 1500},
	{id = "crystal arrow", chance = 100000},
	{id = "arrow", chance = 10000, maxCount = 21},
	{id = "poison arrow", chance = 10000, maxCount = 20},
	{id = "burst arrow", chance = 10000, maxCount = 15},
	{id = "power bolt", chance = 10000, maxCount = 3},
	{id = "onyx arrow", chance = 10000, maxCount = 2},
	{id = "great health potion", chance = 7000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120, condition = {type = CONDITION_POISON, totalDamage = 65, interval = 4000}},
	{name ="combat", interval = 5000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -250, range = 1, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -500, shootEffect = CONST_ANI_POISONARROW, target = false},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -120, maxDamage = -450, range = 3, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="melee", interval = 3000, chance = 20, minDamage = -150, maxDamage = -500},
	{name ="speed", interval = 1000, chance = 25, speedChange = -900, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 50000}
}

monster.defenses = {
	defense = 35,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 14, effect = CONST_ME_MAGIC_BLUE}
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
