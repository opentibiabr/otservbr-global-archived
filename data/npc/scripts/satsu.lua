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
	{ text = "Fresh drinks for all you love birds!" }
}


-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"cocktail glass"}, 10150, 52, 1, 3)

shopModule:addSellableItem({"cocktail glass"}, 10150, 50, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "beer") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 3)
		end
	elseif msgcontains(msg, "fruit juice") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 21)
		end
	elseif msgcontains(msg, "lemonade") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 5)
		end
	elseif msgcontains(msg, "mead") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 43)
		end
	elseif msgcontains(msg, "milk") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 6)
		end
	elseif msgcontains(msg, "rum") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 27)
		end
	elseif msgcontains(msg, "tea") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 35)
		end
	elseif msgcontains(msg, "water") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 1)
		end
	elseif msgcontains(msg, "wine") then
		if player:getItemCount(10150) >= 1 then
			npcHandler:say("here's your drink", cid)
			player:removeMoneyNpc(2)
			player:removeItem(10150, 1)
			player:addItem(10150, 1, 15)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
