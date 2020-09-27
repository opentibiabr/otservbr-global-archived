local mType = Game.createMonsterType("Rift Invader")
local monster = {}

monster.description = "a rift invader"
monster.experience = 6000
monster.outfit = {
	lookType = 290,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8200
monster.maxHealth = 8200
monster.race = "venom"
monster.corpse = 0
monster.speed = 256
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.events = {"RiftInvaderDeath"}

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
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, skill = 70, attack = 130, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 33, minDamage = -450, maxDamage = -550, type = COMBAT_ENERGYDAMAGE, range = 7, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 7, minDamage = -210, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, range = 1, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 14, minDamage = -200, maxDamage = -300, type = COMBAT_DEATHDAMAGE, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -480, type = COMBAT_MANADRAIN, target = true}
}

monster.defenses = {
	defense = 65,
	armor = 40,
	{name ="combat", interval = 2000, chance = 14, minDamage = 150, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = 388, Duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
