local internalNpcName = "Yaman"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 103
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

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = Player(creature)
	if isInArray({"enchanted chicken wing", "boots of haste", "Enchanted Chicken Wing", "Boots of Haste"}, message) then
		npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', npc, creature)
		npcHandler.topic[creature] = 1
	elseif isInArray({"warrior sweat", "warrior helmet", "Warrior Sweat", "Warrior Helmet"}, message) then
		npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', npc, creature)
		npcHandler.topic[creature] = 2
	elseif isInArray({"fighting spirit", "royal helmet", "Fighting Spirit", "Royal Helmet"}, message) then
		npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', npc, creature)
		npcHandler.topic[creature] = 3
	elseif isInArray({"magic sulphur", "fire sword", "Magic Sulphur", "Fire Sword"}, message) then
		npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', npc, creature)
		npcHandler.topic[creature] = 4
	elseif isInArray({"job", "items", "Items", "Job"}, message) then
		npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', npc, creature)
		npcHandler.topic[creature] = 0
	elseif msgcontains(message, 'cookie') then
		if player:getStorageValue(Storage.WhatAFoolish.Questline) == 31
				and player:getStorageValue(Storage.WhatAFoolish.CookieDelivery.Djinn) ~= 1 then
			npcHandler:say('You brought cookies! How nice of you! Can I have one?', npc, creature)
			npcHandler.topic[creature] = 5
		end
	elseif msgcontains(message,'yes') then
		if npcHandler.topic[creature] >= 1 and npcHandler.topic[creature] <= 4 then
			local trade = {
					{ NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
					{ NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
					{ NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
					{ NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}  -- Magic Sulphur
			}
			if player:getItemCount(trade[npcHandler.topic[creature]].NeedItem) >= trade[npcHandler.topic[creature]].Ncount then
				player:removeItem(trade[npcHandler.topic[creature]].NeedItem, trade[npcHandler.topic[creature]].Ncount)
				player:addItem(trade[npcHandler.topic[creature]].GiveItem, trade[npcHandler.topic[creature]].Gcount)
				return npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry but you don\'t have the item.', npc, creature)
			end
		elseif npcHandler.topic[creature] == 5 then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', npc, creature)
				npcHandler.topic[creature] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolish.CookieDelivery.Djinn, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('You see, good deeds like this will ... YOU ... YOU SPAWN OF EVIL! I WILL MAKE SURE THE MASTER LEARNS ABOUT THIS!', npc, creature)
			npcHandler:releaseFocus(creature)
			npcHandler:resetNpc(creature)
		end
	elseif msgcontains(message,'no') then
		if npcHandler.topic[creature] >= 1 and npcHandler.topic[creature] <= 4 then
			npcHandler:say('Ok then.', npc, creature)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 5 then
			npcHandler:say('I see.', npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)
	if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) ~= 3 then
		npcHandler:say('I\'m sorry, but you don\'t have Malor\'s permission to trade with me.', npc, creature)
		return false
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, human |PLAYERNAME|. How can a humble djinn be of service?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human.")
npcHandler:setMessage(MESSAGE_SENDTRADE, 'At your service, just browse through my wares.')

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "ankh", clientId = 3214, sell = 100 },
	{ itemName = "dragon necklace", clientId = 3085, sell = 100 },
	{ itemName = "dwarven ring", clientId = 3097, sell = 100 },
	{ itemName = "energy ring", clientId = 3051, sell = 100 },
	{ itemName = "glacial rod", clientId = 16118, sell = 6500 },
	{ itemName = "hailstorm rod", clientId = 3067, sell = 3000 },
	{ itemName = "life ring", clientId = 3052, sell = 50 },
	{ itemName = "might ring", clientId = 3048, sell = 250 },
	{ itemName = "moonlight rod", clientId = 3070, sell = 200 },
	{ itemName = "muck rod", clientId = 16117, sell = 6000 },
	{ itemName = "mysterious fetish", clientId = 3078, sell = 50 },
	{ itemName = "necrotic rod", clientId = 3069, sell = 1000 },
	{ itemName = "northwind rod", clientId = 8083, sell = 1500 },
	{ itemName = "protection amulet", clientId = 3084, sell = 100 },
	{ itemName = "ring of healing", clientId = 3098, sell = 100 },
	{ itemName = "silver amulet", clientId = 3054, sell = 50 },
	{ itemName = "snakebite rod", clientId = 3066, sell = 100 },
	{ itemName = "springsprout rod", clientId = 8084, sell = 3600 },
	{ itemName = "strange talisman", clientId = 3045, sell = 30 },
	{ itemName = "terra rod", clientId = 3065, sell = 2000 },
	{ itemName = "time ring", clientId = 3053, sell = 100 },
	{ itemName = "underworld rod", clientId = 8082, sell = 4400 },
	-- Buyable items
	{ itemName = "dragon necklace", clientId = 3085, buy = 1000, count = 200 },
	{ itemName = "dwarven ring", clientId = 3097, buy = 2000 },
	{ itemName = "energy ring", clientId = 3051, buy = 2000 },
	{ itemName = "life ring", clientId = 3052, buy = 900 },
	{ itemName = "might ring", clientId = 3048, buy = 5000, count = 20 },
	{ itemName = "protection amulet", clientId = 3084, buy = 700, count = 250 },
	{ itemName = "ring of healing", clientId = 3098, buy = 2000 },
	{ itemName = "silver amulet", clientId = 3054, buy = 100, count = 200 },
	{ itemName = "strange talisman", clientId = 3045, buy = 100, count = 200 },
	{ itemName = "time ring", clientId = 3053, buy = 2000 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost), npc, player)
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, amount, name, totalCost, clientId)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)
