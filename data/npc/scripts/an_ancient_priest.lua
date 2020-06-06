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
		text = "I'm the caretaker of this tomb. I also know these parts like the back of my hand - \z
        just in case you need a status update."
	}
)
keywordHandler:addKeyword({'status'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Horestis's body has been desecrated. His curse now hangs over the land like the shadow \z
        of the vulture. Abandon all hope mortals, his vengeance will be dreadful."
	}
)
keywordHandler:addKeyword({'Horestis'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He was one of the first Pharaohs of the united tribes and under his rule the race of \z
        man flourished to formerly unknown heights."
	}
)
keywordHandler:addKeyword({'heights'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He wisely used the power of his position to unite the tribes of the desert who \z
        formerly defied the rules of the dynasty."
	}
)
keywordHandler:addKeyword({'dynasty'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The ancestors of the dynasty led the human tribes from the lizard-ruled jungles to \z
        the desert where they could finally live without prosecution."
	}
)
keywordHandler:addKeyword({'prosecution'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In the jungle the cruel lizards hunted humans for sport and although food was abundant, \z
        the humans were denied any hunting grounds as the lizards claimed everything for themselves."
	}
)
keywordHandler:addKeyword({'lizards'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The lizards were powerful and many. They wielded magic unknown to the race of man at this time. \z
            Nothing could oppose their rule in these days. ...",
            "The desert was harsh but avoided by the lizards. \z
            Due to cunning and resilience the humans prevailed where the lizards had failed."
    }}
)
keywordHandler:addKeyword({'prevailed'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "They learned to live with that little that the desert and the sea had to offer. \z
        They dwelt in the caves of the mountains, however, some split and rather roamed the desert."
	}
)
keywordHandler:addKeyword({'caves'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The caves were the first safe haven of humankind since the beginning of time. \z
            They were widened and artificial caves were added. ...",
            "Even later when a settlement had been built at the coast, \z
            the caves served as final retreat and fortress in times of danger."
    }}
)
keywordHandler:addKeyword({'danger'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Some defied the rules of the dynasty that had made the jungle of Tiquanda taboo for all humans. \z
        When they wandered into the jungle to hunt and steal equipment and secrets about the desert, \z
        they provoked punishing raids by the lizard people."
	}
)
keywordHandler:addKeyword({'raids'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The raids were a great danger for the tribes of man in these days. \z
        They had not the manpower or weapons to stand against the might of the lizards."
	}
)
keywordHandler:addKeyword({'might'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Only slowly the humans became a power on their own. They learned from the desert, \z
        they learned from its inhabitants and finally, they learned how to communicate with its spirits."
	}
)
keywordHandler:addKeyword({'spirits'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The spirits of nature and of the animals began to talk to selected individuals. \z
        Individuals that used forbidden arts derived from what had been stolen from the lizards."
	}
)
keywordHandler:addKeyword({'arts'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "In the jungle, the humans had learned some of the most basic principles of \z
            magic through observation and experimentation. ...",
            "Although everything connected with the lizard was seen as tainted, \z
            many of the greatest minds turned their attention to those studies."
    }}
)
keywordHandler:addKeyword({'studies'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The first shamans of mankind wielded only little power and there was only a small \z
            distinction between magic and making fire or creating a tool. ...",
            "But when their dabbling with magic brought them into connection with the spirit \z
            world it became a breakthrough."
    }}
)
keywordHandler:addKeyword({'breakthrough'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The spirits talked to the shamans and taught them many new things. \z
            The rock revealed its secrets and taught the humans to build with stone and to melt ore to metal. \z
            The water taught them about the places where to find it and how to conserve it. ...",
            "The scorpion taught the use of poison and medicine, \z
            explained how to craft an armor and told them much about warfare. \z
            Many more spirits revealed their secrets, big and small."
    }}
)
keywordHandler:addKeyword({'secrets'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "With the emergence of these secrets, the shamans came out of hiding and boldly rose to power. \z
        Fights ensued and only the most mighty would prevail as leaders."
	}
)
keywordHandler:addKeyword({'leaders'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The most powerful shaman and fighter became the chieftain and the others became \z
            priests under his rule. ...",
            "The chieftain married only into the families of priests and soon the first dynasty emerged."
    }}
)
keywordHandler:addKeyword({'temple'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Wide parts of the caves were planned to become a temple where the spirits of \z
            nature could be worshipped. ...",
            "It served as spiritual centre of the realm and Horestis's tomb was an integral part of the complex."
    }}
)
keywordHandler:addKeyword({'chieftain'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "When the dynasty emerged, the chieftains were called Pharaohs. \z
        They were the absolute rulers on this side of the mountains. \z
        Soon the caves were abandoned and people left for fortified settlements."
	}
)
keywordHandler:addKeyword({'abandoned'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "When the caves were abandoned, Horestis ordered to rebuild them into a temple and a tomb at once."
	}
)
keywordHandler:addKeyword({'centre'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "For a few generations after Horestis's death, the complex has been used as \z
            planned by the Pharaoh. ...",
            "Then the interest in the old spirits waned and new rulers embraced more sinister secrets ...",
            "Those were stolen and traded from the lizards and gained by bargains with the envious \z
            and reclusive scarab spirit. ...",
            "The spirits turned more and more away from the humans and the humans turned away from the spirits. \z
            So the old pact had been broken."
    }}
)
keywordHandler:addKeyword({'pact'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The spirits, the temple and the tomb became forgotten. ...",
            "A few of the remaining priests, loyal to the pact, \z
            exiled themselves to the complex and summoned vengeful spirits as guardians \z
            of the tomb and the temple and they constructed several protections to ensure \z
            that Horestis's eternal rest is not disturbed."
    }}
)
keywordHandler:addKeyword({'protections'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Many of the protections faded away over the centuries. ...",
            "A few of the most powerful remain though. Foremost there are the spirits and guardians \z
            of the temple that will fight every intruder. ...",
            "But their might is bound to the tomb and if Horestis's rest is disturbed, \z
            they will eventually fade away. The tomb itself is sealed with the help of Horestis' \z
            canopic jars. ...",
            "As long as the canopic jars are intact, the tomb is sealed against any intruder. \z
            Also Horestis's honour guards keep watch. ...",
            "If Horestis's body will ever be desecrated, they will rise from the desert to take \z
            revenge upon the living. Vast armies of undead warriors will seek revenge and \z
            try to strike down the living. ...",
            "Finally there is Horestis's scorpion curse. He was the high priest of the scorpion \z
            spirit and his scorpions will spawn, particularly from the bodies of scarabs."
    }}
)
keywordHandler:addKeyword({'canopic jars'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The canopic jars contain the preserved organs of Horestis's mummified body. ...",
            "They are powerful magic talismans that ward off any intrusion into Horestis's tomb."
    }}
)

npcHandler:setMessage(MESSAGE_GREET, "Greetings mortal! What brings you here? I have a job to do you know.")

npcHandler:addModule(FocusModule:new())
