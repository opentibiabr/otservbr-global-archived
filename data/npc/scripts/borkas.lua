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
	{text = 'Welcome to the house of fashion, Iron Sparrow!'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"armor rack kit"}, 6114, 90, 1)
shopModule:addBuyableItem({"barrel kit"}, 3919, 12, 1)
shopModule:addBuyableItem({"bookcase kit"}, 6373, 70, 1)
shopModule:addBuyableItem({"box"}, 1741, 10, 1)
shopModule:addBuyableItem({"chest"}, 1740, 10, 1)
shopModule:addBuyableItem({"drawer kit"}, 3915, 18, 1)
shopModule:addBuyableItem({"crate"}, 1739, 10, 1)
shopModule:addBuyableItem({"dresser kit"}, 3916, 25, 1)
shopModule:addBuyableItem({"trunk kit"}, 3920, 10, 1)
shopModule:addBuyableItem({"locker kit"}, 3917, 30, 1)
shopModule:addBuyableItem({"treasure chest"}, 1746, 10, 1)
shopModule:addBuyableItem({"trough kit"}, 3918, 7, 1)
shopModule:addBuyableItem({"venorean cabinet kit"}, 20254, 90, 1)
shopModule:addBuyableItem({"venorean drawer kit"}, 20257, 40, 1)
shopModule:addBuyableItem({"venorean wardrobe kit"}, 20255, 50, 1)
shopModule:addBuyableItem({"weapon rack kit"}, 6115, 90, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I'm Borkas Flersson, but let's not waste precious tradin' time with smalltalk."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm into sellin' furniture. My grandfather was in that business, then my father, and so am I."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time is 10:14 am now."})
keywordHandler:addKeyword({'Richardson'}, StdModule.say, {npcHandler = npcHandler, text = "Hes my boss but he likes to be one of us and sells some of his wares personally."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling containers here."})
keywordHandler:addKeyword({'containers'}, StdModule.say, {npcHandler = npcHandler, text = "I offer drawers, dressers, lockers, crates, chests, boxes, barrels, trunks and troughs."})

npcHandler:setMessage(MESSAGE_GREET, "Hey |PLAYERNAME|, what'cha want?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Thanks and see ya.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
