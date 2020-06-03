local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

local voices = {
	{ text = 'Ooooh... the sadness...' },
	{ text = 'Leave me alone in my mourning...' }
}

local function greetCallback(cid)
		npcHandler:say("Is that you...? No... it's not... she never woke up again... the pain... cursed... to wander... \z
		Leave me alone in my mourning...", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "I saw you... who are you... what do you want from me...?")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
