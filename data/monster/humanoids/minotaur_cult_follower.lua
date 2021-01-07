local mType = Game.createMonsterType("Minotaur Cult Follower")
local monster = {}

monster.description = "a minotaur cult follower"
monster.experience = 960
monster.outfit = {
	lookType = 25,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1508
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Minotaurs Cult Cave."
	}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "blood"
monster.corpse = 5969
monster.speed = 170
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{text = "Kaplar!", yell = false},
	{text = "Hurr!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 150},
	{id = "cowbell", chance = 22480},
	{id = "cultish robe", chance = 14720},
	{id = "plate shield", chance = 20020},
	{id = "great health potion", chance = 11840},
	{id = "small ruby", chance = 3690, maxCount = 2},
	{id = "small topaz", chance = 3170, maxCount = 2},
	{id = "yellow gem", chance = 280},
	{id = "platinum coin", chance = 65250, maxCount = 3},
	{id = "plate shield", chance = 20710},
	{id = "small emerald", chance = 3410, maxCount = 2},
	{id = "small amethyst", chance = 2950, maxCount = 2},
	{id = "red piece of cloth", chance = 810},
	{id = "ham", chance = 59410},
	{id = "bronze amulet", chance = 15140},
	{id = "mino shield", chance = 12670},
	{id = "ring of healing", chance = 3190},
	{id = "mino lance", chance = 1810},
	{id = "warrior helmet", chance = 570},
	{id = "red gem", chance = 170},
	{id = "meat", chance = 8020},
	{id = "minotaur leather", chance = 11530},
	{id = "minotaur horn", chance = 14550, maxCount = 2}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -180, maxDamage = -250, range = 7, effect = CONST_ME_EXPLOSIONAREA, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
