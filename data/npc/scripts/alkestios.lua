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
	{ text = 'Even the trees are sensing a greater evil.' },
	{ text = 'The wildlife is troubled.' },
	{ text = 'There are many hidden dangers lately.' }
}

keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My name is Alkestios - which is also the name of a beautiful day lily if you wonder. \z
        That's because my true form is a bit more filigree than this cervine body."
	}
)
keywordHandler:addKeyword({'kind'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "We call ourselves the fae. Some name us nature spirits or peri but we prefer the former term. \z
            Most of us are rather reclusive and live peaceful lives in our secret realm. \z
            We only leave it in order to protect our home. ...",
            "As we tend to be secretive about our true nature I'm afraid I can't tell you more."
    }}
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I have no idea what you mean by this word."
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Time is fluent, traveller."
	}
)
keywordHandler:addKeyword({"Ab'Dendriel"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It's a place full of life, huge trees, lush plants and various animals. \z
        I visit it now and then because I feel very comfortable there."
	}
)
keywordHandler:addKeyword({'Thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It's a place full of stone buildings and people. I heard it is called a town. \z
        But I'm still not sure which purpose it serves."
	}
)
keywordHandler:addKeyword({'Kazordoon'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You are talking about the nearby mountains, I assume. \z
        I have never been there but I know it is the home of the dwarves."
	}
)
keywordHandler:addKeyword({'Roshamuul'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This is a dark and dangerous place. It is full of terrible monsters and \z
        made of nightmares – literally."
	}
)
keywordHandler:addKeyword({'Oramond'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I have never heard of this place."
	}
)
keywordHandler:addKeyword({'Darama'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I guess it's a desert."
	}
)
keywordHandler:addKeyword({'Feyrist'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It is a secret, hidden place. Just few mortals get permission to enter it. \z
        A long time ago, we learned how to hide our realm from the outside world. \z
        Only if you gain our trust I will tell you how to reach it."
	}
)
keywordHandler:addKeyword({'realm'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We call it Feyrist and it is a secret, hidden place. Just few mortals get permission to enter it. \z
        A long time ago, we learned how to hide our realm from the outside world. \z
        Only if you gain our trust I will tell you how to reach it."
	}
)
keywordHandler:addKeyword({'protect'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can sense a kind of dark energy lately. It is pervading this world, more and more every day. \z
        Yet I don't know where it arises from nor what we could do to dispel it."
	}
)
keywordHandler:addKeyword({'energy'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It is rather subversive, so most creatures won't sense it ... yet. \z
        But its corrosive power has already begun to affect my kind and our hidden realm in unpleasant ways."
	}
)
keywordHandler:addKeyword({'kind'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "We call ourselves the fae. Some name us nature spirits or peri but we prefer the former term. \z
            Most of us are rather reclusive and live peaceful lives in our secret realm. \z
            We only leave it in order to protect our home. ...",
            "As we tend to be secretive about our true nature I'm afraid I can't tell you more."
    }}
)
keywordHandler:addKeyword({'Fae'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Some call us nature spirits or peri but we prefer the term fae. Most of us are rather \z
            reclusive and live peaceful lives in our secret realm. \z
            We only leave it in order to protect our home. ...",
            "We tend to be secretive about our true nature, but I guess there was once an elven sage \z
            who visited our realm and put his experiences down on paper. \z
            There might be a book about the fae in the library of Ab'Dendriel."
    }}
)
keywordHandler:addKeyword({'dreams'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "There is far more to dreams than mortal beings are aware of. \z
        They possess some kind of magical power, ancient and mysterious. \z
        I shouldn't tell you too much about it, but I can tell you that the fae are closely linked to this power."
	}
)
keywordHandler:addKeyword({'dwarves'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We know them, yes. Their dreams are different from those of elves and humans. \z
        Somehow graver and more grounded."
	}
)
keywordHandler:addKeyword({'elves'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "They inhabit Ab'Dendriel and live in close touch with nature. \z
        Their dreams are mostly serene and suffused with light."
	}
)
keywordHandler:addKeyword({'humans'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "They inhabit these huge places filled with stone buildings. \z
        They call them towns, I guess. Some of them are cheerful and well-meaning, \z
        others are wicked and cruel. Their traits and attitudes vary greatly - and so do their dreams."
	}
)
keywordHandler:addKeyword({'deer'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Outside of our secret realm my siblings and I can't keep our true shape. \z
        If we want to travel other parts of the world, we must take over the bodies of animals. \z
        But we are causing them no harm and we just take control if necessary."
	}
)
keywordHandler:addKeyword({'Ikassis'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "She's one of my sisters. I guess she took over the body of a snake."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Nature's blessing, traveller!")
npcHandler:setMessage(MESSAGE_FAREWELL, "May your path always be even.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
