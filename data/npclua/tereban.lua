dofile("data/npclua/tereban_functions.lua")

local npcType = Game.createNpcType("Tereban")
local npcConfig = {}

npcConfig.description = "Tereban"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 38,
    lookBody = 48,
    lookLegs = 20,
    lookFeet = 76,
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

function creatureSayCallback(npc, creature, type, msg)
	if not npcHandler:isFocused(creature) then
		return false
	end

	parseTerebanSay(npc, creature, msg, npcHandler)
	return true
end

local function onReleaseFocus(creature)
	message[creature] = nil
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings, friend. Good you are showing up.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
