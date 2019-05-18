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
	
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 10050) == 16) then
			selfSay("Ahhhhhhhh! Find and investigate the hideout, the mission 17", cid)
			setPlayerStorageValue(cid, 10050, 17)
		   
		end
	
		else 
		selfSay("Ahhhhhhhh! ", cid)
		
	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
