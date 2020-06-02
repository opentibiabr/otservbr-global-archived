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

-- SPELLS FOR SORCERER
keywordHandler:addSpellKeyword({"apprenticesstrike"},
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
keywordHandler:addSpellKeyword({"lighthealing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"findperson"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magicrope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energystrike"},
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
keywordHandler:addSpellKeyword({"greatlight"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"terrastrike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"flamestrike"},
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
keywordHandler:addSpellKeyword({"magicshield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"icestrike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"deathstrike"},
	{
		npcHandler = npcHandler,
		spellName = "Death Strike",
		price = 800,
		level = 16,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firewave"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wave",
		price = 850,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"intensehealing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"stronghaste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energybeam"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Beam",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"creatureillusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"summoncreature"},
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
keywordHandler:addSpellKeyword({"ultimatelight"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Light",
		price = 1600,
		level = 26,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"greatenergybeam"},
	{
		npcHandler = npcHandler,
		spellName = "Great Energy Beam",
		price = 1800,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"ultimatehealing"},
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
keywordHandler:addSpellKeyword({"energywave"},
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
keywordHandler:addSpellKeyword({"strongflamestrike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Flame Strike",
		price =6000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"strongenergystrike"},
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
keywordHandler:addSpellKeyword({"summonthundergiant"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Thundergiant",
		price = 50000,
		level = 200,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poisonfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firefieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"lightmagicmissilerune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"destroyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energyfieldrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Field Rune",
		price = 700,
		level = 18,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"disintegraterune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"stalagmiterune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"heavymagicmissilerune"},
	{
		npcHandler = npcHandler,
		spellName = "Heavy Magic Missile Rune",
		price = 1500,
		level = 25,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"soulfirerune"},
	{
		npcHandler = npcHandler,
		spellName = "Soulfire Rune",
		price = 1800,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firebombrune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"animatedeadrune"},
	{
		npcHandler = npcHandler,
		spellName = "Animate Dead Rune",
		price = 1200,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"fireballrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fireball Rune",
		price = 1600,
		level = 27,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"thunderstormrune"},
	{
		npcHandler = npcHandler,
		spellName = "Thunderstorm Rune",
		price = 1100,
		level = 28,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"poisonwallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"greatfireballrune"},
	{
		npcHandler = npcHandler,
		spellName = "Great Fireball Rune",
		price = 1200,
		level = 30,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"explosionrune"},
	{
		npcHandler = npcHandler,
		spellName = "Explosion Rune",
		price = 1800,
		level = 31,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"magicwallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Wall Rune",
		price = 2100,
		level = 32,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"firewallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energybombrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Bomb Rune",
		price = 2300,
		level = 37,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"energywallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = VOCATION.CLIENT_ID.SORCERER
	}
)
keywordHandler:addSpellKeyword({"suddendeathrune"},
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
		text = "In this category I have '{lighthealing}', '{curepoison}', '{intensehealing}' and '{ultimatehealing}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{findperson}', '{magicrope}', '{levitate}', '{light}', '{greatlight}', '{haste}', '{magicshield}', \z
		'{stronghaste}', '{creatureillusion}', '{summoncreature}', '{ultimatelight}', '{invisible}', and '{summonthundergiant}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprenticesstrike}', '{energystrike}', '{terrastrike}', '{flamestrike}', '{icestrike}',\z
		'{deathstrike}', '{firewave}', '{energybeam}', '{ignite}', '{greatenergybeam}', '{electrify}', '{energywave}', \z
		'{energywave}', '{lightning}', '{strongflamestrike}', '{strongenergystrike}' and '{Curse}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poisonfieldrune}', '{firefieldrune}', '{lightmagicmissilerune}', '{destroyfieldrune}', \z
		'{energyfieldrune}', '{disintegraterune}', '{stalagmiterune}', '{heavymagicmissilerune}', '{soulfirerune}', \z
		'{firebombrune}', '{fireballrune}', '{animatedeadrune}', '{thunderstormrune}', '{poisonwallrune}', '{greatfireballrune}', \z
		'{explosionrune}', '{magicwallrune}', '{firewallrune}', '{energybombrune}', '{energywallrune}' and '{suddendeathrune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

-- Start
local tiaraKeyword = keywordHandler:addKeyword({'tiara'}, StdModule.say, {npcHandler = npcHandler, text = 'Well... maybe, if you help me a little, I could convince the academy of Edron that you are a valuable help here and deserve an award too. How about it?'}, function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) == -1 end)
	local yesKeyword = tiaraKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler,
		text = {
			'Okay, great! You see, I need a few magical ingredients which I\'ve run out of. First of all, please bring me 70 bat wings. ...',
			'Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...',
			'Oh, and also, I could use a whole load of ape fur. Please bring me 40 pieces. ...',
			'After that, um, let me think... I\'d like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...',
			'Then, 10 spools of spider silk yarn, 60 lizard scales and 40 red dragon scales. ...',
			'I know I\'m forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...',
			'That\'s it already! Easy task, isn\'t it? I\'m sure you could get all of that within a short time. ...',
			'Did you understand everything I told you and are willing to handle this task?'
		}}
	)

	yesKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Fine! Let\'s start with the 70 bat wings. I really feel uncomfortable out there in the jungle.', reset = true}, nil, function(player) player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak, 1) player:setStorageValue(Storage.OutfitQuest.MageSummoner.MissionHatCloak, 1) player:setStorageValue(Storage.OutfitQuest.Ref, math.max(0, player:getStorageValue(Storage.OutfitQuest.Ref)) + 1) end)
	yesKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Would you like me to repeat the task requirements then?', moveup = 2})

tiaraKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'That\'s a pity.', reset = true})
keywordHandler:addAliasKeyword({'award'})

-- When asking for your award before completing your tasks
keywordHandler:addKeyword({'tiara'}, StdModule.say, {npcHandler = npcHandler, text = 'Before I can nominate you for an award, please complete your task'}, function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) > 0 and player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) < 10 end)
keywordHandler:addAliasKeyword({'award'})

-- What happens when you say task
local function addTaskKeyword(value, text)
	keywordHandler:addKeyword({'task'}, StdModule.say, {npcHandler = npcHandler, text = text}, function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) == value end)
	if value == 10 then
		keywordHandler:addAliasKeyword({'tiara'})
		keywordHandler:addAliasKeyword({'award'})
	end
