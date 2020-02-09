local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local playerTopic = {}
local function greetCallback(cid)

	local player = Player(cid)

	if player:getStorageValue(Storage.KilmareshQuest.Primeira.Acesso) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Como eu poderia lhe ajudar?")
		playerTopic[cid] = 1
	elseif (player:getStorageValue(Storage.KilmareshQuest.Primeira.jamesfrancisTask) >= 0 and player:getStorageValue(Storage.KilmareshQuest.Primeira.jamesfrancisTask) <= 50)
	and player:getStorageValue(Storage.KilmareshQuest.Primeira.Mission) < 3 then
		npcHandler:setMessage(MESSAGE_GREET, "Como eu poderia lhe ajudar?")
		playerTopic[cid] = 15
	elseif player:getStorageValue(Storage.KilmareshQuest.Primeira.Mission) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, {"Como eu poderia lhe ajudar?"})
		player:setStorageValue(Storage.KilmareshQuest.Primeira.Mission, 5)
		playerTopic[cid] = 20
	end
	npcHandler:addFocus(cid)
	return true
end


local voices = {
	{ text = 'Falas do Npc' }
}
npcHandler:addModule(VoiceModule:new(voices))


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	npcHandler.topic[cid] = playerTopic[cid]
	local player = Player(cid)


--function getBankMoney(cid, 1000)
 --local player = Player(cid)
 --if player:getBankBalance() >= 1000 then
 -- player:setBankBalance(player:getBankBalance() - 1000)
 -- player:sendTextMessage(MESSAGE_INFO_DESCR, "Paid " .. amount .. " gold from bank account. Your account balance is now " .. player:getBankBalance() .. " gold.")
 -- return true
-- end
 --return false
--end

-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "ring") then
	npcHandler:say({"So, the Librarian sent you. Well, yes, I have a vial of the hallucinogen you need. I'll give it to you for 1000 gold. Do you agree?"}, cid)
	npcHandler.topic[cid] = 1
	playerTopic[cid] = 1
	
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 then
		if playerTopic[cid] == 1 and player:getBankBalance(1000) <= 1000 then -- verifica se missao de entregar o ring e verifica se tem o item
			-- player:removeMoney(1000)
			player:removeMoneyNpc(1000)
			-- player:setBankBalance(player:getBankBalance() - 1000)
			player:addItem(36185, 1)			
			npcHandler:say({"Great. Here, take it."}, cid)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
		else
			npcHandler:say({"Voce nao tem dinheiro suficiente."}, cid)
		end
end





	
	
	return true
end



npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
