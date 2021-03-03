local mType = Game.createMonsterType("The Dread Maiden")
local monster = {}

monster.description = "The Dread Maiden"
monster.experience = 80000
monster.outfit = {
	lookType = 1278,
}

monster.events = {
	"theDreadMaidenHealth",
}

monster.health = 120000
monster.maxHealth = 120000
monster.race = "undead"
monster.corpse = 37580
monster.speed = 256
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
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 2},
	{name = "ultimate spirit potion", chance = 44444, maxCount = 6},
	{name = "white gem", chance = 43056, maxCount = 2},
	{name = "moonstone", chance = 41667, maxCount = 2},
	{name = "diamond", chance = 38889},
	{name = "supreme health potion", chance = 34722, maxCount = 6},
	{name = "bullseye potion", chance = 23611, maxCount = 10},
	{name = "berserk potion", chance = 22222, maxCount = 10},
	{name = "ultimate mana potion", chance = 20833, maxCount = 6},
	{name = "mastermind potion", chance = 19444, maxCount = 10},
	{name = "ivory comb", chance = 18056},
	{name = "death toll", chance = 13889, maxCount = 2},
	{name = "silver hand mirror", chance = 13889},
	{name = "soulforged lantern", chance = 11111},
	{name = "amber", chance = 6944},
	{name = "angel figurine", chance = 6944},
	{name = "cursed bone", chance = 5556},
	{name = "giant amethyst", chance = 5556},
	{name = "jagged sickle", chance = 5556},
	{name = "amber with a dragonfly", chance = 4167},
	{name = "amber with a bug", chance = 2778},
	{id = 37431, chance = 1389},
	{name = "giant topaz", chance = 1389},
	{name = "pair of nightmare boots", chance = 150},
	{name = "spooky hood", chance = 300},
	{name = "ghost claw", chance = 300},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -1200, maxDamage = -1500, length = 6, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -750, radius = 5, range = 7, effect = CONST_ME_SMALLCLOUDS, shootEffect = CONST_ANI_SUDDENDEATH, target = true},
	{name ="maidenring", interval = 2000, chance = 30, minDamage = -500, maxDamage = -600, target = false},
}

monster.defenses = {
	defense = 40,
	armor = 82,
	{name ="summonsthedreadmaiden", interval = 8000, chance = 100, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 35},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = -200}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
