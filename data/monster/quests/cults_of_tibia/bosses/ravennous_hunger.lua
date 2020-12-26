local mType = Game.createMonsterType("Ravennous Hunger")
local monster = {}

monster.description = "Ravennous Hunger"
monster.experience = 0
monster.outfit = {
	lookType = 556,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 6324
monster.speed = 280
monster.manaCost = 0
monster.maxSummons = 4

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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.events = {
	"LeidenHeal"
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Mutated Bat", chance = 100, interval = 2000},
	{name = "Mutated Bat", chance = 100, interval = 2000},
	{name = "Mutated Bat", chance = 100, interval = 2000},
	{name = "Mutated Bat", chance = 100, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "SU-*burp* SUFFEEER!", yell = false}
}

monster.loot = {
	{id = "bed of nails", chance = 67000},
	{id = "small sapphire", chance = 21000, maxCount = 10},
	{id = "great spirit potion", chance = 33230, maxCount = 5},
	{id = "yellow gem", chance = 12000},
	{id = 7633, chance = 5000},
	{id = "platinum coin", chance = 68299, maxCount = 30},
	{id = "lightning legs", chance = 18000},
	{id = "sacred tree amulet", chance = 15000},
	{id = "wood cape", chance = 9000},
	{id = "gold token", chance = 1532},
	{id = "gold coin", chance = 100000, maxCount = 200},
	{id = "small emerald", chance = 19000, maxCount = 10},
	{id = "great mana potion", chance = 31230, maxCount = 5},
	{id = "red gem", chance = 12000},
	{id = "oriental shoes", chance = 11000},
	{id = "torn shirt", chance = 42000},
	{id = "fig leaf", chance = 32000},
	{id = "luminous orb", chance = 35000},
	{id = "wooden spellbook", chance = 4500},
	{id = "elven legs", chance = 16000},
	{id = "small diamond", chance = 21000, maxCount = 10},
	{id = "ultimate health potion", chance = 28230, maxCount = 5},
	{id = "energy bar", chance = 53000, maxCount = 5},
	{id = "green gem", chance = 12000},
	{id = "broken key ring", chance = 4000},
	{id = "muck rod", chance = 10000},
	{id = "mysterious remains", chance = 100000},
	{id = "cobra crown", chance = 400},
	{id = "silver token", chance = 2500},
	{id = "elven mail", chance = 3000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -900}
}

monster.defenses = {
	defense = 50,
	armor = 35
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -80}
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
