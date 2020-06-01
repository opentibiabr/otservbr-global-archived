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
	{ text = "Ah, salut! Come 'ere and 'ave some of my delicious fruits!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"banana"}, 2676, 5, 1)
shopModule:addBuyableItem({"blueberry"}, 2677, 1, 1)
shopModule:addBuyableItem({"vial of milk"}, 2006, 15, 1, 6)
shopModule:addBuyableItem({"carrot"}, 2684, 3, 1)
shopModule:addBuyableItem({"cherry"}, 2679, 1, 1)
shopModule:addBuyableItem({"corncob"}, 2686, 3, 1)
shopModule:addBuyableItem({"grapes"}, 2681, 3, 1)
shopModule:addBuyableItem({"juice squeezer"}, 5865, 100, 1)
shopModule:addBuyableItem({"lemon"}, 8841, 3, 1)
shopModule:addBuyableItem({"mango"}, 5097, 10, 1)
shopModule:addBuyableItem({"melon"}, 2682, 10, 1)
shopModule:addBuyableItem({"orange"}, 2675, 10, 1)
shopModule:addBuyableItem({"potato"}, 8838, 4, 1)
shopModule:addBuyableItem({"pumpkin"}, 2683, 10, 1)
shopModule:addBuyableItem({"sample of venorean spice"}, 9675, 200, 1)
shopModule:addBuyableItem({"strawberry"}, 2680, 2, 1)
shopModule:addBuyableItem({"white mushroom"}, 2787, 10, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I'm Livielle Delacroix, madame."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Alors, guess what my job might be, standing 'ere in the middle of all these juicy exotic fruits?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "Oh, for sure will my fruits 'elp you driving off all these nasty diseases and strengthen your immune system!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time is 3:34 am now."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = "What's your favorite flavour today? I offer all sorts of exotic fruits."})
keywordHandler:addKeyword({'fruits'}, StdModule.say, {npcHandler = npcHandler, text = "I offer you bananas, melons, pumpkins, white mushrooms, oranges, strawberries, and blueberries."})
keywordHandler:addKeyword({'strawberries'}, StdModule.say, {npcHandler = npcHandler, text = "Do you want to buy a strawberry for 2 gold?"})
keywordHandler:addKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = "You should really prefer my fruits over all this fat meat offered elsewhere. They keep you lithe and lissom."})

npcHandler:setMessage(MESSAGE_GREET, "Bienvenue, |PLAYERNAME|! My fruits will complete the icing on your cake.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bon appétit, and come back soon for your daily dose of vitamins!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Alors, guess what my job might be, standing 'ere in the middle of all these juicy exotic {fruits}?")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
