local internalNpcName = "Charlotta"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 157,
	lookHead = 38,
	lookBody = 97,
	lookLegs = 115,
	lookFeet = 95,
	lookAddons = 1
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
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end
	local player = Player(creature)
	if msgcontains(message, "errand") or msgcontains(message, "gold") then
		if player:getStorageValue(Storage.TheShatteredIsles.TheErrand) == 1 then
			npcHandler:say("Oh, so you brought some gold from Eleonore to me?", npc, creature)
			npcHandler.topic[creature] = 1
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			if player:removeMoneyNpc(200) then
				npcHandler:say("Hmm, it seems that Eleonore does trust you. Perhaps she is even right. However. Since we need some help right now I guess we can't be too picky. Return to Eleonore and tell her the secret password: 'peg leg'. She will tell you more about her problem.", npc, creature)
				player:setStorageValue(Storage.TheShatteredIsles.TheErrand, 2)
				npcHandler.topic[creature] = 2
			else
				npcHandler:say("You don't have enough...", npc, creature)
			end
		end
	elseif msgcontains(message, "no") then
		if npcHandler.topic[creature] >= 1 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ah, welcome! Welcome |PLAYERNAME|! If you need druid spells, you've come to the right place. Otherwise it's just nice to have a visitor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh well.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
