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
shopModule:addBuyableItem({"boggy dreads"}, 10584, 200, 1)
shopModule:addBuyableItem({"bonecarving knife"}, 20110, 190, 1)
shopModule:addBuyableItem({"centipede leg"}, 11218, 28, 1)
shopModule:addBuyableItem({"cliff strider claw"}, 18428, 800, 1)
shopModule:addBuyableItem({"cobra tongue"}, 10551, 15, 1)
shopModule:addBuyableItem({"compound eye"}, 15486, 150, 1)
shopModule:addBuyableItem({"crawler head plating"}, 15482, 210, 1)
shopModule:addBuyableItem({"damselfly eye"}, 19743, 25, 1)
shopModule:addBuyableItem({"damselfly wing"}, 19738, 20, 1)
shopModule:addBuyableItem({"deepling breaktime snack"}, 15424, 90, 1)
shopModule:addBuyableItem({"deepling claw"}, 15455, 430, 1)
shopModule:addBuyableItem({"deepling ridge"}, 15452, 360, 1)
shopModule:addBuyableItem({"deepling scales"}, 15430, 80, 1)
shopModule:addBuyableItem({"deepling warts"}, 15425, 180, 1)
shopModule:addBuyableItem({"demonic finger"}, 13530, 1000, 1)
shopModule:addBuyableItem({"dowser"}, 21427, 35, 1)
shopModule:addBuyableItem({"essence of a bad dream"}, 11223, 360, 1)
shopModule:addBuyableItem({"eye of a deepling"}, 13870, 150, 1)
shopModule:addBuyableItem({"eye of a weeper"}, 18426, 650, 1)
shopModule:addBuyableItem({"eye of corruption"}, 12627, 390, 1)
shopModule:addBuyableItem({"fir cone"}, 21428, 25, 1)
shopModule:addBuyableItem({"ghastly dragon head"}, 11366, 700, 1)
shopModule:addBuyableItem({"ghoul snack"}, 12423, 60, 1)
shopModule:addBuyableItem({"gland"}, 8971, 500, 1)
shopModule:addBuyableItem({"hair of a banshee"}, 12402, 350, 1)
shopModule:addBuyableItem({"half-digested piece of meat"}, 11200, 55, 1)
shopModule:addBuyableItem({"half-eaten brain"}, 10576, 85, 1)
shopModule:addBuyableItem({"hatched rorc egg"}, 21314, 30, 1)
shopModule:addBuyableItem({"haunted piece of wood"}, 10600, 115, 1)
shopModule:addBuyableItem({"hellhound slobber"}, 10554, 500, 1)
shopModule:addBuyableItem({"horoscope"}, 21243, 40, 1)
shopModule:addBuyableItem({"kollos shell"}, 15480, 420, 1)
shopModule:addBuyableItem({"incantation notes"}, 21246, 90, 1)
shopModule:addBuyableItem({"lancet"}, 21242, 90, 1)
shopModule:addBuyableItem({"lizard essence"}, 12636, 300, 1)
shopModule:addBuyableItem({"mutated flesh"}, 11225, 50, 1)
shopModule:addBuyableItem({"mutated rat tail"}, 10585, 150, 1)
shopModule:addBuyableItem({"necromantic robe"}, 12431, 250, 1)
shopModule:addBuyableItem({"pelvis bone"}, 12437, 30, 1)
shopModule:addBuyableItem({"petrified scream"}, 11337, 250, 1)
shopModule:addBuyableItem({"piece of dead brain"}, 10580, 420, 1)
shopModule:addBuyableItem({"pieces of magic chalk"}, 21247, 210, 1)
shopModule:addBuyableItem({"piece of scarab shell"}, 10558, 45, 1)
shopModule:addBuyableItem({"piece of swampling wood"}, 20103, 30, 1)
shopModule:addBuyableItem({"pig foot"}, 10610, 10, 1)
shopModule:addBuyableItem({"pile of grave earth"}, 12440, 25, 1)
shopModule:addBuyableItem({"poison spider shell"}, 12441, 10, 1)
shopModule:addBuyableItem({"poisonous slime"}, 10557, 50, 1)
shopModule:addBuyableItem({"rorc egg"}, 21313, 120, 1)
shopModule:addBuyableItem({"rotten piece of cloth"}, 11208, 30, 1)
shopModule:addBuyableItem({"scale of corruption"}, 12629, 680, 1)
shopModule:addBuyableItem({"scorpion tail"}, 10568, 25, 1)
shopModule:addBuyableItem({"slime mould"}, 13758, 175, 1)
shopModule:addBuyableItem({"small pitchfork"}, 12469, 70, 1)
shopModule:addBuyableItem({"spider fangs"}, 8859, 10, 1)
shopModule:addBuyableItem({"spidris mandible"}, 15485, 450, 1)
shopModule:addBuyableItem({"spitter nose"}, 15481, 340, 1)
shopModule:addBuyableItem({"strand of medusa hair"}, 11226, 600, 1)
shopModule:addBuyableItem({"swampling moss"}, 20102, 20, 1)
shopModule:addBuyableItem({"swarmer antenna"}, 15479, 130, 1)
shopModule:addBuyableItem({"tail of corruption"}, 12628, 240, 1)
shopModule:addBuyableItem({"tarantula egg"}, 11198, 80, 1)
shopModule:addBuyableItem({"tentacle piece"}, 12622, 5000, 1)
shopModule:addBuyableItem({"thorn"}, 10560, 100, 1)
shopModule:addBuyableItem({"tooth file"}, 21241, 60, 1)
shopModule:addBuyableItem({"undead heart"}, 11367, 200, 1)
shopModule:addBuyableItem({"venison"}, 21312, 55, 1)
shopModule:addBuyableItem({"waspoid claw"}, 15483, 320, 1)
shopModule:addBuyableItem({"waspoid wing"}, 15484, 190, 1)
shopModule:addBuyableItem({"widow's mandibles"}, 11328, 110, 1)
shopModule:addBuyableItem({"winged tail"}, 11230, 800, 1)
shopModule:addBuyableItem({"yielocks"}, 13942, 600, 1)
shopModule:addBuyableItem({"yielowax"}, 13881, 600, 1)

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

local voices = { {text = '<mumble>'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Greetings. I have only little time to {spare}, so the conversation will be short. I teach sorcerer {spells} and buy a few magical {ingredients}.")
npcHandler:addModule(FocusModule:new())