end

addTaskKeyword(1, 'Your current task is to bring me 70 bat wings, |PLAYERNAME|.')
addTaskKeyword(2, 'Your current task is to bring me 20 pieces of red cloth, |PLAYERNAME|.')
addTaskKeyword(3, 'Your current task is to bring me 40 pieces of ape fur, |PLAYERNAME|.')
addTaskKeyword(4, 'Your current task is to bring me 35 holy orchids, |PLAYERNAME|.')
addTaskKeyword(5, 'Your current task is to bring me 10 spools of spider silk yarn, |PLAYERNAME|.')
addTaskKeyword(6, 'Your current task is to bring me 60 lizard scales, |PLAYERNAME|.')
addTaskKeyword(7, 'Your current task is to bring me 40 red dragon scales, |PLAYERNAME|.')
addTaskKeyword(8, 'Your current task is to bring me 15 ounces of magic sulphur, |PLAYERNAME|.')
addTaskKeyword(9, 'Your current task is to bring me 30 ounces of vampire dust, |PLAYERNAME|.')
addTaskKeyword(10, 'Go to the academy in Edron and tell Zoltan that I sent you, |PLAYERNAME|.')
addTaskKeyword(11, 'I don\'t have any tasks for you right now, |PLAYERNAME|. You were of great help.')

