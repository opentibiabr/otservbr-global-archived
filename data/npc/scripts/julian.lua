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
	{ text = "A customer? That's music in my ears!" },
	{ text = "I make instruments and sometimes I'm wandering through the lands of Tibia as a bard." },
	{ text = "You can buy a lyre, lute, drum, and simple fanfare. I also sell pianos and harps. If you'd like to see my offers, ask me for a trade." }
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

npcHandler:setMessage(MESSAGE_GREET, "Ah, looking for some cooking utensils today, |PLAYERNAME|? Welcome!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you again ... sooner or later, more or less alive.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yes, it's a wise idea not to leave the choice of your future vessel to chance. Have a look.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
