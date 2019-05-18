local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "barrel") then
		if player:getStorageValue(Storage.secretService.AVINMission03) == 2 then
			npcHandler:say("Do you bring me a barrel of beer??", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(7706, 1) then
				player:setStorageValue(Storage.secretService.AVINMission03, 3)
				npcHandler:say("Three cheers for the noble |PLAYERNAME|.", cid)
			else
				npcHandler:say("You don't have any barrel of beer!", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back, but don't tell others.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back, but don't tell others.")
npcHandler:setMessage(MESSAGE_GREET, "Pshhhht! Not that loud ... but welcome.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
