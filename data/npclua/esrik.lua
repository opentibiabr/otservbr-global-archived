local internalNpcName = "Esrik"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 71
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
		{name="durable exercise axe", id=35280, buy=945000, subType = 2578},
		{name="durable exercise bow", id=35282, buy=945000, subType = 2578},
		{name="durable exercise club", id=35281, buy=945000, subType = 2578},
		{name="durable exercise sword", id=35279, buy=945000, subType = 2578},
		{name="exercise sword", id=28552, buy=262500, subType = 500},
		{name="exercise axe", id=28553, buy=262500, subType = 500},
		{name="exercise club", id=28554, buy=262500, subType = 500},
		{name="exercise bow", id=28555, buy=262500, subType = 500},
		{name="lasting exercise axe", id=35286, buy=7560000, subType = 12898},
		{name="lasting exercise bow", id=35288, buy=7560000, subType = 12898},
		{name="lasting exercise club", id=35287, buy=7560000, subType = 12898},
		{name="lasting exercise sword", id=35285, buy=7560000, subType = 12898},
		{name="axe", id=3274, buy=20, sell=7},
		{name="battle axe", id=3266, buy=235, sell=80},
		{name="battle hammer", id=3305, buy=350, sell=120},
		{name="battle shield", id=3305, sell=95},
		{name="brass armor", id=3359, buy=450, sell=150},
		{name="brass helmet", id=3354, buy=120, sell=30},
		{name="brass legs", id=3372, buy=195, sell=49},
		{name="brass shield", id=3411, buy=65, sell=25},
		{name="carlin sword", id=3283, buy=473, sell=118},
		{name="chain armor", id=3358, buy=200, sell=70},
		{name="chain helmet", id=3352, buy=52, sell=17},
		{name="chain legs", id=3558, buy=80, sell=25},
		{name="club", id=3270, buy=5, sell=1},
		{name="coat", id=3562, buy=8, sell=1},
		{name="crowbar", id=3304, buy=260, sell=50},
		{name="dagger", id=3267, buy=5, sell=2},
		{name="doublet", id=3379, buy=16, sell=3},
		{name="dwarven shield", id=3425, buy=500, sell=100},
		{name="hand axe", id=3268, buy=8, sell=4},
		{name="leather armor", id=3361, buy=35, sell=12},
		{name="leather boots", id=3552, buy=10, sell=2},
		{name="leather helmet", id=3355, buy=12, sell=9},
		{name="leather legs", id=3559, buy=10, sell=9},
		{name="longsword", id=3285, buy=160, sell=51},
		{name="mace", id=3286, buy=90, sell=30},
		{name="morning star", id=3282, buy=430, sell=100},
		{name="plate armor", id=3357, buy=1200, sell=400},
		{name="plate shield", id=3410, buy=125, sell=45},
		{name="rapier", id=3272, buy=15, sell=5},
		{name="sabre", id=3273, buy=35, sell=12},
		{name="scale armor", id=3377, buy=260, sell=75},
		{name="spear", id=3277, buy=10, sell=3},
		{name="short sword", id=3294, buy=26, sell=10},
		{name="sickle", id=3293, buy=7, sell=3},
		{name="soldier helmet", id=3375, buy=110, sell=16},
		{name="spike sword", id=3271, buy=8000, sell=240},
		{name="steel helmet", id=3351, buy=580, sell=293},
		{name="steel shield", id=3409, buy=240, sell=80},
		{name="studded armor", id=3378, buy=90, sell=25},
		{name="studded helmet", id=3376, buy=63, sell=20},
		{name="studded legs", id=3362, buy=50, sell=15},
		{name="studded shield", id=3426, buy=50, sell=16},
		{name="swampling club", id=17824, sell=40},
		{name="sword", id=3264, buy=85, sell=25},
		{name="throwing knife", id=3298, buy=25},
		{name="wooden shield", id=3412, buy=15, sell=3},
		{name="two handed sword", id=3265, sell=450},
		{name="bone shoulderplate", id=10404, sell=150},
		{name="broken draken mail", id=11660, sell=340},
		{name="broken halberd", id=10418, sell=100},
		{name="broken slicer", id=11661, sell=120},
		{name="cursed shoulder spikes", id=10410, sell=320},
		{name="drachaku", id=10391, sell=10000},
		{name="draken boots", id=4033, sell=40000},
		{name="draken wristbands", id=11659, sell=430},
		{name="drakinata", id=10388, sell=10000},
		{name="elite draken mail", id=11651, sell=50000},
		{name="guardian boots", id=10323, sell=35000},
		{name="high guard's shoulderplates", id=10416, sell=130},
		{name="sais", id=10389, sell=16500},
		{name="spiked iron ball", id=10408, sell=100},
		{name="twiceslicer", id=11657, sell=28000},
		{name="twin hooks", id=10392, buy=1100, sell=500},
		{name="wailing widow's necklace", id=10412, sell=3000},
		{name="warmaster's wristguards", id=10405, sell=200},
		{name="zaoan armor", id=10384, sell=14000},
		{name="zaoan halberd", id=10406, buy=1200, sell=500},
		{name="zaoan helmet", id=10385, sell=45000},
		{name="zaoan legs", id=10387, sell=14000},
		{name="zaoan shoes", id=10386, sell=5000},
		{name="zaoan sword", id=10390, sell=30000},
		{name="zaogun's shoulderplates", id=10414, sell=150}
}

	local tomes = {
		{
			-- 3 tomes
		{name="lizard weapon rack kit", id=10209, buy=500}
		},
		{
			-- 9 tomes
		{name="bone shoulderplate", id=10404, sell=150},
		{name="broken draken mail", id=11660, sell=340},
		{name="broken halberd", id=10418, sell=100},
		{name="Broken Slicer", id=11661, sell=120},
		{name="cursed shoulder spikes", id=10410, sell=320},
		{name="drachaku", id=10391, sell=10000},
		{name="draken boots", id=4033, sell=40000},
		{name="draken wristbands", id=11659, sell=430},
		{name="drakinata", id=10388, sell=10000},
		{name="Elite Draken Mail", id=11651, sell=50000},
		{name="guardian boots", id=10323, sell=35000},
		{name="high guard's shoulderplates", id=10416, sell=130},
		{name="sais", id=10389, sell=16500},
		{name="spiked iron ball", id=10408, sell=100},
		{name="twiceslicer", id=11657, sell=28000},
		{name="twin hooks", id=10392, buy=1100, sell=500},
		{name="wailing widow's necklace", id=10412, sell=3000},
		{name="warmaster's wristguards", id=10405, sell=200},
		{name="zaoan armor", id=10384, sell=14000},
		{name="zaoan halberd", id=10406, buy=1200, sell=500},
		{name="zaoan helmet", id=10385, sell=45000},
		{name="zaoan legs", id=10387, sell=14000},
		{name="zaoan shoes", id=10386, sell=5000},
		{name="zaoan sword", id=10390, sell=30000},
		{name="zaogun's shoulderplates", id=10414, sell=150}
		}
}

	if player:getStorageValue(Storage.TheNewFrontier.TomeofKnowledge) >= 3 then
		-- 3 tomes
		for i = 1, #tomes[1] do
			itemsList[#itemsList] = tomes[1][i]
		end
	end

	if player:getStorageValue(Storage.TheNewFrontier.TomeofKnowledge) >= 9 then
		-- 9 tomes
		for i = 1, #tomes[2] do
			itemsList[#itemsList] = tomes[2][i]
		end
	end

	return itemsList
end

local function setNewTradeTable(table)
	local items, item = {}
	for i = 1, #table do
		item = table[i]
		items[item.id] = {itemId = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = item.subType, realName = item.name}
	end
	return items
end

local function onBuy(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	local items = setNewTradeTable(getTable(player))
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	if not backpack or backpack:getEmptySlots(true) < 1 then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		return false
	end
	if not ignoreCap and player:getFreeCapacity() < ItemType(items[item].itemId):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_FAILURE, 'You don\'t have enough cap.')
	end
	if not player:removeMoneyBank(items[item].buyPrice * amount) then
		selfSay("You don't have enough money.", npc, creature)
	else
		player:addItem(items[item].itemId, amount, true, subType)
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
	if msgcontains(message, "trade") then
		local player = Player(creature)
		local items = setNewTradeTable(getTable(player))
		openShopWindow(creature, getTable(player), onBuy, onSell)
		npcHandler:say("Of course, just browse through my wares.", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME| and welcome to my little forge.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
