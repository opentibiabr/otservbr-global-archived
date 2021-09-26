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

local voices = { {text = 'Hello adventurer, looking for Imbuement items? Just ask me!'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Basic

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Currently I have been working selling items for imbuement."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Imbuement's shop!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:addModule(FocusModule:new())
