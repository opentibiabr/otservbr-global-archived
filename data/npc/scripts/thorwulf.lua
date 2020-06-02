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

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Thorwulf, slayer of dragons, giants and yetis."})
keywordHandler:addKeyword({'dragon'}, StdModule.say, {npcHandler = npcHandler, text = "The dragons of these lands are fierce as a blizzard and lethal as the silent cold and the howling snow storm alike."})
keywordHandler:addKeyword({'yeti'}, StdModule.say, {npcHandler = npcHandler, text = "The yetis are powerful and cunning foes. It takes the right bait to lure them out of their hiding places."})
keywordHandler:addKeyword({'bait'}, StdModule.say, {npcHandler = npcHandler, text = "I won't tell. Never ever. Find out on your own."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am an expert fighter and I can teach a true warrior in the arts of war."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = "I don't have anything to do for you."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "How can someone who never proved himself as a warrior lead people into a battle?"})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, text = "The people from Carlin seem to respect their queen. Though, I can't understand why. She is hardly a warrior."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = "I couldn't care less for gods. Every true warrior creates his own fortune."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't teach spells for your vocation."})
keywordHandler:addKeyword({'druids'}, StdModule.say, {npcHandler = npcHandler, text = "As far as I understood it, druids are like our shamans. I know enough magic to defeat my opponents on my own. So I have only little use for such spell casters."})
keywordHandler:addKeyword({'shamans'}, StdModule.say, {npcHandler = npcHandler, text = "All they are doing is talking to the spirits the whole day. My enemies, however, are of flesh and blood and I can handle them on my own."})
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "Bah, to know that he is a sorcerer means to know that he is a coward."})
keywordHandler:addKeyword({'Excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "A true warrior will kill his opponents with a rusty knife. There is no need for a mighty weapon. Where is the honour if the weapon is more powerful than its wielder?"})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = "There are no news ... yet. But I can smell blood and steel in the air. I can feel it, there is going to be a battle soon."})
keywordHandler:addKeyword({'Carlin'}, StdModule.say, {npcHandler = npcHandler, text = "I care little for the people from Carlin. All of them are so weak and timid. I could not care less for their concerns. If they want something to be done, they will have to do it on their own."})
keywordHandler:addKeyword({'Edron', 'Port Hope'}, StdModule.say, {npcHandler = npcHandler, text = "Some far away place the people of Carlin talk about now and then."})
keywordHandler:addKeyword({'Svargrond'}, StdModule.say, {npcHandler = npcHandler, text = "I hate it to wait here for our enemies to arrive. I'd rather go out and wage war in their camps and lairs."})
keywordHandler:addKeyword({'Thais'}, StdModule.say, {npcHandler = npcHandler, text = "Thais is not better than Carlin."})
keywordHandler:addKeyword({'Venore'}, StdModule.say, {npcHandler = npcHandler, text = "For all I know, they are schemers and liars. That means they are even worse than the other southerners."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, text = "I haven't seen many of them around here."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, text = "The elves that came here were quite skilled with a bow. I respect that in a way, still it takes little courage to shoot something from afar."})
keywordHandler:addKeyword({'chakoya'}, StdModule.say, {npcHandler = npcHandler, text = "The chakoyas are small but their teeth can shred a man's arm into pieces. Their strength lies in their number as well as in ambushes on unwary or sleeping persons."})
keywordHandler:addKeyword({'cult'}, StdModule.say, {npcHandler = npcHandler, text = "I don't care about cults."})
keywordHandler:addKeyword({'jarl'}, StdModule.say, {npcHandler = npcHandler, text = "Our jarl has grown old. I honour him for his deeds in the past but I wonder if a younger leader wouldn't be better now. He could lead us into glorious battles with the raiders."})
keywordHandler:addKeyword({'raiders'}, StdModule.say, {npcHandler = npcHandler, text = "Their cowardly tactics are a shame for every true barbarian, so is their obedience to a witch. They are not even worthy opponents."})
keywordHandler:addKeyword({'barbarian'}, StdModule.say, {npcHandler = npcHandler, text = "Most people have forgotten that being a true barbarian means to be a fearless fighter."})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, text = "Those Carliners seem to care about those mines, but they don't have the guts to recapture them. Pathetic."})
keywordHandler:addKeyword({'Chyll'}, StdModule.say, {npcHandler = npcHandler, text = "The wind that has seen all battles and that puts an icy blanket over the battlefields."})
keywordHandler:addKeyword({'Nibelor'}, StdModule.say, {npcHandler = npcHandler, text = "A boring piece of ice and rock on which only shamans live."})
keywordHandler:addKeyword({'Years of Serpents'}, StdModule.say, {npcHandler = npcHandler, text = "Men are not supposed to travel the seas. So I don't care if these giant serpents ever existed or if they had only been an excuse for cowards."})
keywordHandler:addKeyword({'how are you?'}, StdModule.say, {npcHandler = npcHandler, text = "As long as I am not fighting, I am bored."})
keywordHandler:addKeyword({'rumours'}, StdModule.say, {npcHandler = npcHandler, text = "A few years ago there was an arena fighter named Alrik. He managed to win the Warlord title three times in a row. He was Svargrond's greatest hero and all of a sudden he was gone and never seen again."})
keywordHandler:addKeyword({'coward'}, StdModule.say, {npcHandler = npcHandler, text = "You talked to Robert, did you? I think I scared him pretty well! Hehehe!"})

npcHandler:setMessage(MESSAGE_GREET, 'Hi |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Bye.')

npcHandler:addModule(FocusModule:new())