local internalNpcName = "Percybald"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 3,
	lookBody = 21,
	lookLegs = 21,
	lookFeet = 38,
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
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	if msgcontains(message, 'disguise') then
		if player:getStorageValue(Storage.ThievesGuild.TheatreScript) < 0 then
			npcHandler:say({
				'Hmpf. Why should I waste my time to help some amateur? I\'m afraid I can only offer my assistance to actors that are as great as I am. ...',
				'Though, your futile attempt to prove your worthiness could be amusing. Grab a copy of a script from the prop room at the theatre cellar. Then talk to me again about your test!'
			}, npc, creature)
			player:setStorageValue(Storage.ThievesGuild.TheatreScript, 0)
		end
	elseif msgcontains(message, 'test') then
		if player:getStorageValue(Storage.ThievesGuild.Mission04) == 5 then
			npcHandler:say('I hope you learnt your role! I\'ll tell you a line from the script and you\'ll have to answer with the corresponding line! Ready?', npc, creature)
			npcHandler.topic[playerId] = 1
		end
	elseif msgcontains(message, 'yes') then
		if npcHandler.topic[playerId] == 1 then
			npcHandler:say('How dare you? Are you mad? I hold the princess hostage and you drop your weapons. You\'re all lost!', npc, creature)
			npcHandler.topic[playerId] = 2
		elseif npcHandler.topic[playerId] == 3 then
			npcHandler:say('Too late puny knight. You can\'t stop my master plan anymore!', npc, creature)
			npcHandler.topic[playerId] = 4
		elseif npcHandler.topic[playerId] == 5 then
			npcHandler:say('What\'s this? Behind the doctor?', npc, creature)
			npcHandler.topic[playerId] = 6
		elseif npcHandler.topic[playerId] == 7 then
			npcHandler:say('Grrr!', npc, creature)
			npcHandler.topic[playerId] = 8
		elseif npcHandler.topic[playerId] == 9 then
			npcHandler:say('You\'re such a monster!', npc, creature)
			npcHandler.topic[playerId] = 10
		elseif npcHandler.topic[playerId] == 11 then
			npcHandler:say('Ah well, I think you passed the test! Here is your disguise kit! Now get lost, fate awaits me!', npc, creature)
			player:setStorageValue(Storage.ThievesGuild.Mission04, 6)
			player:addItem(8693, 1)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 2 then
		if msgcontains(message, 'I don\'t think so, dear doctor!') then
			npcHandler:say('Ok, ok. You\'ve got this one right! Ready for the next one?', npc, creature)
			npcHandler.topic[playerId] = 3
		else
			npcHandler:say('No no no! That is not correct!', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 4 then
		if msgcontains(message, 'Watch out! It\'s a trap!') then
			npcHandler:say('Ok, ok. You\'ve got this one right! Ready for the next one?', npc, creature)
			npcHandler.topic[playerId] = 5
		else
			npcHandler:say('No no no! That is not correct!', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 6 then
		if msgcontains(message, 'Look! It\'s Lucky, the wonder dog!') then
			npcHandler:say('Ok, ok. You\'ve got this one right! Ready for the next one?', npc, creature)
			npcHandler.topic[playerId] = 7
		else
			npcHandler:say('No no no! That is not correct!', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 8 then
		if msgcontains(message, 'Ahhhhhh!') then
			npcHandler:say('Ok, ok. You\'ve got this one right! Ready for the next one?', npc, creature)
			npcHandler.topic[playerId] = 9
		else
			npcHandler:say('No no no! That is not correct!', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 10 then
		if msgcontains(message, 'Hahaha! Now drop your weapons or else...') then
			npcHandler:say('Ok, ok. You\'ve got this one right! Ready for the next one?', npc, creature)
			npcHandler.topic[playerId] = 11
		else
			npcHandler:say('No no no! That is not correct!', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted |PLAYERNAME|!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
