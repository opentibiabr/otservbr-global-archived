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
	{ text = "Come have a drink in the Hard Rock Racing Track." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- sellable
shopModule:addBuyableItem({"banana"}, 2676, 2, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"ice cream cone"}, 8208, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"mug of beer"}, 2012, 2, 1, 3)
shopModule:addBuyableItem({"mug of lemonade"}, 2012, 2, 1, 5)
shopModule:addBuyableItem({"mug of water"}, 2012, 1, 1, 1)
shopModule:addBuyableItem({"mug of wine"}, 2012, 3, 1, 15)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.TibiaTales.ultimateBoozeQuest) == 2 and player:removeItem(7495, 1) then
			player:setStorageValue(Storage.TibiaTales.ultimateBoozeQuest, 3)
			npcHandler.topic[cid] = 0
			player:addItem(5710, 1)
			player:addItem(2152, 10)
			player:addExperience(100, true)
			npcHandler:say("Yessss! Now I only need to build my own small brewery, figure out the secret recipe, duplicate the dwarvish brew and BANG I'll be back in business! Here take this as a reward.", cid)
		elseif player:getStorageValue(Storage.TibiaTales.ultimateBoozeQuest) < 1 then
			npcHandler.topic[cid] = 1
			npcHandler:say("Shush!! I don't want everybody to know what I am up to. Listen, things are not going too well, I need a new attraction. Do you want to help me?", cid)
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
			player:setStorageValue(Storage.TibiaTales.ultimateBoozeQuest, 1)
			player:addItem(7496, 1)
			npcHandler:say("Good! Listen closely. Take this bottle and go to Kazordoon. I need a sample of their very special brown ale. You may find a cask in their brewery. Come back as soon as you got it.", cid)
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "Just call me Boozer. Everyone does that."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the bartender here at the racing track."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Just call me Boozer. Everyone does that."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "People from all over Tibia come here to buy, sell, gamble, and get drunk until they puke."})
keywordHandler:addKeyword({'amazons'}, StdModule.say, {npcHandler = npcHandler, text = "I guess they just have not met the right man yet."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "Heard about that women there. Must visit that wenches someday."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "Good customers."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "If you like that Thais that much just go there."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you food and drinks. Get anything else somewhere else and don't bother me."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "So you are looking for food? We have cookies, bread, cheese, ham, and meat."})

npcHandler:setMessage(MESSAGE_WALKAWAY, "You'll be back.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, take what you want.")
npcHandler:setMessage(MESSAGE_FAREWELL, "You'll be back.")
npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Hard Rock Racing Track, |PLAYERNAME|")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
