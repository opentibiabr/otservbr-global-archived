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

--SPELLS KNIGTH
keywordHandler:addSpellKeyword({"findperson"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"wound cleansing"},
	{
		npcHandler = npcHandler,
		spellName = "Wound Cleansing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"greatlight"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addKeyword({'healing spells'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{woundcleansing}' and '{curepoison}'."
	}
)
keywordHandler:addKeyword({'support spells'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{Light}', '{findperson}' and '{greatlight}'."
	}
)
keywordHandler:addKeyword({'spells'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = 'I can teach you {healing spells} and {support spells}. What kind of spell do you wish to learn? You can also \z
		tell me for which level you would like to learn a spell, if you prefer that.'
	}
)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Duria Steelbender, daughter of Fire, of the Dragoneaters."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Iam the Highknight of the dwarfs."})
keywordHandler:addKeyword({'Tibia'}, StdModule.say, {npcHandler = npcHandler, text = "Bah, to much plantsandstuff, to few tunnels ifyoudaskme."})
keywordHandler:addKeyword({'Knights'}, StdModule.say, {npcHandler = npcHandler, text = "Knights are proud of being dwarfs, jawoll."})
keywordHandler:addKeyword({'Heroes'}, StdModule.say, {npcHandler = npcHandler, text = "Heroes are rare in this days, jawoll."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Was there once. Can't handle the crime overthere."})

npcHandler:setMessage(MESSAGE_GREET, 'Hiho, fellow knight |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Goodbye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Be carefull out there, jawoll.')

npcHandler:addModule(FocusModule:new())
