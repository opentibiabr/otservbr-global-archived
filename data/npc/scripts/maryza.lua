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
local voices = {
	{ text = "Sit down, have a drink and enjoy the day!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"brown bread"}, 2691, 3, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"roll"}, 2690, 2, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'cookbook') then
		if player:getStorageValue(Storage.MaryzaCookbook) ~= 1 then
			npcHandler:say('The cookbook of the famous dwarven kitchen. You\'re lucky. I have a few copies on sale. Do you like one for 150 gold?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('I\'m sorry but I sell only one copy to each customer. Otherwise they would have been sold out a long time ago.', cid)
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if not player:removeMoneyNpc(150) then
				npcHandler:say('No gold, no sale, that\'s it.', cid)
				return true
			end

			npcHandler:say('Here you are. Happy cooking!', cid)
			player:setStorageValue(Storage.MaryzaCookbook, 1)
			player:addItem(2347, 1)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('I have but a few copies, anyway.', cid)
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Maryza Firehand, daughter of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm the cook of the Jolly Axeman."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "To busy, ask my husband."})
keywordHandler:addKeyword({'Jimbin'}, StdModule.say, {npcHandler = npcHandler, text = "I am so proud of him. In drinking, he's second only to our mighty general."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Don't like these upper cave guys."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "We don't care much about outsiders anymore."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "A fine drinker and strategist. Wastes his skill with these idiots of the army. What a shame."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "We could better feed some dragons instead of these fools."})
keywordHandler:addKeyword({'Tark'}, StdModule.say, {npcHandler = npcHandler, text = "He loved my dragonsteaks. Heard he died by a cave in while fighting drags in the Plains of Havoc."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "Heard that's what the humans call one of their boggiemen."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "Would slice a dragon or two for steaks if i'd get it."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "Don't like it, has an elfish touch, ye know?"})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Puny town for puny guys."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "I sell normal and brown bread, meat, ham, cookies, rolls, and cheese made of mushrooms."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Jolly Axeman, |PLAYERNAME|. Have a good time and eat some {food}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yeah, bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, have a look at my food. Remember, touching means buying it.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())