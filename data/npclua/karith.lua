local internalNpcName = "Karith"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 159,
	lookHead = 79,
	lookBody = 3,
	lookLegs = 93,
	lookFeet = 12,
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

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'This weather is killing me. If I only had enough money to retire.'}
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

local function greetCallback(npc, creature)
	local player = Player(creature)
	if player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) == -1 then
		npcHandler:setMessage(MESSAGE_GREET, 'Hello! Tell me what\'s on your mind. Time is money.')
		player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, 0)
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Hello! Tell me what\'s on your mind. Time is money.')
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)
local player = Player(creature)
	if msgcontains(message, "passage") or msgcontains(message, "sail") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"I see no reason to establish ship routes to other cities. There is nothing that would be worth the effort. ...",
				"But since you won\'t stop bugging me, let\'s make a deal: If you can prove that at least five of your so-called \'cities\' are not worthless, I might reconsider my position. ...",
				"Bring me something SPECIAL! The local bar tenders usually know what\'s interesting about their city.",
			}, npc, creature)
			npcHandler.topic[creature] = 0
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"For the sake of profit, we established ship routes to {Ab\'Dendriel}, {Darashia}, {Venore}, {Ankrahmun}, {Port Hope}, {Thais}, {Liberty Bay} and {Carlin}.",
			}, npc, creature)
			npcHandler.topic[creature] = 0
		else return false
		end
	elseif msgcontains(message, "Ab\'Dendriel") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.AbDendriel) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"I\'ve never been there. I doubt the elves there came up with something noteworthy. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 1
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.AbDendriel) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"Do you want a passage to Ab\'Dendriel for 160 gold?", 	---missing line
			}, npc, creature)
			npcHandler.topic[creature] = 11
		else return false
		end
	elseif msgcontains(message, "Darashia") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.Darashia) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"From all what I have heard, it is an unremarkable pile of huts in the desert. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 2
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.Darashia) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"Of course it is merely superstition that the darashian sand wasp honey brings back youth and vitality, but as long people pay a decent price, I couldn't care less. Do you want a passage to Darashia for 210 gold?",
			}, npc, creature)
			npcHandler.topic[creature] = 12
		else return false
		end
	elseif msgcontains(message, "Venore") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.Venore) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"Another port full of smelly humans, fittingly located in a swamp. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 3
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.Venore) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({"The swamp spice will turn out very lucrative considering that it helps to make even the most disgusting dish taste good. Do you want a passage to Venore for 185 gold?",}, npc, creature)
			npcHandler.topic[creature] = 13
		else return false
		end
	elseif msgcontains(message, "Ankrahmun") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.Ankrahmun) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"A city full of mad death worshippers, no thanks. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 4
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.Ankrahmun) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"The Yalahari seem to be obsessed with conserving their dead, so I guess the embalming fluid will be a great success in Yalahar. Do you want a passage to Ankrahmun for 230 gold?",
			}, npc, creature)
			npcHandler.topic[creature] = 14
		else return false
		end
	elseif msgcontains(message, "Port Hope") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.PortHope) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"Another pointless human settlement. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 5
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.PortHope) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"Ivory is highly prized by the artisans of the Yalahari. Do you want a passage to Port Hope for 260 gold?",
			}, npc, creature)
			npcHandler.topic[creature] = 15
		else return false
		end
	elseif msgcontains(message, "Thais") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.Thais) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"Thais must be a hell hole if only half of the stories we hear about it are true. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 6
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.Thais) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"Astonishing enough the royal satin seems to suit the exquisite taste of the Yalahari. Do you want a passage to Thais for 200 gold?",
			}, npc, creature)
			npcHandler.topic[creature] = 16
		else return false
		end
	elseif msgcontains(message, "Liberty Bay") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.LibertyBay) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"Which sane captain would sail his ship to a pirate town? Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 7
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.LibertyBay) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"Do you want a passage to Liberty Bay for 275 gold?", ---missing line
			}, npc, creature)
			npcHandler.topic[creature] = 17
		else return false
		end
	elseif msgcontains(message, "Carlin") then
		if player:getStorageValue(Storage.SearoutesAroundYalahar.Carlin) ~= 1 and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5 then
			npcHandler:say({
				"An unremarkable town compared to the wonders of Yalahar. Or did you find something interesting there?",
			}, npc, creature)
			npcHandler.topic[creature] = 8
		elseif player:getStorageValue(Storage.SearoutesAroundYalahar.Carlin) == 1 or player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) >= 5 then
			npcHandler:say({
				"The evergreen flower pots are an amusing item that might find some customers here. Do you want a passage to Carlin for 185 gold?",
			}, npc, creature)
			npcHandler.topic[creature] = 18
		else return false
		end
	elseif msgcontains(message, "yes") then
		if npcHandler.topic[creature] == 1 and player:removeItem(9674,1) then
			npcHandler:say("What's that? Bug milk? Hm, perhaps I can find some customers for that! ", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.AbDendriel, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 2 and player:removeItem(9676,1) then
			npcHandler:say("Sand wasp honey? Hm, interesting at least!", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.Darashia, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 3 and player:removeItem(9675,1) then
			npcHandler:say("Some special spice might be of value indeed.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.Venore, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 4 and player:removeItem(9677,1) then
			npcHandler:say("I can hardly imagine that someone is interested in embalming fluid, but I\'ll give it a try.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.Ankrahmun, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 5 and player:removeItem(3956,1) then
			npcHandler:say("Of course! Ivory! Its value is quite obvious.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.PortHope, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 6 and player:removeItem(9678,1) then
			npcHandler:say("This royal satin is indeed of acceptable quality.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.Thais, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 7 and player:removeItem(5553,1,27) then
			npcHandler:say("I doubt that the esteemed Yalahari will indulge into something profane as rum. But who knows, I'll give it a try.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.LibertyBay, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 8 and player:removeItem(11428,1) then
			npcHandler:say("I doubt that these flowers will stay fresh and healthy forever. But if they do, they could be indeed valuable.", npc, creature)
			player:setStorageValue(Storage.SearoutesAroundYalahar.Carlin, 1)
			player:setStorageValue(Storage.SearoutesAroundYalahar.TownsCounter, player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) + 1)
			npcHandler.topic[creature] = 0
		elseif npcHandler.topic[creature] == 11 then
			if player:removeMoneyNpc(160) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32734, 31668, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 12 then
			if player:removeMoneyNpc(210) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(33289, 32480, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 13 then
			if player:removeMoneyNpc(185) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32954, 32022, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 14 then
			if player:removeMoneyNpc(230) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(33092, 32883, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 15 then
			if player:removeMoneyNpc(260) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32527, 32784, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 16 then
			if player:removeMoneyNpc(200) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32310, 32210, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 17 then
			if player:removeMoneyNpc(275) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32285, 32892, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		elseif npcHandler.topic[creature] == 18 then
			if player:removeMoneyNpc(185) then
				npcHandler:say("Set the sails!", npc, creature)
				doTeleportThing(creature, Position(32387, 31820, 6))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler.topic[creature] = 0
			else
				npcHandler:say("You don\'t have enough money.", npc, creature)
				npcHandler.topic[creature] = 0
			end
		else
			npcHandler:say("Don\'t waste my time.", npc, creature)
			npcHandler.topic[creature] = 0
		end
	elseif msgcontains(message, "no") then
		npcHandler:say({"Then no.",}, npc, creature)
		npcHandler.topic[creature] = 0
	end
return true
end

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(32811, 31267, 6), Position(32811, 31270, 6), Position(32811, 31273, 6)}})

-- Basic
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m Karith. I don\'t belong to a caste any longer, and only serve the Yalahari.'})
keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, text = 'The city was a marvel to behold. It is certain that it have been the many foreigners that ruined it.'})

-- Greeting message
keywordHandler:addGreetKeyword({"ashari"}, {npcHandler = npcHandler, text = "Hello! Tell me what\'s on your mind. Time is money."})
--Farewell message
keywordHandler:addFarewellKeyword({"asgha thrazi"}, {npcHandler = npcHandler, text = "Goodbye, |PLAYERNAME|."})

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
