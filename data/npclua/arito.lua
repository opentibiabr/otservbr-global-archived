local internalNpcName = "Arito"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 59,
	lookBody = 111,
	lookLegs = 99,
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

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	local AritosTask = player:getStorageValue(Storage.TibiaTales.AritosTask)
		-- START TASK
	if msgcontains(message, "nomads") then
		if player:getStorageValue(Storage.TibiaTales.AritosTask) <= 0 and player:getItemCount(8267) >= 0 then
			npcHandler:say({
				'What?? My name on a deathlist which you retrieved from a nomad?? Show me!! ...',
				'Oh my god! They found me! You must help me! Please !!!!'
			}, npc, creature)
			if player:getStorageValue(Storage.TibiaTales.DefaultStart) <= 0 then
				player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
			end
			player:setStorageValue(Storage.TibiaTales.AritosTask, 1)
		-- END TASK
		elseif player:getStorageValue(Storage.TibiaTales.AritosTask) == 2 then
			npcHandler:say({
				'These are great news!! Thank you for your help! I don\'t have much, but without you I wouldn\'t have anything so please take this as a reward.'
			}, npc, creature)
			player:setStorageValue(Storage.TibiaTales.AritosTask, 3)
			player:addItem(2152, 50)
		end
		return true
	end
end

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Come in, have a drink and something to eat.'}
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be mourned, pilgrim in flesh. Be mourned in my tavern.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Do visit us again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Do visit us again.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, browse through my offers.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "ice cube", clientId = 7441, sell = 250 },
	-- Buyable items
	{ itemName = "bread", clientId = 3600, buy = 8 },
	{ itemName = "cheese", clientId = 3607, buy = 12 },
	{ itemName = "fish", clientId = 3578, buy = 6 },
	{ itemName = "ham", clientId = 3582, buy = 16 },
	{ itemName = "meat", clientId = 3577, buy = 10 },
	{ itemName = "mug of water", clientId = 2880, buy = 1, count = 1 },
	{ itemName = "mug of beer", clientId = 2880, buy = 2, count = 3 },
	{ itemName = "mug of lemonade", clientId = 2880, buy = 2, count = 5 },
	{ itemName = "mug of wine", clientId = 2880, buy = 3, count = 15 }
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
