local internalNpcName = "Liane"
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
	lookHead = 77,
	lookBody = 98,
	lookLegs = 79,
	lookFeet = 114,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Welcome to the post office!' },
	{ text = 'Hey, send a letter to your friend now and then. Keep in touch, you know.' },
	{ text = 'If you need help with letters or parcels, just ask me. I can explain everything.' },
	{ text = 'No, no, no, there IS no parcel bug, I\'m telling you!' }
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end
	local player = Player(creature)
	if msgcontains(message, "measurements") then
		if player:getStorageValue(Storage.Postman.Mission07) >= 1 and	player:getStorageValue(Storage.Postman.MeasurementsLiane) ~= 1 then
			npcHandler:say("I have more urgent problem to attend then that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I'll see if I have the time for this nonsense. Do you have 12 arrows with you? ", npc, creature)
			npcHandler.topic[creature] = 1
	else
			npcHandler:say("...", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			if player:removeItem(2544, 12) then
				npcHandler:say("Great! Now I'll teach them a lesson ... For those measurements ... <tells you her measurements> ", npc, creature)
				player:setStorageValue(Storage.Postman.Mission07, player:getStorageValue(Storage.Postman.Mission07) + 1)
				player:setStorageValue(Storage.Postman.MeasurementsLiane, 1)
				npcHandler.topic[creature] = 0
	else
			npcHandler:say("Oh, you don\'t have it.", npc, creature)
			npcHandler.topic[creature] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello. How may I help you |PLAYERNAME|? Ask me for a trade if you want to buy something. I can also explain the {mail} system.")
npcHandler:setMessage(MESSAGE_FAREWELL, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here. Don't forget that you need to buy a label too if you want to send a parcel. Always write the name of the {receiver} in the first line.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "label", clientId = 3507, buy = 1 },
	{ itemName = "letter", clientId = 3505, buy = 8 },
	{ itemName = "parcel", clientId = 3503, buy = 15 }
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
