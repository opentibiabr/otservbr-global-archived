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
	{ text = "Buy some refreshing drinks here! Fruit juice! Coconut milk!" },
	{ text = "Cookies! Cookies!" },
	{ text = "Fresh fruit! Bananas! Mangoes! Pineapples!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 2, 1)
shopModule:addBuyableItem({"beach backpack"}, 5949, 20, 1)
shopModule:addBuyableItem({"beach bag"}, 5950, 4, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"dragonfruit"}, 12638, 5, 1)
shopModule:addBuyableItem({"drum"}, 14331, 140, 1)
shopModule:addBuyableItem({"mango"}, 5097, 10, 1)
shopModule:addBuyableItem({"pineapple"}, 12415, 12, 1)
shopModule:addBuyableItem({"party cake"}, 6280, 50, 1)
shopModule:addBuyableItem({"fruit juice"}, 2006, 10, 1, 21)
shopModule:addBuyableItem({"vial of coconut milk"}, 2006, 1, 1, 14)
shopModule:addBuyableItem({"vial of wine"}, 2006, 4, 1, 15)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
