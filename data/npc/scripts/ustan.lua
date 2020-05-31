
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

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
shopModule:addBuyableItem({"bear paw"}, 5896, 100, 1)
shopModule:addBuyableItem({"wolf paw"}, 5897, 70, 1)
shopModule:addBuyableItem({"wolf tooth chain"}, 2129, 100, 1)

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
keywordHandler:addSpellKeyword({"energy strike"},
	{
		npcHandler = npcHandler,
		spellName = "Energy Strike",
		price = 800,
		level = 12,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"levitate"},
	{
		npcHandler = npcHandler,
		spellName = "Levitate",
		price = 500,
		level = 12,
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
keywordHandler:addSpellKeyword({"terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Terra Strike",
		price = 800,
		level = 13,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"flame strike"},
	{
		npcHandler = npcHandler,
		spellName = "Flame Strike",
		price = 800,
		level = 14,
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
keywordHandler:addSpellKeyword({"haste"},
	{
		npcHandler = npcHandler,
		spellName = "Haste",
		price = 600,
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
keywordHandler:addSpellKeyword({"ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Ice Strike",
		price = 800,
		level = 15,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"physical strike"},
	{
		npcHandler = npcHandler,
		spellName = "Physical Strike",
		price = 800,
		level = 16,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"heal friend"},
	{
		npcHandler = npcHandler,
		spellName = "Heal Friend",
		price = 800,
		level = 18,
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
keywordHandler:addSpellKeyword({"strong haste"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Haste",
		price = 1300,
		level = 20,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"cure electrification"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Electrification",
		price = 1000,
		level = 22,
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
keywordHandler:addSpellKeyword({"ultimate light"},
	{
		npcHandler = npcHandler,
		spellName = "Ultimate Light",
		price = 1600,
		level = 26,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"cure burning"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Burning",
		price = 2000,
		level = 30,
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
keywordHandler:addSpellKeyword({"mass healing"},
	{
		npcHandler = npcHandler,
		spellName = "Mass Healing",
		price = 2200,
		level = 36,
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
keywordHandler:addSpellKeyword({"strong ice wave"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ice Wave",
		price = 7500,
		level = 40,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"cure bleeding"},
	{
		npcHandler = npcHandler,
		spellName = "Cure Bleeding",
		price = 2500,
		level = 45,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"envenom"},
	{
		npcHandler = npcHandler,
		spellName = "Envenom",
		price = 6000,
		level = 50,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"strong terra strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Terra Strike",
		price =6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"strong ice strike"},
	{
		npcHandler = npcHandler,
		spellName = "Strong Ice Strike",
		price = 6000,
		level = 70,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"summon grovebeast"},
	{
		npcHandler = npcHandler,
		spellName = "Summon Grovebeast",
		price = 50000,
		level = 200,
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
keywordHandler:addSpellKeyword({"animate dead rune"},
	{
		npcHandler = npcHandler,
		spellName = "Animate Dead Rune",
		price = 1200,
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
keywordHandler:addSpellKeyword({"icicle rune"},
	{
		npcHandler = npcHandler,
		spellName = "Icicle Rune",
		price = 1700,
		level = 28,
		vocation = {VOCATION.CLIENT_ID.DRUID}
	}
)
keywordHandler:addSpellKeyword({"stone shower rune"},
	{
		npcHandler = npcHandler,
		spellName = "Stone Shower Rune",
		price = 1100,
		level = 28,
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
		text = "In this category I have '{light healing}', '{heal friend}', '{cure poison}', '{cure electrification}', \z
		'{intense healing}', '{cure burning}', '{ultimate healing}', '{mass healing}' and '{cure bleeding}'."
	}
)
keywordHandler:addKeyword({"support spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{find person}', '{magic rope}', '{levitate}', '{light}', \z
		'{great light}', '{haste}', '{food}', '{magic shield}', '{strong haste}', '{creature illusion}', \z
		'{summon creature}', '{ultimate light}', '{invisible}', '{envenom}', '{summon grovebeast}'."
	}
)
keywordHandler:addKeyword({"attack spells"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{apprentice's strike}', '{energy strike}', '{terra strike}', '{flame strike}', '{ice strike}',\z
		'{physical strike}', '{ice wave}', '{terra wave}', '{strong ice wave}', '{strong terra strike}' and '{strong ice strike}'."
	}
)
keywordHandler:addKeyword({"runes"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "In this category I have '{poison field rune}', '{fire field rune}', '{light magic missile rune}', '{intense healing rune}', \z
		'{cure poison rune}', '{convince creature rune}', '{destroy field rune}', '{energy field rune}', '{disintegrate rune}',\z
		'{ultimate healing rune}', '{stalagmite rune}', '{poison bomb rune}', '{heavy magic missile rune}', '{fire bomb rune}', '{animate dead rune}', \z
		'{chameleon rune}', '{icicle rune}', '{stone shower rune}', '{poison wall rune}', '{avalanche rune}', '{explosion rune}', \z
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
		npcHandler:say("I had some cough syrup a while ago. It was stolen in an ape raid. I fear if you want more cough syrup you will have to buy it in the druids guild in carlin.", cid)
	elseif msgcontains(msg, "addon") then
		if player:getStorageValue(Storage.OutfitQuest.DruidBodyAddon) < 1 then
			npcHandler:say("Would you like to wear bear paws like I do? No problem, just bring me 50 bear paws and 50 wolf paws and I'll fit them on.", cid)
			player:setStorageValue(Storage.OutfitQuest.DruidBodyAddon, 1)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "paws") or msgcontains(msg, "bear paws") then
		if player:getStorageValue(Storage.OutfitQuest.DruidBodyAddon) == 1 then
			npcHandler:say("Have you brought 50 bear paws and 50 wolf paws?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(5896) >= 50 and player:getItemCount(5897) >= 50 then
				npcHandler:say("Excellent! Like promised, here are your bear paws. ", cid)
				player:removeItem(5896, 50)
				player:removeItem(5897, 50)
				player:setStorageValue(Storage.OutfitQuest.DruidBodyAddon, 2)
				player:addOutfitAddon(148, 1)
				player:addOutfitAddon(144, 1)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my house, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "I'm currently interested in these materials.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
