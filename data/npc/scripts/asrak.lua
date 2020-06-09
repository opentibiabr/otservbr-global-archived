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
	{ text = "Mooh! Tah!" }
}

-- SPELLS FOR PALADIN
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"lighthealing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"findperson"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
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
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"greatlight"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"conjurearrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Arrow",
		price = 450,
		level = 13,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"magicshield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"intensehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"conjureexplosivearrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Explosive Arrow",
		price = 1000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"ultimatehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"divinehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Healing",
		price = 3000,
		level = 35,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"destroyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{lighthealing}', '{curepoison}', '{woundcleansing}', \z
		'{intensehealing}', '{ultimatehealing}' and '{divinehealing}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{findperson}', '{light}', '{greatlight}', '{conjurearrow}', \z
		'{magicshield}', and '{conjureexplosivearrow}'."
		
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{destroy field rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

keywordHandler:addKeyword({'name'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = " I am known as Asrak the Ironhoof."
	}
)
keywordHandler:addKeyword({'job'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I am the overseer of the pits and the trainer of the gladiators."
	}
)
keywordHandler:addKeyword({'gladiators'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Those wannabe fighters are weak and most of them are unable to comprehend a \z
		higher concept like the Mooh'Tah."
	}
)
keywordHandler:addKeyword({'help'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I teach worthy warriors the way of the knight."
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "It is 7:35 pm."
	}
)
keywordHandler:addKeyword({'king'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "I pledge no allegiance to any king, be it human or minotaurean."
	}
)
keywordHandler:addKeyword({'army'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Your human army might be big, but without skills. They are only sheep to be slaughtered."
	}
)
keywordHandler:addKeyword({'spell'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Sorry, I only teach spells to knights and paladins."
	}
)
keywordHandler:addKeyword({'dungeon'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "The dungeons of your desires and fears are the only ones you really should fear and those \z
		you really have to conquer."
	}
)
keywordHandler:addKeyword({'gods'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "By them we were imbued with the rage that almost costed our existence. \z
		By them we were used as pawns in wars that were not ours."
	}
)
keywordHandler:addKeyword({'monsters'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "Inferior creatures of rage, driven by their primitive urges. \z
		Only worthy to be noticed to test one's skills."
	}
)
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "To rely on magic is like to cheat fate. All cheaters will find their just punishment one day, \z
		and so will he."
	}
)
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "If it's truly a weapon to slay gods it might be worth to be sought for."
	}
)
keywordHandler:addKeyword({'Venore'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "The city pays me well and those undisciplined gladiators need my skills and guidance badly."
	}
)
keywordHandler:addKeyword({'Mintwallin'}, StdModule.say, 
	{
		npcHandler = npcHandler, 
		text = "The city is only a shadow of what we could have accomplished without that curse of rage that \z
		the gods bestowed upon us."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "I welcome you, i selling {spells} for knights and paladins")
npcHandler:setMessage(MESSAGE_FAREWELL, "May your path be as straight as an arrow.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
