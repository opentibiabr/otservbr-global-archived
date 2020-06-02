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
	{ text = "Handmade furniture only available in the jungle. Don't miss it!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bamboo drawer kit"}, 3921, 20, 1)
shopModule:addBuyableItem({"bamboo table kit"}, 3914, 25, 1)
shopModule:addBuyableItem({"ivory chair kit"}, 3907, 25, 1)
shopModule:addBuyableItem({"stone table kit"}, 3912, 30, 1)
shopModule:addBuyableItem({"trunk chair kit"}, 3935, 20, 1)
shopModule:addBuyableItem({"trunk table kit"}, 3936, 20, 1)
shopModule:addBuyableItem({"tusk chair kit"}, 3906, 25, 1)
shopModule:addBuyableItem({"tusk table kit"}, 3913, 25, 1)

npcHandler:setMessage(MESSAGE_GREET, "Hello Trunkillo and welcome to my {furniture} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "If you'd like to see my offers in furniture, ask me for a {trade}.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
