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
	{ text = "Need a new holy spell to hunt evil creatures? Come on in!" },
	{ text = "Want to improve your aim, young paladin? Come and buy my bows!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
-- Name, id, price, count/charges
shopModule:addSellableItem({"bow"}, 2456, 100, 1)
shopModule:addSellableItem({"crossbow"}, 2455, 120, 1)
shopModule:addSellableItem({"spear"}, 2389, 3, 1)
-- Sellable
shopModule:addBuyableItem({'arrow'}, 2544, 3, 1)
shopModule:addBuyableItem({'bolt'}, 2543, 4, 1)
shopModule:addBuyableItem({'bow'}, 2456, 400, 1)
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 1)
shopModule:addBuyableItem({'crystalline arrow'}, 18304, 20, 1)
shopModule:addBuyableItem({'drill bolt'}, 18436, 12, 1)
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 1)
shopModule:addBuyableItem({'envenomed arrow'}, 18437, 12, 1)
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 1)
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 1)
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 1)
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 1)
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 1)
shopModule:addBuyableItem({'prismatic bolt'}, 18435, 20, 1)
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 1)
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 1)
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 1)
shopModule:addBuyableItem({'spear'}, 2389, 9, 1)
shopModule:addBuyableItem({'tarsal arrow'}, 15648, 6, 1)
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 1)
shopModule:addBuyableItem({'vortex bolt'}, 15649, 6, 1)

-- SPELLS FOR PALADIN
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Arrow",
		price = 450,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure poisoned arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Poisoned Arrow",
		price = 700,
		level = 16,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Bolt",
		price = 750,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"intense healing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"ethereal spear"},
	{
		npcHandler = npcHandler,
		spellName = "Ethereal Spear",
		price = 1100,
		level = 23,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure sniper arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Sniper Arrow",
		price = 800,
		level = 24,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure explosive arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Explosive Arrow",
		price = 1000,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"cancel invisibility"},
	{
		npcHandler = npcHandler,
		spellName = "Cancel Invisibility",
		price = 1600,
		level = 26,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure piercing bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Piercing Bolt",
		price = 850,
		level = 33,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"divine healing"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Healing",
		price = 3000,
		level = 35,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"divine missile"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Missile",
		price = 1800,
		level = 40,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"enchant spear"},
	{
		npcHandler = npcHandler,
		spellName = "Enchant Spear",
		price = 2000,
		level = 45,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"divine caldera"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Caldera",
		price = 3000,
		level = 50,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"recovery"},
	{
		npcHandler = npcHandler,
		spellName = "Recovery",
		price = 4000,
		level = 50,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"conjure power bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Power Bolt",
		price = 2000,
		level = 59,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"salvation"},
	{
		npcHandler = npcHandler,
		spellName = "Salvation",
		price = 8000,
		level = 60,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"holy flash"},
	{
		npcHandler = npcHandler,
		spellName = "Holy Flash",
		price = 7500,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"cure curse"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Curse",
		price = 6000,
		level = 80,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"strong ethereal spear"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ethereal Spear",
		price = 10000,
		level = 90,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"intense recovery"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Recovery",
		price = 10000,
		level = 100,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"summon emberwing"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Emberwing",
		price = 50000,
		level = 200,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{light healing}', '{cure poison}', '{intense healing}', '{divine healing}', '{recovery}', \z
		'{salvation}', '{cure curse}' and '{intense recovery}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{light}', '{magic rope}', '{levitate}', '{great light}', '{conjure arrow}', '{haste}', \z
		'{conjure poisoned arrow}', '{conjure bolt}', '{conjure sniper arrow}', '{conjure explosive arrow}', \z
		'{cancel invisibility}', '{conjure piercing bolt}', '{enchant spear}', '{conjure power bolt}' and '{summon emberwing}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{ethereal spear}', '{divine missile}', '{divine caldera}', '{holy flash}' and '{strong ethereal spear}'."
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

keywordHandler:addKeyword({'rathleton'}, StdModule.say, {npcHandler = npcHandler, text = "You seem staggered by it. The invention of glooth added to the uniqueness of our city, I believe - there is no glooth in your lands, I understand?"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am a hunter and trainer of hunters. And I teach paladin spells to those of my kind."})
keywordHandler:addKeyword({'glooth'}, StdModule.say, {npcHandler = npcHandler, text = "A strange substance, gained, I think through some sort of process from an animal. Our historian in the magistrate, or Dr Alaistar Stanton, can surely explain it better to you than I can."})
keywordHandler:addKeyword({'alaistar'}, StdModule.say, {npcHandler = npcHandler, text = "A kind and intelligent man, but too naive in his dealings with the minotaurs. You'd better purchase some sturdy bow if you go out there to their camps, friend."})
keywordHandler:addKeyword({'minotaurs'}, StdModule.say, {npcHandler = npcHandler, text = "Those brutish creatures cannot share the island with us. We should eradicate their kind, once and for all, or we shall never be safe."})

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
