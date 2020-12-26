local mType = Game.createMonsterType("Grynch Clan Goblin")
local monster = {}

monster.description = "Grynch Clan Goblin"
monster.experience = 4
monster.outfit = {
	lookType = 61,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 393
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 5,
	FirstUnlock = 2,
	SecondUnlock = 3,
	CharmsPoints = 10,
	Stars = 1,
	Occurrence = 3,
	Locations = "They do not have a set respawn spot. They are announced to be stealing presents from a \z
			random Tibian city and spawn in the aforetold city. \z
			There are two or three messages that appear on each raid and three massive spawns of goblins."
	}

monster.health = 80
monster.maxHealth = 80
monster.race = "blood"
monster.corpse = 6002
monster.speed = 200
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
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
	hostile = false,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 0,
	targetDistance = 11,
	runHealth = 80,
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
	{text = "T'was not me hand in your pocket!", yell = false},
	{text = "Look! Cool stuff in house. Let's get it!", yell = false},
	{text = "Uhh! Nobody home! <chuckle>", yell = false},
	{text = "Me just borrowed it!", yell = false},
	{text = "Me no steal! Me found it!", yell = false},
	{text = "Me had it for five minutes. It's family heirloom now!", yell = false},
	{text = "Nice human won't hurt little, good goblin?", yell = false},
	{text = "Gimmegimme!", yell = false},
	{text = "Invite me in you lovely house plx!", yell = false},
	{text = "Other Goblin stole it!", yell = false},
	{text = "All presents mine!", yell = false},
	{text = "Me got ugly ones purse", yell = false},
	{text = "Free itans plz!", yell = false},
	{text = "Not me! Not me!", yell = false},
	{text = "Guys, help me here! Guys? Guys???", yell = false},
	{text = "That only much dust in me pocket! Honest!", yell = false},
	{text = "Can me have your stuff?", yell = false},
	{text = "Halp, Big dumb one is after me!", yell = false},
	{text = "Uh, So many shiny things!", yell = false},
	{text = "Utani hur hur hur!", yell = false},
	{text = "Mee? Stealing? Never!!!", yell = false},
	{text = "Oh what fun it is to steal a one-horse open sleigh!", yell = false},
	{text = "Must have it! Must have it!", yell = false},
	{text = "Where me put me lockpick?", yell = false},
	{text = "Catch me if you can!", yell = false}
}

monster.loot = {
	{id = 1852, chance = 4000},
	{id = 2072, chance = 5000},
	{id = 2102, chance = 500},
	{id = "snowball", chance = 7000, maxCount = 5},
	{id = "piggy bank", chance = 1000},
	{id = "gold coin", chance = 22500, maxCount = 22},
	{id = "scarab coin", chance = 500, maxCount = 2},
	{id = 2163, chance = 4000},
	{id = "blank rune", chance = 5000},
	{id = 2551, chance = 1500},
	{id = 2560, chance = 1000},
	{id = "scarf", chance = 4000},
	{id = "red apple", chance = 700, maxCount = 3},
	{id = "orange", chance = 7000, maxCount = 3},
	{id = "cherry", chance = 7000, maxCount = 4},
	{id = "cookie", chance = 7000, maxCount = 5},
	{id = "candy cane", chance = 5000, maxCount = 3},
	{id = 2695, chance = 5000, maxCount = 2},
	{id = "explorer brooch", chance = 4000},
	{id = "orichalcum pearl", chance = 500, maxCount = 2},
	{id = 5792, chance = 1000},
	{id = "chicken feather", chance = 4000, maxCount = 5},
	{id = "bat wing", chance = 4000, maxCount = 3},
	{id = "honeycomb", chance = 4000},
	{id = "lump of cake dough", chance = 7000, maxCount = 3},
	{id = "valentine's cake", chance = 1500},
	{id = "christmas present bag", chance = 7000},
	{id = "gingerbreadman", chance = 4000, maxCount = 2},
	{id = "walnut", chance = 3500, maxCount = 5},
	{id = "peanut", chance = 3500, maxCount = 100}
}

monster.attacks = {
}

monster.defenses = {
	defense = 12,
	armor = 10,
	{name ="speed", interval = 1000, chance = 15, speedChange = 500, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
