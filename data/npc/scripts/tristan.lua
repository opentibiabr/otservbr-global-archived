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
keywordHandler:addSpellKeyword({"woundcleansing"},
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
		text = "In this category I have '{whirlwindthrow}', '{Groundshaker}', '{Berserk}' and '{fierceberserk}' \z
		as well as ...', '{brutalstrike}', '{frontsweep}', '{inflictwound}' and '{Annihilation}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "In this category I have '{Light}', '{findperson}', '{magicrope}', '{Levitate}', '{Haste}', \z
		'{Charge}' and '{greatlight}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I can teach you {healing spells}, {attack spells} and {support spells}. What kind of spell do you \z
		wish to learn? You can also tell me for which level you would like to learn a spell, if you prefer that."
	}
)

npcHandler:setMessage(MESSAGE_GREET, 'Welcome back, knight |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())
