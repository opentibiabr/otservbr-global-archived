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
keywordHandler:addSpellKeyword({"apprentice's strike"},
	{
		npcHandler = npcHandler,
		spellName = "Apprentice's Strike",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Strike",
		price = 800,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Flame Strike",
		price = 800,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"food"},
	{
		npcHandler = npcHandler,
		spellName = "Food",
		price = 300,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"magic shield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"death strike"},
	{
		npcHandler = npcHandler,
		spellName = "Death Strike",
		price = 800,
		level = 16,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"physical strike"},
	{
		npcHandler = npcHandler,
		spellName = "Physical Strike",
		price = 800,
		level = 16,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"heal friend"},
	{
		npcHandler = npcHandler,
		spellName = "Heal Friend",
		price = 800,
		level = 18,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ice wave"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Wave",
		price = 850,
		level = 18,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"intense healing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"strong haste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"cure electrification"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Electrification",
		price = 1000,
		level = 22,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"energy beam"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Beam",
		price = 1000,
		level = 23,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"creature illusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"summon creature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"ignite"},
	{
		npcHandler = npcHandler,
		spellName = "Ignite",
		price = 1500,
		level = 26,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"ultimate light"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Light",
		price = 1600,
		level = 26,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"great energy beam"},
	{
		npcHandler = npcHandler,
		spellName = "Great Energy Beam",
		price = 1800,
		level = 29,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"cure burning"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Burning",
		price = 2000,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ultimate healing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"electrify"},
	{
		npcHandler = npcHandler,
		spellName = "Electrify",
		price = 2500,
		level = 34,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"invisible"},
	{
		npcHandler = npcHandler,
		spellName = "Invisible",
		price = 2000,
		level = 35,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"mass healing"},
	{
		npcHandler = npcHandler,
		spellName = "Mass Healing",
		price = 2200,
		level = 36,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"terra wave"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Wave",
		price = 2500,
		level = 38,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"strong ice wave"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ice Wave",
		price = 7500,
		level = 40,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"enchant staff"},
	{
		npcHandler = npcHandler,
		spellName = "Enchant Staff",
		price = 2000,
		level = 41,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"cure bleeding"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Bleeding",
		price = 2500,
		level = 45,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"envenom"},
	{
		npcHandler = npcHandler,
		spellName = "Envenom",
		price = 6000,
		level = 50,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"lightning"},
	{
		npcHandler = npcHandler,
		spellName = "Lightning",
		price = 5000,
		level = 55,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"strong flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Flame Strike",
		price =6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"strong terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Terra Strike",
		price =6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"strong energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Energy Strike",
		price = 6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"strong ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ice Strike",
		price = 6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"curse"},
	{
		npcHandler = npcHandler,
		spellName = "Curse",
		price = 6000,
		level = 75,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"summon grovebeast"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Grovebeast",
		price = 50000,
		level = 200,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"summon thundergiant"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Thundergiant",
		price = 50000,
		level = 200,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poison field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fire field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"disintegrate rune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"stalagmite rune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"poison bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Bomb Rune",
		price = 1000,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"heavy magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Heavy Magic Missile Rune",
		price = 1500,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"soulfire rune"},
	{
		npcHandler = npcHandler,
		spellName = "Soulfire Rune",
		price = 1800,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fire bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fireball rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fireball Rune",
		price = 1600,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"icicle rune"},
	{
		npcHandler = npcHandler,
		spellName = "Icicle Rune",
		price = 1700,
		level = 28,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"stone shower rune"},
	{
		npcHandler = npcHandler,
		spellName = "Stone Shower Rune",
		price = 1100,
		level = 28,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"thunderstorm rune"},
	{
		npcHandler = npcHandler,
		spellName = "Thunderstorm Rune",
		price = 1100,
		level = 28,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"poison wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"great fireball rune"},
	{
		npcHandler = npcHandler,
		spellName = "Great Fireball Rune",
		price = 1200,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"avalanche rune"},
	{
		npcHandler = npcHandler,
		spellName = "Avalanche Rune",
		price = 1200,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"explosion rune"},
	{
		npcHandler = npcHandler,
		spellName = "Explosion Rune",
		price = 1800,
		level = 31,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"magic wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Wall Rune",
		price = 2100,
		level = 32,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fire wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Bomb Rune",
		price = 2300,
		level = 37,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = {VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"sudden death rune"},
	{
		npcHandler = npcHandler,
		spellName = "Sudden Death Rune",
		price = 3000,
		level = 45,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{light healing}', '{heal friend}', '{cure poison}', '{cure electrification}', \z
		'{intense healing}', '{cure burning}', '{ultimate healing}', '{mass healing}' and '{cure bleeding}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{magic rope}', '{levitate}', '{light}', \z
		'{great light}', '{haste}', '{food}', '{magic shield}', '{strong haste}', '{creature illusion}', '{summon creature}', \z
		'{enchant staff}', '{ultimate light}', '{invisible}', '{envenom}', '{summon grovebeast}' and '{summon thundergiant}'."
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprentice's strike}', '{energy strike}', '{terra strike}', '{flame strike}', '{ice strike}',\z
		'{death strike}', '{physical strike}', '{ice wave}', '{energy beam}', '{ignite}', '{great energy beam}', '{electrify}', '{energy wave}', \z
		'{terra wave}', '{strong ice wave}', '{lightning}', '{strong terra strike}', '{strong flame strike}', '{strong energy strike}', \z
		'{strong ice strike}' and '{Curse}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poison field rune}', '{fire field rune}', '{light magic missile rune}', '{destroy field rune}', \z
		'{energy field rune}', '{disintegrate rune}', '{stalagmite rune}', '{poison bomb rune}', '{heavy magic missile rune}', '{soulfire rune}', \z
		'{fire bomb rune}', '{fireball rune}', '{icicle rune}', '{stone shower rune}', '{thunderstorm rune}', '{poison wall rune}', \z
		'{great fireball rune}', '{avalanche rune}', '{explosion rune}', '{magic wall rune}', '{fire wall rune}', '{energy wall rune}' \z
		and '{sudden death rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

local voices = { {text = 'Utevo vis lux!'} }
npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
