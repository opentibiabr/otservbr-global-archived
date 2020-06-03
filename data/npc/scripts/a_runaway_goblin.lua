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

keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Oh, kind hu-man asks for goblin name! But too dangerous, am sought goblin! Ogres must not know!"
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Time for hu-man to go away? Yes indeed!"
    }
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Am, er, purveyor of things! Yes! Bring stuff where needed, discreetly-like! Heheh!"
	}
)
keywordHandler:addKeyword({'runaway'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Yes! Not stay at ogre camp! Not wait to become tasty goblin soup, oh no! \z
		Not want to wipe hairy ogre backside, no no no!"
	}
)
keywordHandler:addKeyword({'ogres'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Urgh, ogre smell baaad! Like rotten rat cheese and dragon eggs! Terrible day for goblins when \z
		ogres found us! Slavery, sadness, sorrow!"
	}
)
keywordHandler:addKeyword({'Vuzrog'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Big gobbler of sweet. Here free tip for you, hu-man. Throw cookie into air to keep him busy while flee! Heheh."
	}
)
keywordHandler:addKeyword({'Ghorza'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Shaman ogre? She no bother. Dancing around cactus tree, not see small goblin, heheh."
	}
)
keywordHandler:addKeyword({'Larek'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Huh, hu-man who not know how to run. Too busy scribbling down things. \z
		Now has to make ogre cookies or become one himself!"
    }
)
keywordHandler:addKeyword({'Nibble'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Ahhh! You spoke to Golozo Taku Narkat Kash Bartak Har-Alhad! Him still alive, that good news!"
	}
)
keywordHandler:addKeyword({'Golozo'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Please stop trying to say name correctly, hu-man. You no goblin."
	}
)
keywordHandler:addKeyword({'Garamor'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Nice try, hu-man. But hu-man hear not all there is to hear. Need goblin ears!"
	}
)
keywordHandler:addKeyword({'Swordfish'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "No time for stories about great goblin, hu-man! You go about business, I do too."
	}
)
keywordHandler:addKeyword({'goblins'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Very perspicacious hu-man!"
	}
)
keywordHandler:addKeyword({'quest'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "<puts finger to his lips>"
    }
)
keywordHandler:addKeyword({'crossbow'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Me not know anything!"
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hu-man! Strange guest! What want? Say!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes, please go!")

npcHandler:addModule(FocusModule:new())
