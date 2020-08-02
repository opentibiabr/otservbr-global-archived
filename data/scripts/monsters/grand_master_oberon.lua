local mType = Game.createMonsterType("Grand Master Oberon")
local immunity = CreatureEvent("OberonImmunity")
local monster = {}
monster.description = "an grand master oberon"
monster.experience = 1
monster.outfit = {
	lookType = 1072
}
condition:setOutfit(lookTypeEx, lookType, lookHead, lookBody, lookLegs, lookFeet, lookAddons, lookMount)

monster.health = 99200
monster.maxHealth = monster.health
monster.race = "fire"
monster.corpse = 5995
monster.speed = 280
monster.maxSummons = 2

monster.changeTarget = {
	interval = 4*1000,
	chance = 20
}

monster.flags = {
	summonable = false,
	attackable = true,
	rewardboss = false,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	preyable = false,
	targetDistance = 1,
	staticAttackChance = 70,
	respawnType = RESPAWN_IN_ALL
}

monster.summons = {
	-- {name = "demon", chance = 10, interval = 2*1000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I'm an example", yell = false},
	{text = "You shall bow", yell = false},
}

monster.loot = {
	{id = "gold coin", chance = 60000, maxCount = 100},
	{id = "bag", chance = 60000,
		child = {
			{id = "platin coin", chance = 60000, maxCount = 100},
			{id = "crystal coin", chance = 60000, maxCount = 100}
		}
	}
}

monster.attacks = {
	{name = "melee", attack = 130, skill = 70, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "energy strike", range = 1, chance = 10, interval = 2*1000, minDamage = -210, maxDamage = -300, target = true},
	{name = "combat", type = COMBAT_MANADRAIN, chance = 10, interval = 2*1000, minDamage = 0, maxDamage = -120, target = true, range = 7, effect = CONST_ME_MAGIC_BLUE},
	{name = "combat", type = COMBAT_FIREDAMAGE, chance = 20, interval = 2*1000, minDamage = -150, maxDamage = -250, radius = 1, target = true, effect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE},
	{name = "speed", chance = 15, interval = 2*1000, speed = -700, radius = 1, target = true, duration = 30*1000, effect = CONST_ME_MAGIC_RED},
	{name = "firefield", chance = 10, interval = 2*1000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name = "combat", type = COMBAT_LIFEDRAIN, chance = 10, interval = 2*1000, length = 8, spread = 0, minDamage = -300, maxDamage = -490, effect = CONST_ME_PURPLEENERGY}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 180, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE},
	{name = "speed", chance = 15, interval = 2*1000, speed = 320, effect = CONST_ME_MAGIC_RED}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_DEATHDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE, percent = -10}
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "drown", condition = true},
	{type = "lifedrain", combat = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true}
}

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

mType.onThink = function(monster, interval)
	if monster:getStorageValue(config.storage.life) <= config.amount_life then
		local percentageHealth = (monster:getHealth()*100)/monster:getMaxHealth()
		if percentageHealth <= 20 then
			sendAsking(monster)
		end
	end
end

mType.onAppear = function(monster, creature)
	if monster:getId() == creature:getId() then
		monster:setStorageValue(config.storage.asking, 1)
		monster:setStorageValue(config.storage.life, 1)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
	if creature:isPlayer() then
		message = message:lower()
		for i, v in pairs(responses) do
			if message == v.msg:lower() then
				local asking_storage = monster:getStorageValue(config.storage.asking)
				if asking[i].msg:lower() == asking[asking_storage].msg:lower() then
					monster:unregisterEvent('OberonImmunity')
				end
			end
		end
	end
end

function immunity.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if creature:isMonster() then
		creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		return false
	end
	return true
end

mType:register(monster)
immunity:register()
