local internalNpcName = "Cassino"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 60,
	lookBody = 22,
	lookLegs = 24,
	lookFeet = 32,
	lookAddons = 2
}

npcConfig.flags = {
	floorchange = false
}

local config = {
	bet = {
		min = 10000, -- gold coins // 30k
		max = 10000000000, 
		win = 180, -- 170% high/low
		winNum = 500, -- 300% numbers
	},
	playerPosition = Position(32352, 32226, 7), -- NpcPos(x-2) player must stay on this position to talk with npc
	dicerCounter = Position(32352, 32225, 7), --	NpcPos(x-1, y-1) 	counter position
	diePos = Position(32354, 32225, 7) --NpcPos(y-1)
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

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
	local tile = Tile(config.playerPosition)
	if tile then
		local player = tile:getTopCreature()
		if not player then
			npcHandler.focuses = {}
		end
	end
end

local function getCoinValue(id)
	if id == 2160 then
		return 10000
	elseif id == 2152 then
		return 100
	elseif id == 2148 then
		return 1
	end
	return 0
end

local function getBetValue()
	local value = 0
	local tile = Tile(config.dicerCounter)
	if tile then
		local items = tile:getItems()
		if not items or #items == 0 then
			return 0
		end
		
		local tempMoney = {}
		for _, item in pairs(items) do
			if table.contains({2160, 2152, 2148}, item:getId()) then
				value = value + getCoinValue(item:getId()) * item:getCount()
				tempMoney[#tempMoney + 1] = item
			end
		end
		
		if value >= config.bet.min and value <= config.bet.max then -- valid bet
			for _, item in pairs(tempMoney) do
				item:remove()
			end
			return value
		end
	end
	return nil
end

local function createMoney(money)
	local table = {}
	local currentMoney = money
	local crystals = math.floor(currentMoney / 10000)
	currentMoney = currentMoney - crystals * 10000
	while crystals > 0 do
		local count = math.min(100, crystals)
		table[#table + 1] = {2160, count}
		crystals = crystals - count
	end
	
	local platinums = math.floor(currentMoney / 100)
	if platinums ~= 0 then
		table[#table + 1] = {2152, platinums}
		currentMoney = currentMoney - platinums * 100
	end
	
	if currentMoney ~= 0 then
		table[#table + 1] = {2148, currentMoney}
	end
	return table
end

local function greetCallback(npc, creature)
	local player = Player(creature)
	if player:getPosition() ~= config.playerPosition then
		npcHandler:say("If you want to play with me please come near me.", npc, creature)
		return false
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)	
	local player = Player(creature)
	if player:getPosition() ~= config.playerPosition then
		npcHandler:unGreet(creature)
		return false
	end
	if table.contains({"low", "high", "h", "l", "1", "2", "3", "4", "5", "6", "odd", "impar", "par", "even"}, message) then
		local bet = getBetValue()
		if not bet then
			npcHandler:say("Your bet is lower than the min {".. config.bet.min .."}gps or higher than the max {"..config.bet.max.."}gps bet.", npc, creature)
			npcHandler.topic[creature] = 0
			return true
		end
		player:say(message, TALKTYPE_SAY, false, true, player:getPosition())
		local number = math.random(6)
		
		local dadimid = {5792, 5793, 5794, 5795, 5796, 5797}
		local daddd = 0
		local haveDie = false
		for x = 1, 6 do
			daddd = Tile(config.diePos):getItemById(dadimid[x])
			if daddd then
				haveDie = true
				break
			end
		end
		if haveDie then
			daddd:transform(dadimid[number])
		else
			Game.createItem((5791+number), 1, config.diePos)
		end
		npc:say(npc:getName() .. " rolled a ".. number .. ".", TALKTYPE_MONSTER_SAY, false, true, config.diePos)
		config.diePos:sendMagicEffect(CONST_ME_CRAPS)
		if table.contains({"low", "l"}, message) then
			if table.contains({1, 2, 3}, number) then
				local wonMoney = math.ceil(bet * (config.bet.win / 100))
				npc:say("You won! Here's your ".. wonMoney .." gold coins.", TALKTYPE_SAY)
				config.dicerCounter:sendMagicEffect(math.random(29, 31))
				for _, coin in pairs(createMoney(wonMoney)) do
					Game.createItem(coin[1], coin[2], config.dicerCounter)
				end
			else
				
				npc:say("You have lost your "..bet.." gold coins.", TALKTYPE_SAY)
				
			end
		elseif table.contains({"high", "h"}, message) then
			if table.contains({4, 5, 6}, number) then
				local wonMoney = math.ceil(bet * (config.bet.win / 100))
				npc:say("You won! Here's your ".. wonMoney .." gold coins.", TALKTYPE_SAY)
				config.dicerCounter:sendMagicEffect(math.random(29, 31))
				for _, coin in pairs(createMoney(wonMoney)) do
					Game.createItem(coin[1], coin[2], config.dicerCounter)
				end
			else
				
				npc:say("You have lost your "..bet.." gold coins.", TALKTYPE_SAY)
				
			end
		elseif table.contains({"odd", "impar"}, message) then
			if table.contains({1, 3, 5}, number) then
				local wonMoney = math.ceil(bet * (config.bet.win / 100))
				npc:say("You won! Here's your ".. wonMoney .." gold coins.", TALKTYPE_SAY)
				config.dicerCounter:sendMagicEffect(math.random(29, 31))
				for _, coin in pairs(createMoney(wonMoney)) do
					Game.createItem(coin[1], coin[2], config.dicerCounter)
				end
			else
				
				npc:say("You have lost your "..bet.." gold coins.", TALKTYPE_SAY)
				
			end
		elseif table.contains({"par", "even"}, message) then
			if table.contains({2, 4, 6}, number) then
				local wonMoney = math.ceil(bet * (config.bet.win / 100))
				npc:say("You won! Here's your ".. wonMoney .." gold coins.", TALKTYPE_SAY)
				config.dicerCounter:sendMagicEffect(math.random(29, 31))
				for _, coin in pairs(createMoney(wonMoney)) do
					Game.createItem(coin[1], coin[2], config.dicerCounter)
				end
			else
				
				npc:say("You have lost your "..bet.." gold coins.", TALKTYPE_SAY)
				
			end
		elseif table.contains({"1", "2", "3", "4", "5", "6"}, message) then
			if number == tonumber(message) then
				local wonMoney = math.ceil(bet * (config.bet.winNum / 100))
				npc:say("You won! Here's your ".. wonMoney .." gold coins.", TALKTYPE_SAY)
				config.dicerCounter:sendMagicEffect(math.random(29, 31))
				for _, coin in pairs(createMoney(wonMoney)) do
					Game.createItem(coin[1], coin[2], config.dicerCounter)
				end
			else
				
				npc:say("You have lost your "..bet.." gold coins.", TALKTYPE_SAY)
				
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Cassino! Here we play with: \n [PAYOUT 180%] {HIGH / LOW}: High for 4, 5, 6 and Low for 1, 2, and 3 - {ODD / EVEN }: Odd for 1, 3, 5 and Even for 2, 4 and 6 \n [PAYOUT 500%] {NUMBERS}: You choose the number, and if you get it right ... {$$$$$}")
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
