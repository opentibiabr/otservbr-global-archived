local internalNpcName = "A Dead Bureaucrat"
local npcType = Game.createNpcType("A Dead Bureaucrat (4)")
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
	[VOCATION.BASE_ID.SORCERER] = "S O R C E R E R",
	[VOCATION.BASE_ID.DRUID] = "D R U I D",
	[VOCATION.BASE_ID.PALADIN] = "P A L A D I N",
	[VOCATION.BASE_ID.KNIGHT] = "K N I G H T"
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
		if player:getStorageValue(Storage.PitsOfInferno.ThronePumin) < 1 then
			npcHandler:say("I'm not sure if you know what you are doing but anyway. Your name is?", npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, player:getName()) then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("Alright |PLAYERNAME|. Vocation?", npc, creature)
			npcHandler.topic[playerId] = 2
		end
	elseif msgcontains(message, Vocation(vocationId):getName()) then
		if npcHandler.topic[playerId] == 2 then
			npcHandler:say(config[vocationBaseId] .. ", is that right?! What do you want from me?", npc, creature)
			npcHandler.topic[playerId] = 3
		end
	elseif msgcontains(message, "356") then
		if npcHandler.topic[playerId] == 3 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 2)
			npcHandler:say("Sorry, you need Form 145 to get Form 356. Come back when you have it", npc, creature)
			npcHandler.topic[playerId] = 0
		elseif player:getStorageValue(Storage.PitsOfInferno.ThronePumin) == 7 then
			player:setStorageValue(Storage.PitsOfInferno.ThronePumin, 8)
			npcHandler:say("You are better than I thought! Congratulations, here you are: Form 356!", npc, creature)
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
