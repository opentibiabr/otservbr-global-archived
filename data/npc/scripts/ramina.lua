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
	{ text = "Come in and order one of our delicious meals. How about curried snake with palm honey?" },
	{ text = "Come in and order one of our delicious meals. How about flounder with blackberries, peppercorns and water nuts?" },
	{ text = "Come in and order one of our delicious meals. How about dove on a bed of sauteed broccoli and lemons?" },
	{ text = "Where is the mango I put here? Has this thieving sibang snitched it?" },
	{ text = "I'm warning you, Moe. If you have taken this silver spoon ..." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 7, 1)
shopModule:addBuyableItem({"brown bread"}, 2691, 6, 1)
shopModule:addBuyableItem({"fish"}, 2667, 10, 1)
shopModule:addBuyableItem({"lemon"}, 8841, 5, 1)
shopModule:addBuyableItem({"mango"}, 5097, 12, 1)
shopModule:addBuyableItem({"melon"}, 2682, 14, 1)
shopModule:addBuyableItem({"orange"}, 2675, 12, 1)
shopModule:addBuyableItem({"peas"}, 12639, 5, 1)
shopModule:addBuyableItem({"fruit juice"}, 2006, 2, 1, 21)
shopModule:addBuyableItem({"vial of water"}, 2006, 1, 1, 1)
shopModule:addBuyableItem({"vial of wine"}, 2006, 4, 1, 15)

shopModule:addSellableItem({"empty honey glass"}, 36166, 270, 1)
shopModule:addSellableItem({"glass full of honey"}, 36167, 300, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
