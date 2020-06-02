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
keywordHandler:addSpellKeyword({"curepoison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
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
keywordHandler:addSpellKeyword({"magicshield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
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
keywordHandler:addSpellKeyword({"firebombrune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
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
keywordHandler:addSpellKeyword({"firewallrune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
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
		text = "In this category I have '{findperson}', '{light}', '{greatlight}', '{magicshield}', '{creatureillusion}', \z
		'{summoncreature}' and '{invisible}'."		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprenticesstrike}', '{firewave}', '{energybeam}', '{greatenergybeam}' and '{energywave}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poisonfieldrune}', '{firefieldrune}', '{lightmagicmissilerune}', '{destroyfieldrune}', \z
		'{energyfieldrune}', '{stalagmiterune}', '{heavymagicmissilerune}', '{firebombrune}', '{poisonwallrune}', '{greatfireballrune}', \z
		'{explosionrune}', '{firewallrune}', '{energywallrune}' and '{suddendeathrune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

local function releasePlayer(cid)
	if not Player(cid) then
		return
	end

	npcHandler:releaseFocus(cid)
	npcHandler:resetNpc(cid)
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'mission') then
		if player:getLevel() < 35 then
			npcHandler:say('Indeed there is something to be done, but I need someone more experienced. Come back later if you want to.', cid)
			addEvent(releasePlayer, 1000, cid)
			return true
		end

		if player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) == -1 then
			npcHandler:say({
				'Indeed, there is something you can do for me. You must know I am researching for a new spell against the undead. ...',
				'To achieve that I need a desecrated bone. There is a cursed bone pit somewhere in the dungeons north of Thais where the dead never rest. ...',
				'Find that pit, dig for a well-preserved human skeleton and conserve a sample in a special container which you receive from me. Are you going to help me?'
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) == 1 then
			npcHandler:say({
				'The rotworms dug deep into the soil north of Thais. Rumours say that you can access a place of endless moaning from there. ...',
				'No one knows how old that common grave is but the people who died there are cursed and never come to rest. A bone from that pit would be perfect for my studies.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		elseif player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) == 2 then
			player:setStorageValue(Storage.TibiaTales.IntoTheBonePit, 3)
			if player:removeItem(4864, 1) then
				player:addItem(6300, 1)
				npcHandler:say('Excellent! Now I can try to put my theoretical thoughts into practice and find a cure for the symptoms of undead. Here, take this for your efforts.', cid)
			else
				npcHandler:say({
					'I am so glad you are still alive. Benjamin found the container with the bone sample inside. Fortunately, I inscribe everything with my name, so he knew it was mine. ...',
					'I thought you have been haunted and killed by the undead. I\'m glad that this is not the case. Thank you for your help.'
				}, cid)
			end
			addEvent(releasePlayer, 1000, cid)
		else
			npcHandler:say('I am very glad you helped me, but I am very busy at the moment.', cid)
			addEvent(releasePlayer, 1000, cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(4863, 1)
			player:setStorageValue(Storage.TibiaTales.IntoTheBonePit, 1)
			npcHandler:say({
				'Great! Here is the container for the bone. Once, I used it to collect ectoplasma of ghosts, but it will work here as well. ...',
				'If you lose it, you can buy a new one from the explorer\'s society in North Port or Port Hope. Ask me about the mission when you come back.'
			}, cid)
			addEvent(releasePlayer, 1000, cid)
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Ohh, then I need to find another adventurer who wants to earn a great reward. Bye!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Greetings, |PLAYERNAME|! Looking for wisdom and power, eh?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
