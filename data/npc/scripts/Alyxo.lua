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

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 1 then
	if player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 1 then
		npcHandler:say({"Voce poderia matar 3 bosses pra mim?"}, cid)
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 1 then
		if player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 1 then
			
			npcHandler:say({"Volte assim que matar todos os 3 bosses."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Boss, 2)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Bragrumol, 1)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Mozradek, 1)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Xogixath, 1)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 2 then

	if player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 2 then
		npcHandler:say({"Voce conseguiu enfrentar todos os 3 bosses?"}, cid)
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 3 and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 2 then
		if player:getStorageValue(Storage.KilmareshQuest.Doze.Bragrumol) == 2 and player:getStorageValue(Storage.KilmareshQuest.Doze.Mozradek) == 2 and player:getStorageValue(Storage.KilmareshQuest.Doze.Xogixath) == 2 then -- verifica se missao de entregar o ring e verifica se tem o item
			
			npcHandler:say({"Estou muito satisfeita."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Boss, 3)
			npcHandler.topic[cid] = 4
			playerTopic[cid] = 4
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- GANHO A MISSAO DE 3

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 3 then

	if player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 3 then
		npcHandler:say({"Poderia me ajudar em mais alguns trabalhos?"}, cid)
		npcHandler.topic[cid] = 5
		playerTopic[cid] = 5
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 5 and player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 3 then
		if player:getStorageValue(Storage.KilmareshQuest.Doze.Boss) == 3 then
			
			npcHandler:say({"Mate 300 membros do culto a Fafnar, me ajude a encontrar a Ivory Lyre e me ajude a encontrar um animel para pedrificar."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Doze.Boss, 4)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Fafnar, 1)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Lyre, 1)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Presente, 1)
			npcHandler.topic[cid] = 6
			playerTopic[cid] = 6
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- REPORT MISSAO

if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 300 then

	if player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 300 then
		npcHandler:say({"Voce terminou de matar os 300 membros do culto de Fafnar?"}, cid)
		npcHandler.topic[cid] = 7
		playerTopic[cid] = 7
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 7 and player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 300 then
		if player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 300 then
			
			npcHandler:say({"Obrigado. Voce matou os 300 membros do culto de Fafnar."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Fafnar, 301)
			npcHandler.topic[cid] = 8
			playerTopic[cid] = 8
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- REPORT MISSAO

if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Treze.Lyre) == 3 then

	if player:getStorageValue(Storage.KilmareshQuest.Treze.Lyre) == 3 then
		npcHandler:say({"Voce conseguiu achar a Lyre?"}, cid)
		npcHandler.topic[cid] = 9
		playerTopic[cid] = 9
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 9 and player:getStorageValue(Storage.KilmareshQuest.Treze.Lyre) == 3 then
		if player:getStorageValue(Storage.KilmareshQuest.Treze.Lyre) == 3 and player:getItemById(36282, 1) then
			player:removeItem(36282, 1)
			npcHandler:say({"Obrigado. Estava a procura da Lyre a um bom tempo"}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Lyre, 4)
			npcHandler.topic[cid] = 10
			playerTopic[cid] = 10
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- REPORT MISSAO

if msgcontains(msg, "report") and player:getStorageValue(Storage.KilmareshQuest.Treze.Presente) == 2 then

	if player:getStorageValue(Storage.KilmareshQuest.Treze.Presente) == 2 then
		npcHandler:say({"Voce conseguiu achar a Small Tortoise?"}, cid)
		npcHandler.topic[cid] = 11
		playerTopic[cid] = 11
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 11 and player:getStorageValue(Storage.KilmareshQuest.Treze.Presente) == 2 then
		if player:getStorageValue(Storage.KilmareshQuest.Treze.Presente) == 2 and player:getItemById(36280, 1) then
			player:removeItem(36280, 1)
			npcHandler:say({"Obrigado. Estava a procura da Small Tortoise."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Treze.Presente, 3)
			npcHandler.topic[cid] = 12
			playerTopic[cid] = 12
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- TORTOISE PEDRIFICADA

if msgcontains(msg, "small tortoise") then

	if player:getItemById(36280, 1) then
		npcHandler:say({"Voce quer que eu pedrifique uma small tortoise?"}, cid)
		npcHandler.topic[cid] = 15
		playerTopic[cid] = 15
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 15 then
		if player:getItemById(36280, 1) then
		
			player:removeItem(36280, 1)
			player:addItem(36281, 1)
			npcHandler:say({"Aqui esta sua Small Petrified Tortoise."}, cid)
			npcHandler.topic[cid] = 16
			playerTopic[cid] = 16
		else
			npcHandler:say({"Sorry."}, cid)
		end
	
end



-- COMPLETAR E PEGAR ITEM

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 301 then

	if player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 301 then
		npcHandler:say({"Voce terminou os 3 trabalhos que lhe dei?"}, cid)
		npcHandler.topic[cid] = 13
		playerTopic[cid] = 13
	end
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 13 and player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 301 then
		if player:getStorageValue(Storage.KilmareshQuest.Treze.Fafnar) == 301 then
			
			player:addAchievement(462, "Congratulations! You earned the achievement \"Sculptor Apprentice\".")
			
			player:addItem(36409, 1)
			npcHandler:say({"Parabens, voce concluiu os 3 trabalhos que lhe dei."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Quator.Restos, 1)
			npcHandler.topic[cid] = 14
			playerTopic[cid] = 14
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
