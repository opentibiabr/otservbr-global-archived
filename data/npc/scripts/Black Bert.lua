local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


npcHandler:setMessage(MESSAGE_GREET, 'Hi there, |PLAYERNAME|! You look like you are eager to {trade}!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye, |PLAYERNAME|')

local function onTradeRequest(cid)
	if Player(cid):getStorageValue(Storage.thievesGuild.Mission08) =< 1 then
		npcHandler:say("I don't know you and I don't have any dealings with people whom I don't trust.", cid)
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
