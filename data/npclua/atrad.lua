local internalNpcName = "Atrad"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 152,
	lookHead = 77,
	lookBody = 113,
	lookLegs = 132,
	lookFeet = 94,
	lookAddons = 3
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

function greetCallback(npc, creature)
	local player = Player(creature)
	local fire = player:getCondition(CONDITION_FIRE)
	
	if fire and (player:hasOutfit(156) or player:hasOutfit(152)) then
		return true
	end
	return false
end

function creatureSayCallback(npc, creature, type, message)
	if(msgcontains(message, "addon") or msgcontains(message, "outfit")) then
		if(getPlayerStorageValue(creature, Storage.Atrad) < 1) then
			npcHandler:say("You managed to deceive Erayo? Impressive. Well, I guess, since you have come that far, I might as well give you a task too, eh?", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	elseif(msgcontains(message, "nose ring") or msgcontains(message, "ring")) then
		if(getPlayerStorageValue(creature, Storage.Atrad) == 1) then
			if(getPlayerItemCount(creature, 5804) >= 1) and getPlayerItemCount(creature, 5930) >= 1 then
				npcHandler:say("I see you brought my stuff. Good. I'll keep my promise: Here's katana in return.", npc, creature)
				doPlayerRemoveItem(creature, 5804, 1)
				doPlayerRemoveItem(creature, 5930, 1)
				doPlayerAddOutfit(creature, getPlayerSex(creature) == 0 and 156 or 152, 2)
				setPlayerStorageValue(creature, Storage.Atrad, 2) -- exaust
				npcHandler:setTopic(playerId, 0)
			else
				npcHandler:say("You don't have it...", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		end
	elseif(msgcontains(message, "yes")) then
		if(npcHandler:getTopic(playerId) == 2) then
			npcHandler:say("Okay, listen up. I don't have a list of stupid objects, I just want two things. A behemoth claw and a nose ring. Got that?", npc, creature)
			npcHandler:setTopic(playerId, 3)
		elseif(npcHandler:getTopic(playerId) == 3) then
			npcHandler:say("Good. Come back then you have BOTH. Should be clear where to get a behemoth claw from. There's a horned fox who wears a nose ring. Good luck.", npc, creature)
			setPlayerStorageValue(creature, Storage.Atrad, 1)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "assassin star", clientId = 7368, buy = 100 }
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
