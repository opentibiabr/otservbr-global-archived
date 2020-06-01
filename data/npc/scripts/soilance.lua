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
	{ text = "Come have a drink in the Hard Rock Racing Track." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"ham"}, 2671, 5, 1)
shopModule:addBuyableItem({"meat"}, 2666, 3, 1)

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. Perhaps you are interested in buying some food?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Well, bye..")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye?")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
