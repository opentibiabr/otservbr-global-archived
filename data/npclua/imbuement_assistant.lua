local npcName = "Imbuement Assistant"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
	lookMounts = 688
}

npcConfig.voices = {
	interval = 2000,
	chance = 50,
	{ text = "Hello adventurer, looking for Imbuement items? Just ask me!"}
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.shop = {
	{clientId = 11447, buy = 100, count = 1},
	{clientId = 16131, buy = 100, count = 1},
	{clientId = 9633, buy = 100, count = 1},
	{clientId = 11702, buy = 100, count = 1},
	{clientId = 11703, buy = 100, count = 1},
	{clientId = 11452, buy = 100, count = 1},
	{clientId = 10302, buy = 100, count = 1},
	{clientId = 14079, buy = 100, count = 1},
	{clientId = 23507, buy = 100, count = 1},
	{clientId = 9638, buy = 100, count = 1},
	{clientId = 9639, buy = 100, count = 1},
	{clientId = 9657, buy = 100, count = 1},
	{clientId = 17458, buy = 100, count = 1},
	{clientId = 14012, buy = 100, count = 1},
	{clientId = 5954, buy = 100, count = 1},
	{clientId = 9647, buy = 100, count = 1},
	{clientId = 11658, buy = 100, count = 1},
	{clientId = 18994, buy = 100, count = 1},
	{clientId = 11464, buy = 100, count = 1},
	{clientId = 9635, buy = 100, count = 1},
	{clientId = 23508, buy = 100, count = 1},
	{clientId = 25694, buy = 100, count = 1},
	{clientId = 9636, buy = 100, count = 1},
	{clientId = 11466, buy = 100, count = 1},
	{clientId = 20199, buy = 100, count = 1},
	{clientId = 9661, buy = 100, count = 1},
	{clientId = 22007, buy = 100, count = 1},
	{clientId = 20205, buy = 100, count = 1},
	{clientId = 5877, buy = 100, count = 1},
	{clientId = 5920, buy = 100, count = 1},
	{clientId = 10304, buy = 100, count = 1},
	{clientId = 9691, buy = 100, count = 1},
	{clientId = 25702, buy = 100, count = 1},
	{clientId = 10298, buy = 100, count = 1},
	{clientId = 21202, buy = 100, count = 1},
	{clientId = 21200, buy = 100, count = 1},
	{clientId = 9660, buy = 100, count = 1},
	{clientId = 22189, buy = 100, count = 1},
	{clientId = 10196, buy = 100, count = 1},
	{clientId = 21975, buy = 100, count = 1},
	{clientId = 10420, buy = 100, count = 1},
	{clientId = 9663, buy = 100, count = 1},
	{clientId = 9641, buy = 100, count = 1},
	{clientId = 17823, buy = 100, count = 1},
	{clientId = 11484, buy = 100, count = 1},
	{clientId = 9640, buy = 100, count = 1},
	{clientId = 9650, buy = 100, count = 1},
	{clientId = 11444, buy = 100, count = 1},
	{clientId = 28567, buy = 100, count = 1},
	{clientId = 11492, buy = 100, count = 1},
	{clientId = 18993, buy = 100, count = 1},
	{clientId = 10311, buy = 100, count = 1},
	{clientId = 21801, buy = 100, count = 1},
	{clientId = 20200, buy = 100, count = 1},
	{clientId = 21194, buy = 100, count = 1},
	{clientId = 9694, buy = 100, count = 1},
	{clientId = 22730, buy = 100, count = 1},
	{clientId = 10309, buy = 100, count = 1},
	{clientId = 9686, buy = 100, count = 1},
	{clientId = 10307, buy = 100, count = 1},
	{clientId = 9685, buy = 100, count = 1},
	{clientId = 22728, buy = 100, count = 1},
	{clientId = 9654, buy = 100, count = 1},
	{clientId = 10405, buy = 100, count = 1},
	{clientId = 14081, buy = 100, count = 1},
	{clientId = 22053, buy = 100, count = 1},
	{clientId = 10295, buy = 100, count = 1},
	{clientId = 9665, buy = 100, count = 1},
	{clientId = 9644, buy = 100, count = 1}
}

-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost), npc, player)
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, amount, name, totalCost, clientId)
	k(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

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

-- On creature say callback
local function creatureSayCallback(npc, creature, type, msg)
	local player = Player(creature)
	if not npcHandler:isFocused(creature) then
		return false
	end

	-- Open shop window
	if msgcontains(msg, "trade") then
		npc:openShopWindow(player)
	end

	local messagesTable = {
		["job"] = "Currently I have been working selling items for imbuement."
	}

	return npcHandler:sendMessages(msg, messagesTable, npc, creature, true, 3000)
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Imbuement's shop! Say {trade} for look my offers.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
