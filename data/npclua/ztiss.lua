local internalNpcName = "Ztiss"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 340
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
	if msgcontains(message, "offer") then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 23 then
		npcHandler:say("You are ztill a captive and your life is forfeit. Zere might be a way for you to ezcape if you agree to {work} for my mazter.", npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, "work") then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say({
				"Zere iz a great tournament of ztrengz each decade. It determinez ze granted privilegez for zertain individualz of power for ze comming decade. ...",
				"My mazter wantz to zurprize hiz opponentz by an unexpected move. He will uze warriorz from ze outzide, zomeone zat no one can azzezz. ...",
				"One of ziz warriorz could be you. Or you could ztay here and rot in ze dungeon. Are you interezted in ziz deal?"
			}, npc, creature)
			npcHandler.topic[playerId] = 2
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 2 then
			npcHandler:say({
				"You are zmart for a zoftzkin, but before you begin to feel too zmart, you should know zat we will zeal our deal wiz you drinking a ztrong poizon zat will inevitably kill you if you want to trick me and not attend ze tournament. ...",
				"Zo are you ready to drink ziz poizon here?"
			}, npc, creature)
			npcHandler.topic[playerId] = 3
		elseif npcHandler.topic[playerId] == 3 then
			npcHandler:say({
				"Excellent! Now you may leave ziz area zrough ze teleporter to ze norz. It will bring you to a hidden boat. Ziz boat will take you to ze tournament izle. ...",
				"Zere you'll learn anyzing you need to know about ze great tournament."
			}, npc, creature)
			player:setStorageValue(Storage.TheNewFrontier.Questline, 24)
			player:setStorageValue(Storage.TheNewFrontier.Mission07, 3) --Questlog, The New Frontier Quest "Mission 07: Messengers Of Peace"
			player:setStorageValue(Storage.TheNewFrontier.Mission08, 1) --Questlog, The New Frontier Quest "Mission 08: An Offer You Can't Refuse"
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
