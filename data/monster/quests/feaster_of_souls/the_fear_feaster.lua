local mType = Game.createMonsterType("The Fear Feaster")
local monster = {}

monster.description = "The Fear Feaster"
monster.experience = 13090
monster.outfit = {
	lookType = 1061,
	lookHead = 79,
	lookBody = 83,
	lookLegs = 113,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "undead"
monster.corpse = 37572
monster.speed = 500
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
	{id = "crystal coin", chance = 96080, maxCount = 2},
	{id = "white gem", chance = 52940, maxCount = 2},
	{id = "moonstone", chance = 52940, maxCount = 2},
	{id = "ultimate mana potion", chance = 43140, maxCount = 6},
	{id = "supreme health potion", chance = 29410, maxCount = 6},
	{id = "silver hand mirror", chance = 27450},
	{id = "berserk potion", chance = 23530, maxCount = 10},
	{id = "ultimate spirit potion", chance = 23530, maxCount = 6},
	{id = "bullseye potion", chance = 19610, maxCount = 10},
	{id = "mastermind potion", chance = 19610, maxCount = 10},
	{id = "death toll", chance = 13730, maxCount = 2},
	{id = "ivory comb", chance = 13730},
	{id = "angel figurine", chance = 11760},
	{id = "diamond", chance = 11760},
	{id = "cursed bone", chance = 7840},
	{id = "soulforged lantern", chance = 7840},
	{id = "grimace", chance = 5880},
	{id = "amber", chance = 5880},
	{id = "amber with a dragonfly", chance = 3920},
	{id = "ghost claw", chance = 1960},
	{id = "bloody tears", chance = 1500},
	{id = "ghost chestplate", chance = 150},
	{id = "spooky hood", chance = 150}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -200},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -680, range = 7, shootEffect = CONST_ANI_EARTHARROW, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -575, length = 5, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -230, maxDamage = -880, range = 7, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
