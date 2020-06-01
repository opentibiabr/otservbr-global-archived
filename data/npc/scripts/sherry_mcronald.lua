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

local voices = { {text = 'Isn\'t this a beautiful day? Perfect for farming.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"melon"}, 2682, 8, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)

shopModule:addSellableItem({"bread"}, 2689, 2, 1)

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! Welcome to our humble farm.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Grace our home with another visit soon, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "What a strange person.")

npcHandler:addModule(FocusModule:new())
