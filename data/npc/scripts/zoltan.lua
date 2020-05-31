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
keywordHandler:addSpellKeyword({"mass healing"},
	{
		npcHandler = npcHandler,
		spellName = "Mass Healing",
		price = 2200,
		level = 36,
		vocation = {VOCATION.CLIENT_ID.DRUID}
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
keywordHandler:addSpellKeyword({"wrath of nature"},
	{
		npcHandler = npcHandler,
		spellName = "Wrath of Nature",
		price = 6000,
		level = 55,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"rage of the skies"},
	{
		npcHandler = npcHandler,
		spellName = "Rage of the Skies",
		price = 6000,
		level = 55,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"protector"},
	{
		npcHandler = npcHandler,
		spellName = "Protector",
		price = 6000,
		level = 55,
		vocation = {VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"swift foot"},
	{
		npcHandler = npcHandler,
		spellName = "Swift Foot",
		price = 6000,
		level = 55,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"eternal winter"},
	{
		npcHandler = npcHandler,
		spellName = "Eternal Winter",
		price = 8000,
		level = 60,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"hell's core"},
	{
		npcHandler = npcHandler,
		spellName = "Hell's Core",
		price = 8000,
		level = 60,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"blood rage"},
	{
		npcHandler = npcHandler,
		spellName = "Blood Rage",
		price = 8000,
		level = 60,
		vocation = {VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"sharpshooter"},
	{
		npcHandler = npcHandler,
		spellName = "Sharpshooter",
		price = 8000,
		level = 60,
		vocation = {VOCATION.CLIENT_ID.PALADIN}
	}
)
keywordHandler:addSpellKeyword({"fierce berserk"},
	{
		npcHandler = npcHandler,
		spellName = "Fierce Berserk",
		price = 7500,
		level = 90,
		vocation = {VOCATION.CLIENT_ID.KNIGHT}
	}
)
keywordHandler:addSpellKeyword({"ultimate terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Terra Strike",
		price = 15000,
		level = 90,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ultimate flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Flame Strike",
		price = 15000,
		level = 90,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
	}
)
keywordHandler:addSpellKeyword({"ultimate ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Ice Strike",
		price = 15000,
		level = 100,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"ultimate energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Energy Strike",
		price = 15000,
		level = 100,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
-- RUNES SPELLS
keywordHandler:addSpellKeyword({"energy bomb rune"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Bomb Rune",
		price = 2300,
		level = 37,
		vocation = {VOCATION.CLIENT_ID.SORCERER}
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
		text = "In this category I have '{mass healing}'."
	}
)
keywordHandler:addKeyword({"specials spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{divine caldera}', '{wrath of nature}', '{rage of the skies}', '{protector}', '{swift foot}', \z
		'{eternal winter}', '{hell's core}', '{blood rage}', '{sharpshootere}', '{fierce berserk}', '{ultimate terra strike}', \z
		'{ultimate flame strike}', '{ultimate ice strike}', '{ultimate energy strike}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poison field rune}' and '{paralyse rune}'."
	}
)
keywordHandler:addKeyword({"spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I can teach you {healing spells}, {specials spells} and {runes}. \z
		What kind of spell do you wish to learn?"
	}
)

-- Female Summoner and Male Mage Hat Addon (needs to be rewritten)
local hatKeyword = keywordHandler:addKeyword({'proof'}, StdModule.say, {npcHandler = npcHandler, text = '... I cannot believe my eyes. You retrieved this hat from Ferumbras\' remains? That is incredible. If you give it to me, I will grant you the right to wear this hat as addon. What do you say?'},
		function(player) return not player:hasOutfit(player:getSex() == PLAYERSEX_FEMALE and 141 or 130, 2) end
	)
	hatKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry you don\'t have the Ferumbras\' hat.'}, function(player) return player:getItemCount(5903) == 0 end)
	hatKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'I bow to you, player, and hereby grant you the right to wear Ferumbras\' hat as accessory. Congratulations!'}, nil,
		function(player)
			player:removeItem(5903, 1)
			player:addOutfitAddon(141, 2)
			player:addOutfitAddon(130, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	)
	-- hatKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = ''})

keywordHandler:addKeyword({'myra'}, StdModule.say, {npcHandler = npcHandler,
	text = {
		'Bah, I know. I received some sort of \'nomination\' from our outpost in Port Hope. ...',
		'Usually it takes a little more than that for an award though. However, I honour Myra\'s word. ...',
		'I hereby grant you the right to wear a special sign of honour, acknowledged by the academy of Edron. Since you are a man, I guess you don\'t want girlish stuff. There you go.'
	}},
	function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) == 10 end,
	function(player)
		player:addOutfitAddon(138, 2)
		player:addOutfitAddon(133, 2)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak, 11)
		player:setStorageValue(Storage.OutfitQuest.MageSummoner.MissionHatCloak, 0)
		player:setStorageValue(Storage.OutfitQuest.Ref, math.min(0, player:getStorageValue(Storage.OutfitQuest.Ref) - 1))
	end
)

keywordHandler:addKeyword({'myra'}, StdModule.say, {npcHandler = npcHandler, text = 'Stop bothering me. I am a far too busy man to be constantly giving out awards.'}, function(player) return player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonHatCloak) == 11 end)
keywordHandler:addKeyword({'myra'}, StdModule.say, {npcHandler = npcHandler, text = 'What the hell are you talking about?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|, student of the arcane arts.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, and don\'t come back too soon.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, and don\'t come back too soon.')

npcHandler:addModule(FocusModule:new())
