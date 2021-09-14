local internalNpcName = "Buddel"
local npcType = Game.createNpcType("Buddel (Raider Camp)")
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 143,
	lookHead = 19,
	lookBody = 57,
	lookLegs = 22,
	lookFeet = 20,
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

-- Travel
local function addTravelKeyword(keyword, text, destination, condition)
	if condition then
		keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'No, no, no, you even are no barb....barba...er.. one of us!!!! Talk to the Jarl first! '}, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text, cost = 50, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = 50, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'You shouldn\'t miss the experience.', reset = true})
end

addTravelKeyword('svargrond', 'You know a town nicer than this? NICER DICER! Apropos, don\'t play dice when you are drunk ...', Position(32255, 31197, 7))
addTravelKeyword('okolnir', 'It\'s nice there. Except of the ice dragons which are not very companionable.', Position(32225, 31381, 7), function(player) return player:getStorageValue(Storage.BarbarianTest.Questline) < 8 end)
addTravelKeyword('helheim', 'T\'at is a small island to the east.', Position(32462, 31174, 7), function(player) return player:getStorageValue(Storage.BarbarianTest.Questline) < 8 end)
addTravelKeyword('tyrsung', '*HICKS* Big, big island east of here. Venorian hunters settled there ..... I could bring you north of their camp.', Position(32333, 31227, 7), function(player) return player:getStorageValue(Storage.BarbarianTest.Questline) < 8 end)

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, text = 'Get out o\' here!*HICKS*', destination = {Position(32020, 31297, 7), Position(32021, 31297, 7), Position(32022, 31297, 7)}})

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = "Where are we at the moment? Is this Svargrond? Ahh yes!*HICKS* Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = "Where are we at the moment? Is this Svargrond? Ahh yes!*HICKS* Where do you want to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = "Where are we at the moment? Is this Svargrond? Ahh yes!*HICKS* Where do you want to go?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = "Where are we at the moment? Is this Svargrond? Ahh yes!*HICKS* Where do you want to go?"})

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "compass", clientId = 10302, sell = 45 }
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
