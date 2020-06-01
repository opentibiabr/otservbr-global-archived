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

shopModule:addBuyableItem({"banana"}, 2676, 3, 1)
shopModule:addBuyableItem({"carrot"}, 2684, 4, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 5, 1)
shopModule:addBuyableItem({"melon"}, 2682, 10, 1)
shopModule:addBuyableItem({"orange"}, 2675, 7, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"sample of sand wasp honey"}, 9676, 200, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 5, 1)

npcHandler:addModule(FocusModule:new())
