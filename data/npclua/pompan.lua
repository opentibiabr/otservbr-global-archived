local internalNpcName = "Pompan"
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
	lookHead = 78,
	lookBody = 13,
	lookLegs = 32,
	lookFeet = 108,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function getTable(player)
	local itemsList = {
		{name='backpack', id=2854, buy=20},
		{name='bag', id=2853, buy=5},
		{name='basket', id=2855, buy=6},
		{name='blue quiver', id=35848, buy=400},
		{name='bucket', id=2873, buy=4},
		{name='candlestick', id=2917, buy=2},
		{name='closed trap', id=3481, buy=280, sell=75},
		{name='crowbar', id=3304, buy=260, sell=50},
		{name='expedition backpack', id=10324, buy=100},
		{name='expedition bag', id=10325, buy=50},
		{name='fishing rod', id=3483, buy=150, sell=40},
		{name='lamp', id=2914, buy=8},
		{name='pick', id=3456, buy=50, sell=15},
		{name='quiver', id=35562, buy=400},
		{name='red quiver', id=35849, buy=400},
		{name='rope', id=3003, buy=50, sell=15},
		{name='scythe', id=3453, buy=50, sell=10},
		{name='shovel', id=3457, buy=50, sell=8},
		{name='torch', id=2920, buy=2},
		{name='watch', id=2906, buy=20, sell=6},
		{name='worm', id=3492, buy=1},
		{name='inkwell', id=3509, sell=8},
		{name='mirror', id=3463, sell=10},
		{name='sickle', id=3293, sell=3}
	}

	local tomes = {
		-- 1 tome
		{
			{name='arrow', id=3447, buy=3},
			{name='bolt', id=3446, buy=4},
			{name='bow', id=3350, buy=400, sell=100},
			{name='crossbow', id=3349, buy=500, sell=120},
			{name='crystalline arrow', id=15793, buy=20},
			{name='diamond arrow', id=35901, buy=100},
			{name='dragon tapestry', id=10347, buy=80},
			{name='drill bolt', id=16142, buy=12},
			{name='earth arrow', id=774, buy=5},
			{name='envenomed arrow', id=16143, buy=12},
			{name='flaming arrow', id=763, buy=5},
			{name='flash arrow', id=761, buy=5},
			{name='onyx arrow', id=7365, buy=7},
			{name='piercing bolt', id=7363, buy=5},
			{name='power bolt', id=3450, buy=7},
			{name='prismatic bolt', id=16141, buy=20},
			{name='royal spear', id=7378, buy=15},
			{name='shiver arrow', id=762, buy=5},
			{name='sniper arrow', id=7364, buy=5},
			{name='spear', id=3277, buy=9, sell=3},
			{name='spectral bolt', id=35902, buy=70},
			{name='tarsal arrow', id=14251, buy=6},
			{name='throwing star', id=3287, buy=42},
			{name='vortex bolt', id=14252, buy=6},
			{name='corrupted flag', id=10409, sell=700},
			{name='high guard flag', id=10415, sell=550},
			{name='legionnaire flags', id=10417, sell=500},
			{name='zaogun flag', id=10413, sell=600}
		},
		-- 2 tomes
		{
			{name='minotaur backpack', id=10327, buy=200}
		},
		-- 5 tomes
		{
			{name='dragon backpack', id=10326, buy=200}
		}
	}

	if player:getStorageValue(Storage.TheNewFrontier.TomeofKnowledge) >= 1 then
		-- 1 tome
		for i = 1, #tomes[1] do
			itemsList[#itemsList] = tomes[1][i]
		end
	end
	if player:getStorageValue(Storage.TheNewFrontier.TomeofKnowledge) >= 2 then
		-- 2 tomes
		for i = 1, #tomes[2] do
			itemsList[#itemsList] = tomes[2][i]
		end
	end
	if player:getStorageValue(Storage.TheNewFrontier.TomeofKnowledge) >= 5 then
		-- 5 tomes
		for i = 1, #tomes[3] do
			itemsList[#itemsList] = tomes[3][i]
		end
	end

	return itemsList
end

local function setNewTradeTable(table)
	local items, item = {}
	for i = 1, #table do
		item = table[i]
		items[item.id] = {itemId = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name}
	end
	return items
end

local function onBuy(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	local items = setNewTradeTable(getTable(player))
	if not ignoreCap and player:getFreeCapacity() < ItemType(items[item].itemId):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_FAILURE, 'You don\'t have enough cap.')
	end
	if not player:removeMoneyBank(items[item].buyPrice * amount) then
		selfSay("You don't have enough money.", npc, creature)
	else
		player:addItem(items[item].itemId, amount)
		return player:sendTextMessage(MESSAGE_TRADE, 'Bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
	end
	return true
end

local function onSell(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	local items = setNewTradeTable(getTable(player))
	if items[item].sellPrice and player:removeItem(items[item].itemId, amount) then
		player:addMoney(items[item].sellPrice * amount)
		return player:sendTextMessage(MESSAGE_TRADE, 'Sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
	else
		selfSay("You don't have item to sell.", npc, creature)
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	if msgcontains(message, 'trade') then
		local player = Player(creature)
		local items = setNewTradeTable(getTable(player))
		openShopWindow(creature, getTable(player), onBuy, onSell)
		npcHandler:say('Keep in mind you won\'t find better offers here. Just browse through my wares.', npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
