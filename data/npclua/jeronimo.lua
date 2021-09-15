local internalNpcName = "Jeronimo"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 57,
	lookBody = 59,
	lookLegs = 3,
	lookFeet = 1,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Change your Bar of Gold\'s for Items here!'}
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

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

-- ID, Count, Price
local eventShopItems = {
	["small stamina refill"] = {22473, 1, 100},
	["zaoan chess box"] = {20620, 1, 100},
	["pannier backpack"] = {21475, 1, 70},
	["green light"] = {23588, 1, 70},
	["blood herb"] = {2798, 3, 10},
	["draken doll"] = {13031, 1, 70},
	["bear doll"] = {3954, 1, 70}
}

local function creatureSayCallback(npc, creature, type, message)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = creature:getId()
	local player = Player(creature)
	message = string.lower(message)
	if (message == "event shop") then
		npcHandler:say("In our website enter in {Events} => {Events Shop}.", npc, creature)
	end
	
	if (eventShopItems[message]) then
		npcHandler.topic[playerId] = 0
		local itemId, itemCount, itemPrice = eventShopItems[message][1], eventShopItems[message][2], eventShopItems[message][3]
		if (player:getItemCount(15515) > 0) then
			npcHandler:say("You want buy {" ..message.. "} for " ..itemPrice.. "x?", npc, creature)
			npcHandler.topic[playerId] = message
		else
			npcHandler:say("You don't have " ..itemPrice.. " {Bar of Gold(s)}!", npc, creature)
			return true
		end
	end
	
	if (eventShopItems[npcHandler.topic[playerId]]) then
		local itemId, itemCount, itemPrice = eventShopItems[npcHandler.topic[playerId]][1], eventShopItems[npcHandler.topic[playerId]][2], eventShopItems[npcHandler.topic[playerId]][3]
		if message == "no" then
			npcHandler:say("So... what you want?", npc, creature)
			npcHandler.topic[playerId] = 0
		elseif message == "yes" then
			if (player:getItemCount(15515) >= itemPrice) then
				npcHandler:say("You bought {" ..npcHandler.topic[playerId].."} " ..itemCount.. "x for " ..itemPrice.. " {Bar of Gold(s)}!", npc, creature)
				player:removeItem(15515, itemPrice)
				player:addItem(itemId, itemCount)
			else
				npcHandler:say("You don't have enough bar's.", npc, creature)
				return true
			end
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
