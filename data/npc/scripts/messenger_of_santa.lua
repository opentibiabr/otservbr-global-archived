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
	{ text = "Fifty red-lacquered rocking horses... check!" },
	{ text = "Two hundred and fifty gallons of sherry to keep Santa warm during travel... check!" },
	{ text = "Three hundred Banor action figures... check!" },
	{ text = "Fourhundred sugar canes, wrapped up and bundled... check!" },
	{ text = "Five thousand pieces of marzipan... <gulp>, erm, four thousand nine hundred ninety-nine pieces of marzipan - check..." }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"blue christmas bundle"}, 6508, 60, 1)
shopModule:addBuyableItem({"blue christmas garland"}, 6505, 25, 1)
shopModule:addBuyableItem({"christmas branch"}, 6489, 40, 1)
shopModule:addBuyableItem({"christmas card"}, 6388, 10, 1)
shopModule:addBuyableItem({"christmas garland"}, 6514, 25, 1)
shopModule:addBuyableItem({"christmas present"}, 6506, 20, 1)
shopModule:addBuyableItem({"christmas present"}, 6510, 20, 1)
shopModule:addBuyableItem({"christmas present"}, 6511, 20, 1)
shopModule:addBuyableItem({"christmas tree package"}, 3910, 50, 1)
shopModule:addBuyableItem({"christmas wreath"}, 6502, 45, 1)
shopModule:addBuyableItem({"green christmas bundle"}, 6509, 80, 1)
shopModule:addBuyableItem({"red christmas bundle"}, 6507, 70, 1)
shopModule:addBuyableItem({"red christmas garland"}, 6504, 25, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
