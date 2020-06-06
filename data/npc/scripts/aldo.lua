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
	{ text = 'Grmbl.' }
}

-- NPC shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({"brass helmet"}, 2460, 120, 1)
shopModule:addBuyableItem({"brass legs"}, 2478, 195, 1)
shopModule:addBuyableItem({"chain helmet"}, 2458, 52, 1)
shopModule:addBuyableItem({"chain legs"}, 2648, 80, 1)
shopModule:addBuyableItem({"iron helmet"}, 2459, 390, 1)
shopModule:addBuyableItem({"leather boots"}, 2643, 10, 1)
shopModule:addBuyableItem({"leather helmet"}, 2461, 12, 1)
shopModule:addBuyableItem({"leather legs"}, 2649, 10, 1)
shopModule:addBuyableItem({"sandals"}, 2642, 2, 1)
shopModule:addBuyableItem({"soldier helmet"}, 2481, 110, 1)
shopModule:addBuyableItem({"steel helmet"}, 2457, 580, 1)
shopModule:addBuyableItem({"studded helmet"}, 2482, 63, 1)
shopModule:addBuyableItem({"studded legs"}, 2468, 50, 1)
shopModule:addBuyableItem({"viking helmet"}, 2473, 265, 1)

shopModule:addSellableItem({"brass helmet"}, 2460, 30, 1)
shopModule:addSellableItem({"brass legs"}, 2478, 49, 1)
shopModule:addSellableItem({"chain helmet"}, 2458, 17, 1)
shopModule:addSellableItem({"chain legs"}, 2648, 25, 1)
shopModule:addSellableItem({"iron helmet"}, 2459, 150, 1)
shopModule:addSellableItem({"leather boots"}, 2643, 2, 1)
shopModule:addSellableItem({"leather helmet"}, 2461, 4, 1)
shopModule:addSellableItem({"leather legs"}, 2649, 9, 1)
shopModule:addSellableItem({"legion helmet"}, 2480, 22, 1)
shopModule:addSellableItem({"plate legs"}, 2647, 115, 1)
shopModule:addSellableItem({"small axe"}, 2559, 5, 1)
shopModule:addSellableItem({"soldier helmet"}, 2481, 16, 1)
shopModule:addSellableItem({"steel helmet"}, 2457, 293, 1)
shopModule:addSellableItem({"studded helmet"}, 2482, 20, 1)
shopModule:addSellableItem({"studded legs"}, 2468, 15, 1)
shopModule:addSellableItem({"viking helmet"}, 2473, 66, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"soft boots", "repair", "soft", "boots"}, msg) then
		npcHandler:say("Do you want to repair your worn soft boots for 10000 gold coins?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 0
		if player:getItemCount(10021) == 0 then
			npcHandler:say("Sorry, you don't have the item.", cid)
			return true
		end

		if not player:removeMoneyNpc(10000) then
			npcHandler:say("Sorry, you don't have enough gold.", cid)
			return true
		end

		player:removeItem(10021, 1)
		player:addItem(6132, 1)
		npcHandler:say("Here you are.", cid)
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 0
		npcHandler:say("Ok then.", cid)


	end

	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I am a salesman, I sell headgear ... uhm ... oh well, and shoes."
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm Aldo. No one calls me 'lucky Aldo' though, guess why!"
	}
)
keywordHandler:addKeyword({'time'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Is it time for lunch already? Hey, stop making fun of me!"
	}
)
keywordHandler:addKeyword({'king'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "One day I will sell the king a pair of shoes made by me and will get out of that \z
		stinky hole I live in and my family will never find me. HE, HE!"
	}
)
keywordHandler:addKeyword({'Tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I doubt I will ever see much of it. It's like i am cursed to haunt this site here for \z
		the rest of my life."
	}
)
keywordHandler:addKeyword({'army'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "So many feet ... so many ... a nightmare!"
	}
)
keywordHandler:addKeyword({'amazons'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I heard that these chicks wear some revealing pieces of armor!!"
	}
)
keywordHandler:addKeyword({'Ferumbras'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Can't be worse than my wife."
	}
)
keywordHandler:addKeyword({'wife'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Leave me alone with her at least while I'm working. To be away from her is my only pleasure here!"
	}
)
keywordHandler:addKeyword({'Excalibug'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I have other stuff to worry about, like paying my bills."
	}
)
keywordHandler:addKeyword({'bills'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Yes, I have to pay a lot of bills."
	}
)
keywordHandler:addKeyword({'Carlin'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "A city ruled by women!? Could anything be worse?"
	}
)
keywordHandler:addKeyword({'Thais'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I will never in my life make it there."
	}
)
keywordHandler:addKeyword({'Hugo'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "He's my boss, an evil slaver of good people like me."
	}
)
keywordHandler:addKeyword({'shoes'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I'm damned to sell headgear, trousers, and shoes for the rest of my life *sigh*. \z
		Let's get over with this trade."
	}
)
keywordHandler:addKeyword({'sigh'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I never wanted to get married, I am married. I never wanted kids, I have 2 of them. \z
		Why the hell am I here?"
	}
)
keywordHandler:addKeyword({'kids'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "We've got two. At least I think so. We haven't had any new kids in the last 10 years. \z
		I must be doing something right."
	}
)
keywordHandler:addKeyword({'here'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I work in a shoe shop, and still I'm not happy to come home."
	}
)

npcHandler:setMessage(MESSAGE_GREET, "CJust great, another ... 'customer'. Hello, |PLAYERNAME|. \z
If you want to trade, let's get it over with.")
npcHandler:setMessage(MESSAGE_FAREWELL, "That's music in my ears.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yeah, get lost.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yeah, buy something.")

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
