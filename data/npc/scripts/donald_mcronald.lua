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
shopModule:addBuyableItem({"beetroot"}, 8845, 2, 1)
shopModule:addBuyableItem({"bunch of wheat"}, 2694, 1, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"corncob"}, 2686, 3, 1)
shopModule:addBuyableItem({"cucumber"}, 8842, 3, 1)
-- buyable
shopModule:addSellableItem({"dead spider"}, 2807, 2, 1)

npcHandler:setMessage(MESSAGE_WALKAWAY, "?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes, bye!.")
npcHandler:setMessage(MESSAGE_GREET, "Hmmm, well, hello |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
