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
	{ text = "Selling bows, crossbows and ammunition!" },
	{ text = "I am the humble supplier for distance fighting weapons of the Ironhouse, owned by Abran Ironeye." }
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

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "People call me Xed, but my full name is Xedem."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the humble supplier for distance fighting weapons of the Ironhouse, owned by Abran Ironeye."})
keywordHandler:addKeyword({'Ammunition'}, StdModule.say, {npcHandler = npcHandler, text = "I sell arrows for bows and bolts for crossbows. Ask me for a trade if you're interested to see my wares."})
keywordHandler:addKeyword({'Distance'}, StdModule.say, {npcHandler = npcHandler, text = "Well, I sell spears, bows, crossbows and ammunition for distance fighting. Ask me for a trade if you're interested to see my wares."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "I heard rumours somewhere that his father was called Hugo."})
keywordHandler:addKeyword({'garamond'}, StdModule.say, {npcHandler = npcHandler, text = "Can be quite feisty if you doubt his seniorship. <snorts> Knows a thing or two about spells, though. Useful knowledge."})
keywordHandler:addKeyword({'Time'}, StdModule.say, {npcHandler = npcHandler, text = "I don't know, maybe what you really need is a watch."})
keywordHandler:addKeyword({'Weapon'}, StdModule.say, {npcHandler = npcHandler, text = "My offers are bows, crossbows and ammunition. If you'd like to see my offers, ask me for a trade."})
keywordHandler:addKeyword({'Xed'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah, nice name, eh?"})
keywordHandler:addKeyword({'Abran Ironeye'}, StdModule.say, {npcHandler = npcHandler, text = "He is the owner of this market, although - just between you and me - I'm not so sure he's honest."})
keywordHandler:addKeyword({'Honest'}, StdModule.say, {npcHandler = npcHandler, text = "Well, I overheard the boss discussing some shady deals with a man in a black cloak."})
keywordHandler:addKeyword({'Shady Deals'}, StdModule.say, {npcHandler = npcHandler, text = "Something about a sword only great warlords can use and a rare distance fighting item."})
keywordHandler:addKeyword({'Rare Distance'}, StdModule.say, {npcHandler = npcHandler, text = "Yes, but I believe this is nothing but lies seeing that there are only a few distance fighting weapons."})

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. Welcome to the distance fighting booth of the Ironhouse where you can buy bows, crossbows and ammunition.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye |PLAYERNAME|, and may the gods be with you.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
