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

keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I don't have a profane 'job' - it is my destiny to devour evil and bring a new dawn."
	}
)
keywordHandler:addKeyword({'help'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You sound like you wish to help me. Yet I must walk this path alone - but thank you."
    }
)
keywordHandler:addKeyword({'tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I see how corrupt this world has become and it makes me want to cry."
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My name would be unspeakable for your tongue. You may call me Devovorga - which comes rather close."
	}
)
keywordHandler:addKeyword({'human'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You're welcome to join me in the pain you also helped causing."
	}
)
keywordHandler:addKeyword({'creators'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Yes, I was created. And I'm not a mere being like humans, devils, demons or even gods. I'm a weapon. \z
        I'm devouring. I'm hungry. I want revenge."
	}
)
keywordHandler:addKeyword({'devovorga'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = " How cute and shallow that sounds from your limited vocal chords and lips. You should have heard my \z
        enslavers pronounce it - accompanied by thunder in their voices that shook earth and sky."
	}
)
keywordHandler:addKeyword({'trapped'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm trapped in this useless body. But I can feel it begin to change... finally..."
	}
)
keywordHandler:addKeyword({'vengoth'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I've been waiting here for a long time. Even before this continent started turning dark."
	}
)
keywordHandler:addKeyword({'weapon'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I will not turn against you if you just leave me alone and let me do what I have to do - for now."
	}
)
keywordHandler:addKeyword({'revenge'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Can you imagine thousands of years trapped down here? I'm thirsting for life. I will face my \z
        creators and enslavers free this beautiful world from them and from anything else that keeps destroying it."
	}
)
keywordHandler:addKeyword({'enslavers'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My enslavers and creators formed and summoned my soul and then, seeing I was too powerful for them, \z
        trapping me deep down here. How foolish of them."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "So you have come, |PLAYERNAME|. I hoped you would not...")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye")

npcHandler:addModule(FocusModule:new())
