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
	{ text = "Food! Food! Best food in world from best cook in world!"}
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 3, 1, 3)
shopModule:addBuyableItem({"vial of lemonade"}, 2006, 2, 1, 5)
shopModule:addBuyableItem({"vial of water"}, 2006, 1, 1, 1)
shopModule:addBuyableItem({"vial of wine"}, 2006, 4, 1, 15)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "Me Pugwah."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Me great cook! Only ingredients most rotten find way in my stews!"})
keywordHandler:addKeyword({'Dworcs'}, StdModule.say, {npcHandler = npcHandler, text = "Me came here with little canoe. Great storm making bshhhh bshhh! Trying to drown little Pugwah! But no no! Pugwah row row row and escape! Then long long only water."})
keywordHandler:addKeyword({'Menacing Mummy'}, StdModule.say, {npcHandler = npcHandler, text = "Me find him in box with exquisite stinky old meat I ordered!"})
keywordHandler:addKeyword({'Yalahar'}, StdModule.say, {npcHandler = npcHandler, text = "Biiiiig city. Soooo many opportunity to find something rotten to make a stew or sausage!"})
keywordHandler:addKeyword({'Vampire'}, StdModule.say, {npcHandler = npcHandler, text = "Me bite back!! Pugwah swear!"})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "Food has to be rotten to gain flavour! No need for expensive spices!"})
keywordHandler:addKeyword({'drinks'}, StdModule.say, {npcHandler = npcHandler, text = "Me offer bread, cheese, ham, or meat. And drinks. If you like? Ask Pugwah for {trade}."})

npcHandler:setMessage(MESSAGE_GREET, "Uh, a brave customer! Me happy to serve you delicious {food} and {drinks}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye?")
npcHandler:setMessage(MESSAGE_DECLINE, "Okay.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Good, good! Take look at yummy food good Pugwah sells.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
