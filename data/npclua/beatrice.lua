local internalNpcName = "Beatrice"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 136,
	lookHead = 96,
	lookBody = 103,
	lookLegs = 69,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Selling general goods and paperware! Come to my shop!'}
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
	if msgcontains(message, "football") then
		npcHandler:say("Do you want to buy a football for 111 gold?", npc, creature)
		npcHandler.topic[playerId] = 1
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 1 then
			local player = Player(creature)
			if player:getMoney() + player:getBankBalance() >= 111 then
				npcHandler:say("Here it is.", npc, creature)
				player:addItem(2109, 1)
				player:removeMoneyBank(111)
			else
				npcHandler:say("You don't have enough money.", npc, creature)
			end
		npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "See you later, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you later, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "closed trap", clientId = 3481, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "fishing rod", clientId = 3483, sell = 40 },
	{ itemName = "inkwell", clientId = 3509, sell = 8 },
	{ itemName = "machete", clientId = 3308, sell = 6 },
	{ itemName = "mirror", clientId = 3463, sell = 10 },
	{ itemName = "pick", clientId = 3456, sell = 15 },
	{ itemName = "rope", clientId = 3003, sell = 15 },
	{ itemName = "scythe", clientId = 3453, sell = 10 },
	{ itemName = "shovel", clientId = 3457, sell = 8 },
	{ itemName = "sickle", clientId = 3293, sell = 3 },
	{ itemName = "watch", clientId = 2906, sell = 6 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	-- Buyable items
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "blue backpack", clientId = 2869, buy = 20 },
	{ itemName = "blue bag", clientId = 2861, buy = 5 },
	{ itemName = "bottle", clientId = 2875, buy = 3, count = 0 },
	{ itemName = "bucket", clientId = 2873, buy = 4, count = 0 },
	{ itemName = "candelabrum", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "lamp", clientId = 2914, buy = 8 },
	{ itemName = "machete", clientId = 3308, buy = 35 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "scythe", clientId = 3453, buy = 50 },
	{ itemName = "shovel", clientId = 3457, buy = 50 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "watch", clientId = 2906, buy = 20 },
	{ itemName = "waterball", clientId = 893, buy = 222 },
	{ itemName = "worm", clientId = 3492, buy = 1 }
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
