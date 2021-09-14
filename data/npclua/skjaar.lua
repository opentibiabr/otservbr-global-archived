local internalNpcName = "Skjaar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 9
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
	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, 'key') then
		npcHandler:say('I will give the key to the crypt only to the closest followers of my master. Would you like me to test you?', npc, creature)
		npcHandler.topic[playerId] = 1
	elseif msgcontains(message, 'yes') and npcHandler.topic[playerId] == 1 then
		npcHandler:say('Before we start I must ask you for a small donation of 1000 gold coins. Are you willing to pay 1000 gold coins for the test?', npc, creature)
		npcHandler.topic[playerId] = 2
	elseif msgcontains(message, 'yes') and npcHandler.topic[playerId] == 2 then
		if player:removeMoneyNpc(1000) then
			npcHandler:say('All right then. Here comes the first question. What was the name of Dago\'s favourite pet?', npc, creature)
			npcHandler.topic[playerId] = 3
		else
			npcHandler:say('You don\'t have enough money', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, 'redips') and npcHandler.topic[playerId] == 3 then
		npcHandler:say('Perhaps you knew him after all. Tell me - how many fingers did he have when he died?', npc, creature)
		npcHandler.topic[playerId] = 4
	elseif msgcontains(message, '7') and npcHandler.topic[playerId] == 4 then
		npcHandler:say('Also true. But can you also tell me the colour of the deamons in which master specialized?', npc, creature)
		npcHandler.topic[playerId] = 5
	elseif msgcontains(message, 'black') and npcHandler.topic[playerId] == 5 then
		npcHandler:say('It seems you are worthy after all. Do you want the key to the crypt?', npc, creature)
		npcHandler.topic[playerId] = 6
	elseif msgcontains(message, 'yes') and npcHandler.topic[playerId] == 6 then
		npcHandler:say('Here you are', npc, creature)
		local key = player:addItem(2089, 1)
		if key then
			key:setActionId(3142)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Another creature who believes thinks physical strength is more important than wisdom! Why are you disturbing me?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Run away, unworthy |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
