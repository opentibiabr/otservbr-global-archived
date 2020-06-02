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
	{text = 'Id like to take a walk with Aurita.'},
	{text = 'I miss Aurita golden hair.*sigh*'},
	{text = 'Pas in boldly tyll thow com to an hall the feyrist undir sky ... *sings*'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Name, id, price, count/charges
shopModule:addSellableItem({"bow"}, 2456, 100, 1)
shopModule:addSellableItem({"crossbow"}, 2455, 120, 1)
shopModule:addSellableItem({"spear"}, 2389, 3, 1)

shopModule:addBuyableItem({'arrow'}, 2544, 3, 1)
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1)
shopModule:addBuyableItem({'bow'}, 2456, 400, 1)
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1)
shopModule:addBuyableItem({'crystalline arrow'}, 18304, 20, 1)
shopModule:addBuyableItem({'drill bolt'}, 18436, 12, 1)
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1)
shopModule:addBuyableItem({'envenomed arrow'}, 18437, 12, 1)
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1)
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1)
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1)
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1)
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1)
shopModule:addBuyableItem({'prismatic bolt'}, 18435, 20, 1)
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1)
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1)
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1)
shopModule:addBuyableItem({'spear'}, 2389, 9, 1)
shopModule:addBuyableItem({'tarsal arrow'}, 15648, 6, 1)
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1)
shopModule:addBuyableItem({'vortex bolt'}, 15649, 6, 1)

npcHandler:setMessage(MESSAGE_GREET, "Greatings, mortal beigin.")
npcHandler:setMessage(MESSAGE_SENDTRADE, " Im carving bolts and arrows and i also craft bows anda spears.If you'd like to buy some ammunition, take a look.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path, |PLAYERNAME|.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
