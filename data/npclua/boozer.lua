local internalNpcName = "Boozer"
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
	lookHead = 76,
	lookBody = 20,
	lookLegs = 116,
	lookFeet = 76,
	lookAddons = 0
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
	if msgcontains(message, "mission") then
		if player:getStorageValue(Storage.TibiaTales.ultimateBoozeQuest) == 2 and player:removeItem(7495, 1) then
			player:setStorageValue(Storage.TibiaTales.ultimateBoozeQuest, 3)
			npcHandler.topic[creature] = 0
			player:addItem(5710, 1)
			player:addItem(2152, 10)
			player:addExperience(100, true)
			npcHandler:say("Yessss! Now I only need to build my own small brewery, figure out the secret recipe, duplicate the dwarvish brew and BANG I'll be back in business! Here take this as a reward.", npc, creature)
		elseif player:getStorageValue(Storage.TibiaTales.ultimateBoozeQuest) < 1 then
			npcHandler.topic[creature] = 1
			npcHandler:say("Shush!! I don't want everybody to know what I am up to. Listen, things are not going too well, I need a new attraction. Do you want to help me?", npc, creature)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
			player:setStorageValue(Storage.TibiaTales.ultimateBoozeQuest, 1)
			player:addItem(7496, 1)
			npcHandler:say("Good! Listen closely. Take this bottle and go to Kazordoon. I need a sample of their very special brown ale. You may find a cask in their brewery. Come back as soon as you got it.", npc, creature)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "bread", clientId = 3600, buy = 4 },
	{ itemName = "cask of brown ale", clientId = 8774, buy = 3000 },
	{ itemName = "cheese", clientId = 3607, buy = 6 },
	{ itemName = "cookie", clientId = 3598, buy = 5 },
	{ itemName = "ham", clientId = 3582, buy = 8 },
	{ itemName = "ice cream cone", clientId = 229, buy = 10 },
	{ itemName = "meat", clientId = 3577, buy = 5 },
	{ itemName = "mug of beer", clientId = 2880, buy = 2, count = 3 },
	{ itemName = "mug of wine", clientId = 2880, buy = 3, count = 15 },
	{ itemName = "mug of lemonade", clientId = 2880, buy = 2, count = 5 },
	{ itemName = "mug of water", clientId = 2880, buy = 2, count = 1 }
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
