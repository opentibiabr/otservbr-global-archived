local internalNpcName = "Carlos"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 86,
	lookFeet = 114,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Hmm, we should do something about your outfit.' },
	{ text = 'Ah, another adventurer. Let\'s talk a little.' },
	{ text = 'Psst! Come over here for a little trade.' },
	{ text = 'Hello, hello! Don\'t be shy, I don\'t bite.' },
	{ text = 'By the way, if you want to look at old hints again, find the \'Help\' button near your inventory and select \'Tutorial Hints\'.' }
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "meat", clientId = 3577, buy = 0, sell = 2, count = 1 },
	{ itemName = "ham", clientId = 3582, buy = 0, sell = 2, count = 1 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost), npc, player)
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, itemId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

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

local storeTalkCid = {}

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	local player = Player(creature)
	if player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Be greeted, |PLAYERNAME|! As a tailor and merchant I have to say - we need to do something about your {outfit}, shall we?")
		player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 1)
		player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 1)
		storeTalkCid[creature] = 1
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Hey, I thought you were going to run away, but luckily you came back. I'll show you how to change your {outfit}, okay?")
		storeTalkCid[creature] = 1
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 2 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome back! You know, after providing my little outfit service, I like to ask a little favour of you. Can you {help} me?")
		storeTalkCid[creature] = 2
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 3 then
		npcHandler:setMessage(MESSAGE_GREET, "Oh hey |PLAYERNAME|, you didn't answer my question yet - could you help me get some {food}? I'll even give you some gold for it.")
		storeTalkCid[creature] = 3
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome back |PLAYERNAME|, I hope you changed your mind and will bring me some {meat}? I'll even give you some gold for it.")
		storeTalkCid[creature] = 4
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 5 then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome back, |PLAYERNAME|! Did you have a successful hunt and carry a piece of {meat} or ham with you?")
		storeTalkCid[creature] = 5
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 6 then
		if player:getItemCount(2666) > 0 or player:getItemCount(2671) > 0 then
			npcHandler:setMessage(MESSAGE_GREET, "Welcome back, Isleth Eagonst! Do you still have that piece of meat or ham? If so, please ask me for a {trade} and I'll give you some gold for it.")
			storeTalkCid[creature] = 6
		else
			npcHandler:setMessage(MESSAGE_GREET, "Welcome back, |PLAYERNAME|! Where did you put that delicious piece of food? Did you eat it yourself? Well, if you find another one, please come back.")
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 7 then
		npcHandler:setMessage(MESSAGE_GREET, "Hey there, |PLAYERNAME|! Well, that's how trading with NPCs like me works. I think you are ready now to cross the bridge to Rookgaard! Take care!")
		player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 7)
		player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 8)
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	elseif player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage) == 8 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello again, |PLAYERNAME|! What are you still doing here? You should head over the bridge to Rookgaard village now!")
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	end
	return true
end

local function releasePlayer(creature)
	if not Player(creature) then
		return
	end

	npcHandler:removeInteraction(npc, creature)
	npcHandler:resetNpc(creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	local player = Player(creature)
	if isInArray({"yes", "help", "ok"}, message) then
		if storeTalkCid[creature] == 1 then
			npcHandler:say("Very well. Just choose an outfit and a colour combination that suits you. You can open this dialogue anytime by right-clicking on yourself and selecting 'Set Outfit'. Just try it and then talk to me again!", npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 2)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 2)
			player:sendTutorial(12)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		elseif storeTalkCid[creature] == 2 then
			npcHandler:say("You see, I'm quite hungry from standing here all day. Could you get me some {food}?", npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 3)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 3)
			storeTalkCid[creature] = 3
		elseif storeTalkCid[creature] == 3 then
			npcHandler:say("Thank you! I would do it myself, but I don't have a weapon. Just kill a few rabbits or deer, loot food from them and bring me one piece of {meat} or ham, will you?", npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 4)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 4)
			storeTalkCid[creature] = 4
		elseif storeTalkCid[creature] == 4 then
			npcHandler:say("Splendid. I'll be awaiting your return eagerly. Don't forget that you can click on the 'Chase Opponent' button to run after those fast creatures. Good {bye} for now!", npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 5)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 5)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		elseif storeTalkCid[creature] == 5 then
			if player:getItemCount(2666) > 0 or player:getItemCount(2671) > 0 then
				npcHandler:say("What's that delicious smell? That must be a piece of meat! Please hurry, simply ask me for a {trade} and I'll give you two gold pieces for it!", npc, creature)
				player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 6)
				player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 6)
				player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcTradeStorage, 1)
				storeTalkCid[creature] = 6
			else
				npcHandler:say("Hmm. No, I don't think you have something with you that I'd like to eat. Please come back once you looted a piece of meat or a piece of ham from a rabbit or deer.", npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			end
		elseif storeTalkCid[creature] == 7 then
			npcHandler:say({
				"Well, that's how trading with NPCs like me works. I think you are ready now to cross the bridge to Rookgaard, just follow the path to the northwest. Good luck, |PLAYERNAME|! ...",
				"And by the way: if you thought all of this was boring and you'd rather skip the tutorial with your next character, just say 'skip tutorial' to Santiago. ...",
				"Then you'll miss out on those nice items and experience though. Hehehe! It's your choice. Well, take care for now!"
			}, npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 7)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 8)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif msgcontains(message, "outfit") then
		if storeTalkCid[creature] == 1 then
			npcHandler:say({
				"Well, that's how trading with NPCs like me works. I think you are ready now to cross the bridge to Rookgaard, just follow the path to the northwest. Good luck, |PLAYERNAME|! ...",
				"And by the way: if you thought all of this was boring and you'd rather skip the tutorial with your next character, just say 'skip tutorial' to Santiago. ...",
				"Then you'll miss out on those nice items and experience though. Hehehe! It's your choice. Well, take care for now!"
			}, npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 7)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 8)
			addEvent(releasePlayer, 1000, npc, creature)
		end
	elseif msgcontains(message, "ready") then
		if storeTalkCid[creature] == 7 then
			npcHandler:say({
				"Well, that's how trading with NPCs like me works. I think you are ready now to cross the bridge to Rookgaard, just follow the path to the northwest. Good luck, |PLAYERNAME|! ...",
				"And by the way: if you thought all of this was boring and you'd rather skip the tutorial with your next character, just say 'skip tutorial' to Santiago. ...",
				"Then you'll miss out on those nice items and experience though. Hehehe! It's your choice. Well, take care for now!"
			}, npc, creature)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosQuestLog, 7)
			player:setStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcGreetStorage, 8)
			addEvent(releasePlayer, 5000, npc, creature)
		end
	end
	return true
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)
	if player:getStorageValue(Storage.RookgaardTutorialIsland.CarlosNpcTradeStorage) ~= 1 then
		return false
	end

	return true
end

local function onReleaseFocus(creature)
	storeTalkCid[creature] = nil
end

npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:setMessage(MESSAGE_SENDTRADE, "Very nice! Food for me! Sell it to me, fast! Once you sold your food to me, just say {ready} to let me know you are done.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye |PLAYERNAME|!.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye traveller and enjoy your stay on Rookgaard.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
