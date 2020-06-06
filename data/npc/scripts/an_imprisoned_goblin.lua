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
	{ text = 'Me so hungry...' },
	{ text = 'Frog God, hear poor goblin! Send help!...' },
	{ text = '<groan>' }
}

keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Name lost in sorrow! Took new one to show tragic fate of goblinkind! Garamor Avolok Tor-Mazak!"
	}
)
keywordHandler:addKeyword({'Garamor Avolok Tor-Mazak'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Black Veil on Mind, Shadow on Heart, Tears of Blood, Weeping for Thousands Killed by Greed! \z
        Near enough translation."
	}
)
keywordHandler:addKeyword({'imprisoned'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Got sealed in as example to others, without food or water! Me left here to die! \z
        But wait for help! Pray to Frog God that it will come!"
	}
)
keywordHandler:addKeyword({'goblins'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Once, goblins stupid and greedy like rest of this world! But then, Frog God gave vision to \z
            Sugatrap how to progress. Went to holy mountain! Grew goblin civilization! Peace! Plenty! Harmony! ...",
            "But alas, goblins lost greatness again, devoured by insatiable ogre appetite for goblin flesh."
    }}
)
keywordHandler:addKeyword({'Swordfish'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Him best friend of Sugatrap. Found city founding stone, and him become protector of city. ...",
            "Many great deeds defending first goblin generations from hungry ogres poking around in mountains! \z
            Long we safe because of him!"
    }}
)
keywordHandler:addKeyword({'Hopgoblin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Greatest thinker of golden age. 'I think, therefore I goblin!'  \z
        When ogre found secret tunnel entrance, it Hopgoblin who told famous riddle to make ogre think long enough, \z
        saving hundreds of goblins!"
	}
)
keywordHandler:addKeyword({'Sugatrap'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Long time ago, he given vision by Frog God, and founded hidden city of goblins. \z
        Free goblins! First among equals he was! But great times long gone. All devastated by greedy ogres."
	}
)
keywordHandler:addKeyword({'ogres'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Bane of goblins! Maybe sent to punish us? But why? All we know, they greedy, \z
        and they enslave and eat goblins. Horrible fate!"
	}
)
keywordHandler:addKeyword({'mines'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Slavery! Poor goblins dig through hard earth for precious stones and crystals, all for greedy ogres."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "What want with starving goblin, hu-man?")
npcHandler:setMessage(MESSAGE_FAREWELL, "All go away.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
