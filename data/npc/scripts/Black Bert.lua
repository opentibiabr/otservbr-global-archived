local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


npcHandler:setMessage(MESSAGE_GREET, 'Hello.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')

local function onTradeRequest(cid)
	if Player(cid):getStorageValue(Storage.thievesGuild.Mission08) == 1 then
		npcHandler:say('Sorry, but you do not belong to my exclusive customers.', cid)
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
