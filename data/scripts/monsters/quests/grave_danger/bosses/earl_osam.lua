local mType = Game.createMonsterType("Earl Osam")
local monster = {}

monster.description = "Earl Osam"
monster.experience = 6300
monster.outfit = {
	lookType = 1223,
	lookHead = 95,
	lookBody = 38,
	lookLegs = 60,
	lookFeet = 76,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = monster.health
monster.race = "venom"
monster.corpse = 36434
monster.speed = 250
monster.maxSummons = 5

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
	{id = "Silver Token", minCount = 2, maxCount = 4, chance = 100000},
	{id = "Great Spirit Potion", minCount = 6, maxCount = 20, chance = 59380},
	{id = "Great Mana Potion", minCount = 6, maxCount = 20, chance = 37500},
	{id = "Supreme Health Potion", minCount = 6, maxCount = 20, chance = 75000},
	{id = "Yellow Gem", chance = 28130},
	{id = "Red Gem", minCount = 1, maxCount = 2, chance = 37500},
	{id = "Green Gem", chance = 37500},
	{id = "Berserk Potion", minCount = 10, maxCount = 10, chance = 34380},
	{id = "Warrior Helmet", chance = 21880},
	{id = "Bullseye Potion", minCount = 10, maxCount = 10, chance = 9380},
	{id = "Glacier Mask", chance = 12500},
	{id = "Blue Gem", chance = 9380},
	{id = "Mastermind Potion", minCount = 10, maxCount = 10, chance = 12500},
	{id = "Piece of Hell Steel", chance = 21880},
	{id = "Piece of Draconian Steel", chance = 21880},
	{id = "Guardian Axe", chance = 12500},
	{id = "Rotten Heart", chance = 9380},
	{id = "Ancient Lich Bone", chance = 6250},
	{id = "Giant Sapphire", chance = 6450},
	{id = "Giant Emerald", chance = 6250},
	{id = "Crystal Coin", minCount = 1, maxCount = 2, chance = 21880},
	{id = "Young Lich Worm", chance = 9380},
	{id = "Embrace of Nature", chance = 3130},
	{id = "Terra Helmet", chance = 3130},
	{id = "Violet Gem", chance = 3130},
	{id = "Gold Ingot", chance = 3130},
	{id = "Final Judgement", chance = 150},
	{id = 26200, chance = 15630},-- collar of red plasma
	{id = 26189, chance = 3130},-- ring of red plasma
	{id = 26199, chance = 6250},-- collar of green plasma
	{id = 26187, chance = 9380},-- ring of green plasma
	{id = 26182, chance = 18750},-- collar of blue plasma
	{id = 26186, chance = 3130},-- ring of blue plasma
}

monster.summons = {
	{name = "Frozen Soul", chance = 20, interval = 2000},
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_ICEDAMAGE, interval = 2*1000, chance = 15, length = 8, spread = 0, minDamage = -400, maxDamage = -1000, effect = CONST_ME_ICEATTACK},
	{name = "combat", type = COMBAT_EARTHDAMAGE, interval = 2*1000, chance = 10, length = 8, spread = 3, minDamage = -400, maxDamage = -1000, effect = CONST_ME_GREEN_RINGS},
}

monster.defenses = {
	defense = 78,
	armor = 78,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 350, maxDamage = 550, effect = CONST_ME_MAGIC_BLUE},
}

monster.elements = {
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
}

monster.immunities = {
	{type = "earth", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I ... will ... rise ... again!", yell = false},
	{text = "I... will ... get ... you ... all!", yell = false},
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
