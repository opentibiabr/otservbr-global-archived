local internalNpcName = "Aruda"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 77,
	lookBody = 81,
	lookLegs = 79,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local Price = {}
npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Hey there, up for a chat?'}
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	if Player(creature):getSex() == PLAYERSEX_FEMALE then
		npcHandler:setMessage(MESSAGE_GREET, "Oh, hello |PLAYERNAME|, your hair looks great! Who did it for you?")
		npcHandler:setTopic(playerId, 1)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Oh, hello, handsome! It's a pleasure to meet you, |PLAYERNAME|. Gladly I have the time to {chat} a bit.")
		npcHandler:setTopic(playerId, nil)
	end
	Price[playerId] = nil
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	local Sex = player:getSex()
	if npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("I would never have guessed that.", npc, creature)
		npcHandler:setTopic(playerId, nil)
	elseif npcHandler:getTopic(playerId) == 2 then
		if player:removeMoneyBank(Price[playerId]) then
			npcHandler:say("Oh, sorry, I was distracted, what did you say?", npc, creature)
		else
			npcHandler:say("Oh, I just remember I have some work to do, sorry. Bye!", npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
		npcHandler:setTopic(playerId, nil)
		Price[playerId] = nil
	elseif npcHandler:getTopic(playerId) == 3 and player:removeItem(2906, 1) then
		npcHandler:say("Take some time to talk to me!", npc, creature)
		npcHandler:setTopic(playerId, nil)
	elseif npcHandler:getTopic(playerId) == 4 and (msgcontains(message, "spouse") or msgcontains(message, "girlfriend")) then
		npcHandler:say("Well ... I have met him for a little while .. but this was nothing serious.", npc, creature)
		npcHandler:setTopic(playerId, 5)
	elseif npcHandler:getTopic(playerId) == 5 and msgcontains(message, "fruit") then
		npcHandler:say("I remember that grapes were his favourites. He was almost addicted to them.", npc, creature)
		npcHandler:setTopic(playerId, nil)
	elseif msgcontains(message, "how") and msgcontains(message, "are") and msgcontains(message, "you") then
		npcHandler:say("Thank you very much. How kind of you to care about me. I am fine, thank you.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "sell") then
		npcHandler:say("Sorry, I have nothing to sell.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "job") or msgcontains(message, "chat") then
		npcHandler:say("I do some work now and then. Nothing unusual, though. So I have plenty time to chat. If you are interested in any topic just ask me.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "name") then
		if Sex == PLAYERSEX_FEMALE then
			npcHandler:say("I am Aruda.", npc, creature)
		else
			npcHandler:say("I am a little sad, that you seem to have forgotten me, handsome. I am Aruda.", npc, creature)
		end
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "aruda") then
		if Sex == PLAYERSEX_FEMALE then
			npcHandler:say("Yes, that's me!", npc, creature)
		else
			npcHandler:say("Oh, I like it, how you say my name.", npc, creature)
		end
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "time") then
		npcHandler:say("Please don't be so rude to look for the time if you are talking to me.", npc, creature)
		npcHandler:setTopic(playerId, 3)
	elseif msgcontains(message, "help") then
		npcHandler:say("I am deeply sorry, I can't help you.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "monster") or msgcontains(message, "dungeon") then
		npcHandler:say("UH! What a terrifying topic. Please let us speak about something more pleasant, I am a weak and small woman after all.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "sewer") then
		npcHandler:say("What gives you the impression, I am the kind of women, you find in sewers?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "god") then
		npcHandler:say("You should ask about that in one of the temples.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "king") then
		npcHandler:say("The king, that lives in this fascinating castle? I think he does look kind of cute in his luxurious robes, doesn't he?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 10
	elseif msgcontains(message, "sam") then
		if Sex == PLAYERSEX_FEMALE then
			npcHandler:say("He is soooo strong! What muscles! What a body! Did you ask him for a date?", npc, creature)
		else
			npcHandler:say("He is soooo strong! What muscles! What a body! On the other hand, compared to you he looks quite puny.", npc, creature)
		end
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "benjamin") then
		npcHandler:say("He is a little simple minded but always nice and well dressed.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "gorn") then
		npcHandler:say("He should really sell some stylish gowns or something like that. We Tibians never get some clothing of the latest fashion. It's a shame.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "quentin") then
		npcHandler:say("I don't understand this lonely monks. I love company too much to become one. Hehehe!", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "bozo") then
		npcHandler:say("Oh, isn't he funny? I could listen to him the whole day.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "oswald") then
		npcHandler:say("As far as I know, he is working in the castle.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "rumour") or msgcontains(message, "rumor") or msgcontains(message, "gossip") then
		npcHandler:say("I am a little shy and so don't hear many rumors.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "kiss") and Sex == PLAYERSEX_MALE then
		npcHandler:say("Oh, you little devil, stop talking like that! <blush>", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 20
	elseif msgcontains(message, "weapon") then
		npcHandler:say("I know only little about weapons. Can you tell me something about them, please?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "magic") then
		npcHandler:say("I believe that love is stronger than magic, don't you agree?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "thief") or msgcontains(message, "theft") then
		npcHandler:say("Oh, sorry, I have to hurry, bye!", npc, creature)
		npcHandler:setTopic(playerId, nil)
		Price[playerId] = nil
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	elseif msgcontains(message, "tibia") then
		npcHandler:say("I would like to visit the beach more often, but I guess it's too dangerous.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "castle") then
		npcHandler:say("I love this castle! It's so beautiful.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "muriel") then
		npcHandler:say("Powerful sorcerers frighten me a little.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "elane") then
		npcHandler:say("I personally think it's inappropriate for a woman to become a warrior, what do you think about that?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "marvik") then
		npcHandler:say("Druids seldom visit a town, what do you know about druids?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "gregor") then
		npcHandler:say("I like brave fighters like him.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "noodles") then
		npcHandler:say("Oh, he is sooooo cute!", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "dog") or msgcontains(message, "poodle") then
		npcHandler:say("I like dogs, the little ones at least. Do you like dogs, too?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 5
	elseif msgcontains(message, "excalibug") then
		npcHandler:say("Oh, I am just a girl and know nothing about magic swords and such things.", npc, creature)
		npcHandler:setTopic(playerId, 2)
		Price[playerId] = 10
	elseif msgcontains(message, "partos") then
		npcHandler:say("I ... don't know someone named like that.", npc, creature)
		npcHandler:setTopic(playerId, 4)
		Price[playerId] = nil
	elseif msgcontains(message, "yenny") then
		npcHandler:say("Yenny? I know no Yenny, nor have I ever used that name! You have mistook me with someone else.", npc, creature)
		npcHandler:setTopic(playerId, nil)
		Price[playerId] = nil
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "I hope to see you soon.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|. I really hope we'll talk again soon.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
