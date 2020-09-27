local mType = Game.createMonsterType("Foreshock")
local monster = {}

monster.description = "Foreshock"
monster.experience = 20000
monster.outfit = {
	lookType = 875,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 105000
monster.maxHealth = 105000
monster.race = "venom"
monster.corpse = 0
monster.speed = 380
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 3000,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.events = {
	"ShocksDeath",
	"ForeshockTransform"
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
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -800, type = COMBAT_ENERGY, length = 10, spread = 3, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -400, maxDamage = -1000, type = COMBAT_PHYSICAL, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -600, type = COMBAT_PHYSICAL, length = 10, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -800, type = COMBAT_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -150, maxDamage = -300, type = COMBAT_PHYSICAL, length = 2, spread = 0, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 40, target = false}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 15, minDamage = 300, maxDamage = 600, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
