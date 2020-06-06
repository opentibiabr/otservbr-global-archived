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

shopModule:addBuyableItem({"ancient shield"}, 2535, 5000, 1)
shopModule:addBuyableItem({"dark armor"}, 2489, 1500, 1)
shopModule:addBuyableItem({"dark helmet"}, 2490, 1000, 1)
shopModule:addBuyableItem({"ice rapier"}, 2396, 5000, 1)
shopModule:addBuyableItem({"serpent sword"}, 2409, 6000, 1)

shopModule:addSellableItem({"ancient shield"}, 2535, 900, 1)
shopModule:addSellableItem({"black shield"}, 2529, 800, 1)
shopModule:addSellableItem({"bonebreaker"}, 7428, 10000, 1)
shopModule:addSellableItem({"dark armor"}, 2489, 400, 1)
shopModule:addSellableItem({"dark helmet"}, 2490, 250, 1)
shopModule:addSellableItem({"dragon hammer"}, 2434, 2000, 1)
shopModule:addSellableItem({"dreaded cleaver"}, 7419, 15000, 1)
shopModule:addSellableItem({"earth knight axe"}, 7860, 2000, 1)
shopModule:addSellableItem({"energy knight axe"}, 7875, 2000, 1)
shopModule:addSellableItem({"fiery knight axe"}, 7750, 2000, 1)
shopModule:addSellableItem({"giant sword"}, 2393, 17000, 1)
shopModule:addSellableItem({"haunted blade"}, 7407, 8000, 1)
shopModule:addSellableItem({"icy knight axe"}, 7769, 2000, 1)
shopModule:addSellableItem({"knight armor"}, 2476, 5000, 1)
shopModule:addSellableItem({"knight axe"}, 2430, 2000, 1)
shopModule:addSellableItem({"knight legs"}, 2477, 5000, 1)
shopModule:addSellableItem({"mystic turban"}, 2663, 150, 1)
shopModule:addSellableItem({"onyx flail"}, 7421, 22000, 1)
shopModule:addSellableItem({"ornamented axe"}, 7411, 20000, 1)
shopModule:addSellableItem({"poison dagger"}, 2411, 50, 1)
shopModule:addSellableItem({"scimitar"}, 2419, 150, 1)
shopModule:addSellableItem({"serpent sword"}, 2409, 900, 1)
shopModule:addSellableItem({"skull staff"}, 2436, 6000, 1)
shopModule:addSellableItem({"strange helmet"}, 2479, 500, 1)
shopModule:addSellableItem({"titan axe"}, 7413, 4000, 1)
shopModule:addSellableItem({"tower shield"}, 2528, 8000, 1)
shopModule:addSellableItem({"vampire shield"}, 2534, 15000, 1)
shopModule:addSellableItem({"warrior helmet"}, 2475, 5000, 1)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local missionProgress = player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission02)
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission01) == 3 then
			if missionProgress < 1 then
				npcHandler:say({
					"So Baa'leal thinks you are up to do a mission for us? ...",
					"I think he is getting old, entrusting human scum such as you are with an \z
					important mission like that. ...",
					"Personally, I don't understand why you haven't been slaughtered right at the gates. ...",
					"Anyway. Are you prepared to embark on a dangerous mission for us?"
				}, cid)
				npcHandler.topic[cid] = 1

			elseif isInArray({1, 2}, missionProgress) then
				npcHandler:say("Did you find the tear of Daraman?", cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say("Don't forget to talk to Malor concerning your next mission.", cid)
			end
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			npcHandler:say({
				"All right then, human. Have you ever heard of the {'Tears of Daraman'}? ...",
				"They are precious gemstones made of some unknown blue mineral and \z
				possess enormous magical power. ...",
				"If you want to learn more about these gemstones don't forget to visit our library. ...",
				"Anyway, one of them is enough to create thousands of our mighty djinn blades. ...",
				"Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...",
				"To my knowledge there is only one place where you can find these gemstones - I know for a fact \z
				that the Marid have at least one of them. ...",
				"Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...",
				"Needless to say, the Marid won't be too eager to part with it. Try not to get killed until \z
				you have delivered the stone to me."
			}, cid)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 1)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToMaridTerritory, 1)

		elseif msgcontains(msg, "no") then
			npcHandler:say("Then not.", cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, "yes") then
			if player:getItemCount(2346) == 0 or missionProgress ~= 2 then
				npcHandler:say("As I expected. You haven't got the stone. Shall I explain your mission again?", cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say({
					"So you have made it? You have really managed to steal a Tear of Daraman? ...",
					"Amazing how you humans are just impossible to get rid of. Incidentally, you have this \z
					character trait in common with many insects and with other vermin. ...",
					"Nevermind. I hate to say it, but it you have done us a favour, human. \z
					That gemstone will serve us well. ...",
					"Baa'leal, wants you to talk to Malor concerning some new mission. ...",
					"Looks like you have managed to extended your life expectancy - for just a bit longer."
				}, cid)
				player:removeItem(2346, 1)
				player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission02, 3)
				npcHandler.topic[cid] = 0
			end

		elseif msgcontains(msg, "no") then
			npcHandler:say("As I expected. You haven't got the stone. Shall I explain your mission again?", cid)
			npcHandler.topic[cid] = 1
		end
	end
	return true
