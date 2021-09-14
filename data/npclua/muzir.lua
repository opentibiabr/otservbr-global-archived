local internalNpcName = "Muzir"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 146,
	lookHead = 95,
	lookBody = 4,
	lookLegs = 11,
	lookFeet = 76,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = "Don't forget to deposit your money here in the Global Bank before you head out for adventure.", yell = false }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local count = {}
local transfer = {}
npcType.onAppear = function(npc, creature)
npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
npcHandler:onThink(npc, interval)
end

--------------------------------guild bank-----------------------------------------------
local receiptFormat = 'Date: %s\nType: %s\nGold Amount: %d\nReceipt Owner: %s\nRecipient: %s\n\n%s'
local function getReceipt(info)
	local receipt = Game.createItem(info.success and 24301 or 24302)
	receipt:setAttribute(ITEM_ATTRIBUTE_TEXT, receiptFormat:format(os.date('%d. %b %Y - %H:%M:%S'), info.type, info.amount, info.owner, info.recipient, info.message))

	return receipt
end

local function getGuildIdByName(name, func)
	db.asyncStoreQuery('SELECT `id` FROM `guilds` WHERE `name` = ' .. db.escapeString(name),
		function(resultId)
			if resultId then
				func(result.getNumber(resultId, 'id'))
				result.free(resultId)
			else
				func(nil)
			end
		end
	)
end

local function getGuildBalance(id)
	local guild = Guild(id)
	if guild then
		return guild:getBankBalance()
	else
		local balance
		local resultId = db.storeQuery('SELECT `balance` FROM `guilds` WHERE `id` = ' .. id)
		if resultId then
			balance = result.getNumber(resultId, 'balance')
			result.free(resultId)
		end

		return balance
	end
end

local function setGuildBalance(id, balance)
	local guild = Guild(id)
	if guild then
		guild:setBankBalance(balance)
	else
		db.query('UPDATE `guilds` SET `balance` = ' .. balance .. ' WHERE `id` = ' .. id)
	end
end

local function transferFactory(playerName, amount, fromGuildId, info)
	return function(toGuildId)
		if not toGuildId then
			local player = Player(playerName)
			if player then
				info.success = false
				info.message = 'We are sorry to inform you that we could not fulfil your request, because we could not find the recipient guild.'
				local inbox = player:getInbox()
				local receipt = getReceipt(info)
				inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
			end
		else
			local fromBalance = getGuildBalance(fromGuildId)
			if fromBalance < amount then
				info.success = false
				info.message = 'We are sorry to inform you that we could not fulfill your request, due to a lack of the required sum on your guild account.'
			else
				info.success = true
				info.message = 'We are happy to inform you that your transfer request was successfully carried out.'
				setGuildBalance(fromGuildId, fromBalance - amount)
				setGuildBalance(toGuildId, getGuildBalance(toGuildId) + amount)
			end

			local player = Player(playerName)
			if player then
				local inbox = player:getInbox()
				local receipt = getReceipt(info)
				inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
			end
		end
	end
end
--------------------------------guild bank-----------------------------------------------

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	count[creature], transfer[creature] = nil, nil
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local playerId = creature:getId()
	local player = Player(creature)
---------------------------- help ------------------------
	if msgcontains(message, 'bank account') then
		npcHandler:say({
			'Every citizen has one. The big advantage is that you can access your money in every branch of the Global Bank! ...',
			'Would you like to know more about the {basic} functions of your bank account, the {advanced} functions, or are you already bored, perhaps?'
		}, npc, creature)
		npcHandler.topic[playerId] = 0
		return true
