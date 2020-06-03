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
    {text = 'Alone ... so alone. So cold.'} 
}

keywordHandler:addKeyword({'alive'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "Once I was alive too. I was a member of the order of the {nightmare knights}. \z
        Now I am but a shadow who walks these cold halls."
    }
)
keywordHandler:addKeyword({'nightmare knights'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "We lost ... perhaps everything is lost. Perhaps there never will be any new {knights} of our order."
    }
)
keywordHandler:addKeyword({'knights'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "Only those who passed the {tests} of the dream challenge would be able to become nightmare knights."
    }
)
keywordHandler:addKeyword({'tests'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "These halls are only a decoy to distract the inattentive. The {true way} is hidden well."
    }
)
keywordHandler:addKeyword({'true way'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "There is a secret .. but no ... I can hardly remember ... and I can't tell you anyway ... But ... \z
        perhaps ... It is so cold here ... If you gave me some ordinary {boots} that might give me some warmth \z
        I would give you a hint."
    }
)
keywordHandler:addKeyword({'boots'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "Do you have a pair of boots for me?"
    }
)
keywordHandler:addKeyword({'yes'}, StdModule.say, 
    {
        npcHandler = npcHandler, 
        text = "No ... you don't. Still so cold ... so cold."
    }
)

npcHandler:setMessage(MESSAGE_GREET, "I feel you. I hear your thoughts. You are ... {alive}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Alone ... so alone. So cold.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Alone ... so alone. So cold.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
