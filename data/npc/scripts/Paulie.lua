local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = 'Deposit your money here in the safety of the Tibian Bank!' },
	{ text = 'Any questions about the functions of your bank account? Feel free to ask me for help!' }
}
npcHandler:addModule(VoiceModule:new(voices))

local function greetCallback(cid)
	count[cid], transfer[cid] = nil, nil
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
---------------------------- help ------------------------
	if msgcontains(msg, 'bank account') then
		npcHandler:say({
			'Every Tibian has one. The big advantage is that you can access your money in every branch of the Tibian Bank! ...',
			'Would you like to know more about the {basic} functions of your bank account, the {advanced} functions, or are you already bored, perhaps?'
		}, cid)
		npcHandler.topic[cid] = 0
		return true
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		npcHandler.topic[cid] = 0
		if player:getBankBalance() >= 100000000 then
			npcHandler:say('I think you must be one of the richest inhabitants in the world! Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		elseif player:getBankBalance() >= 10000000 then
			npcHandler:say('You have made ten millions and it still grows! Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		elseif player:getBankBalance() >= 1000000 then
			npcHandler:say('Wow, you have reached the magic number of a million gp!!! Your account balance is ' .. player:getBankBalance() .. ' gold!', cid)
			return true
		elseif player:getBankBalance() >= 100000 then
			npcHandler:say('You certainly have made a pretty penny. Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		else
			npcHandler:say('Your account balance is ' .. player:getBankBalance() .. ' gold.', cid)
			return true
		end
---------------------------- deposit ---------------------
	elseif msgcontains(msg, 'deposit') then
		if (Player.getExhaustion(player, 494934) > 0) then
            npcHandler:say('You need to wait a time before try deposit.', cid)
            npcHandler.topic[cid] = 0
            return false
        end

		count[cid] = player:getMoney()
		if count[cid] < 1 then
			npcHandler:say('You do not have enough gold.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
		if msgcontains(msg, 'all') then
			count[cid] = player:getMoney()
			npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			if string.match(msg,'%d+') then
				count[cid] = getMoneyCount(msg)
				if count[cid] < 1 then
					npcHandler:say('You do not have enough gold.', cid)
					npcHandler.topic[cid] = 0
					return false
				end
				npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
				npcHandler.topic[cid] = 2
				return true
			else
				npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
				npcHandler.topic[cid] = 1
				return true
			end
		end
		if not isValidMoney(count[cid]) then
			npcHandler:say('Sorry, but you can\'t deposit that much.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
	elseif npcHandler.topic[cid] == 1 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			npcHandler:say('You do not have enough gold.', cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if player:getMoney() + player:getBankBalance() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				npcHandler:say('Alright, we have added the amount of ' .. count[cid] .. ' gold to your {balance}. You can {withdraw} your money anytime you want to.', cid)
				Player.setExhaustion(player, 494934, 2)
			else
				npcHandler:say('You do not have enough gold.', cid)
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:say('As you wish. Is there something else I can do for you?', cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if (Player.getExhaustion(player, 494934) > 0) then
            npcHandler:say('You need to wait a time before try withdraw.', cid)
            npcHandler.topic[cid] = 0
            return false
        end

		if string.match(msg,'%d+') then
			count[cid] = getMoneyCount(msg)
			if isValidMoney(count[cid]) then
				npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
				npcHandler.topic[cid] = 7
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say('There is not enough gold on your account.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			if player:getFreeCapacity() >= getMoneyWeight(count[cid]) then
				if not player:withdrawMoney(count[cid]) then
					npcHandler:say('There is not enough gold on your account.', cid)
				else
					npcHandler:say('Here you are, ' .. count[cid] .. ' gold. Please let me know if there is something else I can do for you.', cid)
					Player.setExhaustion(player, 494934, 2)
				end
			else
				npcHandler:say('Whoah, hold on, you have no room in your inventory to carry all those coins. I don\'t want you to drop it on the floor, maybe come back with a cart!', cid)
			end
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'no') then
			npcHandler:say('The customer is king! Come back anytime you want to if you wish to {withdraw} your money.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- money exchange --------------
	elseif msgcontains(msg, 'change gold') then
		npcHandler:say('How many platinum coins would you like to get?', cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough gold coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your gold coins into ' .. count[cid] .. ' platinum coins?', cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough gold coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		npcHandler:say('Would you like to change your platinum coins into gold or crystal?', cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			npcHandler:say('How many platinum coins would you like to change into gold?', cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say('How many crystal coins would you like to get?', cid)
			npcHandler.topic[cid] = 19
		else
			npcHandler:say('Well, can I help you with something else?', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your platinum coins into ' .. count[cid] * 100 .. ' gold coins for you?', cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2152, count[cid]) then
				player:addItem(2148, count[cid] * 100)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your platinum coins into ' .. count[cid] .. ' crystal coins for you?', cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2152, count[cid] * 100) then
				player:addItem(2160, count[cid])
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say('How many crystal coins would you like to change into platinum?', cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your crystal coins into ' .. count[cid] * 100 .. ' platinum coins for you?', cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') then
			if player:removeItem(2160, count[cid])  then
				player:addItem(2152, count[cid] * 100)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

-- Basic keywords
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m Paulie.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m still a bank clerk-in-training. They say I can work on the mainland of Tibia once I have proven myself!'})
keywordHandler:addKeyword({'transfer'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m afraid this service is not available to you until you reach mainland.'})
keywordHandler:addKeyword({'change'}, StdModule.say, {npcHandler = npcHandler, text = 'There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. For example, if you like to change 100 gold coins into 1 platinum coin, simply say \'{change gold}\' and then \'1 platinum\'.'})
keywordHandler:addKeyword({'advanced'}, StdModule.say, {npcHandler = npcHandler, text = 'Once you are on the Tibian mainland, you can access new functions of your bank account, such as transferring money to other players safely or taking part in house auctions.'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = 'HAIL TO THE KING!'})
keywordHandler:addKeyword({'academy'}, StdModule.say, {npcHandler = npcHandler, text = 'The academy is the big stone building in the town centre. When you are ready to leave Rookgaard, you should visit the {oracle} there.'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s exactly |TIME|.'})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, text = 'The temple is south of the city. Go there and talk to {Cipfried} if you are in dire need of healing.'})
keywordHandler:addKeyword({'mainland'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m looking forward to work on the mainland. The great Tibian cities are so much more interesting than this little village of {Rookgaard}.'})
keywordHandler:addKeyword({'rookgaard'}, StdModule.say, {npcHandler = npcHandler, text = 'What a godforsaken place! Well, at least there are no criminals robbing the bank which would be - me. <gulp>'})
keywordHandler:addKeyword({'premium'}, StdModule.say, {npcHandler = npcHandler, text = 'Another excellent way of investing your money.'})

keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = 'I don\'t trade. Ask the shop owners for a trade instead. I can only help you with your {bank account}.'})
keywordHandler:addAliasKeyword({'offer'})
keywordHandler:addAliasKeyword({'potion'})
keywordHandler:addAliasKeyword({'sell'})
keywordHandler:addAliasKeyword({'buy'})
keywordHandler:addAliasKeyword({'stuff'})
keywordHandler:addAliasKeyword({'wares'})
keywordHandler:addAliasKeyword({'weapon'})
keywordHandler:addAliasKeyword({'equip'})
keywordHandler:addAliasKeyword({'food'})
keywordHandler:addAliasKeyword({'armor'})
keywordHandler:addAliasKeyword({'shield'})

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'Every Tibian has a bank account. You can {deposit} your gold in one bank and {withdraw} it from the same or any other Tibian bank. Ask me for your {balance} to learn how much money you\'ve already saved. There are also {advanced} functions.'})
keywordHandler:addAliasKeyword({'function'})
keywordHandler:addAliasKeyword({'account'})

keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, text = 'You can {deposit} and {withdraw} money from your {bank account} here. I can also {change} money for you.'})
keywordHandler:addAliasKeyword({'money'})

-- Names
keywordHandler:addKeyword({'zerbrus'}, StdModule.say, {npcHandler = npcHandler, text = 'Thank god that guy guards our bridge. Without him, I believe all sorts of critters would storm the bank!'})
keywordHandler:addAliasKeyword({'dallheim'})
keywordHandler:addKeyword({'al', 'dee'}, StdModule.say, {npcHandler = npcHandler, text = 'He sells general equipment such as ropes or torches.'})
keywordHandler:addKeyword({'amber'}, StdModule.say, {npcHandler = npcHandler, text = '<blushes> It\'s making me nervous to have her around my working place all the time. Actually it\'s distracting, but I can\'t say why.'})
keywordHandler:addKeyword({'billy'}, StdModule.say, {npcHandler = npcHandler, text = 'A fine cook and farmer.'})
keywordHandler:addKeyword({'willie'}, StdModule.say, {npcHandler = npcHandler, text = 'He\'s incredibly rude! I don\'t know what I\'ve done to him. Well, he buys and sells {food}.'})
keywordHandler:addKeyword({'tom'}, StdModule.say, {npcHandler = npcHandler, text = 'He\'s the local tanner. You could try selling fresh corpses or leather to him and then bring the earnt money to our {bank}.'})
keywordHandler:addKeyword({'seymour'}, StdModule.say, {npcHandler = npcHandler, text = 'A well-educated man.'})
keywordHandler:addKeyword({'zirella'}, StdModule.say, {npcHandler = npcHandler, text = 'She\'s a nice old lady, but I guess she prefers keeping her savings in one of her socks. She never comes to my bank.'})
keywordHandler:addKeyword({'santiago'}, StdModule.say, {npcHandler = npcHandler, text = 'Just a fisherman living outside the village.'})
keywordHandler:addKeyword({'paulie'}, StdModule.say, {npcHandler = npcHandler, text = 'That\'s me, in all my beauty! <coughs>'})
keywordHandler:addKeyword({'oracle'}, StdModule.say, {npcHandler = npcHandler, text = 'You can find the oracle on the top floor of the {academy}, just above {Seymour}. Go there when you are level 8.'})
keywordHandler:addKeyword({'obi'}, StdModule.say, {npcHandler = npcHandler, text = 'He sells {weapons}. His shop is south west of town, close to the {temple}.'})
keywordHandler:addKeyword({'norma'}, StdModule.say, {npcHandler = npcHandler, text = 'Going to her bar is not so much my cup of tea... I prefer reading a good book about economy.'})
keywordHandler:addKeyword({'loui'}, StdModule.say, {npcHandler = npcHandler, text = 'I don\'t know that guy.'})
keywordHandler:addKeyword({'lily'}, StdModule.say, {npcHandler = npcHandler, text = 'Lily sells {potions} in the South of town.'})
keywordHandler:addKeyword({'lee\'delle'}, StdModule.say, {npcHandler = npcHandler, text = 'Her shop is on the {premium} side of town. She has really good offers.'})
keywordHandler:addKeyword({'hyacinth'}, StdModule.say, {npcHandler = npcHandler, text = 'Hm, I\'ve never seen him. He\'s supposed to be a druid.'})
keywordHandler:addKeyword({'dixi'}, StdModule.say, {npcHandler = npcHandler, text = 'She\'s {Obi\'s} granddaughter and deals with {armors} and {shields}. Her shop is southwest of town, close to the {temple}.'})
keywordHandler:addKeyword({'cipfried'}, StdModule.say, {npcHandler = npcHandler, text = 'He guards the temple and can heal you if you are badly injured or poisoned.'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|! Here, you can {deposit} or {withdraw} your money from your bank account and {change} gold. I can also explain the {functions} of your bank account to you.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, and remember: entrusting us with your gold is the safest way of storing it!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