end

local function onTradeRequest(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) ~= 3 then
		npcHandler:say("I'm sorry, but you don't have Malor's permission to trade with me.", cid)
		return false
	end

	return true
end

-- Greeting
keywordHandler:addGreetKeyword({"djanni'hah"}, 
	{
		npcHandler = npcHandler, 
		text = "What do you want from me, |PLAYERNAME|?"
	}
)
keywordHandler:addKeyword({'want'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "No chance, human. Malor doesn't want me to trade with strangers."
	}
)
keywordHandler:addKeyword({'efreet'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "The efreet are those djinns who never fell for Daraman's insidious propaganda. \z
			I wish I would have been as smart from the start. ...",
            "But errors can be corrected!"
    }}
)
keywordHandler:addKeyword({'marid'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Those among my brothers and sisters who still do not see the truth call themselves the Marid. \z
			I used to be one of them, but I left them when the truth dawned upon me. ...",
            "Now I follow Malor, although I would never fight against my kind."
    }}
)
keywordHandler:addKeyword({'Malor'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Malor is overambitious and unnecessarily cruel, but he is the only djinn who could unite our race, \z
			so I follow him. ...",
            "The truth is I despise him, but that is of no importance as long as you humans will be exterminated."
    }}
)
keywordHandler:addKeyword({'humans'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "I used to have illusions about you humans. I thought humans were good, noble creatures. ...",
			"I thought djinns and humans shared a destiny, and that we could live side by side peacefully. ...",
			"But now I have learnt my lesson. I have had the privilege to look deep into the human mind, \z
			much deeper than most of my brothers. ...",
			"And guess what! I did not like what I've seen. You are nothing but a race of cruel, \z
			perfidious bloodsuckers who hide their wickedness behind a thin layer of civilisation \z
			and so-called humanity. ...",
            "Your race is a blemish on the face of Tibia. The sooner it is gone the better!"
    }}
)
keywordHandler:addKeyword({'djinns'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "One day we will teach your race a lesson it will never forget."
	}
)
keywordHandler:addKeyword({'Tibia'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "One day we djinns will rid this world of evil."
	}
)
keywordHandler:addKeyword({'Haroun'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Haroun? What? You know ... where do you know that name from? Did he send you?"
	}
)
keywordHandler:addKeyword({'Alesar'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "That's my name. So what!"
	}
)
keywordHandler:addKeyword({'name'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "My name is none of your business."
	}
)
keywordHandler:addKeyword({'Gabel'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "Gabel is a kind-hearted, honest djinn. I would hate to see him die just because he \z
			believes in Daraman's lies. ...",
            "After all, I believed them myself."
    }}
)
keywordHandler:addKeyword({'Daraman'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Don't you dare mention Daraman in my presence, human. I am through with his insidious \z
		lies and through with your accursed race!"
	}
)
keywordHandler:addKeyword({"Fa'Hradin"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Fa'hradin, that old cynic is way too smart to believe in Daraman's lies. \z
		He should reconsider his loyalties."
	}
)
keywordHandler:addKeyword({"Bo'Ques"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I miss Bo'ques' cooking, but not his pompous airs and graces."
	}
)
keywordHandler:addKeyword({"Baa'Leal"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Baa'leal is Malor's lieutenant. Unflinchingly loyal, but not quite as clever as he thinks he is."
	}
)
keywordHandler:addKeyword({'Djema'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "Djema? Well - I suppose she is the only human I still like. But she has been brought up by djinns. \z
		Who knows - perhaps humans can learn."
	}
)
keywordHandler:addKeyword({'Melchior'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I remember him. He was a greedy, double-dealing hyena. As far as I know his bleached bones \z
		are now lying somewhere in the Kha'labal."
	}
)
keywordHandler:addKeyword({'Ankrahmun'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I don't care about human cities. If I had it my way, they would all be burnt down today."
	}
)
keywordHandler:addKeyword({'Pharaoh'}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "The Pharaoh in Ankrahmun is a dangerous fool. Just a typical human, in other words."
	}
)
keywordHandler:addKeyword({"Mal'ouquah"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = {
            "I don't like this place. But then it does not really matter where I am. \z
			I have a forge and I don't see any humans. That's all I need. ...",
            "Of course, your presence doesn't help me to feel myself at home here."
    }}
)
keywordHandler:addKeyword({"Ashta'daramai"}, StdModule.say,
	{
		npcHandler = npcHandler,
		text = "I used to live in Ashta'daramai. That was before I realised the extent of my blindness."
	}
)

npcHandler:setMessage(MESSAGE_FAREWELL, "Finally.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Finally.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "At your service, just browse through my wares.")

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new())
