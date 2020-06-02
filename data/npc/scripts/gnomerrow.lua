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
	{ text = "Outch! This one is quite pointy and sharp." },
	{ text = "Hm, pink burst arrows might be a breakthrough." }
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

npcHandler:setMessage(MESSAGE_GREET, "Hi |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you later!")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
