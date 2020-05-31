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
	{ text = 'Increase your knowledge of spells here, young paladin.' },
	{ text = 'Need ammunition, bows or crossbows? Have a look at my wares.' }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
-- Name, id, price, count/charges
shopmodule:addbuyableitem({"bow"}, 2456, 100, 1)
shopmodule:addbuyableitem({"crossbow"}, 2455, 120, 1)
shopmodule:addbuyableitem({"spear"}, 2389, 3, 1)
-- Sellable
shopmodule:addsellableitem({'arrow'}, 2544, 3, 1)
shopmodule:addsellableitem({'bolt'}, 2543, 4, 1)
shopmodule:addsellableitem({'bow'}, 2456, 400, 1)
shopmodule:addsellableitem({'crossbow'}, 2455, 500, 1)
shopmodule:addsellableitem({'crystalline arrow'}, 18304, 20, 1)
shopmodule:addsellableitem({'drill bolt'}, 18436, 12, 1)
shopmodule:addsellableitem({'earth arrow'}, 7850, 5, 1)
shopmodule:addsellableitem({'envenomed arrow'}, 18437, 12, 1)
shopmodule:addsellableitem({'flaming arrow'}, 7840, 5, 1)
shopmodule:addsellableitem({'flash arrow'}, 7838, 5, 1)
shopmodule:addsellableitem({'onyx arrow'}, 7365, 7, 1)
shopmodule:addsellableitem({'piercing bolt'}, 7363, 5, 1)
shopmodule:addsellableitem({'power bolt'}, 2547, 7, 1)
shopmodule:addsellableitem({'prismatic bolt'}, 18435, 20, 1)
shopmodule:addsellableitem({'royal spear'}, 7378, 15, 1)
shopmodule:addsellableitem({'shiver arrow'}, 7839, 5, 1)
shopmodule:addsellableitem({'sniper arrow'}, 7364, 5, 1)
shopmodule:addsellableitem({'spear'}, 2389, 9, 1)
shopmodule:addsellableitem({'tarsal arrow'}, 15648, 6, 1)
shopmodule:addsellableitem({'throwing star'}, 2399, 42, 1)
shopmodule:addsellableitem({'vortex bolt'}, 15649, 6, 1)

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

-- Greeting message
keywordHandler:addGreetKeyword({"ashari"}, {npcHandler = npcHandler, text = "Ashari, |PLAYERNAME|. If you're a distance fighter, you might want to have a look at my wares and spells."})
--Farewell message
keywordHandler:addFarewellKeyword({"asgha thrazi"}, {npcHandler = npcHandler, text = "Asha Thrazi, |PLAYERNAME|."})

npcHandler:setMessage(MESSAGE_GREET, "Ashari, |PLAYERNAME|. If you're a distance fighter, you might want to have a look at my wares and spells.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Asha Thrazi, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Asha Thrazi, |PLAYERNAME|.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())