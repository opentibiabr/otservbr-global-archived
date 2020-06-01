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
	{ text = "Sho bee doo, shoo bee doo, shoo bee doo wah!" },
	{ text = "La la laaa <sings>" },
	{ text = "Cookies, cakes and cocktails! Fresh juices, toasts and sandwiches!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 5, 1)
shopModule:addBuyableItem({"bottle of glooth wine"}, 23516, 10, 1)
shopModule:addBuyableItem({"bowl of glooth soup"}, 23515, 4, 1)
shopModule:addBuyableItem({"bread"}, 2689, 4, 1)
shopModule:addBuyableItem({"cake"}, 6278, 50, 1)
shopModule:addBuyableItem({"cheese"}, 2696, 6, 1)
shopModule:addBuyableItem({"cookie"}, 2687, 2, 1)
shopModule:addBuyableItem({"cucumber"}, 8842, 3, 1)
shopModule:addBuyableItem({"egg"}, 2328, 2, 1)
shopModule:addBuyableItem({"fish"}, 2667, 5, 1)
shopModule:addBuyableItem({"glooth sandwich"}, 23514, 7, 1)
shopModule:addBuyableItem({"glooth steak"}, 23517, 10, 1)
shopModule:addBuyableItem({"ham"}, 2671, 8, 1)
shopModule:addBuyableItem({"meat"}, 2666, 5, 1)
shopModule:addBuyableItem({"potato"}, 8838, 4, 1)
shopModule:addBuyableItem({"red apple"}, 2674, 3, 1)
shopModule:addBuyableItem({"roll"}, 2690, 2, 1)
shopModule:addBuyableItem({"salmon"}, 2668, 10, 1)
shopModule:addBuyableItem({"tomato"}, 2685, 5, 1)
shopModule:addBuyableItem({"white mushroom"}, 2787, 10, 1)

npcHandler:setMessage(MESSAGE_WALKAWAY, "However.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, bye.")
npcHandler:setMessage(MESSAGE_GREET, "Hi there and welcome to my little {food} shop.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
