local internalNpcName = "Fa'Hradin"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 80
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
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = Player(creature)
	local missionProgress = player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission02)
	if msgcontains(message, 'spy report') or msgcontains(message, 'mission') then
		if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission01) ~= 2 then
			npcHandler:say('Looking for work, are you? Well, it\'s very tempting, you know, but I\'m afraid we do not really employ beginners. Perhaps our cook could need a helping hand in the kitchen.', npc, creature)

		elseif missionProgress < 1 then
			npcHandler:say({
				'I have heard some good things about you from Bo\'ques. But I don\'t know. ...',
				'Well, all right. I do have a job for you. ...',
				'In order to stay informed about our enemy\'s doings, we have managed to plant a spy in Mal\'ouquah. ...',
				'He has kept the Efreet and Malor under surveillance for quite some time. ...',
				'But unfortunately, I have lost contact with him months ago. ...',
				'I do not fear for his safety because his cover is foolproof, but I cannot contact him either. This is where you come in. ...',
				'I need you to infiltrate Mal\'ouqhah, contact our man there and get his latest spyreport. The password is {PIEDPIPER}. Remember it well! ...',
				'I do not have to add that this is a dangerous mission, do I? If you are discovered expect to be attacked! So goodluck, human!'
			}, npc, creature)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 1)
			player:setStorageValue(Storage.DjinnWar.MaridFaction.DoorToEfreetTerritory, 1)

		elseif missionProgress == 1 then
			npcHandler:say('Did you already retrieve the spyreport?', npc, creature)
			npcHandler.topic[creature] = 1
		else
			npcHandler:say('Did you already talk to Gabel about the report? I think he will have further instructions for you.', npc, creature)
		end

	elseif npcHandler.topic[creature] == 1 then
		if msgcontains(message, 'yes') then
			if player:getStorageValue(Storage.DjinnWar.MaridFaction.RataMari) ~= 2 or not player:removeItem(2345, 1) then
				npcHandler:say({
					'Don\'t waste any more time. We need the spyreport of our man in Mal\'ouquah as soon as possible! ...',
					'Also don\'t forget the password to contact our man: PIEDPIPER!'
				}, npc, creature)
			else
				npcHandler:say({
					'You really have made it? You have the report? How come you did not get slaughtered? I must say I\'m impressed. Your race will never cease to surprise me. ...',
					'Well, let\'s see. ...',
					'I think I need to talk to Gabel about this. I am sure he will know what to do. Perhaps you should have a word with him, too.'
				}, npc, creature)
				player:setStorageValue(Storage.DjinnWar.MaridFaction.Mission02, 2)
			end

		elseif msgcontains(message, 'no') then
			npcHandler:say({
				'Don\'t waste any more time. We need the spyreport of our man in Mal\'ouquah as soon as possible! ...',
				'Also don\'t forget the password to contact our man: PIEDPIPER!'
			}, npc, creature)
		end
	end
	return true
end

-- Greeting
keywordHandler:addGreetKeyword({"djanni'hah"}, {npcHandler = npcHandler, text = "Aaaah... what have we here. A human - interesting. And such an ugly specimen, too... All right, human |PLAYERNAME|. How can I help you?"})

npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell, human. I will always remember you. Unless I forget you, of course.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, human. I will always remember you. Unless I forget you, of course.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
