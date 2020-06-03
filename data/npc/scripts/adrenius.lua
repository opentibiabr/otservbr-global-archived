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
	{ text = 'Hmmm, hmmm.' }
}

keywordHandler:addKeyword({'Name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My name is Adrenius."
	}
)
keywordHandler:addKeyword({'Time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Time? What is time? A word? A thing? An object?"
    }
)
keywordHandler:addKeyword({'Job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm a priest of Fafnar."
	}
)
keywordHandler:addKeyword({'Fafnar'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Fafnar is the stronger one of the two suns above our world."
	}
)
keywordHandler:addKeyword({'Suon'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Suon is the misguided sibling of the great Fafnar. Suon's light turns pale compared to \z
        the brightness of Fafnar."
	}
)
keywordHandler:addKeyword({'King'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Who needs a king? I don't."
	}
)
keywordHandler:addKeyword({'Thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Yyyyess. Yes, it's the capital city of Tibia I think."
	}
)
keywordHandler:addKeyword({'Carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Carlin? Don't you mean Thais?"
	}
)
keywordHandler:addKeyword({'Darashia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Even after the death of this swindler Daraman, the descendants of his followers cling \z
        to his ignorant teachings."
	}
)
keywordHandler:addKeyword({'Ankrahmun'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Fafnar may burn this city of evil. Its heretical inhabitants and their blasphemous \z
        leader are an insult to the gods. Beware! The day of reckoning is at hand!"
	}
)
keywordHandler:addKeyword({'Darama'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The Daramian deserts are much more impressive than this one. Sadly the continent is run over \z
            by heretics of all sorts ...",
            "Darashia is inhabited by the misguided followers of the so-called prophet Daraman, and Ankrahmun \z
            is a melting pot of mad and undeath worshippers."
    }}
)
keywordHandler:addKeyword({'God'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Fafnar is the greatest among the gods."
	}
)
keywordHandler:addKeyword({'Desert'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Sand, sand and again sand. Sand all over. Yes, I'd say: it's truly a desert!"
	}
)
keywordHandler:addKeyword({'Library'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I heard of the library, but I never was very interested in it."
	}
)
keywordHandler:addKeyword({'Book'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Read books, it increases your intelligence and, furthermore, it's a great source of inspiration!"
	}
)
keywordHandler:addKeyword({'Secret'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Secrets ... What do you mean?"
	}
)
keywordHandler:addKeyword({'Weapon'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Who needs weapons? I never had and i never will have weapons - what for?"
	}
)
keywordHandler:addKeyword({'Sword'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Swords? Don't you have something else to do?"
	}
)
keywordHandler:addKeyword({'Help'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Help? Help? Nothing more? Don't we all demand some help?"
    }
)
keywordHandler:addKeyword({'Fight'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Leave me alone. I don't want to fight."
	}
)
keywordHandler:addKeyword({'Tower'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The tower was built and inhabited by the great sage Jakundaf himself. \z
        It's a shame that it can be rented nowadays. People have no respect for the past!"
	}
)
keywordHandler:addKeyword({'Treasure'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Treasures? What is a treasure for you?"
	}
)
keywordHandler:addKeyword({'Gharonk'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Hmmmm... I don't know much about it."
	}
)
keywordHandler:addKeyword({'Excalibug'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "What's that? You start annoying me."
	}
)
keywordHandler:addKeyword({'Netlios'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This fool! His book is nothing than a hoax! At least I believe that. \z
        Or did you find an answer for my questions?"
    }
)
keywordHandler:addKeyword({'No'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Leave me alone. I don't want to fight."
	}
)
keywordHandler:addKeyword({'anything'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You can't even say 'yes' or 'no'. You are not worth talking to me!"
	}
)
keywordHandler:addKeyword({'Jakundaf'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The sage Jakundaf has studied the nature of this desert about a generation ago. \z
            For this reason, people started to call it Jakundaf desert after a while ...",
            "Before Jakundaf, the desert was just known as the wasteland. This desert isn't a natural one, \z
            rather it was created by a magical accident in a long forgotten battle ...",
            "Here in the desert, Fafnar's burning eye is strong and powerful!"
    }}
)
keywordHandler:addKeyword({'Priest'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I live a solitary life here to meditate and contemplate."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! What can I do for you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
