local internalNpcName = "Noodles"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 32
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Grrrrrrr.' },
	{ text = '<wiggles>' },
	{ text = '<sniff>' },
	{ text = 'Woof! Woof!' },
	{ text = 'Wooof!' }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "banana skin") then
		if player:getStorageValue(Storage.Postman.Mission06) == 7 then
			if player:getItemCount(2219) > 0 then
				npcHandler:say("<sniff><sniff>", npc, creature)
				npcHandler:setTopic(playerId, 1)
			end
		end
	elseif msgcontains(message, "dirty fur") then
		if player:getStorageValue(Storage.Postman.Mission06) == 8 then
			if player:getItemCount(2220) > 0 then
				npcHandler:say("<sniff><sniff>", npc, creature)
				npcHandler:setTopic(playerId, 2)
			end
		end
	elseif msgcontains(message, "mouldy cheese") then
		if player:getStorageValue(Storage.Postman.Mission06) == 9 then
			if player:getItemCount(2235) > 0 then
				npcHandler:say("<sniff><sniff>", npc, creature)
				npcHandler:setTopic(playerId, 3)
			end
		end
	elseif msgcontains(message, "like") then
		if npcHandler:getTopic(playerId) == 1  then
			npcHandler:say("Woof!", npc, creature)
			player:setStorageValue(Storage.Postman.Mission06, 8)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 2 then
			npcHandler:say("Woof!", npc, creature)
			player:setStorageValue(Storage.Postman.Mission06, 9)
			npcHandler:setTopic(playerId, 0)
		elseif npcHandler:getTopic(playerId) == 3 then
			npcHandler:say("Meeep! Grrrrr! <spits>", npc, creature)
			player:setStorageValue(Storage.Postman.Mission06, 10)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "<sniff> Woof! <sniff>")
npcHandler:setMessage(MESSAGE_FAREWELL, "Woof! <wiggle>")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Woof! <wiggle>")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
