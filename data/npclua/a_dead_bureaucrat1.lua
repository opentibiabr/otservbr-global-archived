local internalNpcName = "A Dead Bureaucrat"
local npcType = Game.createNpcType("A Dead Bureaucrat (1)")
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 33
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Now where did I put that form?' },
	{ text = 'Hail Pumin. Yes, hail.' }
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

local config = {
	[VOCATION.BASE_ID.SORCERER] = "wand",
	[VOCATION.BASE_ID.DRUID] = "rod",
	[VOCATION.BASE_ID.PALADIN] = "bow",
	[VOCATION.BASE_ID.KNIGHT] = "sword"
}

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setMessage(MESSAGE_GREET, "Hello " .. (Player(creature):getSex() == PLAYERSEX_FEMALE and "beautiful lady" or "handsome gentleman") .. ", welcome to the atrium of Pumin's Domain. We require some information from you before we can let you pass. Where do you want to go?")
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	local vocation = player:getVocation()
	local vocationId = vocation:getId()
	local vocationBaseId = vocation:getBaseId()

	if msgcontains(message, "pumin") then
		if npcHandler.topic[playerId] == 0 and player:getStorageValue(Storage.PitsOfInferno.ThronePumin) < 1 then
			npcHandler:say("Sure, where else. Everyone likes to meet my master, he is a great demon, isn't he? Your name is ...?", npc, creature)
			npcHandler.topic[playerId] = 1
		elseif npcHandler.topic[playerId] == 3 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 1)
			npcHandler:say("How very interesting. I need to tell that to my master immediately. Please go to my colleagues and ask for Form 356. You will need it in order to proceed.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, player:getName()) then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("Alright |PLAYERNAME|. Vocation?", npc, creature)
			npcHandler.topic[playerId] = 2
		end
	elseif msgcontains(message, Vocation(vocationId):getName()) then
		if npcHandler.topic[playerId] == 2 then
			npcHandler:say("Huhu, please don't hurt me with your " .. config[vocationBaseId] .. "! Reason of your visit?", npc, creature)
			npcHandler.topic[playerId] = 3
		end
	elseif msgcontains(message, "411") then
		if player:getStorageValue(Storage.PitsOfInferno.ThronePumin) == 3 then
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", npc, creature)
			npcHandler.topic[playerId] = 4
		elseif player:getStorageValue(Storage.PitsOfInferno.ThronePumin) == 5 then
			npcHandler:say("Form 411? You need Form 287 to get that! Do you have it?", npc, creature)
			npcHandler.topic[playerId] = 5
		end
	elseif msgcontains(message, "no") then
		if npcHandler.topic[playerId] == 4 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 4)
			npcHandler:say("Oh, what a pity. Go see one of my colleagues. I give you the permission to get Form 287. Bye!", npc, creature)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 5 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 6)
			npcHandler:say("Great. Here you are. Form 411. Come back anytime you want to talk. Bye.", npc, creature)
		end
	elseif msgcontains(message, "356") then
		if player:getStorageValue(Storage.PitsOfInferno.ThronePumin) == 8 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 9)
			npcHandler:say("INCREDIBLE, you did it!! Have fun at Pumin's Domain!", npc, creature)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and don't forget me!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and don't forget me!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
