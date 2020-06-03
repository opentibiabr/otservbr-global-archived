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

keywordHandler:addKeyword({'report'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Wyrmslicer: I heard enough of the gossip and superstitions. I am fed up with that nonsense!"
	}
)
keywordHandler:addKeyword({'gossip'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Spare me the nonsense that people made up like sinister cultists, quara infiltrators, pirate \z
            hideouts voodoo curses and whatnot! ...",
            "I've heared it all and it is completely rubbish and a waste of my time! We have everything firmly under control. \z
            And to ensure this I warn you not to talk to the townspeople about such issues!"
    }}
)
keywordHandler:addKeyword({'cultistis'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The talks about the cult are getting tiresome. There is no such thing. It is only another superstition here."
	}
)
keywordHandler:addKeyword({'quara'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The quara are treacherous foes that don't fight with common tactics. This and the security of the seas, \z
        to what they can withdraw, make it difficult to handle them properly."
	}
)
keywordHandler:addKeyword({'pirate'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Pirates are vermin and we will wipe them from the map wherever they raise their ugly heads."
	}
)
keywordHandler:addKeyword({'voodoo'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Superstition! We have real sorcerers and none of them uses such prankish trickery."
	}
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am admiral of the Thaian fleet and commander of this fort and the local military."
	}
)
keywordHandler:addKeyword({'Wyrmslicer'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My family is respected for many deeds of heroism. There is a well-known dragon \z
        slayer in our bloodline which earned us that name of honour."
	}
)
keywordHandler:addKeyword({'raymond striker'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Captain Striker is one of the more cunning pirates. Up to now, he managed to escape but \z
        sooner or later he will run out of luck."
	}
)
keywordHandler:addKeyword({'chondur'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I heard about that man. For some people he is some kind of father figure. If he should \z
        ever misuse that, we will take a closer look at him."
	}
)
keywordHandler:addKeyword({'thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Thais is of course the crown of our kingdom and the place where our hearts will belong to forever."
	}
)
keywordHandler:addKeyword({'venore'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The efforts Venore put into this city are admirable. It's only fair that they gain a \z
        certain profit from that."
	}
)
keywordHandler:addKeyword({'king'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "LONG LIVE THE KING!"
	}
)
keywordHandler:addKeyword({'sugar'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We need the sugar. We will ensure with everything that is at our command that \z
        the supply of sugar is kept up."
	}
)
keywordHandler:addKeyword({'rum'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Rum can be just as good for morale as it can be bad. It has to be administered with care."
	}
)
keywordHandler:addKeyword({'governor'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The governor is a fine man and I do my best to support him in all his efforts."
	}
)
keywordHandler:addKeyword({'eleonore'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This young lady truly graces Liberty Bay with her presence. It is always a pleasure to meet her."
	}
)
keywordHandler:addKeyword({'liberty bay'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It might take some time but with our guidance the city will flourish and prosper."
	}
)
keywordHandler:addKeyword({'carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Sooner or later Carlin will be nothing more than a footnote in history. Look at the size of our \z
            kingdom and compare it with Carlin ...",
            "One day they will accept that it is better to rejoin the kingdom and to combine our efforts \z
            and resources for the good of all."
    }}
)
keywordHandler:addKeyword({'charlotta'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I believe she is this old healer in town. I don't think she is happy with our presence here \z
        but she did nothing yet that would justify to arrest her."
	}
)
keywordHandler:addKeyword({'Isolde'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Competent and efficient. I give nothing about ugly rumours and she never ever betrayed \z
        the trust put into her."
	}
)
keywordHandler:addKeyword({'Loveless'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Mr. Loveless has a sharp and quick mind. If he were no trader, he would have made a great officer."
	}
)
keywordHandler:addKeyword({'Tristan'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "A fine knight indeed. I am very pleased with his efforts."
	}
)
keywordHandler:addKeyword({'ferumbras'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am not familiar with witchcraft and sorcery. Perhaps you should ask someone else."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Greetings, Player. Have you anything to report?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")

npcHandler:addModule(FocusModule:new())
