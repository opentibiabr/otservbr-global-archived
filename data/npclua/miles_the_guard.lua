local internalNpcName = "Miles, The Guard"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 0,
	lookBody = 19,
	lookLegs = 19,
	lookFeet = 19,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "trouble") and npcHandler.topic[playerId] ~= 3 and player:getStorageValue(Storage.TheInquisition.MilesGuard) < 1 and player:getStorageValue(Storage.TheInquisition.Mission01) ~= -1 then
		npcHandler:say("I'm fine. There's no trouble at all.", npc, creature)
		npcHandler.topic[playerId] = 1
	elseif msgcontains(message, "foresight of the authorities") and npcHandler.topic[playerId] == 1 then
		npcHandler:say("Well, of course. We live in safety and peace.", npc, creature)
		npcHandler.topic[playerId] = 2
	elseif msgcontains(message, "also for the gods") and npcHandler.topic[playerId] == 2 then
		npcHandler:say("I think the gods are looking after us and their hands shield us from evil.", npc, creature)
		npcHandler.topic[playerId] = 3
	elseif msgcontains(message, "trouble will arise in the near future") and npcHandler.topic[playerId] == 3 then
		npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", npc, creature)
		npcHandler.topic[playerId] = 0
		if player:getStorageValue(Storage.TheInquisition.MilesGuard) < 1 then
			player:setStorageValue(Storage.TheInquisition.MilesGuard, 1)
			player:setStorageValue(Storage.TheInquisition.Mission01, player:getStorageValue(Storage.TheInquisition.Mission01) + 1) -- The Inquisition Questlog- "Mission 1: Interrogation"
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "It's my duty to protect the city."})

npcHandler:setMessage(MESSAGE_GREET, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE KING!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
