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

shopModule:addBuyableItem({"aubergine"}, 12416, 8, 1)
shopModule:addBuyableItem({"banana"}, 2676, 5, 1)
shopModule:addBuyableItem({"blueberry"}, 2677, 1, 1)
shopModule:addBuyableItem({"carrot"}, 2684, 3, 1)
shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"corncob"}, 2686, 3, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"juice squeezer"}, 5865, 100, 1)
shopModule:addBuyableItem({"lemon"}, 8841, 3, 1)
shopModule:addBuyableItem({"mango"}, 5097, 10, 1)
shopModule:addBuyableItem({"melon"}, 2682, 10, 1)
shopModule:addBuyableItem({"orange"}, 10, 10, 1)
shopModule:addBuyableItem({"potato"}, 8838, 4, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"strawberry"}, 2680, 2, 1)
shopModule:addBuyableItem({"white mushroom"}, 2787, 10, 1)

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. In case you're looking for fruit and vegetables, you've come to the right place!")
npcHandler:setMessage(MESSAGE_FAREWELL, "You better show some politeness.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:addModule(FocusModule:new())
