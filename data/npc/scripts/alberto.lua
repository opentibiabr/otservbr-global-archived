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
	{ text = 'Bring your arena badges!' },
	{ text = 'Arena fighters visit me to exchange their hard earned arena badges! Earned in blood that is... mostly.'}
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"great health potion"}, 7591, 225, 1)
shopModule:addBuyableItem({"health potion"}, 7618, 50, 1)
shopModule:addBuyableItem({"strong health potion"}, 7588, 115, 1)
shopModule:addBuyableItem({"ultimate health potion"}, 8473, 379, 1)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
