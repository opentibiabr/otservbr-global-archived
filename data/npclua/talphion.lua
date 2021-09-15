local internalNpcName = "Talphion"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 27,
	lookBody = 86,
	lookLegs = 126,
	lookFeet = 127
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
	if msgcontains(message, "dress pattern") then
		if player:getStorageValue(Storage.Postman.Mission06) == 3 then
			if npcHandler.topic[playerId] < 1 then
				npcHandler:say("DRESS FLATTEN? WHO WANTS ME TO FLATTEN A DRESS?", npc, creature)
				npcHandler.topic[playerId] = 1
			elseif npcHandler.topic[playerId] == 1 then
				npcHandler:say("A PRESS LANTERN? NEVER HEARD ABOUT IT!", npc, creature)
				npcHandler.topic[playerId] = 2
			elseif npcHandler.topic[playerId] == 2 then
				npcHandler:say("CHESS? I DONT PLAY CHESS!", npc, creature)
				npcHandler.topic[playerId] = 3
			elseif npcHandler.topic[playerId] == 3 then
				npcHandler:say("A PATTERN IN THIS MESS?? HEY DON'T INSULT MY MACHINEHALL!", npc, creature)
				npcHandler.topic[playerId] = 4
			elseif npcHandler.topic[playerId] == 4 then
				npcHandler:say("AH YES! I WORKED ON THE DRESS PATTERN FOR THOSE UNIFORMS. STAINLESS TROUSERES, STEAM DRIVEN BOOTS! ANOTHERMARVEL TO BEHOLD! I'LL SENT A COPY TO KEVIN IMEDIATELY!", npc, creature)
				player:setStorageValue(Storage.Postman.Mission06, 4)
				npcHandler.topic[playerId] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "crossbow", clientId = 3349, buy = 1150 },
	{ itemName = "bolt", clientId = 3446, buy = 5 }
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
