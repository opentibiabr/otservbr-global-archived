local internalNpcName = "Zumtah"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 51
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

local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({lookType = 352})
condition:setTicks(-1)

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, "exit") then
		if player:getStorageValue(Storage.WrathoftheEmperor.ZumtahStatus) ~= 1 then
			if npcHandler.topic[playerId] < 1 then
				npcHandler:say("Oh of course, may I show you around a bit before? You want to go straight to the exit? Would you please follow me. Oh right, I am terribly sorry but THERE IS NONE. Will you finally give it up please?", npc, creature)
				npcHandler.topic[playerId] = 1
			elseif npcHandler.topic[playerId] == 3 then
				npcHandler.topic[playerId] = 4
			elseif npcHandler.topic[playerId] == 6 then
				npcHandler.topic[playerId] = 7
			elseif npcHandler.topic[playerId] == 10 then
				npcHandler:say("Oh, you mean - if I have ever been out of here in those 278 years? Well, I - I can't remember. No, I can't remember. Sorry.", npc, creature)
				npcHandler.topic[playerId] = 11
			elseif npcHandler.topic[playerId] == 11 then
				npcHandler:say("No, I really can't remember. I enjoyed my stay here so much that I forgot how it looks outside of this hole. Outside. The air, the sky, the light. Oh well... well.", npc, creature)
				npcHandler.topic[playerId] = 12
			elseif npcHandler.topic[playerId] == 12 then
				npcHandler:say("Oh yes, yes. I... I never really thought about how you creatures feel in here I guess. I... just watched all these beings die here. ...", npc, creature)
				npcHandler.topic[playerId] = 13
			elseif npcHandler.topic[playerId] == 13 then
				npcHandler:say("Oh, excuse me of course, you... wanted to go. Like all... the others. I am sorry, so sorry. You... you can leave. Yes. You can go. You are free. I shall stay here and help every poor soul which ever gets thrown in here from this day onward. ...", npc, creature)
				npcHandler.topic[playerId] = 14
			elseif npcHandler.topic[playerId] == 14 then
				npcHandler:say({
					"Alright, as I said you are free now. There will not be an outside for the next three centuries, but you - go. ...",
					"Oh and I recovered the strange crate you where hiding in, it will wait for you at the exit since you can't carry it as... a beetle, muhaha. Yes, you shall now crawl through the passage as a beetle. There you go."
				}, npc, creature)
				npcHandler.topic[playerId] = 0
				player:setStorageValue(Storage.WrathoftheEmperor.ZumtahStatus, 1)
				player:setStorageValue(Storage.WrathoftheEmperor.PrisonReleaseStatus, 1)
				player:addCondition(condition)
			end
		else
			npcHandler:say("It's you, why did they throw you in here again? Anyway, I will just transform you once more. I also recovered your crate which will wait for you at the exit. There, feel free to go.", npc, creature)
			player:setStorageValue(Storage.WrathoftheEmperor.PrisonReleaseStatus, 1)
			player:addCondition(condition)
		end
	elseif msgcontains(message, "no") then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say("You are starting to get on my nerves. Is this the only topic you know?", npc, creature)
			npcHandler.topic[playerId] = 2
		elseif npcHandler.topic[playerId] == 4 then
			npcHandler.topic[playerId] = 5
		elseif npcHandler.topic[playerId] == 7 then
			npcHandler.topic[playerId] = 8
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[playerId] == 2 then
			npcHandler:say("Pesky, persistent human.", npc, creature)
			npcHandler.topic[playerId] = 3
		elseif npcHandler.topic[playerId] == 5 then
			npcHandler.topic[playerId] = 6
		elseif npcHandler.topic[playerId] == 8 then
			npcHandler:say("Muhahaha. Then I will give you a test. How many years do you think have I been here? {89}, {164} or {278}?", npc, creature)
			npcHandler.topic[playerId] = 9
		end
	elseif msgcontains(message, "278") and npcHandler.topic[playerId] == 9 then
		npcHandler:say("Correct human, and that is not nearly how high you would need to count to tell all the lost souls I've seen dying here. I AM PERPETUAL. Muahahaha.", npc, creature)
		npcHandler.topic[playerId] = 10
	elseif (msgcontains(message, "164") or msgcontains(message, "89")) and npcHandler.topic[playerId] == 9 then
		npcHandler:say("Wrong answer human! Muahahaha.", npc, creature)
		npcHandler.topic[playerId] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
