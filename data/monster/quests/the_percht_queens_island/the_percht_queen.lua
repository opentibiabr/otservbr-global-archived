local mType = Game.createMonsterType("The Percht Queen")
local monster = {}

monster.description = "The Percht Queen"
monster.experience = 500
monster.outfit = {
	lookTypeEx = 35168
}

monster.health = 2300
monster.maxHealth = 2300
monster.race = "undead"
monster.corpse = 35101
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 100,
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
	targetDistance = 1,
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

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "piggy bank", chance = 80000},
	{id = "royal star", chance = 80000, maxCount = 100},
	{id = "platinum coin", chance = 80000, maxCount = 5},
	{id = "energy bar", chance = 75000},
	{id = "supreme health potion", chance = 65000, maxCount = 20},
	{id = "huge chunk of crude iron", chance = 64000},
	{id = "mysterious remains", chance = 63000},
	{id = "ultimate spirit potion", chance = 62000, maxCount = 20},
	{id = "ultimate mana potion", chance = 61000, maxCount = 20},
	{id = "bullseye potion", chance = 25500, maxCount = 10},
	{id = "chaos mace", chance = 25000},
	{id = 35108, chance = 24500},
	{id = "berserk potion", chance = 23000, maxCount = 10},
	{id = "red gem", chance = 22500},
	{id = "soul stone", chance = 224000},
	{id = 35104, chance = 25000},
	{id = "flames of the percht queen", chance = 18000},
	{id = "small ladybug", chance = 24980},
	{id = "gold ingot", chance = 22480},
	{id = "crystal coin", chance = 24890, maxCount = 2},
	{id = 7632, chance = 21580},
	{id = "skull staff", chance = 19850},
	{id = "magic sulphur", chance = 25480},
	{id = "percht queen's frozen heart", chance = 26800},
	{id = "percht skull", chance = 25842},
	{id = 35106, chance = 25840},
	{id = "silver token", chance = 5480, maxCount = 5},
	{id = "percht handkerchief", chance = 5808},
	{id = "ring of the sky", chance = 5100},
	{id = 26185, chance = 8486},
	{id = 35148, chance = 4848},
	{id = "percht broom", chance = 6485},
	{id = "ice hatchet", chance = 5485},
	{id = 26189, chance = 4858},
	{id = 26187, chance = 3485},
	{id = "yellow gem", chance = 5485},
	{id = "violet gem", chance = 6485},
	{id = 26200, chance = 7848},
	{id = 26199, chance = 5485},
	{id = "green gem", chance = 5485},
	{id = "blue gem", chance = 5845},
	{id = "frozen chain", chance = 5485},
	{id = 26198, chance = 5158},-- collar of blue plasma
	{id = "horseshoe", chance = 1250},
	{id = "golden horseshoe", chance = 2510},
	{id = "abyss hammer", chance = 1480},
	{id = "golden bell", chance = 2548},
	{id = "golden cotton reel", chance = 1254},
	{id = "lucky pig", chance = 2540}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -200},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_ICE, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 79
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 90},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 90}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
