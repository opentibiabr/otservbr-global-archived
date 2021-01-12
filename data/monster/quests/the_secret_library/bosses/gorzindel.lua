local mType = Game.createMonsterType("Gorzindel")
local monster = {}

monster.description = "Gorzindel"
monster.experience = 100000
monster.outfit = {
	lookType = 1062,
	lookHead = 94,
	lookBody = 100,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 300000
monster.maxHealth = 300000
monster.race = "blood"
monster.corpse = 25151
monster.speed = 230
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4
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
	rewardBoss = true,
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
	{text = "THE STOLEN POWERS HEAL GORZINDEL!", yell = false},
	{text = "GORZINDEL USES THE POWERS OF STOLEN SPELLS!", yell = false},
	{text = "GORZINDEL UNLEASHES THE STOLEN POWERS OF DEATH!", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 90000},
	{id = "crystal coin", chance = 90000, maxCount = 8},
	{id = "small amethyst", chance = 90000, maxCount = 12},
	{id = "small diamond", chance = 90000, maxCount = 12},
	{id = "small emerald", chance = 90000, maxCount = 12},
	{id = "small ruby", chance = 90000, maxCount = 12},
	{id = "small topaz", chance = 90000, maxCount = 12},
	{id = "onyx chip", chance = 90000, maxCount = 12},
	{id = "great spirit potion", chance = 90000, maxCount = 8},
	{id = "supreme health potion", chance = 90000, maxCount = 12},
	{id = "Ultimate health potion", chance = 90000, maxCount = 18},
	{id = "Ultimate mana potion", chance = 90000, maxCount = 8},
	{id = "Ultimate spirit potion", chance = 90000, maxCount = 12},
	{id = "berserk potion", chance = 90000, maxCount = 2},
	{id = "bullseye potion", chance = 90000, maxCount = 2},
	{id = "mastermind potion", chance = 90000, maxCount = 2},
	{id = "chaos mace", chance = 30000},
	{id = "crown armor", chance = 30000},
	{id = "curious matter", chance = 30000},
	{id = "demon horn", chance = 30000},
	{id = "dreaded cleaver", chance = 30000},
	{id = 7632, chance = 30000},
	{id = "gold token", chance = 1000, maxCount = 6},
	{id = "green gem", chance = 1000},
	{id = "knowledgeable book", chance = 1000},
	{id = "ominous book", chance = 1000},
	{id = "magic sulphur", chance = 1000, maxCount = 2},
	{id = "muck rod", chance = 1000},
	{id = "red gem", chance = 1000},
	{id = 9820, chance = 1000},
	{id = 9814, chance = 1000},
	{id = "silver Token", chance = 1000, maxCount = 6},
	{id = "sinister book", chance = 1000},
	{id = "spellbook of warding", chance = 1000},
	{id = "steel boots", chance = 1000},
	{id = "stone skin amulet", chance = 1000},
	{id = "wand of cosmic Energy", chance = 1000},
	{id = "yellow gem", chance = 1000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 100},
	{name ="melee", interval = 2000, chance = 15, minDamage = -600, maxDamage = -2800},
	{name ="melee", interval = 1000, chance = 15, minDamage = -800, maxDamage = -1300},
	{name ="melee", interval = 1000, chance = 15, minDamage = -800, maxDamage = -1000},
	{name ="melee", interval = 1000, chance = 15, minDamage = -200, maxDamage = -800},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -600, radius = 9, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 33,
	armor = 28
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
