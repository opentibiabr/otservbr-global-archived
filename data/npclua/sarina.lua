local internalNpcName = "Sarina"
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
	lookHead = 41,
	lookBody = 72,
	lookLegs = 95,
	lookFeet = 96,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'General equipment and all sorts of goods. Visit my store!'}
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

npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What can I do for you? If you need adventure equipment, ask me for a {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. {Footballs} have to be purchased separately.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "closed trap", clientId = 3481, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "fishing rod", clientId = 3483, sell = 40 },
	{ itemName = "machete", clientId = 3308, sell = 6 },
	{ itemName = "pick", clientId = 3456, sell = 15 },
	{ itemName = "rope", clientId = 3003, sell = 15 },
	{ itemName = "scythe", clientId = 3453, sell = 10 },
	{ itemName = "shovel", clientId = 3457, sell = 8 },
	{ itemName = "watch", clientId = 2906, sell = 6 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	-- Buyable items
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3, count = 0 },
	{ itemName = "bucket", clientId = 2873, buy = 4, count = 0 },
	{ itemName = "candelaburm", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "cup", clientId = 2881, buy = 3, count = 0 },
	{ itemName = "document", clientId = 2818, buy = 12 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 35 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "parchment", clientId = 2814, buy = 8 },
	{ itemName = "parchment", clientId = 2817, buy = 8 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "plate", clientId = 2905, buy = 6 },
	{ itemName = "present", clientId = 3218, buy = 10 },
	{ itemName = "purple backpack", clientId = 2868, buy = 20 },
	{ itemName = "purple bag", clientId = 2860, buy = 5 },
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "scroll", clientId = 2815, buy = 5 },
	{ itemName = "scythe", clientId = 3453, buy = 50 },
	{ itemName = "shovel", clientId = 3457, buy = 50 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "vial of oil", clientId = 2874, buy = 20, count = 11 },
	{ itemName = "watch", clientId = 2906, buy = 20 },
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
