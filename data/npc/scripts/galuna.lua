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
{text = 'Bows, crossbows and ammunition on special sale today.'}
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Name, id, price, count/charges
shopModule:addSellableItem({"spear"}, 2389, 3, 1)

shopModule:addBuyableItem({'arrow'}, 2544, 3, 1)
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1)
shopModule:addBuyableItem({'bow'}, 2456, 400, 1)
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1)
shopModule:addBuyableItem({'spear'}, 2389, 9, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Galuna, paladin and fletcher."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the local fletcher. I am selling bows, crossbows, and ammunition. Do you need anything?"})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "Tibia, a green island. Here it is wunderful to walk into the forests and to hunt with a bow."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Don't bother me. Go and buy a watch."})
keywordHandler:addKeyword({'paladins'}, StdModule.say, {npcHandler = npcHandler, text = "We are feared warriors and good marksmen. Ask Elane if want to know more about the guild."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, text = "It is rumored that they live in the northeast of Tibia. They are the best in archery."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "We have visitors of all kind in Thais, only elves show up seldom."})
keywordHandler:addKeyword({'Elane'}, StdModule.say, {npcHandler = npcHandler, text = "She is the leader of all paladins."})
keywordHandler:addKeyword({'Gorn'}, StdModule.say, {npcHandler = npcHandler, text = "I supplied him with my goods in the past, now I sell them myself."})

npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What do you need? Distance weapons? I sell lots of them.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
