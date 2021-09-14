local internalNpcName = "Irmana"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 78,
	lookBody = 90,
	lookLegs = 13,
	lookFeet = 14,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)


npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	if (msgcontains(message, "fur")) then
		if (player:getStorageValue(Storage.ThreatenedDreams.TroubledMission01) == 8) then
			npcHandler:say({
				"A wolf whelp fur? Well, some months ago a hunter came here - a rather scruffy, smelly guy. I would have thrown him out instantly, but he had to offer some fine pelts. One of them was the fur of a very young wolf. ...",
				"I was not delighted that he obviously killed such a young animal. When I confronted him, he said he wanted to raise it as a companion but it unfortunately died. A sad story. In the end, I bought some of his pelts, among them the whelp fur. ...",
				"You can have it if this is important for you. I would sell it for 1000 gold. Are you interested?"
			}, npc, creature)
			npcHandler.topic[playerId] = 8
		else
			npcHandler:say("You are not on that mission.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif(msgcontains(message, "addon")) then
		if(getPlayerStorageValue(creature, Storage.Irmana1) < 1) then
			npcHandler:say("Currently we are offering accessories for the nobleman - and, of course, noblewoman - outfit. Would you like to hear more about our offer?", npc, creature)
			npcHandler.topic[playerId] = 1
		elseif getPlayerStorageValue(creature, Storage.Irmana2) < 1 then
			npcHandler:say("Currently we are offering accessories for the nobleman - and, of course, noblewoman - outfit. Would you like to hear more about our offer?", npc, creature)
			npcHandler.topic[playerId] = 1
		else
			npcHandler:say("You have already bought the two addons.", npc, creature)
		end
	elseif(msgcontains(message, "yes")) then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("Especially for you, mylady, we are offering a pretty {hat} and a beautiful {dress} like the ones I wear. Which one are you interested in?", npc, creature)
			npcHandler.topic[playerId] = 2
		elseif npcHandler.topic[playerId] == 3 then
			if(doPlayerRemoveMoney(creature, 150000) and getPlayerStorageValue(creature, Storage.Irmana1) < 1) then
				npcHandler:say("Congratulations! Here is your brand-new accessory, I hope you like it. Please visit us again! ", npc, creature)
				npcHandler.topic[playerId] = 0
				player:addOutfitAddon(140, 2)
				player:addOutfitAddon(132, 2)
				setPlayerStorageValue(creature, Storage.Irmana1, 1)
				if player:getStorageValue(Storage.Irmana1) == 1 and player:getStorageValue(Storage.Irmana2) == 1 then
					player:addAchievement(226) -- Achievement Aristocrat
				end
			end
		elseif npcHandler.topic[playerId] == 4 then
			if(doPlayerRemoveMoney(creature, 150000) and getPlayerStorageValue(creature, Storage.Irmana2) < 1) then
				npcHandler:say("Congratulations! Here is your brand-new accessory, I hope you like it. Please visit us again! ", npc, creature)
				npcHandler.topic[playerId] = 0
				player:addOutfitAddon(140, 1)
				player:addOutfitAddon(132, 1)
				setPlayerStorageValue(creature, Storage.Irmana2, 1)
				if player:getStorageValue(Storage.Irmana1) == 1 and player:getStorageValue(Storage.Irmana2) == 1 then
					player:addAchievement(226) -- Achievement Aristocrat
				end
			end
		elseif npcHandler.topic[playerId] == 5 then
			 if getPlayerItemCount(creature,2655) >= 1 then
					doPlayerRemoveItem(creature,2655,1)
				npcHandler:say("A {Red Robe}! Great. Here, take this red piece of cloth, I don\'t need it anyway.", npc, creature)
				doPlayerAddItem(creature,5911,1)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say('Are you trying to mess with me?!', npc, creature)
			end
		elseif npcHandler.topic[playerId] == 6 then
				 if getPlayerItemCount(creature,2663) >= 1 then
				doPlayerRemoveItem(creature,2663,1)
				npcHandler:say("A {Mystic Turban}! Great. Here, take this blue piece of cloth, I don\'t need it anyway.", npc, creature)
				doPlayerAddItem(creature,5912,1)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say('Are you trying to mess with me?!', npc, creature)
			end
		elseif npcHandler.topic[playerId] == 7 then
				 if getPlayerItemCount(creature,2652) >= 150 then
				doPlayerRemoveItem(creature,2652,150)
				npcHandler:say("A 150 {Green Tunic}! Great. Here, take this green piece of cloth, I don\'t need it anyway.", npc, creature)
				doPlayerAddItem(creature,5910,1)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say('Are you trying to mess with me?!', npc, creature)
			end
		elseif npcHandler.topic[playerId] == 8 then
			if player:getMoney() >= 1000 then
				player:removeMoney(1000)
				player:addItem(28599, 1) -- Fur of a Wolf Whelp
				npcHandler:say("Alright. Here is the fur.", npc, creature)
				player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 9)
				npcHandler.topic[playerId] = 0
			else
				npcHandler:say('Are you trying to mess with me?!', npc, creature)
			end
		end
	elseif(msgcontains(message, "hat") or msgcontains(message, "accessory")) and (npcHandler.topic[playerId] == 2 and getPlayerStorageValue(creature, Storage.Irmana1) < 1) then
		selfSay("This accessory requires a small fee of 150000 gold pieces. Of course, we do not want to put you at any risk to be attacked while carrying this huge amount of money. ...", npc, creature)
		selfSay("This is why we have established our brand-new instalment sale. You can choose to either pay the price at once, or if you want to be safe, by instalments of 10000 gold pieces. ...", npc, creature)
		selfSay("I also have to inform you that once you started paying for one of the accessories, you have to finish the payment first before you can start paying for the other one, of course. ...", npc, creature)
		npcHandler:say("Are you interested in purchasing this accessory?", npc, creature)
		npcHandler.topic[playerId] = 3
	elseif(msgcontains(message, "dress") or msgcontains(message, "coat")) and (npcHandler.topic[playerId] == 2 and getPlayerStorageValue(creature, Storage.Irmana2) < 1) then
		selfSay("This accessory requires a small fee of 150000 gold pieces. Of course, we do not want to put you at any risk to be attacked while carrying this huge amount of money. ...", npc, creature)
		selfSay("This is why we have established our brand-new instalment sale. You can choose to either pay the price at once, or if you want to be safe, by instalments of 10000 gold pieces. ...", npc, creature)
		selfSay("I also have to inform you that once you started paying for one of the accessories, you have to finish the payment first before you can start paying for the other one, of course. ...", npc, creature)
		npcHandler:say("Are you interested in purchasing this accessory?", npc, creature)
		npcHandler.topic[playerId] = 4
	elseif(msgcontains(message, "red robe")) then
		npcHandler:say("Have you found a {Red Robe} for me?", npc, creature)
		npcHandler.topic[playerId] = 5
	elseif(msgcontains(message, "mystic turban")) then
		npcHandler:say("Have you found a {Mystic Turban} for me?", npc, creature)
		npcHandler.topic[playerId] = 6
	elseif(msgcontains(message, "green tunic")) then
		npcHandler:say("Have you found {150 Green Tunic} for me?", npc, creature)
		npcHandler.topic[playerId] = 7
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "ape fur", clientId = 5883, sell = 120 },
	{ itemName = "badger fur", clientId = 10299, sell = 15 },
	{ itemName = "black wool", clientId = 11448, sell = 300 },
	{ itemName = "blue piece of cloth", clientId = 5912, sell = 200 },
	{ itemName = "brown piece of cloth", clientId = 5913, sell = 100 },
	{ itemName = "bunch of troll hair", clientId = 9689, sell = 30 },
	{ itemName = "dirty turban", clientId = 11456, sell = 120 },
	{ itemName = "downy feather", clientId = 11684, sell = 20 },
	{ itemName = "earflap", clientId = 17819, sell = 40 },
	{ itemName = "frost giant pelt", clientId = 9658, sell = 160 },
	{ itemName = "geomancer's robe", clientId = 11458, sell = 80 },
	{ itemName = "ghostly tissue", clientId = 9690, sell = 90 },
	{ itemName = "gloom wolf fur", clientId = 22007, sell = 70 },
	{ itemName = "green dragon leather", clientId = 5877, sell = 100 },
	{ itemName = "green piece of cloth", clientId = 5910, sell = 200 },
	{ itemName = "jewelled belt", clientId = 11470, sell = 180 },
	{ itemName = "lion's mane", clientId = 9691, sell = 60 },
	{ itemName = "lizard leather", clientId = 5876, sell = 150 },
	{ itemName = "minotaur leather", clientId = 5878, sell = 80 },
	{ itemName = "necromantic robe", clientId = 11475, sell = 250 },
	{ itemName = "noble turban", clientId = 11486, sell = 430 },
	{ itemName = "piece of crocodile leather", clientId = 10279, sell = 15 },
	{ itemName = "purple robe", clientId = 11473, sell = 110 },
	{ itemName = "red dragon leather", clientId = 5948, sell = 200 },
	{ itemName = "red piece of cloth", clientId = 5911, sell = 300 },
	{ itemName = "rope belt", clientId = 11492, sell = 66 },
	{ itemName = "royal tapestry", clientId = 9045, sell = 1000 },
	{ itemName = "safety pin", clientId = 11493, sell = 120 },
	{ itemName = "shaggy tail", clientId = 10407, sell = 25 },
	{ itemName = "silky fur", clientId = 10292, sell = 35 },
	{ itemName = "simple dress", clientId = 3568, sell = 50 },
	{ itemName = "skunk tail", clientId = 10274, sell = 50 },
	{ itemName = "snake skin", clientId = 9694, sell = 400 },
	{ itemName = "spool of yarn", clientId = 5886, sell = 1000 },
	{ itemName = "striped fur", clientId = 10293, sell = 50 },
	{ itemName = "tattered piece of robe", clientId = 9684, sell = 120 },
	{ itemName = "thick fur", clientId = 10307, sell = 150 },
	{ itemName = "velvet tapestry", clientId = 8923, sell = 800 },
	{ itemName = "warwolf fur", clientId = 10318, sell = 30 },
	{ itemName = "werewolf fur", clientId = 10317, sell = 380 },
	{ itemName = "white piece of cloth", clientId = 5909, sell = 100 },
	{ itemName = "winter wolf fur", clientId = 10295, sell = 20 },
	{ itemName = "wool", clientId = 10319, sell = 15 },
	{ itemName = "yellow piece of cloth", clientId = 5914, sell = 150 }
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

npcType:register(npcConfig)
