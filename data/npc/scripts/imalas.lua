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
	{ text = "Fresh food! Finest quality!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 2, 1)
shopModule:addBuyableItem({"brown bread"}, 2691, 3, 1)
shopModule:addBuyableItem({"carrot"}, 2684, 2, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"melon"}, 2682, 8, 1)
shopModule:addBuyableItem({"peas"}, 12639, 2, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"roll"}, 2690, 2, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Imalas."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = " I'm a shopkeeper. You can buy food here."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "I offer quite a lot of food. Ask me for a {trade} if you're hungry"})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! What do you need? If it's {food}, you've come to the right place.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yep, take a good look.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
