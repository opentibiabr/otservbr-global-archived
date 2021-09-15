local internalNpcName = "Wyrdin"
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
	lookHead = 76,
	lookBody = 77,
	lookLegs = 79,
	lookFeet = 115,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = "<mumbles> So where was I again?" },
	{ text = "<mumbles> Typical - you can never find a hero when you need one!" },
	{ text = "<mumbles> Could the bonelord language be the invention of some madman?" },
	{ text = "<mumbles> The curse algorithm of triplex shadowing has to be two times higher than an overcharged nanoquorx on the peripheral..." }
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
	if msgcontains(message, "mission") then
		if player:getStorageValue(Storage.TheWayToYalahar.QuestLine) < 1 and player:getStorageValue(Storage.ExplorerSociety.JoiningTheExplorers) >= 4 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 4 then
			npcHandler:say({
				"There is indeed something that needs our attention. In the far north, a new city named Yalahar was discovered. It seems to be incredibly huge. ...",
				"According to travelers, it's a city of glory and wonders. We need to learn as much as we can about this city and its inhabitants. ...",
				"Gladly the explorer's society already sent a representative there. Still, we need someone to bring us the information he was able to gather until now. ...",
				"Please look for the explorer's society's captain Maximilian in Liberty Bay. Ask him for a passage to Yalahar. There visit Timothy of the explorer's society and get his research notes. ...",
				"It might be a good idea to explore the city a bit on your own before you deliver the notes here, but please make sure you don't lose them."
			}, npc, creature)
			player:setStorageValue(Storage.TheWayToYalahar.QuestLine, 1)
			npcHandler:setTopic(playerId, 0)
		elseif player:getStorageValue(Storage.TheWayToYalahar.QuestLine) == 2 then
			npcHandler:say("Did you bring the papers I asked you for?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			if player:removeItem(10090, 1) then
				player:setStorageValue(Storage.TheWayToYalahar.QuestLine, 3)
				npcHandler:say("Oh marvellous, please excuse me. I need to read this text immediately. Here, take this small reward of 500 gold pieces for your efforts.", npc, creature)
				player:addMoney(500)
				npcHandler:setTopic(playerId, 0)
			end
		end
	--The New Frontier
	elseif msgcontains(message, "farmine") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 15 then
			npcHandler:say("I've heard some odd rumours about this new dwarven outpost. But tell me, what has the Edron academy to do with Farmine?", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	elseif msgcontains(message, "plea") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getStorageValue(Storage.TheNewFrontier.BribeWydrin) < 1 then
				npcHandler:say("Hm, you are right, we are at the forefront of knowledge and innovation. Our dwarven friends could learn much from one of our representatives.", npc, creature)
				player:setStorageValue(Storage.TheNewFrontier.BribeWydrin, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, what brings you here?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
