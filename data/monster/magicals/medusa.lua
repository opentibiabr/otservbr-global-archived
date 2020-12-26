local mType = Game.createMonsterType("Medusa")
local monster = {}

monster.description = "a medusa"
monster.experience = 4050
monster.outfit = {
	lookType = 330,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 570
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 5,
	Occurrence = 0,
	Locations = "Vandura Mountain (single spawn), Talahu (Medusa Cave), Deeper Banuta, Medusa Tower."
	}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 10524
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 600,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will make sssuch a fine ssstatue!", yell = false},
	{text = "There isss no chhhanccce of essscape", yell = false},
	{text = "Jussst look at me!", yell = false},
	{text = "Are you tired or why are you moving thhat ssslow <chuckle>", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 90},
	{id = "small emerald", chance = 3770, maxCount = 4},
	{id = "platinum coin", chance = 74810, maxCount = 6},
	{id = "knight armor", chance = 1840},
	{id = "medusa shield", chance = 3040},
	{id = "titan axe", chance = 1160},
	{id = "great mana potion", chance = 10000, maxCount = 2},
	{id = "terra mantle", chance = 870},
	{id = "terra legs", chance = 420},
	{id = "terra amulet", chance = 4060},
	{id = "ultimate health potion", chance = 9290, maxCount = 2},
	{id = 9810, chance = 500},
	{id = "sacred tree amulet", chance = 850},
	{id = "strand of medusa hair", chance = 9900}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, condition = {type = CONDITION_POISON, totalDamage = 840, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -21, maxDamage = -350, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="speed", interval = 2000, chance = 25, radius = 7, effect = CONST_ME_POFF, target = true},
	{name ="outfit", interval = 2000, chance = 1, range = 7, target = true, duration = 3000, outfitMonster = "clay guardian"}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
