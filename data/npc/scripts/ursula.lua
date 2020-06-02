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

-- SPELLS FOR PALADIN
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"magicrope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
keywordHandler:addSpellKeyword({"greatlight"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
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
keywordHandler:addSpellKeyword({"etherealspear"},
	{
		npcHandler = npcHandler,
		spellName = "Ethereal Spear",
		price = 1100,
		level = 23,
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
keywordHandler:addSpellKeyword({"cancelinvisibility"},
	{
		npcHandler = npcHandler,
		spellName = "Cancel Invisibility",
		price = 1600,
		level = 26,
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
keywordHandler:addSpellKeyword({"divinemissile"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Missile",
		price = 1800,
		level = 40,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"enchantspear"},
	{
		npcHandler = npcHandler,
		spellName = "Enchant Spear",
		price = 2000,
		level = 45,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"divinecaldera"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Caldera",
		price = 3000,
		level = 50,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"recovery"},
	{
		npcHandler = npcHandler,
		spellName = "Recovery",
		price = 4000,
		level = 50,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"salvation"},
	{
		npcHandler = npcHandler,
		spellName = "Salvation",
		price = 8000,
		level = 60,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"holyflash"},
	{
		npcHandler = npcHandler,
		spellName = "Holy Flash",
		price = 7500,
		level = 70,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"curecurse"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Curse",
		price = 6000,
		level = 80,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"strongetherealspear"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ethereal Spear",
		price = 10000,
		level = 90,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"intenserecovery"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Recovery",
		price = 10000,
		level = 100,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"summonemberwing"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Emberwing",
		price = 50000,
		level = 200,
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
		text = "In this category I have '{lighthealing}', '{curepoison}', '{intensehealing}', '{divinehealing}', '{recovery}', \z
		'{salvation}', '{curecurse}' and '{intenserecovery}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{findperson}', '{light}', '{magicrope}', '{levitate}', '{greatlight}', '{conjurearrow}', '{haste}', \z
		'{conjureexplosivearrow}', \z
		'{cancelinvisibility}', '{enchantspear}' and '{summonemberwing}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{etherealspear}', '{divinemissile}', '{divinecaldera}', '{holyflash}' and '{strongetherealspear}'."
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

npcHandler:addModule(FocusModule:new())