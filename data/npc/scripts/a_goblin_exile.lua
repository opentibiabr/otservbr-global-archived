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
		text = {
			'Used to be philosopher priest shaman for East Waterwhirl clans! Keeper of sacredness! Truth teller! \z
            But this no say anything to you, hu-man. ...',
			'These days, me exile hermit waiting for new time. Keep things safe and hallow lost artefacts of goblins, \z
            for Frog God to look kindly on our last hope! ...',
			'Frog God leads me to places where find useful stuff needed for salvation of goblinkind. \z
            I pray, his golden eyes lead. I find. I hide.'
	}}
)
keywordHandler:addKeyword({'Frog God'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Holy, holy, holy. Poor goblin pray to Frog God for new time of peace for goblins!"
	}
)
keywordHandler:addKeyword({'peace'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Goblins wait for Third Time of Peace. Will be end of world as we know it. Frog God will return to be \z
        tadpole, Night Snake will devour skies and die, and earth will be one with water again."
	}
)
keywordHandler:addKeyword({'Third Time of Peace'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Hopefully, time near when goblinkind free again. Me await sign every day."
	}
)
keywordHandler:addKeyword({'Night Snake'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "No story to tell in dark times, not here. Might come when called! Suffice it to say that it chases \z
        Frog God and hates cool earth and water, no friend of goblins."
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Used to have one, when still in city. Left it behind. Now, old hermit waiting for goblin redemption I am. \z
        Nemmo Tokrok Argkaz Ar-Vanda Ho'Memot."
	}
)
keywordHandler:addKeyword({"Nemmo Tokrok Argkaz Ar-Vanda Ho'Memot"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Not name, more description of what is. Roughly means, The One Who Is No-One, Whose Name Is Buried in \z
        Memories of Days Lost Behind Closed Eyes."
	}
)
keywordHandler:addKeyword({'goblins'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "For long time, goblins safe in mountains. Lived and prospered! Sang songs of golden times, passed on \z
        knowledge from old to new goblins! Then ogres came."
	}
)
keywordHandler:addKeyword({'ogres'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Always hungry, always, take, kill, eat, destroy! Must have been spawn spewn out by Night Snake to prey \z
        on poor Frog God children."
	}
)
keywordHandler:addKeyword({'Nibble'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "You seen Golozo Taku Narkat Kash Bartak Har-Alhad! If him still alive, there still hope. Great leader, \z
        almost golden fire of Sugatrap in him. Him never give up."
	}
)
keywordHandler:addKeyword({'Garamor Avolok Tor-Mazak'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
			'Ah, me know him. Young goblin scholar, heart of philosopher. Best pupil he was! ...',
			'Him rally other goblins in time of need and bear their soul load. Sign of golden eyes looking on him, \z
            great deed and burden, oh yes.'
	}}
)
keywordHandler:addKeyword({'Swordfish'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
			'Him best friend of Sugatrap. Bravest goblin scout, master of disguise and fleet-footed! Found city \z
            founding stone! Protector of city! ...',
			'Dressed up as ogre girl to distract hungry ogres from holy food finders! ...',
			'Sang snarky songs to lure ogres away from wounded Sugatrap, then ran back and carried him to \z
            nearest hidden tunnel entrance! ...',
			'Lots more stories but no time to tell, hu-man!'
	}}
)
keywordHandler:addKeyword({'Hopgoblin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
			'Wisest goblin of past times, founded three school of rival philosophies! Very selfless goblin, \z
            died for goblinkind! ...',
            'His riddle stopped ogre killing long enough for goblins to flee back home, collapsing secret tunnels! \z
            But Hopgoblin stay behind and angry ogre kill him and break his staff. ...',
			'His broken staff in my family for hundred generations! Proud heirloom! \z
            One day will be made whole when goblins free again!'
	}}
)
keywordHandler:addKeyword({'Sugatrap'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "No! You lie! That not true. Golden eyes averted from you!"
	}
)
keywordHandler:addKeyword({'Grubokk'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "That name of mine jailer now? I remember other ogre jailer. Bit him into shin before me \z
        went into exile. Heheh."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Hello, hu-man! Away put your weapon, I am meaning no harm.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, hu-man. Don't let ogres bite you.")

npcHandler:addModule(FocusModule:new())
