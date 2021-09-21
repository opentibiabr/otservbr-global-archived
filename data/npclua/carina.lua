local internalNpcName = "Carina"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 138,
	lookHead = 97,
	lookBody = 70,
	lookLegs = 94,
	lookFeet = 76,
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, 'precious necklace') then
		if player:getItemCount(7940) > 0 then
			npcHandler:say('Would you like to buy my precious necklace for 5000 gold?', npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif msgcontains(message, 'mouse') then
		npcHandler:say('Wha ... What??? Are you saying you\'ve seen a mouse here??', npc, creature)
		npcHandler:setTopic(playerId, 2)
	elseif msgcontains(message, 'yes') then
		if npcHandler:getTopic(playerId) == 1 then
			if player:removeMoneyBank(5000) then
				player:removeItem(7940, 1)
				player:addItem(7939, 1)
				npcHandler:say('Here you go kind sir.', npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 2 then
			if not player:removeItem(123, 1) then
				npcHandler:say('There is no mouse here! Stop talking foolish things about serious issues!', npc, creature)
				npcHandler:setTopic(playerId, 0)
				return true
			end

			player:setStorageValue(Storage.WhatAFoolish.ScaredCarina, 1)
			npcHandler:say('IIIEEEEEK!', npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif msgcontains(message, 'no') then
		if npcHandler:getTopic(playerId) == 2 then
			npcHandler:say('Thank goodness!', npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "wedding ring", clientId = 3004, sell = 100 },
	-- Buyable items
	{ itemName = "golden amulet", clientId = 3013, buy = 6600 },
	{ itemName = "precious necklace", clientId = 7939, buy = 5000 },
	{ itemName = "ruby necklace", clientId = 3016, buy = 3560 },
	{ itemName = "wedding ring", clientId = 3004, buy = 990 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)
