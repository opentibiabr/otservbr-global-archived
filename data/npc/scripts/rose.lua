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
	{text = 'Have a look at my beautiful flowers!'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"exotic flowers"}, 2107, 300, 1)
shopModule:addBuyableItem({"flower bowl"}, 2102, 6, 1)
shopModule:addBuyableItem({"god flowers"}, 2100, 5, 1)
shopModule:addBuyableItem({"honey flower"}, 2103, 5, 1)
shopModule:addBuyableItem({"indoor plant"}, 2101, 8, 1)
shopModule:addBuyableItem({"potted flower"}, 2104, 5, 1)

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "Hydra Tongue") then
		npcHandler:say("Do you want to buy a Hydra Tongue for 100 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getMoney() + player:getBankBalance() >= 100 then
				player:removeMoneyNpc(100)
				npcHandler:say("Here you are. A Hydra Tongue!", cid)
				player:addItem(7250, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough money.", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Then not.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Rose, nice to meet you, Player."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Here you may buy some of the most beautiful flowers."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I have no watch on me."})
keywordHandler:addKeyword({'Rose'}, StdModule.say, {npcHandler = npcHandler, text = "That's me. I am not for sale. <giggles>"})
keywordHandler:addKeyword({'flowers'}, StdModule.say, {npcHandler = npcHandler, text = "I offer indoor plants, flower bowls, god flowers, honey flowers and potted flowers. What do you need?"})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Crunor's finest warehouse, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here you may buy some of the most beautiful flowers.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
