local internalNpcName = "Gelidrazah'S Thirst"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 100000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookTypeex = 10948,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	local player = Player(creature)

	if msgcontains(message, "yes") and npcHandler.topic[playerId] == 0 then
			npcHandler:say({
				"There are three questions. First: What is the name of the princess who fell in love with a Thaian nobleman during the regency of pharaoh Uthemath? Second: Who is the author of the book ,The Language of the Wolves'? ...",
				"Third: Which ancient Tibian race reportedly travelled the sky in cloud ships? Can you answer these questions?"
			}, npc, creature)
			npcHandler.topic[playerId] = 1
	elseif msgcontains(message, "yes") and npcHandler.topic[playerId] == 1 then
		npcHandler:say("So I ask you: What is the name of the princess who fell in love with a Thaian nobleman during the regency of pharaoh Uthemath?", npc, creature)
		npcHandler.topic[playerId] = 2
	elseif msgcontains(message, "Tahmehe") and npcHandler.topic[playerId] == 2 then
		npcHandler:say("That's right. Listen to the second question: Who is the author of the book ,The Language of the Wolves'?", npc, creature)
		npcHandler.topic[playerId] = 3
	elseif msgcontains(message, "Ishara") and npcHandler.topic[playerId] == 3 then
		npcHandler:say("That's right. Listen to the third question: Which ancient Tibian race reportedly travelled the sky in cloud ships?", npc, creature)
		npcHandler.topic[playerId] = 4
	 elseif msgcontains(message, "Svir") and npcHandler.topic[playerId] == 4 then
		npcHandler:say("That is correct. You satisfactorily answered all questions. You may pass and enter Gelidrazah's lair.", npc, creature)
		npcHandler.topic[playerId] = 0
		player:setStorageValue(Storage.FirstDragon.GelidrazahAccess, 1)
	else
		npcHandler:say('I don\'t know what you are talking about.', npc, creature)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Have you come to answer Gelidrazah's questions?")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
