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

-- SPELLS FOR DRUID
keywordHandler:addSpellKeyword({"magicshield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"creatureillusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"summoncreature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"invisible"},
	{
		npcHandler = npcHandler,
		spellName = "Invisible",
		price = 2000,
		level = 35,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poisonfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"firefieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"convincecreaturerune"},
	{
		npcHandler = npcHandler,
		spellName = "Convince Creature Rune",
		price = 800,
		level = 16,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"destroyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"energyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 18,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"firebombrune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"chameleonrune"},
	{
		npcHandler = npcHandler,
		spellName = "Chameleon Rune",
		price = 1300,
		level = 27,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"poisonwallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"firewallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)
keywordHandler:addSpellKeyword({"energywallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = VOCATION.CLIENT_ID.DRUID
	}
)

keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{magicshield}', '{creatureillusion}', '{summoncreature}', '{invisible}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poisonfieldrune}', '{firefieldrune}', '{destroyfieldrune}', '{energyfieldrune}', \z
		'{firebombrune}', '{poisonwallrune}', '{firewallrune}', '{energywallrune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {support spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the leader of the Cenath caste."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, text = "The Kuridai are aggressive and victims of their instincts. Without our help they would surely die in a foolish war."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, text = "Gods are for the weak. We will master the world on our own. We need no gods."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, text = "They lack the understanding of unity. We are keeping them together and prevent them from being slaughtered one by one."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, text = "We are the shepherds of our people. The other castes need our guidance."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "Magic comes almost naturally to the Cenath. We keep the secrets of ages."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "I can teach the spells 'magic shield', 'destroy field', 'creature illusion', 'chameleon', 'convince creature', and 'summon creature'."})

-- Greeting message
keywordHandler:addGreetKeyword({"ashari"}, {npcHandler = npcHandler, text = "I greet thee, outsider."})
--Farewell message
keywordHandler:addFarewellKeyword({"asgha thrazi"}, {npcHandler = npcHandler, text = "Asha Thrazi. Go, where you have to go."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_GREET, "I greet thee, outsider.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Asha Thrazi. Go, where you have to go.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Asha Thrazi.")

npcHandler:addModule(FocusModule:new())