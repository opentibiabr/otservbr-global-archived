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


	if(msgcontains(msg, "necrometer")) then
		--if(getPlayerStorageValue(cid, 10050) <= 10) then
			selfSay("A necrometer? Have you any idea how rare and expensive a necrometer is? There is no way I could justify giving a necrometer to an inexperienced adventurer. Hm, although ... if you weren't inexperienced that would be a different matter. ...", cid)
			selfSay("Did you do any measuring task for Doubleday lately?", cid)
			npcHandler.topic[cid] = 1
		--end
			elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) and (getPlayerStorageValue(cid, 10050) < 10) then
			npcHandler:say("Indeed I heard you did a good job out there. <sigh> I guess that means I can hand you one of our necrometers. Handle it with care", cid)
			npcHandler.topic[cid] = 0
		   setPlayerStorageValue(cid, 10050, 10)
		   setPlayerStorageValue(cid, 20059, 1)
		   setPlayerStorageValue(cid, 30050, 0)
		   doPlayerAddItem(cid, 23495,1)

		   else
		   npcHandler:say("You already got the Necrometer.", cid)
		end
	end

	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