-- Hand over items
local function addItemKeyword(keyword, text, value, itemId, count, last)
	local itemKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text[1]}, function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) == value end)
		itemKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'No, no. That\'s not enough, I fear.', reset = true}, function(player) return player:getItemCount(itemId) < count end)
		local rewardKeyword = itemKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = text[2]}, nil,
			function(player)
				player:removeItem(itemId, count)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak, player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) + 1)
				player:setStorageValue(Storage.OutfitQuest.MageSummoner.MissionHatCloak, player:getStorageValue(Storage.OutfitQuest.MageSummoner.MissionHatCloak) + 1)
				if not last then
					npcHandler:resetNpc(player.uid)
				end
			end
		)

		if last then
			rewardKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'I thought so. Go to the academy of Edron and tell Zoltan that I sent you. I will send a nomination to him. You were really a great help. Thanks again!', reset = true})
			rewardKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Really? Well, if you should change your mind, go to the academy of Edron and tell Zoltan that I sent you. I will send a nomination to him.', reset = true})
		end

		itemKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'That\'s a pity.', reset = true})
	keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text[3]})
end

addItemKeyword('bat wing', {'Oh, did you bring the 70 bat wings for me?', 'Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of {red cloth}.', 'I love to say \'creatures of the night\'. Got a dramatic as well as romantic ring to it.'}, 1, 5894, 70)
addItemKeyword('red cloth', {'Have you found 20 pieces of red cloth?', 'Great! This should be enough for my new dress. Don\'t forget to bring me 40 pieces of {ape fur} next!', 'Nice material for a cape, isn\'t it?'}, 2, 5911, 20)
addItemKeyword('ape fur', {'Were you able to retrieve 40 pieces of ape fur?', 'Nice job, player. You see, I\'m testing a new depilation cream. I guess if it works on ape fur it\'s good quality. Next, please bring me 35 {holy orchids}.', 'This feels really smooth.'}, 3, 5883, 40)
addItemKeyword('holy orchid', {'Did you convince the elves to give you 35 holy orchids?', 'Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the tavern latrine. Now, please bring me 10 rolls of {spider silk yarn}!', 'I heard that some elves cultivate these flowers.'}, 4, 5922, 35)
addItemKeyword('spider silk', {'Oh, did you bring 10 spools of spider silk yarn for me?', 'I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I\'m sure this strong yarn will keep him. Now, go for the 60 {lizard scales}!', 'Only very large spiders produce silk which is strong enough to be yarned. I heard that mermaids can turn spider silk into yarn.'}, 5, 5886, 10)
addItemKeyword('lizard scale', {'Have you found 60 lizard scales?', 'Good job. They will look almost like sequins on my new dress. Please go for the 40 {red dragon scales} now.', 'Lizard scales are great for all sorts of magical potions.'}, 6, 5881, 60)
addItemKeyword('red dragon scale', {'Were you able to get all 40 red dragon scales?', 'Thanks! They make a pretty decoration, don\'t you think? Please bring me 15 ounces of {magic sulphur} now!', 'Red dragon scales are hard to come by, but much harder than the green ones.'}, 7, 5882, 40)
addItemKeyword('magic sulphur', {'Have you collected 15 ounces of magic sulphur?', 'Ah, that\'s enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is {vampire dust}. 30 ounces will suffice.', 'Magic sulphur can be extracted from magical weapons. I heard that Djinns are good at magical extractions.'}, 8, 5904, 15)
addItemKeyword('vampire dust', {'Have you gathered 30 ounces of vampire dust?', 'Ah, great. Now I can finally finish the potion which the academy of Edron asked me to. I guess, now you want your reward, don\'t you?', 'The Tibian vampires are quite restistant. I needs a special blessed stake to turn their corpse into dust, and it doesn\'t work all the time. Maybe a priest can help you.'}, 9, 5905, 30, true)

-- Basic
keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, text = 'This Tiara is an award by the academy of Edron in recognition of my service here.'})

npcHandler:setMessage(MESSAGE_GREET, 'Greetings, |PLAYERNAME|. If you are looking for sorcerer {spells} don\'t hesitate to ask.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell.')

npcHandler:addModule(FocusModule:new())
