local internalNpcName = "Telas"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 39,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 76,
	lookAddons = 1
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
	if(msgcontains(message, "farmine")) then
		if(player:getStorageValue(Storage.TheNewFrontier.Questline) == 15) then
			npcHandler:say("I have heard only little about this mine. I am a bit absorbed in my studies. But what does this mine have to do with me?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif(msgcontains(message, "reason")) then
		if(npcHandler:getTopic(playerId) == 1) then
			if(player:getStorageValue(Storage.TheNewFrontier.BribeTelas) < 1) then
				npcHandler:say("Well it sounds like a good idea to test my golems in some real environment. I think it is acceptable to send some of them to Farmine.", npc, creature)
				player:setStorageValue(Storage.TheNewFrontier.BribeTelas, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "ancient stone", clientId = 9632, sell = 200 },
	{ itemName = "battle stone", clientId = 11447, sell = 290 },
	{ itemName = "broken gladiator shield", clientId = 9656, sell = 190 },
	{ itemName = "coal", clientId = 12600, sell = 20 },
	{ itemName = "crystal of balance", clientId = 9028, sell = 1000 },
	{ itemName = "crystal of focus", clientId = 9027, sell = 2000 },
	{ itemName = "crystal of power", clientId = 9067, sell = 3000 },
	{ itemName = "crystal pedestal", clientId = 9063, sell = 500 },
	{ itemName = "crystalline spikes", clientId = 16138, sell = 440 },
	{ itemName = "flintstone", clientId = 12806, sell = 800 },
	{ itemName = "gear crystal", clientId = 9655, sell = 200 },
	{ itemName = "gear wheel", clientId = 8775, sell = 500 },
	{ itemName = "huge chunk of crude iron", clientId = 5892, sell = 15000 },
	{ itemName = "magma clump", clientId = 16130, sell = 570 },
	{ itemName = "metal spike", clientId = 10298, sell = 320 },
	{ itemName = "piece of draconian steel", clientId = 5889, sell = 3000 },
	{ itemName = "piece of hell steel", clientId = 5888, sell = 500 },
	{ itemName = "piece of hellfire armor", clientId = 9664, sell = 550 },
	{ itemName = "piece of royal steel", clientId = 5887, sell = 10000 },
	{ itemName = "pulverized ore", clientId = 16133, sell = 400 },
	{ itemName = "shiny stone", clientId = 10310, sell = 500 },
	{ itemName = "stone nose", clientId = 16137, sell = 590 },
	{ itemName = "sulphurous stone", clientId = 10315, sell = 100 },
	{ itemName = "vein of ore", clientId = 16135, sell = 330 },
	{ itemName = "war crystal", clientId = 9654, sell = 460 }
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
