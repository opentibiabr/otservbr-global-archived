local mType = Game.createMonsterType("The Unwelcome")
local monster = {}

monster.description = "The Unwelcome"
monster.experience = 80000
monster.outfit = {
	lookType = 1277,
}

monster.events = {
	"wormShareHealth",
}

monster.health = 120000
monster.maxHealth = 120000
monster.race = "undead"
monster.corpse = 37576
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
	{name = "diamond", chance = 57534, maxCount = 2},
	{name = "moonstone", chance = 54795, maxCount = 2},
	{name = "supreme health potion", chance = 35616, maxCount = 6},
	{name = "ultimate mana potion", chance = 32877, maxCount = 6},
	{name = "ultimate spirit potion", chance = 31507, maxCount = 6},
	{name = "bullseye potion", chance = 24658, maxCount = 10},
	{name = "mastermind potion", chance = 24658, maxCount = 10},
	{name = "berserk potion", chance = 16438, maxCount = 10},
	{name = "angel figurine", chance = 13699},
	{name = "cursed bone", chance = 12329},
	{name = "ivory comb", chance = 12329},
	{name = "silver hand mirror", chance = 9589},
	{name = "soulforged lantern", chance = 9589},
	{name = "white gem", chance = 9589},
	{name = "death toll", chance = 8219, maxCount = 2},
	{name = "writhing heart", chance = 6849},
	{name = "giant topaz", chance = 5479},
	{name = "spooky hood", chance = 5479},
	{name = "amber with a dragonfly", chance = 4110},
	{name = "giant amethyst", chance = 4110},
	{name = "amber", chance = 1370},
	{name = "amber with a bug", chance = 1370},
	{name = "writhing brain", chance = 800},
	{name = "fabulous legs", chance = 150},
	{name = "soulful legs", chance = 150},
	{name = "spooky hood", chance = 300},	
	{name = "ghost claw", chance = 300},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000},
	{name ="lifesteal", interval = 2000, chance = 15, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -600, maxDamage = -750, radius = 5, range = 7, effect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -500, radius = 5, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -750, length = 5, effect = CONST_ME_HITBYPOISON, target = false},
}

monster.defenses = {
	defense = 40,
	armor = 82,
	{name ="summonstheunwelcome", interval = 8000, chance = 100, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 95},
	{type = COMBAT_ENERGYDAMAGE, percent = 95},
	{type = COMBAT_EARTHDAMAGE, percent = 95},
	{type = COMBAT_FIREDAMAGE, percent = 95},
	{type = COMBAT_LIFEDRAIN, percent = 95},
	{type = COMBAT_MANADRAIN, percent = 95},
	{type = COMBAT_DROWNDAMAGE, percent = 95},
	{type = COMBAT_ICEDAMAGE, percent = 95},
	{type = COMBAT_HOLYDAMAGE , percent = 95},
	{type = COMBAT_DEATHDAMAGE , percent = -100}
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
