local mType = Game.createMonsterType("Tentuglys Head")
local monster = {}

monster.description = "a tentuglys head"
monster.experience = 40000
monster.outfit = {
	lookTypeEx = 39940
}

monster.health = 0 --?
monster.maxHealth = 0 --?
monster.race = "blood"
monster.corpse = 40435
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 10,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = true,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{name = "Crystal Coin", chance = 68480, maxCount =2},
	{name = "Ultimate Health Potion", chance = 59780, maxCount =20},
	{name = "Ultimate Mana Potion", chance = 59780, maxCount =20},
 	{name = "Platinum Coin", chance = 23910, maxCount =10},
	{name = "Ultimate Spirit Potion", chance = 23910, maxCount =10},
	{name = "Mastermind Potion", chance = 19570, maxCount =5},
	{name = "Berserk Potion", chance = 18480, maxCount =5},
	{name = "Bullseye Potion", chance = 1630, maxCount =5},
	{name = "Pirate Coin", chance = 15220, maxCount =50},
	{name = "Small Treasure Chest", chance = 8700},
	{name = "Golden Dustbin", chance = 6520},
	{name = "Giant Amethyst", chance = 5430},
	{name = "Giant Ruby", chance = 4350},
	{name = "Tentugly's Eye", chance = 4350},
	{name = "Tiara", chance = 4350},
	{name = "Giant Topaz", chance = 3260},
	{name = "Golden Skull", chance = 3260},
	{name = "Golden Cheese Wedge", chance = 2170},
	{name = "Tentacle of Tentugly", chance = 2170},
	{name = "Plushie of Tentugly", chance = 1090}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -700},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -160, maxDamage = -250, range = 6, shootEffect = CONST_ANI_ENERGYBALL, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DROWNDAMAGE, minDamage = -150, maxDamage = -180, radius = 8, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="condition", type = CONDITION_DROWN, interval = 2000, chance = 10, minDamage = -180, maxDamage = -300, radius = 8, effect = CONST_ME_WATERSPLASH, target = false},
}

monster.defenses = {
	defense = 80,
	armor = 0
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = -130},
	{type = COMBAT_FIREDAMAGE, percent = -120},
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

mType:register(monster)
