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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
-- Name, id, price, count/charges
shopModule:addBuyableItem({"black hood"}, 10562, 190, 1)
shopModule:addBuyableItem({"book of necromantic rituals"}, 11237, 180, 1)
shopModule:addBuyableItem({"book of prayers"}, 10563, 120, 1)
shopModule:addBuyableItem({"broken key ring"}, 12608, 8000, 1)
shopModule:addBuyableItem({"broken ring of ending"}, 13877, 4000, 1)
shopModule:addBuyableItem({"cultish mask"}, 10555, 280, 1)
shopModule:addBuyableItem({"cultish robe"}, 10556, 150, 1)
shopModule:addBuyableItem({"cultish symbol"}, 12411, 500, 1)
shopModule:addBuyableItem({"dark rosary"}, 11220, 48, 1)
shopModule:addBuyableItem({"elvish talisman"}, 10552, 45, 1)
shopModule:addBuyableItem({"flask of embalming fluid"}, 12422, 30, 1)
shopModule:addBuyableItem({"strange symbol"}, 2174, 200, 1)
shopModule:addBuyableItem({"unholy bone"}, 11233, 480, 1)
shopModule:addBuyableItem({"witch broom"}, 10569, 60, 1)

-- SPELLS FOR SORCERER
keywordHandler:addSpellKeyword({"apprentice's strike"},
	{
		npcHandler = npcHandler,
		spellName = "Apprentice's Strike",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Strike",
		price = 800,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Flame Strike",
		price = 800,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"magic shield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
keywordHandler:addSpellKeyword({"fire wave"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wave",
		price = 850,
		level = 18,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"intense healing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"strong haste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"summon creature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
keywordHandler:addSpellKeyword({"ultimate healing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy wave"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wave",
		price = 2500,
		level = 38,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
keywordHandler:addSpellKeyword({"strong energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Energy Strike",
		price = 6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fire field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"light magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"energy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Field Rune",
		price = 700,
		level = 18,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"disintegrate rune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"stalagmite rune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"heavy magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Heavy Magic Missile Rune",
		price = 1500,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"soulfire rune"},
	{
		npcHandler = npcHandler,
		spellName = "Soulfire Rune",
		price = 1800,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"fire bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"animate dead rune"},
	{
		npcHandler = npcHandler,
		spellName = "Animate Dead Rune",
		price = 1200,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
keywordHandler:addSpellKeyword({"explosion rune"},
	{
		npcHandler = npcHandler,
		spellName = "Explosion Rune",
		price = 1800,
		level = 31,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		text = "In this category I have '{light healing}', '{cure poison}', '{intense healing}' and '{ultimate healing}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{magic rope}', '{levitate}', '{light}', '{great light}', '{haste}', '{magic shield}', \z
		'{strong haste}', '{creature illusion}', '{summon creature}', '{ultimate light}', '{invisible}', and '{summon thundergiant}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprentice's strike}', '{energy strike}', '{terra strike}', '{flame strike}', '{ice strike}',\z
		'{death strike}', '{fire wave}', '{energy beam}', '{ignite}', '{great energy beam}', '{electrify}', '{energy wave}', \z
		'{energy wave}', '{lightning}', '{strong flame strike}', '{strong energy strike}' and '{Curse}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poison field rune}', '{fire field rune}', '{light magic missile rune}', '{destroy field rune}', \z
		'{energy field rune}', '{disintegrate rune}', '{stalagmite rune}', '{heavy magic missile rune}', '{soulfire rune}', \z
		'{fire bomb rune}', '{fireball rune}', '{animate dead rune}', '{thunderstorm rune}', '{poison wall rune}', '{great fireball rune}', \z
		'{explosion rune}', '{magic wall rune}', '{fire wall rune}', '{energy bomb rune}', '{energy wall rune}' and '{sudden death rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_SENDTRADE, "I'm currently interested in these materials.")

npcHandler:addModule(FocusModule:new())
