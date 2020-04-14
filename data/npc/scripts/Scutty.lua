local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local player = Player(cid)
	if (msgcontains(msg, 'research notes')) then
		if(player:getStorageValue(Storage.ShadownofYalahar.QuestStart) == 1) and player:getStorageValue(Storage.ShadownofYalahar.Scutty) < 1 then
			selfSay("Ok, ok. Considering how much knowledge Telas was willing to share and keeping in mind that he promised to send me the results of his research I'll make an exception. I will send him the information he wants .. even a bit more. ...", cid)
			npcHandler:say("He'd better live up to his promises, a dwarf does not forget or forgive easily.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, player:getStorageValue(Storage.ShadownofYalahar.Questline) + 1)
			setPlayerStorageValue(cid, 82960, getPlayerStorageValue(cid, 82960) + 1) -- quest log
			player:setStorageValue(Storage.ShadownofYalahar.Scutty, 1)
			npcHandler.topic[cid] = 0
	    end
	end
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
