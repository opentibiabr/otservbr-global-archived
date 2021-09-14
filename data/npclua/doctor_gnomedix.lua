local internalNpcName = "Doctor Gnomedix"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 493,
	lookHead = 85,
	lookBody = 85,
	lookLegs = 85,
	lookFeet = 85,
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
	local player = Player(creature)
	if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 5 then
		npcHandler:setMessage(MESSAGE_GREET, "Stand still on the examination platform |PLAYERNAME|.")
		player:setStorageValue(Storage.BigfootBurden.QuestLine, 6)
	end
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
