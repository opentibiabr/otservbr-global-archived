local internalNpcName = "Peter"
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
	lookHead = 58,
	lookBody = 43,
	lookLegs = 38,
	lookFeet = 76,
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
	if(msgcontains(message, "report")) then
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) == 7 or player:getStorageValue(Storage.InServiceofYalahar.Questline) == 13) then
			npcHandler:say("A report? What do they think is happening here? <gives an angry and bitter report>. ", npc, creature)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, player:getStorageValue(Storage.InServiceofYalahar.Questline) + 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission02, player:getStorageValue(Storage.InServiceofYalahar.Mission02) + 1) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			npcHandler.topic[playerId] = 0
		end
	elseif(msgcontains(message, "pass")) then
		npcHandler:say("You can {pass} either to the {Factory Quarter} or {Trade Quarter}. Which one will it be?", npc, creature)
		npcHandler.topic[playerId] = 1
	elseif(msgcontains(message, "factory")) then
		if(npcHandler.topic[playerId] == 1) then
			local destination = Position(32859, 31302, 7)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[playerId] = 0
		end
	elseif(msgcontains(message, "trade")) then
		if(npcHandler.topic[playerId] == 1) then
			local destination = Position(32854, 31302, 7)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
