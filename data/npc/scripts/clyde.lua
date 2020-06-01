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
	{ text = "Sit down, have a drink and relax!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- sellable
shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 3, 1)
shopModule:addBuyableItem({"mug of beer"}, 2012, 2, 1, 3)
shopModule:addBuyableItem({"mug of lemonade"}, 2012, 2, 1, 5)
shopModule:addBuyableItem({"mug of water"}, 2012, 1, 1, 1)
shopModule:addBuyableItem({"mug of wine"}, 2012, 3, 1, 15)

npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, visit us again.")
npcHandler:setMessage(MESSAGE_GREET, "Greetings, dear customer. Have a {drink} and some {food}.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
