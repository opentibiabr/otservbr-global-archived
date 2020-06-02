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
	{ text = "Apples, cherries, grapes and pears! All fresh, all tasty!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"pear"}, 2673, 4, 1)
shopModule:addBuyableItem({"plum"}, 8839, 3, 1)
shopModule:addBuyableItem({"raspberry"}, 8840, 1, 1)
shopModule:addBuyableItem({"red apple"}, 2674, 3, 1)
shopModule:addBuyableItem({"sample of venorean spice"}, 9675, 200, 1)

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. If you're looking for {fruits}, you've come to the right place.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
