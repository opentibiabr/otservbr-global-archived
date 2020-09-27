local mType = Game.createMonsterType("Count Vlarkorth")
local monster = {}

monster.description = "Count Vlarkorth"
monster.experience = 6300
monster.outfit = {
	lookType = 1221,
	lookHead = 10,
	lookBody = 19,
	lookLegs = 19,
	lookFeet = 19,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = monster.health
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.maxSummons = 6

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	respawnType = RESPAWN_IN_ALL
}

monster.loot = {
	{id = "Platinum Coin", minCount = 5, maxCount = 5, chance = 100000},
	{id = "Silver Token", minCount = 2, maxCount = 2, chance = 100000},
	{id = "Great Spirit Potion", minCount = 6, maxCount = 20, chance = 64520},
	{id = "Great Mana Potion", minCount = 6, maxCount = 20, chance = 58060},
	{id = "Supreme Health Potion", minCount = 6, maxCount = 20, chance = 48390},
	{id = "Yellow Gem", minCount = 1, maxCount = 2, chance = 48390},
	{id = "Red Gem", chance = 35480},
	{id = "Green Gem", chance = 25810},
	{id = "Berserk Potion", minCount = 10, maxCount = 10, chance = 22580},
	{id = "Skull Staff", chance = 22580},
	{id = "Bullseye Potion", minCount = 10, maxCount = 10, chance = 19350},
	{id = "Knight Legs", chance = 19350},
	{id = "Blue Gem", chance = 19350},
	{id = "Mastermind Potion", minCount = 10, maxCount = 10, chance = 16130},
	{id = "Magic Sulphur", chance = 12900},
	{id = "Violet Gem", chance = 9680},
	{id = "Magma Boots", chance = 9680},
	{id = "Rotten Heart", chance = 9680},
	{id = "Medal of Valiance", chance = 6450},
	{id = "Giant Sapphire", chance = 6450},
	{id = "Crystal Coin", chance = 3230},
	{id = "Young Lich Worm", chance = 3230},
	{id = "Bear Skin", chance = 3230},
	{id = 26200, chance = 6450},-- collar of red plasma
	{id = 26189, chance = 16130},-- ring of red plasma
	{id = 26199, chance = 6450},-- collar of green plasma
	{id = 26187, chance = 3230},-- ring of green plasma
	{id = 26182, chance = 3230},-- collar of blue plasma
	{id = 26186, chance = 12900},-- ring of blue plasma
}

monster.summons = {
	{name = "Soulless Minion", chance = 70, interval = 1800},
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_FIREDAMAGE, interval = 2*1000, chance = 15, length = 8, spread = 0, minDamage = -500, maxDamage = -1500, effect = CONST_ME_HITBYFIRE},
	{name = "combat", type = COMBAT_LIFEDRAIN, interval = 2*1000, chance = 10, length = 8, spread = 3, minDamage = -1000, maxDamage = -2200, effect = CONST_ME_SMALLCLOUDS},
}

monster.defenses = {
	defense = 78,
	armor = 78,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 150, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE},
}

monster.elements = {
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_DEATHDAMAGE, percent = 10},
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You should have brought more friends!", yell = false},
	{text = "Have at thee, cowards!", yell = false},
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
