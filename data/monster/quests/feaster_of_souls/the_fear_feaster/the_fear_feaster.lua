local mType = Game.createMonsterType("The Fear Feaster")
local monster = {}

monster.description = "The Fear Feaster"
monster.experience = 60000
monster.outfit = {
	lookType = 1276,
}

monster.events = {
	"healDeathDamage",
}

monster.health = 80000
monster.maxHealth = 80000
monster.race = "undead"
monster.corpse = 37572
monster.speed = 380
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
	{name = "crystal coin", chance = 96429, maxCount = 2},
	{name = "moonstone", chance = 51786, maxCount = 2},
	{name = "white gem", chance = 51786, maxCount = 2},
	{name = "ultimate mana potion", chance = 42857, maxCount = 6},
	{name = "silver hand mirror", chance = 26786},
	{name = "supreme health potion", chance = 26786, maxCount = 6},
	{name = "ultimate spirit potion", chance = 26786, maxCount = 6},
	{name = "berserk potion", chance = 25000, maxCount = 10},
	{name = "bullseye potion", chance = 19643, maxCount = 10},
	{name = "mastermind potion", chance = 19643, maxCount = 10},
	{name = "ivory comb", chance = 14286},
	{name = "death toll", chance = 12500, maxCount = 2},
	{name = "angel figurine", chance = 10714},
	{name = "diamond", chance = 10714},
	{name = "cursed bone", chance = 8929},
	{name = "soulforged lantern", chance = 7143},
	{name = "amber", chance = 5357},
	{name = "grimace", chance = 5357},
	{name = "amber with a dragonfly", chance = 3571, maxCount = 2},
	{name = "ghost claw", chance = 300},
	{name = "spooky hood", chance = 300},
	{name = "ghost chestplate", chance = 150},
	{name = "giant amethyst", chance = 1786}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 20, radius = 2, minDamage = -500, maxDamage = -600, target = false},
	{name ="deathring1x1", interval = 2000, chance = 20, minDamage = -500, maxDamage = -600, target = false},
	{name ="deathring2x2", interval = 2000, chance = 20, minDamage = -500, maxDamage = -600, target = false},
	{name ="deathring3x3", interval = 2000, chance = 20, minDamage = -500, maxDamage = -600, target = false},
}

monster.defenses = {
	defense = 40,
	armor = 82,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 25},
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
