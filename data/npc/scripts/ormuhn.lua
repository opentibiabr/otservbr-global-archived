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
keywordHandler:addSpellKeyword({"wound cleansing"},
	{
		npcHandler = npcHandler,
		spellName = "Wound Cleansing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"magicrope"}, 
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope", 
		price = 200, 
		level = 9, 
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
keywordHandler:addSpellKeyword({"levitate"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Levitate", 
		price = 500, 
		level = 12, 
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
keywordHandler:addSpellKeyword({"haste"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Haste", 
		price = 600, 
		level = 14, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"brutalstrike"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Brutal Strike", 
		price = 1000, 
		level = 16, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"charge"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Charge", 
		price = 1300, 
		level = 25, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"whirlwindthrow"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Whirlwind Throw", 
		price = 1500, 
		level = 28, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"groundshaker"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Groundshaker", 
		price = 1500, 
		level = 33, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"berserk"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Berserk", 
		price = 2500, 
		level = 35, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"inflictwound"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Inflict Wound", 
		price = 2500, 
		level = 40, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"curebleeding"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Cure Bleeding", 
		price = 2500, 
		level = 45, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"recovery"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Recovery", 
		price = 4000, 
		level = 50, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"frontsweep"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Front Sweep", 
		price = 4000, 
		level = 70, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"intensewoundcleansing"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Intense Wound Cleansing", 
		price = 6000, 
		level = 80, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"fierceberserk"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Fierce Berserk", 
		price = 7500, 
		level = 90, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"intenserecovery"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Intense Recovery", 
		price = 10000, 
		level = 100, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"annihilation"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Annihilation", 
		price = 20000, 
		level = 110, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"summonskullfrost"}, 
	{
		npcHandler = npcHandler, 
		spellName = "Summon Skullfrost", 
		price = 50000, 
		level = 200, 
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)


keywordHandler:addKeyword({"healing spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "In this category I have '{Bruise Bane}', '{curebleeding}', '{woundcleansing}', '{curepoison}', \z
		'{intensewoundcleansing}', '{Recovery}' and '{intenserecovery}'."
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "In this category I have '{whirlwindthrow}', '{Groundshaker}', '{Berserk}' and '{fierceberserk}' as well as ...', \z 
		'{brutalstrike}', '{frontsweep}', '{inflictwound}' and '{Annihilation}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "In this category I have '{Light}', '{findperson}', '{magicrope}', '{Levitate}', '{Haste}', '{Charge}' and '{greatlight}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I can teach you {healing spells}, {attack spells} and {support spells}. What kind of spell do you wish to learn? You \z
		can also tell me for which level you would like to learn a spell, if you prefer that."
	}
)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the arena master. I supervise all challenges that take place in this arena and train true fighters."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, text = "If you wish to test your mortal Akh you are at the right place."})
keywordHandler:addKeyword({'akh'}, StdModule.say, {npcHandler = npcHandler, text = "As far as I know this is what you would call your body. Ask a priest for further information."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, text = "The temple takes care of your Uthun. In this arena we challenge your Akh."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, text = "The pharaoh, our mighty leader, is an unliving god."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, text = "Scarabs might be sacred, but they are also a challenge. If you are able to overcome one of them, its spirit will forgive you. The everlasting sand will grant him rebirth anyway."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = "This continent will be the first to prosper under the guidance of our pharaoh."})
keywordHandler:addKeyword({'undeath'}, StdModule.say, {npcHandler = npcHandler, text = "We are the chosen ones."})
keywordHandler:addKeyword({'chosen ones'}, StdModule.say, {npcHandler = npcHandler, text = "I am one of the chosen. To become like me you have to serve the pharaoh and his temple faithfully."})

npcHandler:setMessage(MESSAGE_GREET, "Greetings, |PLAYERNAME|. What do you want?")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path, |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
