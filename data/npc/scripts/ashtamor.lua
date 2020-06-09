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
	{text = 'The passage to the afterlife is filled with obstacles, but I can help you with my wares.'} 
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"amphora"}, 2023, 4, 1)
shopModule:addBuyableItem({"vase"}, 2008, 3, 1)

keywordHandler:addKeyword({'name'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "What is a name worth in your eyes? And more important: Does the choice of your \z
		name decide your further fate? Perhaps we will never know."
	}
)
keywordHandler:addKeyword({'job'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I consider myself as a guide, a guardian over the souls who transcend the border to another world."
	}
)
keywordHandler:addKeyword({'souls'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "The essence of life. Source of your very self. While the body is in space and time, \z
		the soul exists in time only."
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "It's time now, but the true question is: How much time is left?"
	}
)
keywordHandler:addKeyword({'venore'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "You come to this world naked, and leave it this way, so there's no need to hold back your money, \z
		especially not in a place like Venore."
	}
)
keywordHandler:addKeyword({'help'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "What help might I offer you except guidance? Would you like me to help you transcend the \z
		border to the afterlife?"
	}
)
keywordHandler:addKeyword({'king'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Kings, queens ... I've seen them come and go. Everything fades, \z
		even the glory and wealth of the richest."
	}
)
keywordHandler:addKeyword({'birth'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Birth might be the beginning but death is certainly not the end."
	}
)
keywordHandler:addKeyword({'death'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "What else does it mean than the loss of your weak physical shell? And isn't the true power \z
		in the universe rather mental than physical?"
	}
)
keywordHandler:addKeyword({'monsters'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Oh yes, monsters can grant you a passage to the afterlife also, \z
		but it's not a comfortable trip. <chuckles>"
	}
)
keywordHandler:addKeyword({'gods'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Once you leave your mortal shell, you'll become one with the gods."
	}
)
keywordHandler:addKeyword({'body'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Is the mind an emination of body, or the body an invention by the mind?"
	}
)
keywordHandler:addKeyword({'offer'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I'm offering vases and amphoras, the perfect vessel for all kinds of dusty remains. \z
		Ask me for a trade if you're interested."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|, wanderer between the worlds.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you again, |PLAYERNAME| ... sooner or later, more or less alive.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you again ... sooner or later, more or less alive.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yes, it's a wise idea not to leave the choice of your \z
future vessel to chance. Have a look.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
