local internalNpcName = "Bruce"
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
	if msgcontains(message, 'report') then
		local player = Player(creature)
		if isInArray({9, 11}, player:getStorageValue(Storage.InServiceofYalahar.Questline)) then
			npcHandler:say('Well, .. <gives a short and precise report>.', npc, creature)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, player:getStorageValue(Storage.InServiceofYalahar.Questline) + 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission02, player:getStorageValue(Storage.InServiceofYalahar.Mission02) + 1) -- StorageValue for Questlog 'Mission 02: Watching the Watchmen'
		end
	elseif msgcontains(message, 'pass') then
		npcHandler:say('You can {pass} either to the {Alchemist Quarter} or {Cemetery Quarter}. Which one will it be?', npc, creature)
		npcHandler.topic[playerId] = 1
	elseif npcHandler.topic[playerId] == 1 then
		if msgcontains(message, 'alchemist') then
			local destination = Position(32738, 31113, 7)
			Player(creature):teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[playerId] = 0
		elseif msgcontains(message, 'cemetery') then
			local destination = Position(32743, 31113, 7)
			Player(creature):teleportTo(destination)
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
