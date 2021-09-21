local internalNpcName = "Chrak"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 115
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "battle") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 24 then
			npcHandler:say({
				"Zo you want to enter ze arena, you know ze rulez and zat zere will be no ozer option zan deaz or victory? ...",
				"My mazter wantz to zurprize hiz opponentz by an unexpected move. He will uze warriorz from ze outzide, zomeone zat no one can azzezz. ...",
				"One of ziz warriorz could be you. Or you could ztay here and rot in ze dungeon. Are you interezted in ziz deal?"
			}, npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	elseif msgcontains(message, "mission") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 26 then
			npcHandler:say({
				"You have done ze impozzible and beaten ze champion. Your mazter will be pleazed. Hereby I cleanze ze poizon from your body. You are now allowed to leave. ...",
				"For now ze mazter will zee zat you and your alliez are zpared of ze wraz of ze dragon emperor az you are unimportant for hiz goalz. ...",
				"You may crawl back to your alliez and warn zem of ze gloriouz might of ze dragon emperor and hiz minionz."
			}, npc, creature)
			player:setStorageValue(Storage.TheNewFrontier.Questline, 27)
			player:setStorageValue(Storage.TheNewFrontier.Mission09, 3) --Questlog, The New Frontier Quest "Mission 09: Mortal Combat"
			npcHandler:setTopic(playerId, 0)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("Asss you wishzz.", npc, creature)
			player:setStorageValue(Storage.TheNewFrontier.Questline, 25)
			player:setStorageValue(Storage.TheNewFrontier.Mission08, 2) --Questlog, The New Frontier Quest "Mission 08: An Offer You Can't Refuse"
			player:setStorageValue(Storage.TheNewFrontier.Mission09, 1) --Questlog, The New Frontier Quest "Mission 09: Mortal Combat"
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
