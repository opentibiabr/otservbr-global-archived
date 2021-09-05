local internalNpcName = "Siestaar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 288,
	lookHead = 129,
	lookBody = 128,
	lookLegs = 72,
	lookFeet = 94,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = "Don't forget to deposit your money here in the Tibian Bank before you head out for adventure.", yell = false }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, msg)
	if not npcHandler:isFocused(creature) then
		return false
	end

	-- Parse bank
	npc:parseBank(msg, npc, creature, npcHandler)
	-- Parse guild bank
	npc:parseGuildBank(msg, npc, creature, npcHandler)
	-- Normal messages
	npc:parseBankMessages(msg, npc, creature, npcHandler)
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Yes? What may I do for you, |PLAYERNAME|? Bank business, perhaps?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a nice day.")
npcHandler:setCallback(CALLBACK_GREET, npcBankGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
