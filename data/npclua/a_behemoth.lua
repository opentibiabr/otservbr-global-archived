local internalNpcName = "A Behemoth"

local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 55
}

npcConfig.flags = {
	attackable = false,
	hostile = false,
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

if not UNDERCOVER_CONTACTED then
	UNDERCOVER_CONTACTED = {}
end

function greetCallback(npc, creature)
	local player = Player(creature)
	local SPIKE_STORAGE = player:getStorageValue(SPIKE_LOWER_UNDERCOVER_MAIN)

	if table.contains({-1, 3}, SPIKE_STORAGE) then
		npcHandler:setMessage(MESSAGE_GREET, "Pssst! Keep it down! <gives you an elaborate report on monster activity>"
		return true
	end

	if not UNDERCOVER_CONTACTED[player:getGuid()] then
		UNDERCOVER_CONTACTED[player:getGuid()] = {}
	end

	if table.contains(UNDERCOVER_CONTACTED[player:getGuid()], npc:getId()) then
		npcHandler:setMessage(MESSAGE_GREET, "Pssst! Keep it down! <gives you an elaborate report on monster activity>")
		return true
	end

	player:setStorageValue(SPIKE_LOWER_UNDERCOVER_MAIN, SPIKE_STORAGE + 1)
	table.insert(UNDERCOVER_CONTACTED[player:getGuid()], npc:getId())
	npcHandler:releaseFocus(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Pssst! Keep it down! <gives you an elaborate report on monster activity>")
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
