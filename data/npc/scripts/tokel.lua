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
	{ text = "Are you hungry? I offer bread, cheese, ham and meat. Perfect for a little snack." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bread"}, 2689, 3, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 5, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Tokel."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "I pray to Crunor to bless our harvests."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "I wish I'd be as rich as him."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "I know nothing but about such stuff."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "I know nothing but about such stuff."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "I have not seen much of it yet. I am thinking about moving to Edron soon."})
keywordHandler:addKeyword({'Edron'}, StdModule.say, {npcHandler = npcHandler, text = "They say life is easy there, the soil is rich, the city save. One day I might move there."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, text = "I know nothing but about such stuff."})
keywordHandler:addKeyword({'dungeons'}, StdModule.say, {npcHandler = npcHandler, text = "Here are no dungeons as far as I know."})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, text = "It's relatively peaceful here."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "The city is too lousy and crowded for my taste."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Oh, now that you mention it: I have much left to do, please excuse me."})

npcHandler:setMessage(MESSAGE_GREET, "Hi there, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, take a look at my tasty offers.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
