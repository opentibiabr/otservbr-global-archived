local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()						npcHandler:onThink() 						end
function onThink() 						npcHandler:onThink() 						end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end

	local player = Player(cid)
	-- missing the full script and task of the npc on oramond quest for complete
	if(msgcontains(msg, "mission")) then
		if player:getStorageValue(Storage.DarkTrails.Mission15) == 1 then
			npcHandler:say("Ahhhhhhhh! Find and investigate the hideout, the mission 17", cid)
			player:setStorageValue(Storage.DarkTrails.Mission16, 1)
		end
		else
		npcHandler:say("Ahhhhhhhh! ", cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
