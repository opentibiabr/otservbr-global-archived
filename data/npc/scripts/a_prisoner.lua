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

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "riddle") then
		if player:getStorageValue(Storage.Quest.MadMageRoom.APrisoner) ~= 1 then
			npcHandler:say("Great riddle, isn't it? If you can tell me the correct answer, \z
				I will give you something. Hehehe!", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "PD-D-KS-P-PD") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Hurray! For that I will give you my key for - hmm - let's say ... some apples. Interested?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			if player:removeItem(2674, 7) then
				npcHandler:say("Mnjam - excellent apples. Now - about that key. You are sure want it?", cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("Get some more apples first!", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("Really, really?", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say("Really, really, really, really?", cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 then
			player:setStorageValue(Storage.Quest.MadMageRoom.APrisoner, 1)
			npcHandler:say("Then take it and get happy - or die, hehe.", cid)
			local key = player:addItem(2088, 1)
			if key then
				key:setActionId(Storage.Quest.Key.ID3666)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		npcHandler:say("Then go away!", cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Wait! Don't leave! I want to tell you about my surreal numbers.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Next time we should talk about my surreal numbers.")
npcHandler:setMessage(MESSAGE_GREET, "Huh? What? I can see! Wow! A non-mino. Did they {capture} you as well?")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())
