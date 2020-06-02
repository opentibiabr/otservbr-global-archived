local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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
	{ text = "Come a little closer mortal." },
	{ text = "FCHHHHH!" },
	{ text = "GRRRRRRR!" }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
-- Name, id, price, count/charges
shopModule:addBuyableItem({"blue gem"}, 2158, 5000, 1)
shopModule:addBuyableItem({"golden mug"}, 2033, 250, 1)
shopModule:addBuyableItem({"green gem"}, 2155, 5000, 1)
shopModule:addBuyableItem({"red gem"}, 2156, 1000, 1)
shopModule:addBuyableItem({"violet gem"}, 2153, 10000, 1)
shopModule:addBuyableItem({"yellow gem"}, 2154, 1000, 1)

-- SPELLS FOR SORCERER
keywordHandler:addSpellKeyword({"apprentice's strike"},
	{
		npcHandler = npcHandler,
		spellName = "Apprentice's Strike",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Strike",
		price = 800,
		level = 12,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Flame Strike",
		price = 800,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magic shield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"death strike"},
	{
		npcHandler = npcHandler,
		spellName = "Death Strike",
		price = 800,
		level = 16,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fire wave"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wave",
		price = 850,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"intense healing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strong haste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy beam"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Beam",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"creature illusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"summon creature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ignite"},
	{
		npcHandler = npcHandler,
		spellName = "Ignite",
		price = 1500,
		level = 26,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ultimate light"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Light",
		price = 1600,
		level = 26,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"great energy beam"},
	{
		npcHandler = npcHandler,
		spellName = "Great Energy Beam",
		price = 1800,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ultimate healing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"electrify"},
	{
		npcHandler = npcHandler,
		spellName = "Electrify",
		price = 2500,
		level = 34,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"invisible"},
	{
		npcHandler = npcHandler,
		spellName = "Invisible",
		price = 2000,
		level = 35,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy wave"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wave",
		price = 2500,
		level = 38,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"lightning"},
	{
		npcHandler = npcHandler,
		spellName = "Lightning",
		price = 5000,
		level = 55,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strong flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Flame Strike",
		price =6000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strong energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Energy Strike",
		price = 6000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"curse"},
	{
		npcHandler = npcHandler,
		spellName = "Curse",
		price = 6000,
		level = 75,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"summon thundergiant"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Thundergiant",
		price = 50000,
		level = 200,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poison field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fire field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"light magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Field Rune",
		price = 700,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"disintegrate rune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"stalagmite rune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"heavy magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Heavy Magic Missile Rune",
		price = 1500,
		level = 25,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"soulfire rune"},
	{
		npcHandler = npcHandler,
		spellName = "Soulfire Rune",
		price = 1800,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fire bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"animate dead rune"},
	{
		npcHandler = npcHandler,
		spellName = "Animate Dead Rune",
		price = 1200,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fireball rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fireball Rune",
		price = 1600,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"thunderstorm rune"},
	{
		npcHandler = npcHandler,
		spellName = "Thunderstorm Rune",
		price = 1100,
		level = 28,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"poison wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"great fireball rune"},
	{
		npcHandler = npcHandler,
		spellName = "Great Fireball Rune",
		price = 1200,
		level = 30,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"explosion rune"},
	{
		npcHandler = npcHandler,
		spellName = "Explosion Rune",
		price = 1800,
		level = 31,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magic wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Wall Rune",
		price = 2100,
		level = 32,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fire wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Bomb Rune",
		price = 2300,
		level = 37,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energy wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"sudden death rune"},
	{
		npcHandler = npcHandler,
		spellName = "Sudden Death Rune",
		price = 3000,
		level = 45,
		vocation = VOCATION.CLIENT_ID.SORCERER
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

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, "Another pesky mortal who believes his gold outweighs his nutrition value.")
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "first dragon") then
		npcHandler:say("The First Dragon? The first of all of us? The Son of Garsharak? I'm surprised you heard about him. It is such a long time that he wandered Tibia. Yet, there are some {rumours}.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "rumours") and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 2
		npcHandler:say("It is told that the First Dragon had four {descendants}, who became the ancestors of the four kinds of dragons we know in Tibia. They perhaps still have knowledge about the First Dragon's whereabouts - if one could find them.", cid)
	elseif msgcontains(msg, "descendants") and npcHandler.topic[cid] == 2 then
		npcHandler.topic[cid] = 3
		npcHandler:say("The names of these four are Tazhadur, Kalyassa, Gelidrazah and Zorvorax. Not only were they the ancestors of all dragons after but also the primal representation of the {draconic incitements}. About whom do you want to learn more?", cid)
	elseif msgcontains(msg, "draconic incitements") and npcHandler.topic[cid] == 3 then
		npcHandler.topic[cid] = 4
		npcHandler:say({
			'Each kind of dragon has its own incitement, an important aspect that impels them and occupies their mind. For the common dragons this is the lust for power, for the dragon lords the greed for treasures. ...',
			'The frost dragons\' incitement is the thirst for knowledge und for the undead dragons it\'s the desire for life, as they regret their ancestor\'s mistake. ...',
			'These incitements are also a kind of trial that has to be undergone if one wants to {find} the First Dragon\'s four descendants.'
		}, cid)
	elseif msgcontains(msg, "find") then
		npcHandler.topic[cid] = 5
		npcHandler:say("What do you want to do, if you know about these mighty dragons' abodes? Go there and look for a fight?", cid)
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 5 then
		npcHandler.topic[cid] = 6
		npcHandler:say({
			' Fine! I\'ll tell you where to find our ancestors. You now may ask yourself why I should want you to go there and fight them. It\'s quite simple: I am a straight descendant of Kalyassa herself. She was not really a caring mother. ...',
			'No, she called herself an empress and behaved exactly like that. She was domineering, farouche and conceited and this finally culminated in a serious quarrel between us. ...',
			'I sought support by my aunt and my uncles but they were not a bit better than my mother was! So, feel free to go to their lairs and challenge them. I doubt you will succeed but then again that\'s not my problem. ...',
			'So, you want to know about their secret lairs?'
		}, cid)
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 6 then
		npcHandler:say({
			'So listen: The lairs are secluded and you can only reach them by using a magical gem teleporter. You will find a teleporter carved out of a giant emerald in the dragon lairs deep beneath the Darama desert, which will lead you to Tazhadur\'s lair. ...',
			'A ruby teleporter located in the western Dragonblaze Peaks allows you to enter the lair of Kalyassa. A teleporter carved out of sapphire is on the island Okolnir and leads you to Gelidrazah\'s lair. ...',
			'And finally an amethyst teleporter in undead-infested caverns underneath Edron allows you to enter the lair of Zorvorax.'
		}, cid)
		npcHandler.topic[cid] = 0
		player:setStorageValue(Storage.FirstDragon.Questline, 1)
		player:setStorageValue(Storage.FirstDragon.DragonCounter, 0)
		player:setStorageValue(Storage.FirstDragon.ChestCounter, 0)
		player:setStorageValue(Storage.FirstDragon.GelidrazahAccess, 0)
		player:setStorageValue(Storage.FirstDragon.SecretsCounter, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'I welcome thee, |PLAYERNAME|! I suppose you are looking for a trade in fine jewelery!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Goodbye and please bring more gold next time. I mean, it would be nice to see you again.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Goodbye and please bring more gold next time. I mean, it would be nice to see you again.')

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
