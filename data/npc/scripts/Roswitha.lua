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


	if(msgcontains(msg, "Harsin")) then
		if(getPlayerStorageValue(cid, 10050) == 13) then
			selfSay("I'm sorry, but Harsin no longer lives here. He ordered a local named Quandon to transport all his stuff somewhere. I don't know where he moved, but Quandon should be able to help you with this information.", cid)
            setPlayerStorageValue(cid, 10050, 14)
		   setPlayerStorageValue(cid, 30052, 1)
		   setPlayerStorageValue(cid, 30053, 0)
		   player:setStorageValue(Storage.DarkTrails.DoorQuandon, 1)
		end
	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
