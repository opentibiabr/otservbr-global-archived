local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Now I need to clean up everything again.' },
	{ text = 'So much to do, so little time, they say...' },
	{ text = 'Could it be...? No. No way.' },
	{ text = 'Mh...' }
}

npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Yes? What can I do for you? I hope this won't take long, though.")
npcHandler:addModule(FocusModule:new())
