local internalNpcName = "Chief Grarkharok"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 281
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Grarkharok\'s bestest troll tribe! Yeee, good name!' },
	{ text = 'Grarkharok make new tribe here! Me Chief now!' },
	{ text = 'Me like to throw rocks, me also like frogs! Yumyum!' }
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
	if msgcontains(message, 'cloak') then
		if (player:getStorageValue(Storage.ThreatenedDreams.TroubledMission01) == 13) then
			player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 14)
			npcHandler:say("Hahaha! Grarkharok take cloak from pretty girl. Then ... girl is swan. Grarkharok wants eat but flies away. Grarkharok not understand. Not need cloak, too many feathers. Give cloak to To ... Ta ... Tereban in Edron. Getting shiny coins and meat.", npc, creature)
		else
			npcHandler:say("You are not on that mission.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Me Chief Grarkharok! No do {nothing}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Grarkharok be {chief}!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Grarkharok be {chief}!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


npcType:register(npcConfig)
