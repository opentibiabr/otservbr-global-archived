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

shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 3, 1)
shopModule:addBuyableItem({"mug of beer"}, 2012, 3, 1, 3)
shopModule:addBuyableItem({"mug of rum"}, 2012, 2, 1, 27)
shopModule:addBuyableItem({"mug of wine"}, 2012, 3, 1, 15)

npcHandler:addModule(FocusModule:new())
