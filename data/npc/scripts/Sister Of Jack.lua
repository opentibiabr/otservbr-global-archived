local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Where did I put my broom? Mother?' },
	{ text = 'Mother?! Oh no, now I have to do this all over again' },
	{ text = 'Mhmhmhmhm.' },
	{ text = 'Lalala...' }
}

npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Mh hello there. What can I do for you?")
npcHandler:addModule(FocusModule:new())
