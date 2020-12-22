local mType = Game.createMonsterType("Lost Berserker")
local monster = {}

monster.description = "a lost berserker"
monster.experience = 4400
monster.outfit = {
	lookType = 496,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 888
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Warzones 2 and 3."
		}

monster.health = 5900
monster.maxHealth = 5900
monster.race = "blood"
monster.corpse = 17416
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
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
	canWalkOnEnergy = false,
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
	{text = "Kill! Kiill! Kill!", yell = false},
	{text = "Death! Death! Death!", yell = false}
}

monster.loot = {
	{id = "piggy bank", chance = 3920},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "platinum coin", chance = 100000, maxCount = 9},
	{id = "dwarven ring", chance = 2280},
	{id = "knight axe", chance = 2070},
	{id = "fire axe", chance = 380},
	{id = "royal helmet", chance = 150},
	{id = "guardian shield", chance = 1400},
	{id = "tower shield", chance = 1002},
	{id = "black shield", chance = 640},
	{id = "brown mushroom", chance = 15190, maxCount = 2},
	{id = "iron ore", chance = 8490},
	{id = "magic sulphur", chance = 720},
	{id = "chaos mace", chance = 550},
	{id = "spiked squelcher", chance = 810},
	{id = "great mana potion", chance = 13650},
	{id = "great health potion", chance = 13650},
	{id = "terra boots", chance = 640},
	{id = "small topaz", chance = 7970, maxCount = 2},
	{id = "clay lump", chance = 930},
	{id = 13757, chance = 2050},
	{id = "violet crystal shard", chance = 3500},
	{id = "brown crystal splinter", chance = 7540, maxCount = 2},
	{id = "blue crystal splinter", chance = 4610},
	{id = "green crystal fragment", chance = 6870},
	{id = "drill bolt", chance = 8210, maxCount = 10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -501},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -300, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -250, range = 7, radius = 3, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -150, maxDamage = -250, radius = 5, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="speed", interval = 2000, chance = 10, speedChange = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000},
	{name ="drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_STUN, target = true, duration = 6000}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="invisible", interval = 2000, chance = 5, effect = CONST_ME_TELEPORT}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
