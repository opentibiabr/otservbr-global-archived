local internalNpcName = "Simon The Beggar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 153,
	lookHead = 116,
	lookBody = 123,
	lookLegs = 123,
	lookFeet = 40,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}
npcConfig.shop = {
	{ itemName = "shovel", clientId = 3457, buy = 50, sell = 0 , count = 1}
}

-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = "Alms! Alms for the poor!" },
	{ text = "Sir, Ma'am, have a gold coin to spare?" },
	{ text = "I need help! Please help me!" }
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

-- First beggar addon
local function BeggarFirst(creature, message, keywords, parameters, node)
	local player = Player(creature)
	if player:isPremium() then
		if player:getStorageValue(Storage.OutfitQuest.BeggarFirstAddonDoor) == -1 then
			if player:getItemCount(5883) >= 100 and player:getMoney() + player:getBankBalance() >= 20000 then
				if player:removeItem(5883, 100) and player:removeMoneyNpc(20000) then
					npcHandler:say("Ah, right! The beggar beard or beggar dress! Here you go.", npc, creature)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(Storage.OutfitQuest.BeggarFirstAddonDoor, 1)
					player:addOutfitAddon(153, 1)
					player:addOutfitAddon(157, 1)
				end
			else
				npcHandler:say("You do not have all the required items.", npc, creature)
			end
		else
			npcHandler:say("It seems you already have this addon, don't you try to mock me son!", npc, creature)
		end
	end
end

-- Second beggar addon
local function BeggarSecond(creature, message, keywords, parameters, node)
	local player = Player(creature)
	if player:isPremium() then
		if player:getStorageValue(Storage.OutfitQuest.BeggarSecondAddon) == -1 then
			if player:getItemCount(6107) >= 1 then
				if player:removeItem(6107, 1) then
					npcHandler:say("Ah, right! The beggar staff! Here you go.", npc, creature)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(Storage.OutfitQuest.BeggarSecondAddon, 1)
					player:addOutfitAddon(153, 2)
					player:addOutfitAddon(157, 2)
				end
			else
				npcHandler:say("You do not have all the required items.", npc, creature)
			end
		else
			npcHandler:say("It seems you already have this addon, don't you try to mock me son!", npc, creature)
		end
	end
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "cookie") then
		if player:getStorageValue(Storage.WhatAFoolish.Questline) == 31
				and player:getStorageValue(Storage.WhatAFoolish.CookieDelivery.SimonTheBeggar) ~= 1 then
			npcHandler:say("Have you brought a cookie for the poor?", npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, "help") then
		npcHandler:say("I need gold. Can you spare 100 gold pieces for me?", npc, creature)
		npcHandler.topic[playerId] = 2
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 1 then
			if not player:removeItem(8111, 1) then
				npcHandler:say("You have no cookie that I'd like.", npc, creature)
				npcHandler.topic[playerId] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolish.CookieDelivery.SimonTheBeggar, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement("Allow Cookies?")
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say("Well, it's the least you can do for those who live in dire poverty. \z
						A single cookie is a bit less than I'd expected, but better than ... WHA ... WHAT?? \z
						MY BEARD! MY PRECIOUS BEARD! IT WILL TAKE AGES TO CLEAR IT OF THIS CONFETTI!", npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		elseif npcHandler.topic[playerId] == 2 then
			if not player:removeMoneyNpc(100) then
				npcHandler:say("You haven't got enough money for me.", npc, creature)
				npcHandler.topic[playerId] = 0
				return true
			end

			npcHandler:say("Thank you very much. Can you spare 500 more gold pieces for me? I will give you a nice hint.", npc, creature)
			npcHandler.topic[playerId] = 3
		elseif npcHandler.topic[playerId] == 3 then
			if not player:removeMoneyNpc(500) then
				npcHandler:say("Sorry, that's not enough.", npc, creature)
				npcHandler.topic[playerId] = 0
				return true
			end

			npcHandler:say("That's great! I have stolen something from Dermot. \z
						You can buy it for 200 gold. Do you want to buy it?", npc, creature)
			npcHandler.topic[playerId] = 4
		elseif npcHandler.topic[playerId] == 4 then
			if not player:removeMoneyNpc(200) then
				npcHandler:say("Pah! I said 200 gold. You don't have that much.", npc, creature)
				npcHandler.topic[playerId] = 0
				return true
			end

			local key = player:addItem(2087, 1)
			if key then
				key:setActionId(3940)
			end
			npcHandler:say("Now you own the hot key.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, "no") and npcHandler.topic[playerId] ~= 0 then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("I see.", npc, creature)
		elseif npcHandler.topic[playerId] == 2 then
			npcHandler:say("Hmm, maybe next time.", npc, creature)
		elseif npcHandler.topic[playerId] == 3 then
			npcHandler:say("It was your decision.", npc, creature)
		elseif npcHandler.topic[playerId] == 4 then
			npcHandler:say("Ok. No problem. I'll find another buyer.", npc, creature)
		end
		npcHandler.topic[playerId] = 0
	end
	return true
end

-- Node 1
node1 = keywordHandler:addKeyword({"addon"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "For the small fee of 20000 gold pieces I will help you mix this potion. \z
					Just bring me 100 pieces of ape fur, which are necessary to create this potion. ... Do we have a deal?"
	}
)
node1:addChildKeyword({"yes"}, BeggarSecond, {})
node1:addChildKeyword({"no"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Alright then. Come back when you got all neccessary items.",
		reset = true
	}
)

-- Node 2
node2 = keywordHandler:addKeyword({"dress"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "For the small fee of 20000 gold pieces I will help you mix this potion. \z
					Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?"
	}
)
node2:addChildKeyword({"yes"}, BeggarFirst, {})
node2:addChildKeyword({"no"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Alright then. Come back when you got all neccessary items.",
		reset = true
	}
)

-- Node 3
node3 = keywordHandler:addKeyword({"staff"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "To get beggar staff you need to give me simon the beggar's staff. Do you have it with you?"
	}
)
node3:addChildKeyword({"yes"}, BeggarSecond, {})
node3:addChildKeyword({"no"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Alright then. Come back when you got all neccessary items.",
		reset = true
	}
)

-- Node 4
node4 = keywordHandler:addKeyword({"outfit"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "For the small fee of 20000 gold pieces I will help you mix this potion. \z
					Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?"
	}
)
node4:addChildKeyword({"yes"}, BeggarFirst, {})
node4:addChildKeyword({"no"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Alright then. Come back when you got all neccessary items.",
		reset = true
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I am a poor man. Please help me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a nice day.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