---------------------------- balance ---------------------
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'guild balance') then
		npcHandler.topic[playerId] = 0
		if not player:getGuild() then
			npcHandler:say('You are not a member of a guild.', npc, creature)
			return false
		end
		npcHandler:say('Your guild account balance is ' .. player:getGuild():getBankBalance() .. ' gold.', npc, creature)
		return true
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'balance') then
		npcHandler.topic[playerId] = 0
		if player:getBankBalance() >= 100000000 then
			npcHandler:say('I think you must be one of the richest inhabitants in the world! Your account balance is ' .. player:getBankBalance() .. ' gold.', npc, creature)
			return true
		elseif player:getBankBalance() >= 10000000 then
			npcHandler:say('You have made ten millions and it still grows! Your account balance is ' .. player:getBankBalance() .. ' gold.', npc, creature)
			return true
		elseif player:getBankBalance() >= 1000000 then
			npcHandler:say('Wow, you have reached the magic number of a million gp!!! Your account balance is ' .. player:getBankBalance() .. ' gold!', npc, creature)
			return true
		elseif player:getBankBalance() >= 100000 then
			npcHandler:say('You certainly have made a pretty penny. Your account balance is ' .. player:getBankBalance() .. ' gold.', npc, creature)
			return true
		else
			npcHandler:say('Your account balance is ' .. player:getBankBalance() .. ' gold.', npc, creature)
			return true
		end
