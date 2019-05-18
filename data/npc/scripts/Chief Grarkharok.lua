local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Grarkharok\'s bestest troll tribe! Yeee, good name!' },
	{ text = 'Grarkharok make new tribe here! Me Chief now!' },
	{ text = 'Me like to throw rocks, me also like frogs! Yumyum!' }
}

npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Me Chief Grarkharok! No do {nothing}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Grarkharok be {chief}!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Grarkharok be {chief}!")
npcHandler:addModule(FocusModule:new())
