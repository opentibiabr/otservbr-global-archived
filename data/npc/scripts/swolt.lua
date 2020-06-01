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
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 4, 1, 3)
shopModule:addBuyableItem({"vial of water"}, 2006, 1, 1, 1)

shopModule:addSellableItem({"bunch of ripe rice"}, 11245, 75, 1)
shopModule:addSellableItem({"ectoplasmic sushi"}, 12637, 300, 1)
shopModule:addSellableItem({"terramite eggs"}, 11370, 50, 1)

-- need develop tomes out new frontier

npcHandler:addModule(FocusModule:new())
