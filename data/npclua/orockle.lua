local internalNpcName = "Orockle"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeex = 14892
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
--[[
	if msgcontains(message, "fight") then
		npcHandler:say("You can help in the fight against the hive. There are several missions available to destabilise the hive. Just ask for them if you want to learn more. After completing many missions you might be worthy to get a reward.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif msgcontains(message, "mission") then
		npcHandler:say("You could try to blind the hive, you might disrupt its digestion, you could gather acid or you can disable the swarm pores. ...", npc, creature)
		npcHandler:setTopic(playerId, 2)

	elseif msgcontains(message, "yes") then
		if npcHandler:getTopic(playerId) == 2 then
			npcHandler:say("So be it. Now you are a member of the inquisition. You might ask me for a mission to raise in my esteem.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
--]]
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "blob bomb", clientId = 13976, buy = 150 },
	{ itemName = "flask of chitin dissolver", clientId = 14052, buy = 150 },
	{ itemName = "gooey substance", clientId = 14051, buy = 150 },
	{ itemName = "reagent flask", clientId = 14054, buy = 200 },
	{ itemName = "strange powder", clientId = 13974, buy = 150 },
	{ itemName = "swarmer drum", clientId = 14255, buy = 200 }
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
