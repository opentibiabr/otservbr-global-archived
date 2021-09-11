local internalNpcName = "A Prisoner"
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
	lookHead = 81,
	lookBody = 21,
	lookLegs = 54,
	lookFeet = 94,
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
	-- Mad mage room quest
	if msgcontains(message, "riddle") then
		if player:getStorageValue(Storage.Quest.MadMageRoom.APrisoner) ~= 1 then
			npcHandler:say("Great riddle, isn't it? If you can tell me the correct answer, \z
				I will give you something. Hehehe!", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif msgcontains(message, "PD-D-KS-P-PD") then
		if npcHandler.topic[creature] == 1 then
			npcHandler:say("Hurray! For that I will give you my key for - hmm - let's say ... some apples. Interested?", npc, creature)
			npcHandler.topic[creature] = 2
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 2 then
			if player:removeItem(2674, 7) then
				npcHandler:say("Mnjam - excellent apples. Now - about that key. You are sure want it?", npc, creature)
				npcHandler.topic[creature] = 3
			else
				npcHandler:say("Get some more apples first!", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 3 then
			npcHandler:say("Really, really?", npc, creature)
			npcHandler.topic[creature] = 4
		elseif npcHandler.topic[creature] == 4 then
			npcHandler:say("Really, really, really, really?", npc, creature)
			npcHandler.topic[creature] = 5
		elseif npcHandler.topic[creature] == 5 then
			player:setStorageValue(Storage.Quest.MadMageRoom.APrisoner, 1)
			npcHandler:say("Then take it and get happy - or die, hehe.", npc, creature)
			local key = player:addItem(2088, 1)
			if key then
				key:setActionId(Storage.Quest.Key.ID3666)
			end
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "no") then
		npcHandler:say("Then go away!", npc, creature)
	end
	-- The paradox tower quest
	if msgcontains(message, "math") then
		if  player:getStorageValue(Storage.Quest.TheParadoxTower.Mathemagics) < 1 then
			npcHandler:say("My surreal numbers are based on astonishing facts. \z
				Are you interested in learning the secret of mathemagics?", npc, creature)
			npcHandler.topic[creature] = 6
		else
			npcHandler:say("You already know the secrets of mathemagics! Now go and use them to learn.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 6 then
		npcHandler:say("But first tell me your favourite colour please!", npc, creature)
		npcHandler.topic[creature] = 7
	elseif msgcontains(message, "green") and npcHandler.topic[creature] == 7 then
		npcHandler:say("Very interesting. So are you ready to proceed in your lesson in mathemagics?", npc, creature)
		npcHandler.topic[creature] = 8
	elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 8 then
		if player:getStorageValue(Storage.Quest.TheParadoxTower.Mathemagics) < 1 then
			player:setStorageValue(Storage.Quest.TheParadoxTower.Mathemagics, 1)
			player:addAchievement("Mathemagician")
			npcHandler:say("So know that everything is based on the simple fact that 1 + 1 = 1!", npc, creature)
			npcHandler.topic[creature] = 0
		else
			npcHandler:say(" I think you are not in touch with yourself, come back if you have tuned in on your own feelings.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Wait! Don't leave! I want to tell you about my surreal numbers.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye! Don't forget about the secrets of mathemagics.")
npcHandler:setMessage(MESSAGE_GREET, "Huh? What? I can see! Wow! A non-mino. Did they {capture} you as well?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
