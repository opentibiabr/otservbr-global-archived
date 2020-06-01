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

shopModule:addBuyableItem({"brown bread"}, 2691, 6, 1)
shopModule:addBuyableItem({"fish"}, 2667, 10, 1)
shopModule:addBuyableItem({"meat"}, 2666, 6, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 5, 1, 3)
shopModule:addBuyableItem({"vial of wine"}, 2006, 6, 1, 15)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, 'package for rashid') then
		if player:getStorageValue(Storage.TravellingTrader.Mission02) >= 1 and player:getStorageValue(Storage.TravellingTrader.Mission02) < 3 then
			npcHandler:say('So you\'re the delivery boy? Go ahead, but I warn you, it\'s quite heavy. You can take it from the box over there.', cid)
			player:setStorageValue(Storage.TravellingTrader.Mission02, 3)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'documents') then
		if player:getStorageValue(Storage.thievesGuild.Mission04) == 1 then
			player:setStorageValue(Storage.thievesGuild.Mission04, 2)
			npcHandler:say('Funny thing that everyone thinks we have forgers for fake documents here. But no, we don\'t. The best forger is old Ahmet in Ankrahmun.', cid)
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I'm Snake Eye."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Well, I'm the boss of this tavern."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "The Gods of Tibia! What a crap! It's all superstition!"})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, text = "It's a great tavern. No closing time. No problems with kings or other rulers. Best place in Tibia."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "There's already too much order in Tibia. We don't need kings or whatever."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Go and get a watch."})
keywordHandler:addKeyword({'camp'}, StdModule.say, {npcHandler = npcHandler, text = "Well, the real wild warriors don't live here. They hide in the woods."})
keywordHandler:addKeyword({'woods'}, StdModule.say, {npcHandler = npcHandler, text = "It's the best place to live. By the way, there's an old wild warrior building to the southwest. It might be interesting for you."})
keywordHandler:addKeyword({'wild warrior'}, StdModule.say, {npcHandler = npcHandler, text = "There are a lot of wild warriors around. They built this camp."})
keywordHandler:addKeyword({"Ab'Dendriel"}, StdModule.say, {npcHandler = npcHandler, text = "I've never been there. I don't like the elves anyway."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "I've never been there. Don't know anything about it."})
keywordHandler:addKeyword({'Edron'}, StdModule.say, {npcHandler = npcHandler, text = "That's a place for wealthy toffs!"})
keywordHandler:addKeyword({'Kazordoon'}, StdModule.say, {npcHandler = npcHandler, text = "Kazordoon is alright. Except the dwarfs. I don't like them. But the mountains are a good place. Been there once."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "In the beginning, it was a nice encampment. Now it's an overcrowded, polluted city. I hate it!"})
keywordHandler:addKeyword({'Snake Eye'}, StdModule.say, {npcHandler = npcHandler, text = "Well, I had a dispute with a snake once. And the snake won. Bit my left eye out. Therefore, Snake Eye."})
keywordHandler:addKeyword({"Cip"}, StdModule.say, {npcHandler = npcHandler, text = "Cip sux!"})
keywordHandler:addKeyword({'H.L.'}, StdModule.say, {npcHandler = npcHandler, text = "He is a wild warrior. Nobody knows his real name. We just call im H.L. You can find him in the small armory shop."})
keywordHandler:addKeyword({"water"}, StdModule.say, {npcHandler = npcHandler, text = "Water is for free. Do you want some?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
