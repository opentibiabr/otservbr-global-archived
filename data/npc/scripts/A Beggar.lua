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


	if(msgcontains(msg, "want")) then
		if(getPlayerStorageValue(cid, 10050) == 1) then
			npcHandler:say("The guys from the magistrate sent you here, didn't they?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Thought so. You'll have to talk to the king though. The beggar king that is. The king does not grant an audience to just everyone. You know how those kings are, don't you? ... ", cid)
			selfSay("However, to get an audience with the king, you'll have to help his subjects a bit. ... ", cid)
			selfSay("His subjects that would be us, the poor, you know? ... ", cid)
			selfSay("So why don't you show your dedication to the poor? Go and help Chavis at the poor house. He's collecting food for people like us. ... ", cid)
			selfSay("If you brought enough of the stuff you'll see that the king will grant you entrance in his {palace}.", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, 20051, 1) -- quest log mission 1 completada
			setPlayerStorageValue(cid, 20052, 0) -- quest log mission 2
			setPlayerStorageValue(cid, 871241, 1) -- quest log mission 2
		end
	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
