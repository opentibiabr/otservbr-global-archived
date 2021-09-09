local internalNpcName = "Leeland"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 19,
	lookBody = 53,
	lookLegs = 15,
	lookFeet = 95,
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	if not npcHandler:isFocused(creature) then
		return false
	--The New Frontier
	elseif msgcontains(message, "farmine") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 15 then
			npcHandler:say("Oh yes, that project the whole dwarven community is so excited about. I guess I already know why you are here, but speak up.", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif msgcontains(message, "impress") or msgcontains(message, "plea") then
		if npcHandler.topic[creature] == 1 then
			if player:getStorageValue(Storage.TheNewFrontier.BribeLeeland) < 1 then
				npcHandler:say("The idea of a promising market and new resources suits us quite well. I think it is reasonable to send some assistance.", npc, creature)
				player:setStorageValue(Storage.TheNewFrontier.BribeLeeland, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
