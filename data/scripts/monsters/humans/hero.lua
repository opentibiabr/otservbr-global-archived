local mType = Game.createMonsterType("Hero")
local monster = {}

monster.description = "a hero"
monster.experience = 1200
monster.outfit = {
	lookType = 73,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1400
monster.maxHealth = 1400
monster.race = "blood"
monster.corpse = 20415
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Let's have a fight!", yell = false},
	{text = "Welcome to my battleground!", yell = false},
	{text = "Have you seen princess Lumelia?", yell = false},
	{text = "I will sing a tune at your grave.", yell = false}
}

monster.loot = {
	{id = 1949, chance = 45000},
	{id = 2071, chance = 1640},
	{id = "piggy bank", chance = 80},
	{id = 2120, chance = 2190},
	{id = "wedding ring", chance = 4910},
	{id = "gold coin", chance = 59500, maxCount = 100},
	{id = "might ring", chance = 470},
	{id = "two handed sword", chance = 1500},
	{id = "war hammer", chance = 870},
	{id = "fire sword", chance = 550},
	{id = "bow", chance = 13300},
	{id = "crown armor", chance = 490},
	{id = "crown legs", chance = 660},
	{id = "crown helmet", chance = 450},
	{id = "crown shield", chance = 280},
	{id = "arrow", chance = 26000, maxCount = 13},
	{id = "green tunic", chance = 8000},
	{id = "scarf", chance = 1110},
	{id = "meat", chance = 8200, maxCount = 3},
	{id = "grapes", chance = 19850},
	{id = "red rose", chance = 20450},
	{id = "red piece of cloth", chance = 2006},
	{id = "sniper arrow", chance = 11400, maxCount = 4},
	{id = "great health potion", chance = 720},
	{id = "small notebook", chance = 930},
	{id = "scroll of heroic deeds", chance = 5000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -120, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_ARROW, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 20, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
