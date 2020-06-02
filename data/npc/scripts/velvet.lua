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
	{text = 'Silky smooth pillows and tapestries! No home is perfect without them!'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"blue pillow"}, 1686, 25, 1)
shopModule:addBuyableItem({"blue tapestry"}, 1872, 25, 1)
shopModule:addBuyableItem({"green pillow"}, 1688, 25, 1)
shopModule:addBuyableItem({"green tapestry"}, 1860, 25, 1)
shopModule:addBuyableItem({"heart pillow"}, 1685, 30, 1)
shopModule:addBuyableItem({"orange tapestry"}, 1866, 25, 1)
shopModule:addBuyableItem({"purple tapestry"}, 1857, 25, 1)
shopModule:addBuyableItem({"red pillow"}, 1687, 25, 1)
shopModule:addBuyableItem({"red tapestry"}, 1869, 25, 1)
shopModule:addBuyableItem({"round blue pillow"}, 1690, 25, 1)
shopModule:addBuyableItem({"round purple pillow"}, 1692, 25, 1)
shopModule:addBuyableItem({"round red pillow"}, 1691, 25, 1)
shopModule:addBuyableItem({"round turquoise pillow"}, 1693, 25, 1)
shopModule:addBuyableItem({"silky tapestry"}, 9959, 80, 1)
shopModule:addBuyableItem({"small blue pillow"}, 1681, 20, 1)
shopModule:addBuyableItem({"small green pillow"}, 1679, 20, 1)
shopModule:addBuyableItem({"small orange pillow"}, 1682, 20, 1)
shopModule:addBuyableItem({"small purple pillow"}, 1678, 20, 1)
shopModule:addBuyableItem({"small red pillow"}, 1680, 20, 1)
shopModule:addBuyableItem({"small turquoise pillow"}, 1683, 20, 1)
shopModule:addBuyableItem({"small white pillow"}, 1684, 20, 1)
shopModule:addBuyableItem({"white tapestry"}, 1880, 25, 1)
shopModule:addBuyableItem({"yellow pillow"}, 1689, 25, 1)
shopModule:addBuyableItem({"yellow tapestry"}, 1863, 25, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Velvet. How can I help you?"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm working here in this shop. Are you interested in any of our goods?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It's 3:29 am, my lady."})
keywordHandler:addKeyword({'goods'}, StdModule.say, {npcHandler = npcHandler, text = "I sell pillows and tapestries."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to our pillow and tapestry shop, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
