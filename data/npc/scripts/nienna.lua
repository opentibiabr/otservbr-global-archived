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
	{ text = "Get your flowers and that special something for your loved one!" },
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"black pearl"}, 2144, 280, 1)
shopModule:addBuyableItem({"candelabrum"}, 2057, 8, 1)
shopModule:addBuyableItem({"candlestick"}, 2047, 2, 1)
shopModule:addBuyableItem({"exotic flowers"}, 2107, 310, 1)
shopModule:addBuyableItem({"fireworks rocket"}, 6576, 1000, 1)
shopModule:addBuyableItem({"flower bouquet"}, 7733, 500, 1)
shopModule:addBuyableItem({"flower bowl"}, 2102, 6, 1)
shopModule:addBuyableItem({"god flowers"}, 2100, 5, 1)
shopModule:addBuyableItem({"heart pillow"}, 1685, 30, 1)
shopModule:addBuyableItem({"honey flower"}, 2103, 5, 1)
shopModule:addBuyableItem({"lyre"}, 2071, 120, 1)
shopModule:addBuyableItem({"orange star"}, 2759, 50, 1)
shopModule:addBuyableItem({"potter flower"}, 2104, 5, 1)
shopModule:addBuyableItem({"present"}, 1990, 10, 1)
shopModule:addBuyableItem({"red rose"}, 2744, 11, 1)
shopModule:addBuyableItem({"ruby necklace"}, 2133, 3560, 1)
shopModule:addBuyableItem({"small amethyst"}, 2150, 400, 1)
shopModule:addBuyableItem({"small diamond"}, 2145, 600, 1)
shopModule:addBuyableItem({"small emerald"}, 2149, 500, 1)
shopModule:addBuyableItem({"small ruby"}, 2147, 50, 1)
shopModule:addBuyableItem({"small sapphire"}, 2146, 500, 1)
shopModule:addBuyableItem({"white pearl"}, 2143, 320, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
