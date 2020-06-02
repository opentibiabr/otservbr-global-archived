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

keywordHandler:addSpellKeyword({"conjure arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Arrow",
		price = 450,
		level = 13,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"conjure poisoned arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Poisoned Arrow",
		price = 700,
		level = 16,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"conjure explosive arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Explosive Arrow",
		price = 1000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)

keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {conjure arrow}, {conjure poisoned arrow} and {conjure explosive arrow}. \z
		What kind of spell do you wish to learn?"
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
