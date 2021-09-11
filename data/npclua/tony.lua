local internalNpcName = "Tony"
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
	local player = Player(creature)
	if msgcontains(message, "report") then
		if player:getStorageValue(Storage.InServiceofYalahar.Questline) == 7 or player:getStorageValue(Storage.InServiceofYalahar.Questline) == 13 then
			npcHandler:say("Uhm, report, eh? <slowly gives a clumsy description of recent problems>. ", npc, creature)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, math.max(1, player:getStorageValue(Storage.InServiceofYalahar.Questline) +1))
			player:setStorageValue(Storage.InServiceofYalahar.Mission02, math.max(1, player:getStorageValue(Storage.InServiceofYalahar.Mission02) +1)) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "pass") then
		npcHandler:say("You can {pass} either to the {Arena Quarter} or {Foreigner Quarter}. Which one will it be?", npc, creature)
		npcHandler.topic[creature] = 1
	elseif(msgcontains(message, "arena")) then
		if npcHandler.topic[creature] == 1 then
			player:teleportTo(Position(32695, 31254, 7))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[creature] = 0
		end
	elseif(msgcontains(message, "foreigner")) then
		if npcHandler.topic[creature] == 1 then
			player:teleportTo(Position(32695, 31259, 7))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
