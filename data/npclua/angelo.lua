local internalNpcName = "Angelo"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 145,
	lookHead = 96,
	lookBody = 114,
	lookLegs = 120,
	lookFeet = 101,
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
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local playerTopic = {}
local function greetCallback(npc, creature)

	local player = Player(creature)

	-- Se estiver na 1º missão
	if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "The Druid of Crunor? He told you that a new cave appeared here? That's right. I'm the head of a {project} that tries to find out more about this new {area}.")
		playerTopic[creature] = 1
	-- Se já tiver após a 1º missão
	elseif player:getStorageValue(Storage.CultsOfTibia.Life.Mission) > 1 then
		npcHandler:setMessage(MESSAGE_GREET, "How is your {mission} going?")
		playerTopic[creature] = 6
	end
	npcHandler:addFocus(creature)
	return true
end
local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	npcHandler.topic[creature] = playerTopic[creature]
	local player = Player(creature)

-- Sequência para pegar a quest
if npcHandler.topic[creature] == 1 and msgcontains(message, "project") then
		npcHandler:say({"The project is called 'Sandy {Cave} Project' and is funded by the {MoTA}. Its goal is the investigation of this {cave}."}, npc, creature)
		playerTopic[creature] = 2

	elseif npcHandler.topic[creature] == 2 and msgcontains(message, "mota") then
		npcHandler:say({"MoTA is short for the recently founded Museum of Tibian Arts. We work together in close collaboration. New {results} are communicated to the museum instantly."}, npc, creature)
		playerTopic[creature] = 3

	elseif npcHandler.topic[creature] == 3 and msgcontains(message, "results") then
		npcHandler:say({"We have no scientific results so far to reach our {goal}, because my workers aren't back yet. Should I be {worried}?"}, npc, creature)
		playerTopic[creature] = 4

	elseif npcHandler.topic[creature] == 4 and msgcontains(message, "yes") then
		npcHandler:say({"Alright. I have to find out why they don't return. But I'm old and my back aches. Would you like to go there and look for my workers?"}, npc, creature)
		playerTopic[creature] = 5

	elseif npcHandler.topic[creature] == 5 and msgcontains(message, "yes") then
		npcHandler:say({"Fantastic! Go there and then tell me what you've seen. I've oppened the door for you. Take care of yourself!"}, npc, creature)
		player:setStorageValue(Storage.CultsOfTibia.Life.Mission, 2)
		player:setStorageValue(Storage.CultsOfTibia.Life.AccessDoor, 1)
		playerTopic[creature] = 0

	-- Inútil
	elseif npcHandler.topic[creature] == 2 and msgcontains(message, "cave") then
		npcHandler:say({"We don't know exactly why this cave has now exposed an entry via the {dark pyramid}. It seems that the cave already existed for a long time, however, without a connection to our world. Maybe some smaller earth movements have changed the situation."}, npc, creature)
		playerTopic[creature] = 11

	elseif npcHandler.topic[creature] == 11 and msgcontains(message, "dark pyramid") then
		npcHandler:say({"We don't know yet to wich extent the cave and the dark pyramid belong together. Thisi s what we try to find out. Maybe the history of this place has to be rewritten."}, npc, creature)
		playerTopic[creature] = 0
end

	-- Depois de encontrar o Oasis
if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) == 3 then
	if msgcontains(message, "mission") and npcHandler.topic[creature] == 6 then
		npcHandler:say({"The scientists are still missing? You just found some strange green shining mummies and a big oasis? I give you this analysis tool for the water of the oasis. Maybe that's the key. Could you bring me a sample of this water?"}, npc, creature)
		playerTopic[creature] = 15
			elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 15 then
			npcHandler:say({"Very good. Hopefully analysing this sample will get us closer to the solution of this mistery."}, npc, creature)
			player:addItem(28666, 1)
			player:setStorageValue(Storage.CultsOfTibia.Life.Mission, 4)
	end
end

-- Depois de usar o analyzing tool
if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) == 5 then
	if msgcontains(message, "mission") and npcHandler.topic[creature] == 6 then
		npcHandler:say({"Do you have the sample I asked you for?"}, npc, creature)
		playerTopic[creature] = 16
			elseif msgcontains(message, "yes") and npcHandler.topic[creature] == 16 then
			npcHandler:say({"Thanks a lot. Let me check the result. Well, I think you need the counteragent. Please apply it to the oasis!"}, npc, creature)
			player:addItem(28665, 1)
			player:setStorageValue(Storage.CultsOfTibia.Life.Mission, 6)
	end
end

-- Depois de usar o conteragent
if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) == 7 then
	if msgcontains(message, "mission") and npcHandler.topic[creature] == 6 then
		npcHandler:say({"What has happened? You applied the counteragent to the oasis and then it was destroyed by a sandstorm? Keep on investigating the place."}, npc, creature)
		playerTopic[creature] = 17
	end
end

-- after killing the boss the sandking
if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) == 8 then
		npcHandler:setMessage(MESSAGE_GREET, "Just get out of my way! You killed this beautiful creature. I have nothing more to say. Damn druid of Crunor!")
		player:setStorageValue(Storage.CultsOfTibia.Life.Mission, 9)
end
----------------------------------------- MOTA -------------------------------
	-- Pedindo o Magnifier de Gareth
if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 6 then
	if msgcontains(message, "magnifier") then
			npcHandler:say({"{Gareth} told you that there are rumours about fake artefacts in the MoTA? And it is your task to check that with a magnifier? I see. I don't need one right now, so you can have one of mine. You find one in the crate over there."}, npc, creature)
			player:setStorageValue(Storage.CultsOfTibia.MotA.Mission, 7)
		end
	end

	-- Pedindo a pintura de Gareth para Angelo
if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 10 then
	if msgcontains(message, "picture") then
			npcHandler:say({"So you found out that one artefact in the MoTA is fake? And {Gareth} sent you to me to get a new artefact as a replacement? Sorry, I hardly know you so I don't trust you. I won't help you with that!"}, npc, creature)
			player:setStorageValue(Storage.CultsOfTibia.MotA.Mission, 11)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
