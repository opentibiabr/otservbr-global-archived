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
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"light"},
	{
		npcHandler = npcHandler,
		spellName = "Light",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.DRUID}
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
keywordHandler:addSpellKeyword({"magic shield"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Shield",
		price = 450,
		level = 14,
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
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"creature illusion"},
	{
		npcHandler = npcHandler,
		spellName = "Creature Illusion",
		price = 1000,
		level = 23,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"summon creature"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Creature",
		price = 2000,
		level = 25,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ultimate healing"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing",
		price = 1000,
		level = 30,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"invisible"},
	{
		npcHandler = npcHandler,
		spellName = "Invisible",
		price = 2000,
		level = 35,
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
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"poison field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Field Rune",
		price = 300,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"fire field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Field Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"light magic missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Light Magic Missile Rune",
		price = 500,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"intense healing rune"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing Rune",
		price = 600,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"cure poison rune"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison Rune",
		price = 600,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"convince creature rune"},
	{
		npcHandler = npcHandler,
		spellName = "Convince Creature Rune",
		price = 800,
		level = 16,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"energy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 18,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"disintegrate rune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ultimate healing rune"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Healing Rune",
		price = 1500,
		level = 24,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"stalagmite rune"},
	{
		npcHandler = npcHandler,
		spellName = "stalagmite rune",
		price = 1400,
		level = 24,
		vocation = {VOCATION.CLIENT_ID.DRUID}
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
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"fire bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "fire bomb rune",
		price = 1500,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"chameleon rune"},
	{
		npcHandler = npcHandler,
		spellName = "Chameleon Rune",
		price = 1300,
		level = 27,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"poison wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Poison Wall Rune",
		price = 1600,
		level = 29,
		vocation = {VOCATION.CLIENT_ID.DRUID}
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
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"fire wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Fire Wall Rune",
		price = 2000,
		level = 33,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"energy wall rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Wall Rune",
		price = 2500,
		level = 41,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"paralyse rune"},
	{
		npcHandler = npcHandler,
		spellName = "Paralyse Rune",
		price = 1900,
		level = 54,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{light healing}', '{cure poison}',	'{intense healing}', '{ultimate healing}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{magic rope}', '{light}',	'{great light}', '{food}', \z
		'{magic shield}', '{creature illusion}', '{summon creature}', '{ultimate light}', '{invisible}'."
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprentice's strike}', '{ice wave}', '{terra wave}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poison field rune}', '{fire field rune}', '{light magic missile rune}', '{intense healing rune}', \z
		'{cure poison rune}', '{convince creature rune}', '{destroy field rune}', '{energy field rune}', '{disintegrate rune}',\z
		'{ultimate healing rune}', '{stalagmite rune}', '{poison bomb rune}', '{heavy magic missile rune}', '{fire bomb rune}', \z
		'{chameleon rune}', '{poison wall rune}', '{avalanche rune}', '{explosion rune}', \z
		'{fire wall rune}', '{energy wall rune}' and '{paralyse rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells}, {attack spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "cough syrup") then
		npcHandler:say("Do you want to buy a bottle of cough syrup for 50 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'mission') then
		if player:getStorageValue(Storage.TibiaTales.TheExterminator) == -1 then
			npcHandler:say({
				'Oh |PLAYERNAME|, thank god you came to me. Last night, I had a vision about an upcoming plague here in Carlin. ...',
				'It will originate from slimes that will swarm out of the sewers and infect every citizen with a deadly disease. Are you willing to help me save Carlin?'
			}, cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(Storage.TibiaTales.TheExterminator) == 1 then
			npcHandler:say('You MUST find that slime pool immediately or life here in Carlin will not be the same anymore.', cid)
		elseif player:getStorageValue(Storage.TibiaTales.TheExterminator) == 2 then
			local itemId = {2150, 2149, 2147, 2146}
			for i = 1, #itemId do
				player:addItem(itemId[i], 1)
			end
			player:setStorageValue(Storage.TibiaTales.TheExterminator, 3)
			npcHandler:say('You did it! Even if only few of the Carliners will ever know about that, you saved all of their lives. Here, take this as a reward. Farewell!', cid)
		else
			npcHandler:say('Maybe the guards have something to do for you or know someone who could need some help.', cid)
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if not player:removeMoneyNpc(50) then
				npcHandler:say("You don't have enough money.", cid)
				return true
			end

			npcHandler:say("Thank you. Here it is.", cid)
			player:addItem(4839, 1)
		elseif npcHandler.topic[cid] == 2 then
			player:addItem(8205, 1)
			player:setStorageValue(Storage.TibiaTales.TheExterminator, 1)
			npcHandler:say({
				'I knew I could count on you. Take this highly intensified vermin poison. In my vision, I saw some kind of \'pool\' where these slimes came from. ...',
				'Pour the poison in the water to stop the demise of Carlin. Tell me about your mission after you fulfilled your task.'
			}, cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Then the downfall of Carlin is inescapable. Please think about it. You know where to find me.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the grand druid of Carlin. I am responsible for the guild, the fields, and our citizens' health."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "Every druid is able to learn the numerous spells of our craft."})
--keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't teach spells for your vocation."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Padreia, grand druid of our fine city."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time is just a crystal pillar - the centre of creation and life."})
keywordHandler:addKeyword({'druids'}, StdModule.say, {npcHandler = npcHandler, text = "We are druids, preservers of life. Our magic is about defence, healing, and nature."})
keywordHandler:addKeyword({'sorcerers'}, StdModule.say, {npcHandler = npcHandler, text = "Sorcerers are destructive. Their power lies in destruction and pain."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to our humble guild, wanderer. May I be of any assistance to you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
