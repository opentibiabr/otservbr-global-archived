local internalNpcName = "A Beggar"

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
	lookHead = 39,
	lookBody = 39,
	lookLegs = 39,
	lookFeet = 76,
	lookAddons = 0
}

npcConfig.flags = {
	attackable = false,
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

	local player = Player(creature)
	if not player then
		return false
	end

	if msgcontains(message, "want") then
		if player:getStorageValue(Storage.DarkTrails.Mission01) == 1 then
			npcHandler.topic[player] = 1
		end
		npcHandler:say("The guys from the magistrate sent you here, didn't they?", npc, player)
	elseif msgcontains(message, "yes")  then
		if npcHandler.topic[player] == 1 then
			npcHandler:say({
				"Thought so. You'll have to talk to the king though. The beggar king that is. The king does not grant an audience to just everyone. You know how those kings are, don't you? ... ",
				"However, to get an audience with the king, you'll have to help his subjects a bit. ... ",
				"His subjects that would be us, the poor, you know? ... ",
				"So why don't you show your dedication to the poor? Go and help Chavis at the poor house. He's collecting food for people like us. ... ",
				"If you brought enough of the stuff you'll see that the king will grant you entrance in his {palace}."
			}, npc, player, 100)
			npcHandler.topic[player] = 0
			-- Mission 1 end
			player:setStorageValue(Storage.DarkTrails.Mission01, 2)
			-- Mission 2 start
			player:setStorageValue(Storage.DarkTrails.Mission02, 1)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hi! What is it, what d'ye {want}?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)
