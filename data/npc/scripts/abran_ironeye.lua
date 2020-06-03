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

keywordHandler:addKeyword({'disturb'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am a busy man. I run the Ironhouse."
	}
)
keywordHandler:addKeyword({'Ironhouse'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "What do you think? Here weapons and armor are forged, repaired, and sold."
    }
)
keywordHandler:addKeyword({'forged'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My Ironhouse is more than a warehouse."
	}
)
keywordHandler:addKeyword({'Teddy'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I don't know anything about a teddy... and if you are smart you shouldn't either..."
	}
)
keywordHandler:addKeyword({'Tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The world is ready for a significant change."
	}
)
keywordHandler:addKeyword({'news'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In Venore nothing comes for free and you could not afford my 'news'."
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You should know that on your own!"
	}
)
keywordHandler:addKeyword({'King'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I would like to see a true warrior-king in Thais... like in the old days. But who knows, \z
        perhaps one day the tides of fate will bring such a man to power. Who knows..."
	}
)
keywordHandler:addKeyword({'Thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Thais has outlived its usefulness since years. Its star is sinking."
	}
)
keywordHandler:addKeyword({'Carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Their independence is a proof for the weakness of Thais."
	}
)
keywordHandler:addKeyword({'Excalibug'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "If someone would bring me that weapon I could reshape the realm... \z
        and reward this hero beyond his imagination."
	}
)
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Quite a challenge, but his bets for power were made without the finesse of a true warrior."
	}
)
keywordHandler:addKeyword({'finesse'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I won't give away my tricks, learn your own."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hail, |PLAYERNAME|! Why do you disturb me?")
npcHandler:setMessage(MESSAGE_FAREWELL, "You are dismissed.")

npcHandler:addModule(FocusModule:new())
