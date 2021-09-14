local internalNpcName = "Grombur"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 114,
	lookBody = 77,
	lookLegs = 79,
	lookFeet = 114
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
	local playerId = creature:getId()
	local player = Player(creature)

	if msgcontains(message, "nokmir") then
		if player:getStorageValue(Storage.HiddenCityOfBeregar.JusticeForAll) == 2 then
			npcHandler:say("Oh well, I liked Nokmir. He used to be a good dwarf until that day on which he stole the ring from {Rerun}.", npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, "rerun") then
		if npcHandler.topic[playerId] == 1 then
			player:setStorageValue(Storage.HiddenCityOfBeregar.JusticeForAll, 3)
			npcHandler:say("Yeah, he's the lucky guy in this whole story. I heard rumours that emperor Rehal had plans to promote Nokmir, but after this whole thievery story, he might pick Rerun instead.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, "mission") then
		if player:getStorageValue(Storage.HiddenCityOfBeregar.TheGoodGuard) < 1 then
			npcHandler:say("Got any dwarven brown ale?? I DON'T THINK SO....and Bolfana, the tavern keeper, won't sell you anything. I'm sure about that...she doesn't like humans... I tell you what, if you get me a cask of dwarven brown ale, I allow you to enter the mine. Alright?", npc, creature)
			npcHandler.topic[playerId] = 2
		elseif player:getStorageValue(Storage.HiddenCityOfBeregar.TheGoodGuard) == 1 and player:removeItem(9689, 1) then
			player:setStorageValue(Storage.HiddenCityOfBeregar.TheGoodGuard, 2)
			player:setStorageValue(Storage.HiddenCityOfBeregar.DoorSouthMine, 1)
			npcHandler:say("HOW?....WHERE?....AHHHH, I don't mind....SLUUUUUURP....tastes a little flat but I had worse. Thank you. Just don't tell anyone that I let you in.", npc, creature)
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 2 then
			player:setStorageValue(Storage.HiddenCityOfBeregar.TheGoodGuard, 1)
			player:setStorageValue(Storage.HiddenCityOfBeregar.DefaultStart, 1)
			npcHandler:say("Haha, fine! Don't waste time and get me the ale. See you.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "See you my friend.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you my friend.")
npcHandler:setMessage(MESSAGE_GREET, "STOP RIGHT THERE!..... Oh, just a human. What's up big guy?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
