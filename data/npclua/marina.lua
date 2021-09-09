local internalNpcName = "Marina"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeex = 5811
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
	if msgcontains(message, "silk") or msgcontains(message, "yarn") or msgcontains(message, "silk yarn") or msgcontains(message, "spool of yarn") then
		if player:getStorageValue(Storage.FriendsandTraders.TheMermaidMarina) < 1 then
			npcHandler:say("Um. You mean, you really want me to touch that gooey spider silk just because you need yarn? Well... do you think that I'm pretty?", npc, creature)
			npcHandler.topic[creature] = 1
		elseif player:getStorageValue(Storage.FriendsandTraders.TheMermaidMarina) == 2 then
			npcHandler:say("Okay... a deal is a deal, would you like me to create a {spool of yarn} from {10 pieces of spider silk}?", npc, creature)
			npcHandler.topic[creature] = 5
		end
	elseif msgcontains(message, "honey") or msgcontains(message, "honeycomb") or msgcontains(message, "50 honeycombs") then
		if player:getStorageValue(Storage.FriendsandTraders.TheMermaidMarina) == 1 then
			npcHandler:say("Did you bring me the 50 honeycombs I requested and do you absolutely admire my beauty?", npc, creature)
			npcHandler.topic[creature] = 4
		end
	elseif msgcontains(message, "raymond striker") then
		if player:getStorageValue(Storage.TheShatteredIsles.APoemForTheMermaid) == 1 then
			npcHandler:say("<giggles> I think he has a crush on me. Well, silly man, it is only for his own good. This way he can get accustomed to TRUE beauty. And I won't give him up anymore now that he is mine.", npc, creature)
			player:setStorageValue(Storage.TheShatteredIsles.APoemForTheMermaid, 2)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "date") then
		if player:getStorageValue(Storage.TheShatteredIsles.ADjinnInLove) == 1 then
			npcHandler:say("Is that the best you can do? A true Djinn would have done something more poetic.", npc, creature)
			player:setStorageValue(Storage.TheShatteredIsles.ADjinnInLove, 2)
			npcHandler.topic[creature] = 0
		elseif player:getStorageValue(Storage.TheShatteredIsles.ADjinnInLove) == 4 then
			npcHandler:say({
				"This lovely, exotic Djinn is a true poet. And he is asking me for a date? Excellent. Now I can finaly dump this human pirate. He was growing to be boring more and more with each day ...",
				"As a little reward for your efforts I allow you to ride my sea turtles. Just look around at the shores and you will find them."
			}, npc, creature)
			player:addAchievement('Matchmaker')
			player:setStorageValue(Storage.TheShatteredIsles.ADjinnInLove, 5)
			player:setStorageValue(Storage.TheShatteredIsles.AccessToLagunaIsland, 1)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 then
			npcHandler:say("Well, everyone would say that in your position. Do you think that I'm really, absolutely the most stunning being that you have ever seen?", npc, creature)
			npcHandler.topic[creature] = 2
		elseif npcHandler.topic[creature] == 2 then
			npcHandler:say({
				"<giggles> It's funny how easy it is to get humans to say what you want. Now, proving it will be even more fun! ...",
				"You want me to touch something gooey, so you have to touch something gooey for me too. <giggles> ...",
				"I love honey and I haven't eaten it in a while, so bring me 50 honeycombs and worship my beauty a little more, then we will see."
			}, npc, creature)
			player:setStorageValue(Storage.FriendsandTraders.TheMermaidMarina, 1)
			player:setStorageValue(Storage.FriendsandTraders.DefaultStart, 1)
		elseif npcHandler.topic[creature] == 4 then
			if player:removeItem(5902, 50) then
				npcHandler:say("Oh goodie! Thank you! Okay... I guess since my fingers are sticky now anyway, I will help you. From now on, if you bring me {10 pieces of spider silk}, I will create one {spool of yarn}.", npc, creature)
				npcHandler.topic[creature] = 0
				player:setStorageValue(Storage.FriendsandTraders.TheMermaidMarina, 2)
			else
				npcHandler:say("You don't have enough honey.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 5 then
			if player:removeItem(5879, 10) then
				player:addItem(5886, 1)
				npcHandler:say("Ew... gooey... there you go.", npc, creature)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don't have the required items.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'comb'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, I don\'t have a spare comb. I lost my favourite one when diving around in Calassa.'})
keywordHandler:addKeyword({'mermaid comb'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, I don\'t have a spare comb. I lost my favourite one when diving around in Calassa.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
