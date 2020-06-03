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
		text = "I have no idea what you mean by this word."
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My name is not meant to be known by humans."
    }
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Time is fluent, traveller."
	}
)
keywordHandler:addKeyword({'swan maiden'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We are fae who can shapeshift from human form to swan form. We protect the wilds of our secret \z
        realm from every intruder and live in small flocks along secluded lakeshores."
	}
)
keywordHandler:addKeyword({'Feyrist'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It's a secret, hidden place. Only very few mortals get permission to enter it. A long time ago, \z
        we learned how to hide our realm from the outside world. Only if you gain our trust you \z
        will get permission to enter it."
	}
)
keywordHandler:addKeyword({'realm'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We call it Feyrist and it is a secret, hidden place. Only very few mortals get permission to enter it. \z
        A long time ago, we learnt how to hide our realm from the outside world. \z
        Only if you gain our trust you will get permission to enter it."
	}
)
keywordHandler:addKeyword({'protect'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Dark energies are seeping into the world. They are tainting our home as much as everything else. \z
        We couldn't discover the origin of these energies on Feyrist itself, Therefore, \z
        some of us decided to leave our home and investigate."
	}
)
keywordHandler:addKeyword({"kind"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "We call ourselves the fae. Some name us nature spirits or peri but we prefer the former term. \z
            Most of us are rather reclusive and live peaceful lives in our secret realm. \z
            We only leave it in order to protect our home. ...",
            "As we tend to be secretive about our true nature I'm afraid I can't tell you more."
    }}
)
keywordHandler:addKeyword({"Fae"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Some call us nature spirits or peri but we prefer the term fae. Most of us are rather reclusive and live \z
            peaceful lives in our secret realm. We only leave it in order to protect our home. ...",
            "As we tend to be secretive about our true nature I'm afraid I can't tell you more."
    }}
)
keywordHandler:addKeyword({"dreams"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "There is far more to dreams than mortal beings are aware of. They possess some kind of magical power, \z
        ancient and mysterious. I shouldn't tell you too much about it, but I can tell you that the \z
        fae are closely linked to this power."
	}
)
keywordHandler:addKeyword({"Alkestios"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He's a brother of mine. He took it upon himself to kind of lead our mission in the outside world. \z
        You may find him south of Ab'Dendriel."
	}
)
keywordHandler:addKeyword({"Ikassis"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "She's one of my sisters who took over the body of a snake. You can find her northwest of here."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "I salute you, mortal being.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May your path be always even.")

npcHandler:addModule(FocusModule:new())
