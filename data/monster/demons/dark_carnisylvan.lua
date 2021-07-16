local mType = Game.createMonsterType("Dark Carnisylvan")
local monster = {}

monster.description = "Dark Carnisylvan"
monster.experience = 3900
monster.outfit = {
	lookType = 1418,
	lookHead = 114,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 285
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Forest of Life."
}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "undead"
monster.corpse = 41745
monster.speed = 110
monster.manaCost = 0
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
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
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
	{text = "You like it, don't you?", yell = false},
	{text = "IahaEhheAie!", yell = false},
	{text = "It's party time!", yell = false},
	{text = "Harrr, Harrr!", yell = false},
	{text = "The torturer is in!", yell = false}
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 19},
	{name = "Bone", chance = 29530},
	{name = "Carnisylvan Finger", chance = 10430},
	{name = "Carnisylvan Bark", chance = 8990},
	{name = "Great Mana Potion", chance = 8990},
	{name = "Wand of Starstorm", chance = 3930},
	{name = "Underworld Rod", chance = 3450},
	{id = 	"Hailstorm Rod", chance = 3130},
	{name = "Spellbook", chance = 2810},
	{name = "Spellbook of Warding", chance = 2250},
	{name = "	Springsprout Rod", chance = 1930},
	{name = "Human Teeth", chance = 008},
    {name = "Gold Ring", chance = 0720},
    {name = "Butterfly Ring", chance = 0640}
}

monster.attacks = {
	---?
}

monster.defenses = {
	defense = 40,
	armor = 41
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 99},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -101},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 99}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
