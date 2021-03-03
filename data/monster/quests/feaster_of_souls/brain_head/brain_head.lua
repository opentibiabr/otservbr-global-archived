local mType = Game.createMonsterType("Brain Head")
local monster = {}

monster.description = "Brain Head"
monster.experience = 35000
monster.outfit = {
	lookTypeEx = 37253,
}

monster.health = 45000
monster.maxHealth = 45000
monster.race = "undead"
monster.corpse = 37107
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.events = {
	"healFireDamage",
	"healEnergyDamage"
}

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
	{name = "crystal coin", chance = 62500, maxCount = 2},
	{name = "white gem", chance = 45833, maxCount = 2},
	{name = "supreme health potion", chance = 41667, maxCount = 6},
	{name = "diamond", chance = 33333},
	{name = "berserk potion", chance = 12500, maxCount = 10},
	{name = "bullseye potion", chance = 12500, maxCount = 10},
	{name = "death toll", chance = 12500},
	{name = "mastermind potion", chance = 12500, maxCount = 10},
	{name = "moonstone", chance = 12500},
	{name = "ultimate mana potion", chance = 12500, maxCount = 6},
	{name = "ultimate spirit potion", chance = 12500, maxCount = 6},
	{name = "cursed bone", chance = 8333},
	{name = "ivory comb", chance = 8333},
	{name = "angel figurine", chance = 4167},
	{name = "ghost claw", chance = 4167},
	{name = "giant amethyst", chance = 4167},
	{name = "giant topaz", chance = 4167},
	{name = "brain head's giant neuron", chance = 3000},
	{name = "brain head's left hemisphere", chance = 3000},
	{name = "brain head's right hemisphere", chance = 3000},
	{id = 37456, chance = 1500},
	{name = "ghost claw", chance = 300},
	{name = "phantasmal axe", chance = 150},
	
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -500},
	{name ="Energy Wave", interval = 2000, chance = 20, minDamage = -500, maxDamage = -680, target = false},
	{name ="energyberserk", interval = 2000, chance = 20, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -600, maxDamage = -750, radius = 5, range = 7, effect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE, target = true},
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="summonsbrainhead", interval = 8000, chance = 100, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
