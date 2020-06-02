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
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"light healing"},
	{
		npcHandler = npcHandler,
		spellName = "Light Healing",
		price = 0,
		level = 8,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"find person"},
	{
		npcHandler = npcHandler,
		spellName = "Find Person",
		price = 80,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"wound cleansing"},
	{
		npcHandler = npcHandler,
		spellName = "Wound Cleansing",
		price = 0,
		level = 8,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"magic rope"},
	{
		npcHandler = npcHandler,
		spellName = "Magic Rope",
		price = 200,
		level = 9,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"cure poison"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Poison",
		price = 150,
		level = 10,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"conjure arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Arrow",
		price = 450,
		level = 13,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"great light"},
	{
		npcHandler = npcHandler,
		spellName = "Great Light",
		price = 500,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
		level = 14,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"conjure poisoned arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Poisoned Arrow",
		price = 700,
		level = 16,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"brutal strike"},
	{
		npcHandler = npcHandler,
		spellName = "Brutal Strike",
		price = 1000,
		level = 16,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"conjure bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Bolt",
		price = 750,
		level = 17,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"intense healing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Healing",
		price = 350,
		level = 20,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"ethereal spear"},
	{
		npcHandler = npcHandler,
		spellName = "Ethereal Spear",
		price = 1100,
		level = 23,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"conjure sniper arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Sniper Arrow",
		price = 800,
		level = 24,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"conjure explosive arrow"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Explosive Arrow",
		price = 1000,
		level = 25,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
keywordHandler:addSpellKeyword({"cancel invisibility"},
	{
		npcHandler = npcHandler,
		spellName = "Cancel Invisibility",
		price = 1600,
		level = 26,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"whirlwind throw"},
	{
		npcHandler = npcHandler,
		spellName = "Whirlwind Throw",
		price = 1500,
		level = 28,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"conjure piercing bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Piercing Bolt",
		price = 850,
		level = 33,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
keywordHandler:addSpellKeyword({"divine healing"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Healing",
		price = 3000,
		level = 35,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
keywordHandler:addSpellKeyword({"divine missile"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Missile",
		price = 1800,
		level = 40,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"inflict wound"},
	{
		npcHandler = npcHandler,
		spellName = "Inflict Wound",
		price = 2500,
		level = 40,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"enchant spear"},
	{
		npcHandler = npcHandler,
		spellName = "Enchant Spear",
		price = 2000,
		level = 45,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"cure bleeding"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Bleeding",
		price = 2500,
		level = 45,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"divine caldera"},
	{
		npcHandler = npcHandler,
		spellName = "Divine Caldera",
		price = 3000,
		level = 50,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"recovery"},
	{
		npcHandler = npcHandler,
		spellName = "Recovery",
		price = 4000,
		level = 50,
		vocation = {VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"conjure power bolt"},
	{
		npcHandler = npcHandler,
		spellName = "Conjure Power Bolt",
		price = 2000,
		level = 59,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"salvation"},
	{
		npcHandler = npcHandler,
		spellName = "Salvation",
		price = 8000,
		level = 60,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"holy flash"},
	{
		npcHandler = npcHandler,
		spellName = "Holy Flash",
		price = 7500,
		level = 70,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"front sweep"},
	{
		npcHandler = npcHandler,
		spellName = "Front Sweep",
		price = 4000,
		level = 70,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"cure curse"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Curse",
		price = 6000,
		level = 80,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"intense wound cleansing"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Wound Cleansing",
		price = 6000,
		level = 80,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"strong ethereal spear"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ethereal Spear",
		price = 10000,
		level = 90,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"fierce berserk"},
	{
		npcHandler = npcHandler,
		spellName = "Fierce Berserk",
		price = 7500,
		level = 90,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
keywordHandler:addSpellKeyword({"intense recovery"},
	{
		npcHandler = npcHandler,
		spellName = "Intense Recovery",
		price = 10000,
		level = 100,
		vocation = VOCATION.CLIENT_ID.PALADIN
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
keywordHandler:addSpellKeyword({"summon emberwing"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Emberwing",
		price = 50000,
		level = 200,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"summon skullfrost"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Skullfrost",
		price = 50000,
		level = 200,
		vocation = VOCATION.CLIENT_ID.KNIGHT
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"destroy field rune"},
	{
		npcHandler = npcHandler,
		spellName = "Destroy Field Rune",
		price = 700,
		level = 17,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"disintegrate rune"},
	{
		npcHandler = npcHandler,
		spellName = "Disintegrate Rune",
		price = 900,
		level = 21,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)
keywordHandler:addSpellKeyword({"holy missile rune"},
	{
		npcHandler = npcHandler,
		spellName = "Holy Missile Rune",
		price = 1600,
		level = 27,
		vocation = VOCATION.CLIENT_ID.PALADIN
	}
)

keywordHandler:addKeyword({"healing spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{light healing}', '{wound cleansing}', '{cure poison}', '{intense healing}', '{divine healing}', '{cure bleeding}', \z
		'{recovery}', '{salvation}', '{cure curse}', '{intense wound cleansing}' and '{intense recovery}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{light}', '{magic rope}', '{levitate}', '{great light}', '{conjure arrow}', '{haste}', \z
		'{conjure poisoned arrow}', '{conjure bolt}', '{conjure sniper arrow}', '{conjure explosive arrow}', '{charge}' \z
		'{cancel invisibility}', '{conjure piercing bolt}', '{enchant spear}', '{conjure power bolt}', '{summon emberwing}' and '{summon skullfrost}'."
		
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{brutal strike}', '{ethereal spear}', '{whirlwind throw}', '{groundshaker}', '{berserk}', \z
		'{divine missile}', '{inflict wound}', '{divine caldera}', '{holy flash}, '{front sweep}', '{fierce berserk}', \z
		'{strong ethereal spear}' and '{annihilation}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{destroy field rune}', '{disintegrate rune}' and '{holy missile rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {support spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

local message = {}

local config = {
	['ape fur'] = {
		itemId = 5883,
		count = 100,
		storageValue = 1,
		text = {
			'Have you really managed to fulfil the task and brought me 100 pieces of ape fur?',
			'Only ape fur is good enough to touch the feet of our Caliph.',
			'Ahhh, this softness! I\'m impressed, |PLAYERNAME|. You\'re on the best way to earn that turban. Now, please retrieve 100 fish fins.'
		}
	},
	['fish fins'] = {
		itemId = 5895,
		count = 100,
		storageValue = 2,
		text = {
			'Were you able to discover the undersea race and retrieved 100 fish fins?',
			'I really wonder what the explorer society is up to. Actually I have no idea how they managed to dive unterwater.',
			'I never thought you\'d make it, |PLAYERNAME|. Now we only need two enchanted chicken wings to start our waterwalking test!'
		}
	},
	['enchanted chicken wings'] = {
		itemId = 5891,
		count = 2,
		storageValue = 3,
		text = {
			'Were you able to get hold of two enchanted chicken wings?',
			'Enchanted chicken wings are actually used to make boots of haste, so they could be magically extracted again. Djinns are said to be good at that.',
			'Great, thank you very much. Just bring me 100 pieces of blue cloth now and I will happily show you how to make a turban.'
		}
	},
	['blue cloth'] = {
		itemId = 5912,
		count = 100,
		storageValue = 4,
		text = {
			'Ah, have you brought the 100 pieces of blue cloth?',
			'It\'s a great material for turbans.',
			'Ah! Congratulations - even if you are not a true weaponmaster, you surely deserve to wear this turban. Here, I\'ll tie it for you.'
		}
	}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'outfit') then
		npcHandler:say(player:getSex() == PLAYERSEX_FEMALE and 'My turban? I know something better for a pretty girl like you. Why don\'t you go talk to Miraia?' or 'My turban? Eh no, you can\'t have it. Only oriental weaponmasters may wear it after having completed a difficult task.', cid)
	elseif msgcontains(msg, 'task') then
		if player:getSex() == PLAYERSEX_FEMALE then
			npcHandler:say('I really don\'t want to make girls work for me. If you are looking for a job, ask Miraia.', cid)
			return true
		end

		if player:getStorageValue(Storage.OutfitQuest.secondOrientalAddon) < 1 then
			npcHandler:say('You mean, you would like to prove that you deserve to wear such a turban?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif config[msg] and npcHandler.topic[cid] == 0 then
		if player:getStorageValue(Storage.OutfitQuest.secondOrientalAddon) == config[msg].storageValue then
			npcHandler:say(config[msg].text[1], cid)
			npcHandler.topic[cid] = 3
			message[cid] = msg
		else
			npcHandler:say(config[msg].text[2], cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				'Alright, then listen to the following requirements. We are currently in dire need of ape fur since the Caliph has requested a new bathroom carpet. ...',
				'Thus, please bring me 100 pieces of ape fur. Secondly, it came to our ears that the explorer society has discovered a new undersea race of fishmen. ...',
				'Their fins are said to allow humans to walk on water! Please bring us 100 of these fish fin. ...',
				'Third, if the plan of walking on water should fail, we need enchanted chicken wings to prevent the testers from drowning. Please bring me two. ...',
				'Last but not least, just drop by with 100 pieces of blue cloth and I will happily show you how to make a turban. ...',
				'Did you understand everything I told you and are willing to handle this task?'
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.OutfitQuest.DefaultStart) ~= 1 then
				player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1)
			end
			player:setStorageValue(Storage.OutfitQuest.secondOrientalAddon, 1)
			npcHandler:say('Excellent! Come back to me once you have collected 100 pieces of ape fur.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			local targetMessage = config[message[cid]]
			if not player:removeItem(targetMessage.itemId, targetMessage.count) then
				npcHandler:say('That is a shameless lie.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.OutfitQuest.secondOrientalAddon, player:getStorageValue(Storage.OutfitQuest.secondOrientalAddon) + 1)
			if player:getStorageValue(Storage.OutfitQuest.secondOrientalAddon) == 5 then
				player:addOutfitAddon(146, 2)
				player:addOutfitAddon(150, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
			npcHandler:say(targetMessage.text[3], cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] ~= 0 then
		npcHandler:say('What a pity.', cid)
		npcHandler.topic[cid] = 0
	end

	return true
end

local function onReleaseFocus(cid)
	message[cid] = nil
end

npcHandler:setMessage(MESSAGE_GREET, 'Greetings |PLAYERNAME|. What leads you to me?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Daraman\'s blessings.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())
