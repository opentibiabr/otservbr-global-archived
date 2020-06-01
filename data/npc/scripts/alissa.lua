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
	{ text = "Fruit and vegetables, all fresh and tasty!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 3, 1)
shopModule:addBuyableItem({"blueberry"}, 2677, 1, 1)
shopModule:addBuyableItem({"carrot"}, 2684, 3, 1)
shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"cucumber"}, 8842, 5, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"mango"}, 5097, 8, 1)
shopModule:addBuyableItem({"melon"}, 2682, 8, 1)
shopModule:addBuyableItem({"orange"}, 2675, 6, 1)
shopModule:addBuyableItem({"pear"}, 2673, 5, 1)
shopModule:addBuyableItem({"plum"}, 8839, 3, 1)
shopModule:addBuyableItem({"potato"}, 8838, 5, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"raspberry"}, 8840, 1, 1)
shopModule:addBuyableItem({"red apple"}, 2674, 3, 1)
shopModule:addBuyableItem({"strawberry"}, 2680, 1, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 4, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
