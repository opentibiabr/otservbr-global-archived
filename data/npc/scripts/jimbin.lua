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

shopModule:addBuyableItem({"vial of beer"}, 2006, 2, 1, 3)
shopModule:addBuyableItem({"vial of water"}, 2006, 1, 1, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Jimbin Luckythroat, son of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "I supply the army with dwarfish beer to keep morals high."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "The general is a fine man. Can drink as much as he wants and still is sober."})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, text = "The cookbook? It belongs to Maryza. I think she has a few copies for sale."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm runing the Jolly Axeman together with my wife Maryza."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "The king orders huge amounts of mushroombeer for festivities."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "The Tibia our race was born into was even more fierce than the world you young ones know."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It is about 12:28 pm."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "Actually I belive it's more than a taverntale."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "Hah! He never dares to trespass our realm."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "Silly town. Alcohol is forbidden there and elves visit this town quite often, what certainly suggests nothing good about a town, jawoll."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Bah! Humans, can't stand a drink, jawoll."})
keywordHandler:addKeyword({'Maryza'}, StdModule.say, {npcHandler = npcHandler, text = "She's a fine cook; likes it bloddy, though. Humans call her Bloody Mary, but don't mention that to her if you're smart."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = "Oh well, many hidden places of ancient times appear seemingly out of nowhere in these times."})

npcHandler:setMessage(MESSAGE_GREET, "Talking to me, |PLAYERNAME|?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back if you enjoyed my tavern, if not ... well, get eaten by a dragon, jawoll.")

npcHandler:addModule(FocusModule:new())
