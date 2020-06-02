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

shopModule:addBuyableItem({"drum"}, 2073, 140, 1)
shopModule:addBuyableItem({"lute"}, 2072, 195, 1)
shopModule:addBuyableItem({"lyre"}, 2071, 120, 1)
shopModule:addBuyableItem({"simple fanfare"}, 2075, 150, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Quero."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I make instruments and sometimes I'm wandering through the lands of Tibia as a bard."})
keywordHandler:addKeyword({'instruments'}, StdModule.say, {npcHandler = npcHandler, text = "You can buy a lyre, lute, drum, and simple fanfare."})
keywordHandler:addKeyword({'bard'}, StdModule.say, {npcHandler = npcHandler, text = "Selling instruments isn't enough to live on and I love music. That's why I wander through the lands from time to time."})
keywordHandler:addKeyword({'music'}, StdModule.say, {npcHandler = npcHandler, text = "I love the music of the elves."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't know what time it is."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome Player! Can I help you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")

npcHandler:addModule(FocusModule:new())
