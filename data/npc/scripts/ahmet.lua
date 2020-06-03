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
	{ text = 'Have a look at the largest sortiment of general goods in town.' }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({"closed trap"}, 2578, 75, 1)
shopModule:addSellableItem({"crowbar"}, 2416, 50, 1)
shopModule:addSellableItem({"fishing rod"}, 2580, 40, 1)
shopModule:addSellableItem({"machete"}, 2420, 6, 1)
shopModule:addSellableItem({"pick"}, 2553, 15, 1)
shopModule:addSellableItem({"rope"}, 2120, 15, 1)
shopModule:addSellableItem({"scythe"}, 2550, 10, 1)
shopModule:addSellableItem({"shovel"}, 2554, 8, 1)
shopModule:addSellableItem({"watch"}, 2036, 6, 1)

shopModule:addBuyableItem({"basket"}, 1989, 6, 1)
shopModule:addBuyableItem({"bottle"}, 2007, 3, 1)
shopModule:addBuyableItem({"bucket"}, 2005, 4, 1)
shopModule:addBuyableItem({"candelabrum"}, 2042, 8, 1)
shopModule:addBuyableItem({"candlestick"}, 2047, 2, 1)
shopModule:addBuyableItem({"closed trap"}, 2578, 280, 1)
shopModule:addBuyableItem({"crowbar"}, 2416, 260, 1)
shopModule:addBuyableItem({"cup"}, 2013, 2, 1)
shopModule:addBuyableItem({"deed of ownership"}, 8694, 1000, 1)
shopModule:addBuyableItem({"document"}, 1952, 12, 1)
shopModule:addBuyableItem({"fishing rod"}, 2580, 150, 1)
shopModule:addBuyableItem({"golden backpack"}, 2004, 10, 1)
shopModule:addBuyableItem({"golden bag"}, 1997, 4, 1)
shopModule:addBuyableItem({"hand auger"}, 36169, 25, 1)
shopModule:addBuyableItem({"machete"}, 2420, 35, 1)
shopModule:addBuyableItem({"net"}, 36324, 50, 1)
shopModule:addBuyableItem({"parchment"}, 1951, 8, 1)
shopModule:addBuyableItem({"pick"}, 2553, 50, 1)
shopModule:addBuyableItem({"plate"}, 2035, 6, 1)
shopModule:addBuyableItem({"present"}, 1990, 10, 1)
shopModule:addBuyableItem({"rope"}, 2120, 50, 1)
shopModule:addBuyableItem({"scroll"}, 1949, 5, 1)
shopModule:addBuyableItem({"scythe"}, 2550, 50, 1)
shopModule:addBuyableItem({"shovel"}, 2554, 50, 1)
shopModule:addBuyableItem({"torch"}, 2050, 2, 1)
shopModule:addBuyableItem({"watch"}, 2036, 20, 1)
shopModule:addBuyableItem({"vial of water"}, 2006, 40, 1, 1)
shopModule:addBuyableItem({"worm"}, 3976, 1, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, 'documents') then
		if player:getStorageValue(Storage.thievesGuild.Mission04) == 2 then
			player:setStorageValue(Storage.thievesGuild.Mission04, 3)
			npcHandler:say({
				'You need some forged documents? But I will only forge something for a friend. ...',
				'The nomads at the northern oasis killed someone dear to me. Go and kill at least one \z
				of them, then we talk about your document.'
			}, cid)
		elseif player:getStorageValue(Storage.thievesGuild.Mission04) == 4 then
			npcHandler:say('The slayer of my enemies is my friend! For a mere 1000 gold I will create \z
			the documents you need. Are you interested?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, 'mission') or msgcontains(msg, 'quest') then
		if player:getStorageValue(Storage.QuestChests.StealFromThieves) < 1 then
			npcHandler:say({
				"What are you talking about?? I was robbed!!!! Someone catch those filthy thieves\z
				!!!!! GUARDS! ...",
				"<nothing happens>....<SIGH> Like usual, they hide at the slightest sign of trouble! \z
				YOU! Want to earn some quick money?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(Storage.QuestChests.StealFromThieves) == 1 or 
		player:getStorageValue(Storage.QuestChests.StealFromThieves) == 2 then
			npcHandler:say('Did you find my stuff?', cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:removeMoneyNpc(1000) then
				player:addItem(8694, 1)
				player:setStorageValue(Storage.thievesGuild.Mission04, 5)
				npcHandler:say('And here they are! Now forget where you got them from.', cid)
			else
				npcHandler:say('You don\'t have enough money.', cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say({
				"Of course you do! Go hunt down the thieves and bring back the stuff they have stolen from me. ...",
				" I saw them running out of town and then to the north. Maybe they hide at the oasis."
			}, cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.QuestChests.StealFromThieves, 1)
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(7587, 1) then
				npcHandler:say('GREAT! If you ever need a job as my personal security guard, let me know. \z
				Here is the reward I promised you.', cid)
				player:setStorageValue(Storage.QuestChests.StealFromThieves, 3)
				player:addItem(2148, 100)
				player:addItem(2789, 100)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('Come back when you find my stuff.', cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'offer'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My inventory of general goods and is large, ask me for a trade to take a look."
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am the mourned Ahmet."
    }
)
keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Are you interested in being my private security slave ...er...officer?"
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "It would be foolish of me to tell you the time as you won't buy a watch then."
	}
)
keywordHandler:addKeyword({'carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The vain cities of the Tibian continent think they are at the centre of the universe. \z
		Little do they know about the wisdom of the Pharaoh."
	}
)
keywordHandler:addKeyword({'kazordoon'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We rarely see a traveller of the small folk here."
	}
)
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Elves are a rare sight in our lands."
	}
)
keywordHandler:addKeyword({'tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The world is nothing but a sigil of death, a monument of decay. \z
		We have to attune to death to become one with the world."
	}
)
keywordHandler:addKeyword({'darashia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The foolishness of their ways will eventually spell their doom."
	}
)
keywordHandler:addKeyword({'darama'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Life here is harsh, but only this way can we deny the temptations that might \z
		damage our Rah and our Uthun to our traitorous flesh."
	}
)
keywordHandler:addKeyword({'mission'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm glad I don't require the help of anyone else than......ME."
	}
)
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Our city will endure the sands of the desert and the grinding teeth of time."
	}
)
keywordHandler:addKeyword({'Rah'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The Rah could be called our soul."
	}
)
keywordHandler:addKeyword({'Uthun'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The Uthun is that what we learn and remember."
	}
)
keywordHandler:addKeyword({'pharaoh'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Blessed be the Pharaoh. He is our saviour. I hope that I will be chosen one day."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "Be mourned pilgrim in flesh. I'm selling general goods.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "May enlightenment be your path, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my offers.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
