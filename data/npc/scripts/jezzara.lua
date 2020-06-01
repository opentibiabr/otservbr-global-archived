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

local voices = { {text = 'Food of various kinds, have a look.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 5, 1)
shopModule:addBuyableItem({"bulb of garlic"}, 9114, 2, 1)
shopModule:addBuyableItem({"carrot"}, 2684, 8, 1)
shopModule:addBuyableItem({"dragon ham"}, 2672, 25, 1)
shopModule:addBuyableItem({"fish"}, 2667, 6, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 8, 1)
shopModule:addBuyableItem({"ham"}, 2671, 15, 1)
shopModule:addBuyableItem({"jalapeno pepper"}, 8844, 2, 1)
shopModule:addBuyableItem({"meat"}, 2666, 10, 1)
shopModule:addBuyableItem({"melon"}, 2682, 13, 1)
shopModule:addBuyableItem({"onion"}, 8843, 2, 1)
shopModule:addBuyableItem({"orange"}, 2675, 8, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"salmon"}, 2668, 7, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 10, 1)

npcHandler:setMessage(MESSAGE_GREET, "Be mourned pilgrim in flesh. Talking of flesh, maybe you'd enjoy some {food}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May enlightenment be your path.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, take a look at my offers.")
npcHandler:addModule(FocusModule:new())
