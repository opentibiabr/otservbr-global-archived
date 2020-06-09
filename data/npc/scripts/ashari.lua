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
		text = "My name is Ashari. Mh... everything all right? You look as if it has some meaning to you? \z
        Oh sorry, I hope I did not offend you."
	}
)
keywordHandler:addKeyword({'second generation'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "We do not know for how long sinners have lived and died here in the afterworld before some \z
            of the second generation saw the damnation that the deeds of the first brought upon them.",
            "Second generation might have only been true for some of them. Some might have been third of fourth \z
            generation already, who knows.",
            "They were free of some of the taint of their mothers and fathers, and saw through their lies. \z
            Saw them as the sinners that they were.",
            "It became clear to them and their leader Feridil that only by distancing themselves from the \z
            sinful outcasts, they could begin the long walk on the road to salvation.",
            "They drove off the sinners and claimed a small part of this afterworld for themselves. They chose a \z
            home near the entrance to the afterworld to make it easier for the wise of \z
            Abar Dendri to watch and ultimately judge them.",
            "They also made note of each new sinner, that arrived in the afterworld. And they marked them, \z
            so they could later tell if a petitioner who came to join them, was of second generation at least.",
            "They secured the resources that they needed and organised their harvest. \z
            That was how our community came to be."
    }}
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am the first voice amongst this community."
	}
)
keywordHandler:addKeyword({'first voice'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am the leader of our people in worldly matters. I am the one who gives everyone its \z
        responsibilities and sees over our resources."
	}
)
keywordHandler:addKeyword({'resources'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This world is unforgiving and barren. Little can be done about that, but those of the second \z
        generation left us with more than the sins of the ancestors. \z
        They also gave us a home, hope, and at least some meagre resources."
	}
)
keywordHandler:addKeyword({'taint'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Larfion, our shaman, knows more about such matters. He is the guardian of our souls."
	}
)
keywordHandler:addKeyword({'community'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We are bound together in our need to purify ourselves in this harsh afterworld. \z
        Our resources are limited and our enemies numerous. But it will help us to atone."
	}
)
keywordHandler:addKeyword({'purify'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Meditation and hard work purify body and soul. But the taint runs deep."
	}
)
keywordHandler:addKeyword({'afterworld'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "This is but a mockery of the world of light. Here we do not live, but are not truly dead either. \z
        We are similar to the undead that roam these caves. But unlike them we have the hope to atone."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hello, stranger! These caves must seem strange to you. \z
I wonder what brings you here... maybe you are interested in some work? There are several tasks \z
I could need a hand with.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye!")
npcHandler:addModule(FocusModule:new())
