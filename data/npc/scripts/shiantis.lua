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
	{text = 'Containers, decoration and general goods, all here!'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"basket"}, 1989, 6, 1)
shopModule:addBuyableItem({"birdcage kit"}, 3922, 50, 1)
shopModule:addBuyableItem({"brown book"}, 1950, 15, 1)
shopModule:addBuyableItem({"black book"}, 1955, 15, 1)
shopModule:addBuyableItem({"grey small book"}, 1959, 15, 1)
shopModule:addBuyableItem({"bottle"}, 2007, 3, 1)
shopModule:addBuyableItem({"bucket"}, 2005, 4, 1)
shopModule:addBuyableItem({"candelabrum"}, 2057, 8, 1)
shopModule:addBuyableItem({"candlestick"}, 2047, 2, 1)
shopModule:addBuyableItem({"chimney kit"}, 8692, 200, 1)
shopModule:addBuyableItem({"closed trap"}, 2578, 280, 1)
shopModule:addBuyableItem({"coal basin kit"}, 3932, 25, 1)
shopModule:addBuyableItem({"crowbar"}, 2416, 260, 1)
shopModule:addBuyableItem({"cuckoo clock"}, 1877, 40, 1)
shopModule:addBuyableItem({"document"}, 1968, 12, 1)
shopModule:addBuyableItem({"empty goldfish bowl"}, 5928, 50, 1)
shopModule:addBuyableItem({"fishing rod"}, 2580, 150, 1)
shopModule:addBuyableItem({"globe kit"}, 3926, 50, 1)
shopModule:addBuyableItem({"greeting card"}, 6387, 30, 1)
shopModule:addBuyableItem({"inkwell"}, 2600, 10, 1)
shopModule:addBuyableItem({"table lamp kit"}, 3924, 35, 1)
shopModule:addBuyableItem({"machete"}, 2442, 35, 1)
shopModule:addBuyableItem({"oven kit"}, 6372, 80, 1)
shopModule:addBuyableItem({"parchment"}, 1967, 8, 1)
shopModule:addBuyableItem({"parchment"}, 4842, 8, 1)
shopModule:addBuyableItem({"pendulum clock kit"}, 3927, 75, 1)
shopModule:addBuyableItem({"pick"}, 2553, 50, 1)
shopModule:addBuyableItem({"picture"}, 1852, 50, 1)
shopModule:addBuyableItem({"picture"}, 1854, 50, 1)
shopModule:addBuyableItem({"picture"}, 1853, 50, 1)
shopModule:addBuyableItem({"present"}, 2331, 10, 1)
shopModule:addBuyableItem({"red backpack"}, 2000, 20, 1)
shopModule:addBuyableItem({"red bag"}, 1993, 5, 1)
shopModule:addBuyableItem({"rocking horse kit"}, 3926, 30, 1)
shopModule:addBuyableItem({"rope"}, 2120, 50, 1)
shopModule:addBuyableItem({"scroll"}, 1949, 5, 1)
shopModule:addBuyableItem({"scythe"}, 2550, 25, 1)
shopModule:addBuyableItem({"shovel"}, 2554, 50, 1)
shopModule:addBuyableItem({"telescope kit"}, 3925, 70, 1)
shopModule:addBuyableItem({"torch"}, 2054, 2, 1)
shopModule:addBuyableItem({"valentine's card"}, 6538, 30, 1)
shopModule:addBuyableItem({"vial of oil"}, 2006, 20, 1, 11)
shopModule:addBuyableItem({"wall mirror"}, 1851, 40, 1)
shopModule:addBuyableItem({"wall mirror"}, 1848, 40, 1)
shopModule:addBuyableItem({"wall mirror"}, 1845, 40, 1)
shopModule:addBuyableItem({"watch"}, 2036, 20, 1)
shopModule:addBuyableItem({"water pipe"}, 2099, 40, 1)
shopModule:addBuyableItem({"worm"}, 3976, 1, 1)

shopModule:addSellableItem({"gemmed book"}, 1976, 100, 1)
shopModule:addSellableItem({"orange book"}, 1962, 30, 1)
shopModule:addSellableItem({"blue book"}, 1963, 20, 1)
shopModule:addSellableItem({"green books"}, 1965, 50, 1)
shopModule:addSellableItem({"closed trap"}, 2578, 75, 1)
shopModule:addSellableItem({"crowbar"}, 2416, 50, 1)
shopModule:addSellableItem({"fishing rod"}, 2580, 40, 1)
shopModule:addSellableItem({"inkwell"}, 2600, 8, 1)
shopModule:addSellableItem({"machete"}, 2442, 6, 1)
shopModule:addSellableItem({"parchment"}, 1967, 5, 1)
shopModule:addSellableItem({"pick"}, 2553, 15, 1)
shopModule:addSellableItem({"rope"}, 2120, 15, 1)
shopModule:addSellableItem({"scythe"}, 2550, 10, 1)
shopModule:addSellableItem({"shovel"}, 2554, 8, 1)
shopModule:addSellableItem({"vial"}, 2006, 5, 1)
shopModule:addSellableItem({"watch"}, 2036, 6, 1)
shopModule:addSellableItem({"wooden hammer"}, 2556, 15, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if msgcontains(msg, "football") then
		npcHandler:say("Do you want to buy a football for 111 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			local player = Player(cid)
			if player:getMoney() + player:getBankBalance() >= 111 then
				npcHandler:say("Here it is.", cid)
				player:addItem(2109, 1)
				player:removeMoneyNpc(111)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What can I do for you? If you need adventure equipment, ask me for a {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
