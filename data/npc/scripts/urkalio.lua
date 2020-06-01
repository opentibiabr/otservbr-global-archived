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
	{ text = "Enjoy a good drink in the Hard Rock Tavern!." }
}

shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 5, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 2, 1, 3)
shopModule:addBuyableItem({"vial of lemonade"}, 2006, 2, 1, 5)
shopModule:addBuyableItem({"vial of water"}, 2006, 1, 1, 1)
shopModule:addBuyableItem({"vial of wine"}, 2006, 3, 1, 15)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Urkalio."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am responsible for the Hard Rock Pits Tavern."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "No clue, it's equally dark down here at any time."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Down here everyone is king as far as where his weapons reach."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "Sooner or later everyone comes here, so why bother to travel."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = "I sell food and drinks for the hungry and thirsty."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "I have cookies, bread, cheese, ham, and meat."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "I would love to see that weapon in a fight."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "THAT would be some attraction down here."})
keywordHandler:addKeyword({'Fighting Pits'}, StdModule.say, {npcHandler = npcHandler, text = "Choose your enemies with care."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "I don't care about their 'independence war'."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Such a boring city. I wonder why anyone would live there."})
keywordHandler:addKeyword({'Asrak'}, StdModule.say, {npcHandler = npcHandler, text = "He's the best. To be the man, you'll have to beat the minotaur, so to say. Not that you could provoke him to a fight at all."})
keywordHandler:addKeyword({'Maria'}, StdModule.say, {npcHandler = npcHandler, text = "She's kind of my boss."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the pits of the Hard Rock Tavern, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a good fight, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a good fight, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Have any food or drinks you like.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
