local internalNpcName = "Theodore Loveless"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 19,
	lookBody = 95,
	lookLegs = 76,
	lookFeet = 114,
	lookAddons = 1
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

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	if msgcontains(message, 'cigar') then
		npcHandler:say('Oh my. Have you gotten an exquisite cigar for me, my young friend?', npc, creature)
		npcHandler.topic[creature] = 1
	elseif msgcontains(message, 'yes') and npcHandler.topic[creature] == 1 then
		local player = Player(creature)
		if not player:removeItem(7499, 1) then
			npcHandler.topic[creature] = 0
			return true
		end

		player:setStorageValue(Storage.WhatAFoolish.Cigar, 1)
		Npc():getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
		npcHandler:say({
			'Ah what a fine blend. I really ...',
			'OUCH! What have you done you fool? How dare you???'
		}, npc, creature)
		npcHandler.topic[creature] = 0
	elseif msgcontains(message, 'no') and npcHandler.topic[creature] == 1 then
		npcHandler:say('Oh, then there must be a misunderstanding.', npc, creature)
		npcHandler.topic[creature] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
