local internalNpcName = "Kallimae"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1199,
	lookHead = 95,
	lookBody = 52,
	lookLegs = 0,
	lookFeet = 71,
	lookAddons = 1
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

local playerTopic = {}
local function greetCallback(npc, creature)
	local playerId = creature:getId()
	local player = Player(creature)
	if player:getStorageValue(Storage.Kilmaresh.First.Access) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		playerTopic[creature] = 1
	elseif (player:getStorageValue(Storage.Kilmaresh.First.JamesfrancisTask) >= 0 and player:getStorageValue(Storage.Kilmaresh.First.JamesfrancisTask) <= 50)
	and player:getStorageValue(Storage.Kilmaresh.First.Mission) < 3 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		playerTopic[creature] = 15
	elseif player:getStorageValue(Storage.Kilmaresh.First.Mission) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, "How could I help you?") -- It needs to be revised, it's not the same as the global
		player:setStorageValue(Storage.Kilmaresh.First.Mission, 5)
		playerTopic[creature] = 20
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	npcHandler.topic[playerId] = playerTopic[creature]
	local player = Player(creature)
	if msgcontains(message, "mission") and player:getStorageValue(Storage.Kilmaresh.Sixth.Favor) == 11 then
		if player:getStorageValue(Storage.Kilmaresh.Sixth.Favor) == 11 then
			npcHandler:say({"Some residents are in need of ingredients to finish a ritual. You can help?"}, npc, creature)-- It needs to be revised, it's not the same as the global
			npcHandler.topic[playerId] = 1
			playerTopic[creature] = 1
		end	
	elseif msgcontains(message, "yes") and playerTopic[creature] == 1 then
		if player:getStorageValue(Storage.Kilmaresh.Sixth.Favor) == 11 then
			npcHandler:say({"Search for the NPCs Yonan, Narsai, Shimun and Tefrit."}, npc, creature)-- It needs to be revised, it's not the same as the global
			player:setStorageValue(Storage.Kilmaresh.Set.Ritual, 1)
			player:setStorageValue(Storage.Kilmaresh.Set.Yonan, 1)
			player:setStorageValue(Storage.Kilmaresh.Set.Narsai, 1)
			player:setStorageValue(Storage.Kilmaresh.Set.Shimun, 1)
			player:setStorageValue(Storage.Kilmaresh.Set.Tefrit, 1)
			player:setStorageValue(Storage.Kilmaresh.Sixth.Favor, 12)
			npcHandler.topic[playerId] = 2
			playerTopic[creature] = 2
		else
			npcHandler:say({"Sorry."}, npc, creature)-- It needs to be revised, it's not the same as the global
		end
	end
	if msgcontains(message, "mission") and player:getStorageValue(Storage.Kilmaresh.Eighth.Yonan) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Narsai) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Shimun) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Tefrit) == 3 then
		if player:getStorageValue(Storage.Kilmaresh.Eighth.Yonan) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Narsai) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Shimun) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Tefrit) == 3 then
			npcHandler:say({"Did you help some residents with ingredients?"}, npc, creature)-- It needs to be revised, it's not the same as the global
			npcHandler.topic[playerId] = 3
			playerTopic[creature] = 3
		end
	elseif msgcontains(message, "yes") and playerTopic[creature] == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Yonan) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Narsai) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Shimun) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Tefrit) == 3 then
		if player:getStorageValue(Storage.Kilmaresh.Eighth.Yonan) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Narsai) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Shimun) == 3 and player:getStorageValue(Storage.Kilmaresh.Eighth.Tefrit) == 3 then
			npcHandler:say({"Thanks. I need you to go to 4 places indicated by Goddess Bastesh."}, npc, creature)-- It needs to be revised, it's not the same as the global
			player:setStorageValue(Storage.Kilmaresh.Nine.Owl, 1)
			npcHandler.topic[playerId] = 4
			playerTopic[creature] = 4
		else
			npcHandler:say({"Sorry."}, npc, creature)-- It needs to be revised, it's not the same as the global
		end
	end
	if msgcontains(message, "mission") and player:getStorageValue(Storage.Kilmaresh.Eleven.Basin) == 1 then
		if player:getStorageValue(Storage.Kilmaresh.Eleven.Basin) == 1 then
			npcHandler:say({"Did you check all the points and bring the Symbol of Sun and Sea?"}, npc, creature)-- It needs to be revised, it's not the same as the global
			npcHandler.topic[playerId] = 5
			playerTopic[creature] = 5
		end	
	elseif msgcontains(message, "yes") and playerTopic[creature] == 5 and player:getStorageValue(Storage.Kilmaresh.Eleven.Basin) == 1 then
		if player:getStorageValue(Storage.Kilmaresh.Eleven.Basin) == 1 and player:getItemById(36266, 1) then
			player:addItem(36407, 1)
			npcHandler:say({"Thanks. Here is your reward."}, npc, creature)-- It needs to be revised, it's not the same as the global
			player:setStorageValue(Storage.Kilmaresh.Twelve.Boss, 1)
			player:setStorageValue(Storage.Kilmaresh.Eleven.Basin, 2)
			npcHandler.topic[playerId] = 6
			playerTopic[creature] = 6
		else
			npcHandler:say({"Sorry."}, npc, creature)-- It needs to be revised, it's not the same as the global
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')
npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
