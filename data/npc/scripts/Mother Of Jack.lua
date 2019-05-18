local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'JAAAAACK? EVERYTHING ALRIGHT DOWN THERE?' },
	{ text = 'Oh dear, I can\'t find anything in here!' },
	{ text = 'There is still some dust on the drawer over there. What where you thinking, Jane?' },
	{ text = 'Jane!' }
}

npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "I demand an explanation of you entering our house without any invitation.")
npcHandler:addModule(FocusModule:new())
