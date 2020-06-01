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
	{ text = "Meat, ham, fish and other delicacies freshly imported!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bread"}, 2689, 2, 1)
shopModule:addBuyableItem({"cake"}, 6278, 50, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 4, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"fish"}, 2667, 5, 1)
shopModule:addBuyableItem({"ham"}, 2671, 6, 1)
shopModule:addBuyableItem({"meat"}, 2666, 3, 1)
shopModule:addBuyableItem({"roll"}, 2690, 2, 1)
shopModule:addBuyableItem({"salmon"}, 2668, 6, 1)
shopModule:addBuyableItem({"valentine's cake"}, 6393, 100, 1)
shopModule:addBuyableItem({"white mushroom"}, 2787, 6, 1)
shopModule:addBuyableItem({"vial of water"}, 2006, 2, 1, 1)
shopModule:addBuyableItem({"vial of wine"}, 2006, 3, 1, 15)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
