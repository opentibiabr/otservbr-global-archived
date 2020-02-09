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





-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Sexta.Favor) == 11 then -- verifica se tem a missao aberta

	if player:getStorageValue(Storage.KilmareshQuest.Sexta.Favor) == 11 then
		npcHandler:say({"Alguns moradores estao precisando de ingredientes para terminar um ritual. Voce pode ajudar?"}, cid)
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	end
		
		
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 then
		if player:getStorageValue(Storage.KilmareshQuest.Sexta.Favor) == 11 then -- verifica se missao de entregar o ring e verifica se tem o item
			
			npcHandler:say({"Procure pelos NPCs Yonan, Narsai, Shimun e Tefrit."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Set.Ritual, 1)
			
			player:setStorageValue(Storage.KilmareshQuest.Set.Yonan, 1)
			player:setStorageValue(Storage.KilmareshQuest.Set.Narsai, 1)
			player:setStorageValue(Storage.KilmareshQuest.Set.Shimun, 1)
			player:setStorageValue(Storage.KilmareshQuest.Set.Tefrit, 1)
			
			player:setStorageValue(Storage.KilmareshQuest.Sexta.Favor, 12)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
		else
			npcHandler:say({"Sorry."}, cid)
		end
end




-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR 00 ESSE PASSA PRA CORUJA

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Narsai) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Shimun) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Tefrit) == 3 then

	if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Narsai) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Shimun) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Tefrit) == 3 then
		npcHandler:say({"Voce ajudou alguns moradores com ingredientes?"}, cid)
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	end
		
		
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Narsai) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Shimun) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Tefrit) == 3 then
		if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Narsai) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Shimun) == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Tefrit) == 3 then

			npcHandler:say({"Obrigado. Preciso que voce va em 4 lugares indicados pela Deusa Bastesh."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Nove.Coruja, 1)
			npcHandler.topic[cid] = 4
			playerTopic[cid] = 4
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Onze.Basin) == 1 then -- verifica se tem a missao aberta

	if player:getStorageValue(Storage.KilmareshQuest.Onze.Basin) == 1 then
		npcHandler:say({"Voce verificou todos pontos e trouxe o Symbol of Sun and Sea?"}, cid)
		npcHandler.topic[cid] = 5
		playerTopic[cid] = 5
	end
		
		
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 5 and player:getStorageValue(Storage.KilmareshQuest.Onze.Basin) == 1 then
		if player:getStorageValue(Storage.KilmareshQuest.Onze.Basin) == 1 and player:getItemById(36266, 1) then -- verifica se missao de entregar o ring e verifica se tem o item
			
			player:addItem(36407, 1) -- Blue and Golden Cordon
			npcHandler:say({"Obrigado. Aqui esta sua recompensa."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Boss, 1)
			player:setStorageValue(Storage.KilmareshQuest.Onze.Basin, 2)
			npcHandler.topic[cid] = 6
			playerTopic[cid] = 6
		else
			npcHandler:say({"Sorry."}, cid)
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
