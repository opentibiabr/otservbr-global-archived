local asking = {
	[1] = {msg = "You appear like a worm among men!"},
	[2] = {msg = "The world will suffer for its iddle laziness!"},
	[3] = {msg = "People fall at my feet when they see me coming!"},
	[4] = {msg = "This will be the end of mortal man!"},
	[5] = {msg = "I will remove you from this plane of existence!"},
	[6] = {msg = "Dragons will soon rule this world, I am their herald!"},
	[7] = {msg = "The true virtue of chivalry are my belief!"},
	[8] = {msg = "I lead the most honourable and formidable following of knights!"},
	[9] = {msg = "ULTAH SALID'AR, ESDO LO!"},
}

local responses = {
	[1] = {msg = "How appropriate, you look like something worms already got the better of!"},
	[2] = {msg = "Are you ever going to fight or do you prefer talking!"},
	[3] = {msg = "Even before they smell your breath?"},
	[4] = {msg = "Then let me show you the concept of mortality before it!"},
	[5] = {msg = "Too bad you barely exist at all!"},
	[6] = {msg = "Excuse me but I still do not get the message!"},
	[7] = {msg = "Dare strike up a Minnesang and you will receive your last accolade!"},
	[8] = {msg = "Then why are we fighting alone right now?"},
	[9] = {msg = "SEHWO ASIMO, TOLIDO ESD!"},
}

local config = {
	storage = {
		asking = 1,
		life = 2,
		exhaust = 3,
	},
	monster = {
		"Falcon Knight",
		"Falcon Paladin"
	},
	amount_life = 3
}

local function heal(monster)
	local storage = monster:getStorageValue(config.storage.life)
	monster:setStorageValue(config.storage.life, storage + 1)
	monster:addHealth(monster:getMaxHealth())

end

local function sendAsking(monster)
	monster:registerEvent('OberonImmunity')
	local random = math.random(#asking)
	monster:say(asking[random].msg, TALKTYPE_MONSTER_SAY)
	monster:setStorageValue(config.storage.asking, random)
	heal(monster)
	Game.createMonster(config.monster[math.random(#config.monster)], monster:getPosition(), true, true)
end

local immunity = CreatureEvent("OberonImmunity")

function immunity.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if creature:isMonster() then
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	end
	return true
end

immunity:register()

local mType = Game.createMonsterType("Grand Master Oberon")
local monster = {}

monster.description = "Grand Master Oberon"
monster.experience = 20000
monster.outfit = {
	lookType = 1072,
	lookHead = 57,
	lookBody = 75,
	lookLegs = 38,
	lookFeet = 86,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 33368
monster.speed = 230
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
}

monster.loot = {
	{id = 2230, chance = 30000, maxCount = 1}, --comum
	{id = "brass shield", chance = 30000, maxCount = 1}, --comum
	{id = "spatial warp almanac", chance = 25000, maxCount = 1}, --comum
	{id = "viking helmet", chance = 23000, maxCount = 1}, --comum
	{id = "Falcon Battleaxe", chance = 500, maxCount = 1}, --semiraro
	{id = "Falcon Longsword", chance = 500, maxCount = 1},--semiraro
	{id = "Falcon Mace", chance = 500, maxCount = 1},--semiraro
	{id = "Grant of Arms", chance = 500, maxCount = 1},--semiraro
	{id = "Falcon Bow", chance = 350, maxCount = 1},--raro
	{id = "Falcon Circlet", chance = 350, maxCount = 1},--raro
	{id = "Falcon Coif", chance = 350, maxCount = 1},--raro
	{id = "Falcon Rod", chance = 350, maxCount = 1},--raro
	{id = "Falcon wand", chance = 350, maxCount = 1},--raro
	{id = "Falcon Shield", chance = 200, maxCount = 1},--muito raro
	{id = "Falcon Greaves", chance = 200, maxCount = 1},--muito raro
	{id = "Falcon Plate", chance = 200, maxCount = 1},--muito raro
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1200},
	{name ="combat", interval = 6000, chance = 80, type = COMBAT_HOLYDAMAGE, minDamage = -1000, maxDamage = -2250, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -820, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -860, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 82,
	{name ="speed", interval = 1000, chance = 10, speedChange = 180, effect = CONST_ME_POFF, target = false, duration = 4000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 5},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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