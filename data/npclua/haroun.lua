local internalNpcName = "Haroun"
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)	local player = Player(creature)
	if isInArray({"enchanted chicken wing", "boots of haste"}, message) then
		npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', npc, creature)
		npcHandler.topic[creature] = 1
	elseif isInArray({"warrior sweat", "warrior helmet"}, message) then
		npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', npc, creature)
		npcHandler.topic[creature] = 2
	elseif isInArray({"fighting spirit", "royal helmet"}, message) then
		npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', npc, creature)
		npcHandler.topic[creature] = 3
	elseif isInArray({"magic sulphur", "fire sword"}, message) then
		npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', npc, creature)
		npcHandler.topic[creature] = 4
	elseif isInArray({"job", "items"}, message) then
		npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', npc, creature)
		npcHandler.topic[creature] = 0
	elseif msgcontains(message,'yes') and npcHandler.topic[creature] <= 4 and npcHandler.topic[creature] >= 1 then
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
	elseif msgcontains(message,'no') and (npcHandler.topic[creature] >= 1 and npcHandler.topic[creature] <= 5) then
		npcHandler:say('Ok then.', npc, creature)
		npcHandler.topic[creature] = 0
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	end
	return true
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)

	if player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission03) ~= 3 then
		npcHandler:say('I\'m sorry, human. But you need Gabel\'s permission to trade with me.', npc, creature)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, human |PLAYERNAME|. How can a humble djinn be of service?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell! May the serene light of the enlightened one rest shine on your travels.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human.")
npcHandler:setMessage(MESSAGE_SENDTRADE, 'At your service, just browse through my wares.')

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "axe ring", clientId = 3092, sell = 100 },
	{ itemName = "bronze amulet", clientId = 3056, sell = 50 },
	{ itemName = "club ring", clientId = 3093, sell = 100 },
	{ itemName = "elven amulet", clientId = 3082, sell = 100 },
	{ itemName = "garlic necklace", clientId = 3083, sell = 50 },
	{ itemName = "life crystal", clientId = 4840, sell = 50 },
	{ itemName = "magic light wand", clientId = 3046, sell = 35 },
	{ itemName = "mind stone", clientId = 3062, sell = 100 },
	{ itemName = "orb", clientId = 3060, sell = 750 },
	{ itemName = "power ring", clientId = 3050, sell = 50 },
	{ itemName = "stealth ring", clientId = 3049, sell = 200 },
	{ itemName = "stone skin amulet", clientId = 3081, sell = 500 },
	{ itemName = "sword ring", clientId = 3091, sell = 100 },
	{ itemName = "wand of cosmic energy", clientId = 3073, sell = 2000 },
	{ itemName = "wand of decay", clientId = 3072, sell = 1000 },
	{ itemName = "wand of defiance", clientId = 16096, sell = 6500 },
	{ itemName = "wand of draconia", clientId = 8093, sell = 1500 },
	{ itemName = "wand of dragonbreath", clientId = 3075, sell = 200 },
	{ itemName = "wand of everblazing", clientId = 16115, sell = 6000 },
	{ itemName = "wand of inferno", clientId = 3071, sell = 3000 },
	{ itemName = "wand of starstorm", clientId = 8092, sell = 3600 },
	{ itemName = "wand of voodoo", clientId = 8094, sell = 4400 },
	{ itemName = "wand of vortex", clientId = 3074, sell = 100 },
	-- Buyable items
	{ itemName = "axe ring", clientId = 3092, buy = 500 },
	{ itemName = "bronze amulet", clientId = 3056, buy = 100, count = 200 },
	{ itemName = "club ring", clientId = 3093, buy = 500 },
	{ itemName = "elven amulet", clientId = 3082, buy = 500, count = 50 },
	{ itemName = "garlic necklace", clientId = 3083, buy = 100 },
	{ itemName = "magic light wand", clientId = 3046, buy = 120 },
	{ itemName = "power ring", clientId = 3050, buy = 100 },
	{ itemName = "stealth ring", clientId = 3049, buy = 5000 },
	{ itemName = "stone skin amulet", clientId = 3081, buy = 5000, count = 5 },
	{ itemName = "sword ring", clientId = 3091, buy = 500 }
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