---------------------------- deposit ---------------------
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'guild deposit') then
		if not player:getGuild() then
			npcHandler:say('You are not a member of a guild.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		end
	   -- count[creature] = player:getMoney()
	   -- if count[creature] < 1 then
		   -- npcHandler:say('You do not have enough gold.', npc, creature)
		   -- npcHandler.topic[playerId] = 0
		   -- return false
		--end
		if string.match(message, '%d+') then
			count[creature] = getMoneyCount(message)
			if count[creature] < 1 then
				npcHandler:say('You do not have enough gold.', npc, creature)
				npcHandler.topic[playerId] = 0
				return false
			end
			npcHandler:say('Would you really like to deposit ' .. count[creature] .. ' gold to your {guild account}?', npc, creature)
			npcHandler.topic[playerId] = 23
			return true
		else
			npcHandler:say('Please tell me how much gold it is you would like to deposit.', npc, creature)
			npcHandler.topic[playerId] = 22
			return true
		end
	elseif npcHandler.topic[playerId] == 22 then
		count[creature] = getMoneyCount(message)
		if isValidMoney(count[creature]) then
			npcHandler:say('Would you really like to deposit ' .. count[creature] .. ' gold to your {guild account}?', npc, creature)
			npcHandler.topic[playerId] = 23
			return true
		else
			npcHandler:say('You do not have enough gold.', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
	elseif npcHandler.topic[playerId] == 23 then
		if msgcontains(message, 'yes') then
			npcHandler:say('Alright, we have placed an order to deposit the amount of ' .. count[creature] .. ' gold to your guild account. Please check your inbox for confirmation.', npc, creature)
			local guild = player:getGuild()
			local info = {
				type = 'Guild Deposit',
				amount = count[creature],
				owner = player:getName() .. ' of ' .. guild:getName(),
				recipient = guild:getName()
			}
			local playerBalance = player:getBankBalance()
			if playerBalance < tonumber(count[creature]) then
				info.message = 'We are sorry to inform you that we could not fulfill your request, due to a lack of the required sum on your bank account.'
				info.success = false
			else
				info.message = 'We are happy to inform you that your transfer request was successfully carried out.'
				info.success = true
				guild:setBankBalance(guild:getBankBalance() + tonumber(count[creature]))
				player:setBankBalance(playerBalance - tonumber(count[creature]))
			end

			local inbox = player:getInbox()
			local receipt = getReceipt(info)
			inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
		elseif msgcontains(message, 'no') then
			npcHandler:say('As you wish. Is there something else I can do for you?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
		return true
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'deposit') then
		count[creature] = player:getMoney()
		if count[creature] < 1 then
			npcHandler:say('You do not have enough gold.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		end
		if msgcontains(message, 'all') then
			count[creature] = player:getMoney()
			npcHandler:say('Would you really like to deposit ' .. count[creature] .. ' gold?', npc, creature)
			npcHandler.topic[playerId] = 2
			return true
		else
			if string.match(message,'%d+') then
				count[creature] = getMoneyCount(message)
				if count[creature] < 1 then
					npcHandler:say('You do not have enough gold.', npc, creature)
					npcHandler.topic[playerId] = 0
					return false
				end
				npcHandler:say('Would you really like to deposit ' .. count[creature] .. ' gold?', npc, creature)
				npcHandler.topic[playerId] = 2
				return true
			else
				npcHandler:say('Please tell me how much gold it is you would like to deposit.', npc, creature)
				npcHandler.topic[playerId] = 1
				return true
			end
		end
		if not isValidMoney(count[creature]) then
			npcHandler:say('Sorry, but you can\'t deposit that much.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		end
	elseif npcHandler.topic[playerId] == 1 then
		count[creature] = getMoneyCount(message)
		if isValidMoney(count[creature]) then
			npcHandler:say('Would you really like to deposit ' .. count[creature] .. ' gold?', npc, creature)
			npcHandler.topic[playerId] = 2
			return true
		else
			npcHandler:say('You do not have enough gold.', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
	elseif npcHandler.topic[playerId] == 2 then
		if msgcontains(message, 'yes') then
			if player:depositMoney(count[creature]) then
				npcHandler:say('Alright, we have added the amount of ' .. count[creature] .. ' gold to your {balance}. You can {withdraw} your money anytime you want to.', npc, creature)
			else
				npcHandler:say('You do not have enough gold.', npc, creature)
			end
		elseif msgcontains(message, 'no') then
			npcHandler:say('As you wish. Is there something else I can do for you?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
		return true
---------------------------- withdraw --------------------
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'guild withdraw') then
		if not player:getGuild() then
			npcHandler:say('I am sorry but it seems you are currently not in any guild.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		elseif player:getGuildLevel() < 2 then
			npcHandler:say('Only guild leaders or vice leaders can withdraw money from the guild account.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		end

		if string.match(message,'%d+') then
			count[creature] = getMoneyCount(message)
			if isValidMoney(count[creature]) then
				npcHandler:say('Are you sure you wish to withdraw ' .. count[creature] .. ' gold from your guild account?', npc, creature)
				npcHandler.topic[playerId] = 25
			else
				npcHandler:say('There is not enough gold on your guild account.', npc, creature)
				npcHandler.topic[playerId] = 0
			end
			return true
		else
			npcHandler:say('Please tell me how much gold you would like to withdraw from your guild account.', npc, creature)
			npcHandler.topic[playerId] = 24
			return true
		end
	elseif npcHandler.topic[playerId] == 24 then
		count[creature] = getMoneyCount(message)
		if isValidMoney(count[creature]) then
			npcHandler:say('Are you sure you wish to withdraw ' .. count[creature] .. ' gold from your guild account?', npc, creature)
			npcHandler.topic[playerId] = 25
		else
			npcHandler:say('There is not enough gold on your guild account.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
		return true
	elseif npcHandler.topic[playerId] == 25 then
		if msgcontains(message, 'yes') then
			local guild = player:getGuild()
			local balance = guild:getBankBalance()
			npcHandler:say('We placed an order to withdraw ' .. count[creature] .. ' gold from your guild account. Please check your inbox for confirmation.', npc, creature)
			local info = {
				type = 'Guild Withdraw',
				amount = count[creature],
				owner = player:getName() .. ' of ' .. guild:getName(),
				recipient = player:getName()
			}
			if balance < tonumber(count[creature]) then
				info.message = 'We are sorry to inform you that we could not fulfill your request, due to a lack of the required sum on your guild account.'
				info.success = false
			else
				info.message = 'We are happy to inform you that your transfer request was successfully carried out.'
				info.success = true
				guild:setBankBalance(balance - tonumber(count[creature]))
				local playerBalance = player:getBankBalance()
				player:setBankBalance(playerBalance + tonumber(count[creature]))
			end

			local inbox = player:getInbox()
			local receipt = getReceipt(info)
			inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
			npcHandler.topic[playerId] = 0
		elseif msgcontains(message, 'no') then
			npcHandler:say('As you wish. Is there something else I can do for you?', npc, creature)
			npcHandler.topic[playerId] = 0
		end
		return true
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'withdraw') then
		if string.match(message,'%d+') then
			count[creature] = getMoneyCount(message)
			if isValidMoney(count[creature]) then
				npcHandler:say('Are you sure you wish to withdraw ' .. count[creature] .. ' gold from your bank account?', npc, creature)
				npcHandler.topic[playerId] = 7
			else
				npcHandler:say('There is not enough gold on your account.', npc, creature)
				npcHandler.topic[playerId] = 0
			end
			return true
		else
			npcHandler:say('Please tell me how much gold you would like to withdraw.', npc, creature)
			npcHandler.topic[playerId] = 6
			return true
		end
	elseif npcHandler.topic[playerId] == 6 then
		count[creature] = getMoneyCount(message)
		if isValidMoney(count[creature]) then
			npcHandler:say('Are you sure you wish to withdraw ' .. count[creature] .. ' gold from your bank account?', npc, creature)
			npcHandler.topic[playerId] = 7
		else
			npcHandler:say('There is not enough gold on your account.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
		return true
	elseif npcHandler.topic[playerId] == 7 then
		if msgcontains(message, 'yes') then
			if player:getFreeCapacity() >= getMoneyWeight(count[creature]) then
				if not player:withdrawMoney(count[creature]) then
					npcHandler:say('There is not enough gold on your account.', npc, creature)
				else
					npcHandler:say('Here you are, ' .. count[creature] .. ' gold. Please let me know if there is something else I can do for you.', npc, creature)
				end
			else
				npcHandler:say('Whoah, hold on, you have no room in your inventory to carry all those coins. I don\'t want you to drop it on the floor, maybe come back with a cart!', npc, creature)
			end
			npcHandler.topic[playerId] = 0
		elseif msgcontains(message, 'no') then
			npcHandler:say('The customer is king! Come back anytime you want to if you wish to {withdraw} your money.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
		return true
---------------------------- transfer --------------------
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'guild transfer') then
		if not player:getGuild() then
			npcHandler:say('I am sorry but it seems you are currently not in any guild.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		elseif player:getGuildLevel() < 2 then
			npcHandler:say('Only guild leaders or vice leaders can transfer money from the guild account.', npc, creature)
			npcHandler.topic[playerId] = 0
			return false
		end

		if string.match(message, '%d+') then
			count[creature] = getMoneyCount(message)
			if isValidMoney(count[creature]) then
				transfer[creature] = string.match(message, 'to%s*(.+)$')
				if transfer[creature] then
					npcHandler:say('So you would like to transfer ' .. count[creature] .. ' gold from your guild account to guild ' .. transfer[creature] .. '?', npc, creature)
					npcHandler.topic[playerId] = 28
				else
					npcHandler:say('Which guild would you like to transfer ' .. count[creature] .. ' gold to?', npc, creature)
					npcHandler.topic[playerId] = 27
				end
			else
				npcHandler:say('There is not enough gold on your guild account.', npc, creature)
				npcHandler.topic[playerId] = 0
			end
		else
			npcHandler:say('Please tell me the amount of gold you would like to transfer.', npc, creature)
			npcHandler.topic[playerId] = 26
		end
		return true
	elseif npcHandler.topic[playerId] == 26 then
		count[creature] = getMoneyCount(message)
		if player:getGuild():getBankBalance() < count[creature] then
			npcHandler:say('There is not enough gold on your guild account.', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
		if isValidMoney(count[creature]) then
			npcHandler:say('Which guild would you like to transfer ' .. count[creature] .. ' gold to?', npc, creature)
			npcHandler.topic[playerId] = 27
		else
			npcHandler:say('There is not enough gold on your account.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
		return true
	elseif npcHandler.topic[playerId] == 27 then
		transfer[creature] = message
		if player:getGuild():getName() == transfer[creature] then
			npcHandler:say('Fill in this field with person who receives your gold!', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
		npcHandler:say('So you would like to transfer ' .. count[creature] .. ' gold from your guild account to guild ' .. transfer[creature] .. '?', npc, creature)
		npcHandler.topic[playerId] = 28
		return true
	elseif npcHandler.topic[playerId] == 28 then
		if msgcontains(message, 'yes') then
			npcHandler:say('We have placed an order to transfer ' .. count[creature] .. ' gold from your guild account to guild ' .. transfer[creature] .. '. Please check your inbox for confirmation.', npc, creature)
			local guild = player:getGuild()
			local balance = guild:getBankBalance()
			local info = {
				type = 'Guild to Guild Transfer',
				amount = count[creature],
				owner = player:getName() .. ' of ' .. guild:getName(),
				recipient = transfer[creature]
			}
			if balance < tonumber(count[creature]) then
				info.message = 'We are sorry to inform you that we could not fulfill your request, due to a lack of the required sum on your guild account.'
				info.success = false
				local inbox = player:getInbox()
				local receipt = getReceipt(info)
				inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
			else
				getGuildIdByName(transfer[creature], transferFactory(player:getName(), tonumber(count[creature]), guild:getId(), info))
			end
			npcHandler.topic[playerId] = 0
		elseif msgcontains(message, 'no') then
			npcHandler:say('Alright, is there something else I can do for you?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
--------------------------------guild bank-----------------------------------------------
	elseif msgcontains(message, 'transfer') then
		npcHandler:say('Please tell me the amount of gold you would like to transfer.', npc, creature)
		npcHandler.topic[playerId] = 11
	elseif npcHandler.topic[playerId] == 11 then
		count[creature] = getMoneyCount(message)
		if player:getBankBalance() < count[creature] then
			npcHandler:say('There is not enough gold on your account.', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
		if isValidMoney(count[creature]) then
			npcHandler:say('Who would you like transfer ' .. count[creature] .. ' gold to?', npc, creature)
			npcHandler.topic[playerId] = 12
		else
			npcHandler:say('There is not enough gold on your account.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 12 then
		transfer[creature] = message
		if player:getName() == transfer[creature] then
			npcHandler:say('Fill in this field with person who receives your gold!', npc, creature)
			npcHandler.topic[playerId] = 0
			return true
		end
		if playerExists(transfer[creature]) then
		local arrayDenied = {"accountmanager", "rooksample", "druidsample", "sorcerersample", "knightsample", "paladinsample"}
			if isInArray(arrayDenied, string.gsub(transfer[creature]:lower(), " ", "")) then
				npcHandler:say('This player does not exist.', npc, creature)
				npcHandler.topic[playerId] = 0
				return true
			end
			npcHandler:say('So you would like to transfer ' .. count[creature] .. ' gold to ' .. transfer[creature] .. '?', npc, creature)
			npcHandler.topic[playerId] = 13
		else
			npcHandler:say('This player does not exist.', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 13 then
		if msgcontains(message, 'yes') then
			if not player:transferMoneyTo(transfer[creature], count[creature]) then
				npcHandler:say("I'm afraid this character only holds a junior account at our bank. Do not worry, though. Once he has chosen his vocation or is no longer on Dawnport, his account will be upgraded.", npc, creature)
			else
				npcHandler:say('Very well. You have transferred ' .. count[creature] .. ' gold to ' .. transfer[creature] ..'.', npc, creature)
				transfer[creature] = nil
			end
		elseif msgcontains(message, 'no') then
			npcHandler:say('Alright, is there something else I can do for you?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
---------------------------- money exchange --------------
	elseif msgcontains(message, 'change gold') then
		npcHandler:say('How many platinum coins would you like to get?', npc, creature)
		npcHandler.topic[playerId] = 14
	elseif npcHandler.topic[playerId] == 14 then
		if getMoneyCount(message) < 1 then
			npcHandler:say('Sorry, you do not have enough gold coins.', npc, creature)
			npcHandler.topic[playerId] = 0
		else
			count[creature] = getMoneyCount(message)
			npcHandler:say('So you would like me to change ' .. count[creature] * 100 .. ' of your gold coins into ' .. count[creature] .. ' platinum coins?', npc, creature)
			npcHandler.topic[playerId] = 15
		end
	elseif npcHandler.topic[playerId] == 15 then
		if msgcontains(message, 'yes') then
			if player:removeItem(2148, count[creature] * 100) then
				player:addItem(2152, count[creature])
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry, you do not have enough gold coins.', npc, creature)
			end
		else
			npcHandler:say('Well, can I help you with something else?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
	elseif msgcontains(message, 'change platinum') then
		npcHandler:say('Would you like to change your platinum coins into gold or crystal?', npc, creature)
		npcHandler.topic[playerId] = 16
	elseif npcHandler.topic[playerId] == 16 then
		if msgcontains(message, 'gold') then
			npcHandler:say('How many platinum coins would you like to change into gold?', npc, creature)
			npcHandler.topic[playerId] = 17
		elseif msgcontains(message, 'crystal') then
			npcHandler:say('How many crystal coins would you like to get?', npc, creature)
			npcHandler.topic[playerId] = 19
		else
			npcHandler:say('Well, can I help you with something else?', npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif npcHandler.topic[playerId] == 17 then
		if getMoneyCount(message) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', npc, creature)
			npcHandler.topic[playerId] = 0
		else
			count[creature] = getMoneyCount(message)
			npcHandler:say('So you would like me to change ' .. count[creature] .. ' of your platinum coins into ' .. count[creature] * 100 .. ' gold coins for you?', npc, creature)
			npcHandler.topic[playerId] = 18
		end
	elseif npcHandler.topic[playerId] == 18 then
		if msgcontains(message, 'yes') then
			if player:removeItem(2152, count[creature]) then
				player:addItem(2148, count[creature] * 100)
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', npc, creature)
			end
		else
			npcHandler:say('Well, can I help you with something else?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
	elseif npcHandler.topic[playerId] == 19 then
		if getMoneyCount(message) < 1 then
			npcHandler:say('Sorry, you do not have enough platinum coins.', npc, creature)
			npcHandler.topic[playerId] = 0
		else
			count[creature] = getMoneyCount(message)
			npcHandler:say('So you would like me to change ' .. count[creature] * 100 .. ' of your platinum coins into ' .. count[creature] .. ' crystal coins for you?', npc, creature)
			npcHandler.topic[playerId] = 20
		end
	elseif npcHandler.topic[playerId] == 20 then
		if msgcontains(message, 'yes') then
			if player:removeItem(2152, count[creature] * 100) then
				player:addItem(2160, count[creature])
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', npc, creature)
			end
		else
			npcHandler:say('Well, can I help you with something else?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
	elseif msgcontains(message, 'change crystal') then
		npcHandler:say('How many crystal coins would you like to change into platinum?', npc, creature)
		npcHandler.topic[playerId] = 21
	elseif npcHandler.topic[playerId] == 21 then
		if getMoneyCount(message) < 1 then
			npcHandler:say('Sorry, you do not have enough crystal coins.', npc, creature)
			npcHandler.topic[playerId] = 0
		else
			count[creature] = getMoneyCount(message)
			npcHandler:say('So you would like me to change ' .. count[creature] .. ' of your crystal coins into ' .. count[creature] * 100 .. ' platinum coins for you?', npc, creature)
			npcHandler.topic[playerId] = 22
		end
	elseif npcHandler.topic[playerId] == 22 then
		if msgcontains(message, 'yes') then
			if player:removeItem(2160, count[creature])  then
				player:addItem(2152, count[creature] * 100)
				npcHandler:say('Here you are.', npc, creature)
			else
				npcHandler:say('Sorry, you do not have enough crystal coins.', npc, creature)
			end
		else
			npcHandler:say('Well, can I help you with something else?', npc, creature)
		end
		npcHandler.topic[playerId] = 0
	end
	return true
end

keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'change'}, StdModule.say, {npcHandler = npcHandler, text = 'There are three different coin types in Global Bank: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you\'d like to change 100 gold into 1 platinum, simply say \'{change gold}\' and then \'1 platinum\'.'})
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'advanced'}, StdModule.say, {npcHandler = npcHandler, text = 'Your bank account will be used automatically when you want to {rent} a house or place an offer on an item on the {market}. Let me know if you want to know about how either one works.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'functions'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'basic'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I work in this bank. I can change money for you and help you with your bank account.'})

npcHandler:setMessage(MESSAGE_GREET, "Yes? What may I do for you, |PLAYERNAME|? Bank business, perhaps?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a nice day.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
