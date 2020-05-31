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

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Hawkyr the hunter."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am a hunter and bowyer. If you need some training, I am the man you want to see."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't have anything to do for you."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "In our lands, the most successful hunter is the king. Be it beast or man."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, text = "In our lands, the most successful huntress is the queen. Be it beast or woman."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = "The gods of the south seem to have little influence here."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, text = "They know the ways of spirits and nature. You can learn a lot from them just by listening. Still, you can always learn a lot if you're listening well to what nature tells you."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "Better ask the Southerners about that one."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "A weapon hardly useful for a hunter."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = "The wolves are very hungry lately."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = " I don't think I'd like that place and it's not only that this is not my marked territory."})
keywordHandler:addKeyword({'Edron'}, StdModule.say, {npcHandler = npcHandler, text = "Only foreigners talk about that place now and then."})
keywordHandler:addKeyword({'Svargrond'}, StdModule.say, {npcHandler = npcHandler, text = "I admire the safety of the burrow and the closeness of the pack. It's a good thing to have a lair to which you can withdraw to lick your wounds."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Thais is some far away city."})
keywordHandler:addKeyword({'Venore'}, StdModule.say, {npcHandler = npcHandler, text = "Carlin and Venore seem to live in some sort of rivalry."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, text = "Most dwarfs I've seen seem to lack the stealthiness to become a good hunter."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, text = "Elves are good hunters. Even I was able to learn something from the elves that came here. I am thinking about visiting their city some day."})
keywordHandler:addKeyword({'chakoya'}, StdModule.say, {npcHandler = npcHandler, text = "The chakoya are ferocious hunters. They don't only kill out of hunger, they love the carnage they are causing."})
keywordHandler:addKeyword({'yeti'}, StdModule.say, {npcHandler = npcHandler, text = "Yetis are rare but they do exist. Everyone that has been hunting in the frozen wastes for some time can share stories of their sightings."})
keywordHandler:addKeyword({'dragon'}, StdModule.say, {npcHandler = npcHandler, text = "It's not easy to hunt dragons. Suddenly, a hunter might become the hunted in their lairs."})
keywordHandler:addKeyword({'cult'}, StdModule.say, {npcHandler = npcHandler, text = "I don't know anything about it."})
keywordHandler:addKeyword({'barbarian'}, StdModule.say, {npcHandler = npcHandler, text = "Being a barbarian means to be one with nature and its instincts."})
keywordHandler:addKeyword({'raiders'}, StdModule.say, {npcHandler = npcHandler, text = "Their packs are not of our kin anymore. They left our pack. We will see how they prosper. They have nothing to expect from us except for cold steel in their hearts."})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, text = "As far as I have understood it, they are of some importance for the people of Carlin."})
keywordHandler:addKeyword({'Chyll'}, StdModule.say, {npcHandler = npcHandler, text = "Father north wind knows best."})
keywordHandler:addKeyword({'Nibelor'}, StdModule.say, {npcHandler = npcHandler, text = "An isle on which the shamans live."})
keywordHandler:addKeyword({'Years of Serpents'}, StdModule.say, {npcHandler = npcHandler, text = "I wonder if even bigger hunter have driven them away."})
keywordHandler:addKeyword({'how are you?'}, StdModule.say, {npcHandler = npcHandler, text = "I only feel alive when I'm on a hunt. But even I need some time to rest and regain strength."})

npcHandler:setMessage(MESSAGE_GREET, 'Greetings |PLAYERNAME|. What leads you to me?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good hunting, |PLAYERNAME|')

npcHandler:addModule(FocusModule:new())
