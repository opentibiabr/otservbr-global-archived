local internalNpcName = "Karl"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 58,
	lookBody = 49,
	lookLegs = 70,
	lookFeet = 115,
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

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)

	if msgcontains(message, 'barrel') then
		if player:getStorageValue(Storage.SecretService.AVINMission03) == 2 then
			npcHandler:say('Do you bring me a barrel of beer??', npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, 'whisper beer') then
		if player:getStorageValue(Storage.TheShatteredIsles.ReputationInSabrehaven) == 11 then
			npcHandler:say('Do you want to buy a bottle of our finest whisper beer for 80 gold?', npc, creature)
			npcHandler.topic[playerId] = 2
		end
	elseif msgcontains(message, 'yes') then
		if npcHandler.topic[playerId] == 1 then
			if player:removeItem(7706, 1) then
				player:setStorageValue(Storage.SecretService.AVINMission03, 3)
				npcHandler:say('Three cheers for the noble |PLAYERNAME|.', npc, creature)
			else
				npcHandler:say("You don't have any barrel of beer!", npc, creature)
			end
			npcHandler.topic[playerId] = 0
		elseif npcHandler.topic[playerId] == 2 then
			if player:getStorageValue(Storage.TheShatteredIsles.ReputationInSabrehaven) == 11 then
				if player:removeMoneyBank(80) then
					npcHandler:say("Here. Don't take it into the city though.", npc, creature)
					player:setStorageValue(Storage.TheShatteredIsles.ReputationInSabrehaven, 12)
					player:addItem(6106, 1)
					npcHandler.topic[playerId] = 0
				else
					npcHandler:say("You don't have enough money.", npc, creature)
				end
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back, but don't tell others.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back, but don't tell others.")
npcHandler:setMessage(MESSAGE_GREET, 'Pshhhht! Not that loud ... but welcome.')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "mug of beer", clientId = 2880, buy = 20, count = 3 },
	{ itemName = "bottle of whisper beer", clientId = 6106, buy = 80 }
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
