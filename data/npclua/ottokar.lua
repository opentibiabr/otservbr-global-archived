local internalNpcName = "Ottokar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 153,
	lookHead = 132,
	lookBody = 121,
	lookLegs = 120,
	lookFeet = 114,
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
	if msgcontains(message, 'belongings of deceasead') or msgcontains(message, 'medicine') then
		if player:getItemCount(13506) > 0 then
			npcHandler:say('Did you bring me the medicine pouch?', npc, creature)
			npcHandler.topic[playerId] = 1
		else
			npcHandler:say('I need a {medicine pouch}, to give you the {belongings of deceased}. Come back when you have them.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, 'yes') and npcHandler.topic[playerId] == 1 then
		if player:removeItem(13506, 1) then
			player:addItem(13670, 1)
			player:addAchievementProgress('Doctor! Doctor!', 100)
			npcHandler:say('Here you are', npc, creature)
		else
			npcHandler:say('You do not have the required items.', npc, creature)
		end
		npcHandler.topic[playerId] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
