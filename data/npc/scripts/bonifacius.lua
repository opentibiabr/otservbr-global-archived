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
-- sellable
shopModule:addBuyableItem({"banana"}, 2676, 2, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"melon"}, 2682, 8, 1)
shopModule:addBuyableItem({"orange"}, 2675, 5, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"roll"}, 2690, 2, 1)
shopModule:addBuyableItem({"salmon"}, 2668, 4, 1)

npcHandler:setMessage(MESSAGE_WALKAWAY, "May the gods bless your travels, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May the gods bless your travels, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_GREET, "Thousand greetings, |PLAYERNAME|. How may I help you? I have delicious {food} to offer.")

npcHandler:addModule(FocusModule:new())
