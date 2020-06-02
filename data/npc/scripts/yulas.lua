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
	{ text = "Every home needs at least one table. Come get yours here." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"big table kit"}, 3911, 30, 1)
shopModule:addBuyableItem({"round table kit"}, 14328, 25, 1)
shopModule:addBuyableItem({"small table kit"}, 3908, 20, 1)
shopModule:addBuyableItem({"square table ki"}, 14329, 25, 1)
shopModule:addBuyableItem({"trophy stand"}, 7936, 50, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Yulas. I will be your salesperson today."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "We are into home improvement."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It's 5:20 pm, my lady."})
keywordHandler:addKeyword({'Allen'}, StdModule.say, {npcHandler = npcHandler, text = "To think just because he is around here to watch what we do, he want to be considered one of us..."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "We sell furniture and equipment. At this counter you can buy tables."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Plank and Treasurechest Market, |PLAYERNAME|! Looking for {furniture}, I hope.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
