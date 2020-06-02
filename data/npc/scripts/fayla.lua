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
	{text = "Do, re, mi, fa, so la, ti, do! <hums>"} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"drum"}, 2073, 140, 1)
shopModule:addBuyableItem({"harp kit"}, 3934, 50, 1)
shopModule:addBuyableItem({"lute"}, 2072, 195, 1)
shopModule:addBuyableItem({"lyre"}, 2071, 120, 1)
shopModule:addBuyableItem({"piano kit"}, 3933, 200, 1)
shopModule:addBuyableItem({"simple fanfare"}, 2075, 150, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
