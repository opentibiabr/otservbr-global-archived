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
	{ text = "Hey, need some furniture for your house? Come to the Plank and Treasurechest Market!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"blue bed kit"}, 7907, 80, 1)
shopModule:addBuyableItem({"canopy bed kit"}, 20252, 200, 1)
shopModule:addBuyableItem({"green bed kit"}, 7904, 80, 1)
shopModule:addBuyableItem({"green cushioned chair kit"}, 3902, 40, 1)
shopModule:addBuyableItem({"red bed kit"}, 7906, 80, 1)
shopModule:addBuyableItem({"red cushioned chair kit"}, 3901, 40, 1)
shopModule:addBuyableItem({"rocking chair kit"}, 3904, 25, 1)
shopModule:addBuyableItem({"venorean wardrobe kit"}, 20255, 50, 1)
shopModule:addBuyableItem({"wooden chair kit"}, 3903, 15, 1)
shopModule:addBuyableItem({"yellow bed kit"}, 7905, 80, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Allen Richardson. I am the owner of this market."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I run this market and sell furniture."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It is 11:44 am. Too bad we run out of cuckoo clocks."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'chairs'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you wooden chairs, rocking chairs, red cushioned chairs, green cushioned chairs and sofa chairs."})
keywordHandler:addKeyword({'sofa chair'}, StdModule.say, {npcHandler = npcHandler, text = "You want to buy a sofa chair for 55 gold?"})
keywordHandler:addKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = "Hmm, but I'm sure, it would fit nicely into your house."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Plank and Treasurechest Market, |PLAYERNAME|! Best {trades} in town!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
