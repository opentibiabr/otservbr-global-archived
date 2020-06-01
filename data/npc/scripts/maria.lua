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
	{ text = "Hello, hello! Put your feet up and relax in the Hard Rock Tavern." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 3, 1)
shopModule:addBuyableItem({"valentine cake"}, 6393, 10, 1)
shopModule:addBuyableItem({"vial of beer"}, 2006, 3, 1, 3)
shopModule:addBuyableItem({"vial of lemonade"}, 2006, 2, 1, 5)
shopModule:addBuyableItem({"vial of water"}, 2006, 2, 1, 1)
shopModule:addBuyableItem({"vial of wine"}, 2006, 3, 1, 15)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Maria."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am running this upper part of the Hard Rock Tavern."})
keywordHandler:addKeyword({'upper part'}, StdModule.say, {npcHandler = npcHandler, text = "Yes, that's here. Below is the Fighting Pits for those fighters that use the Fighting Pits."})
keywordHandler:addKeyword({'Fighting Pits'}, StdModule.say, {npcHandler = npcHandler, text = "Well, they do a lot of fighting down there."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "In Venore, everyone is a king ... until he runs out of luck or money."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "In the long run it's money that rules everything in Tibia."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = "Food and drinks as much as you can pay for."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "Good fighters need good entertainment. That's what they get here."})
keywordHandler:addKeyword({'amazons'}, StdModule.say, {npcHandler = npcHandler, text = "I can only hope those wild women don't scare away more customers than come here in order to fight against them."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "I think he's more a Thaian problem."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "I'd rather have a stainless steel cooking pan than such a knife."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "As far as the merchants say it's economically unimportant."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "It's a shame that this lousy city is the heart of the kingdom."})
keywordHandler:addKeyword({'Maria'}, StdModule.say, {npcHandler = npcHandler, text = "Yes, I am Maria, Maria Corona."})

npcHandler:setMessage(MESSAGE_GREET, "The Hard Rock Tavern greets you, |PLAYERNAME|. Sit down, have some {food} and a {drink}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|. Tell your friends about us and visit us again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|. Tell your friends about us and visit us again.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
