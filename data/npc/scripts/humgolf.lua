
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({"dead rat"}, 2813, 2, 1)
shopModule:addSellableItem({"ham"}, 2671, 4, 1)
shopModule:addSellableItem({"meat"}, 2666, 2, 1)
shopModule:addSellableItem({"tentacle piece"}, 12622, 5000, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if(msgcontains(msg, "farmine")) then
		if(player:getStorageValue(Storage.TheNewFrontier.Questline) == 15) then
			npcHandler:say("Bah, Farmine here, Farmine there. Is there nothing else than Farmine to talk about these days? Hrmpf, whatever. So what do you want?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "flatter")) then
		if(npcHandler.topic[cid] == 1) then
			if(player:getStorageValue(Storage.TheNewFrontier.BribeHumgolf) < 1) then
				npcHandler:say("Yeah, of course they can't do without my worms. Mining and worms go hand in hand. Well, in the case of the worms it is only an imaginary hand of course. I'll send them some of my finest worms.", cid)
				player:setStorageValue(Storage.TheNewFrontier.BribeHumgolf, 1)
				player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Humgolf Molesight, Son of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am chief rotwormtamer of Kazordoon. I sell rotworms and buy meat and tasty, fresh rats for my worms."})
keywordHandler:addKeyword({'earth'}, StdModule.say, {npcHandler = npcHandler, text = "Home of the worms, home of my people, too."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "The worm does not care about gods, why should I?"})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, text = "Can't say I like it much."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, text = "What by the worm are you talking about?."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "More nice beneath this noisy green surface."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time does not matter to a dwarf who understands the ways of the worm."})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, text = "Unwormish creatures they are."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "They should remember old dwarfish rotworm tactics. Think like a worm and the battle is almost won."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "That guy is a monster! I despise rotworm killers."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "Silly fairy tale."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "A true enemy of the worms."})

npcHandler:setMessage(MESSAGE_GREET, "Player, good day .. or night, whatever.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
