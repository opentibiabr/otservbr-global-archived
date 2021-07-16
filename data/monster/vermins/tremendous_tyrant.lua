local mType = Game.createMonsterType("Tremendous Tyrant")
local monster = {}

monster.description = "You see a tremendous tyrant."
monster.experience = 6100
monster.outfit = {
	lookType = 1396,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 1545
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Dwelling of the Forgotten."
}

monster.health = 11500
monster.maxHealth = 11500
monster.race = "blood"
monster.corpse = 41536
monster.speed = 115
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 10000,
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
	staticAttackChance = 90,
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

monster.loot = {
	{name = "Platinum Coin ", chance = 0},
	{name = "Red Gem", chance = 0}, ---??? all
	{name = "Gold Ingot ", chance = 0},
	{name = "Blue Crystal Shard ", chance = 0},
	{name = "Lightning Legs ", chance = 0},
	{name = "Hailstorm Rod", chance = 0},
	{name = "Knight Axe ", chance = 0},
	{name = "Spellbook of Warding ", chance = 0},
	{name = "Tremendous Tyrant Head ", chance = 0},
	{name = "Violet Crystal Shard ", chance = 0},
	{name = "Glacier Robe ", chance = 0},
	{name = "Wand of Cosmic Energy ", chance = 0},
	{name = "Dragonbone Staff ", chance = 0},
	{name = "Wand of Starstorm ", chance = 0},
	{name = "Tremendous Tyrant Shell", chance = 0},
	{name = "Green Crystal Shard ", chance = 0},
	{name = "Yellow Gem  ", chance = 0},
	{name = "Elven Amulet  ", chance = 0},
	{name = "Ice Rapier  ", chance = 0},
	{name = "Focus Cape", chance = 0},
	{name = "Warrior's Shield ", chance = 0}
}

monster.attacks = {

    --?

}

monster.defenses = {
	defense = 5,
	armor = 71
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 99},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -101},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 99},
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
