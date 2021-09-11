local internalNpcName = "Tehlim"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 66,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
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
	if msgcontains(message, "mission") then
		if Player(creature):getStorageValue(Storage.HiddenCityOfBeregar.RoyalRescue) < 300 then
			npcHandler:say("I warn you, those trolls are WAY more dangerous than the usual kind. Alone, I can't do anything for my brothers. Find a way to the trolls' hideout and rescue my brothers. Are you willing to help me?", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			Player(creature):setStorageValue(Storage.HiddenCityOfBeregar.RoyalRescue, 4)
			npcHandler:say(" Great! I hope you find my brothers. Good luck!", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "See you my friend.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you my friend.")
npcHandler:setMessage(MESSAGE_GREET, "Hello. I'm so glad someone has found me. Did you meet THEM?!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
