local internalNpcName = "Gnomux"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 493,
	lookHead = 12,
	lookBody = 82,
	lookLegs = 39,
	lookFeet = 114,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

local talkState = {}

local spike_items = {
	[21564] = {250, 4, SPIKE_MIDDLE_MUSHROOM_MAIN},
	[21555] = {150, 3, SPIKE_UPPER_TRACK_MAIN},
	[21569] = {100, 4, SPIKE_LOWER_PARCEL_MAIN},
	[21557] = {250, 1, SPIKE_MIDDLE_CHARGE_MAIN},
	[21553] = {150, 4, SPIKE_UPPER_MOUND_MAIN},
	[21556] = {500, 1, SPIKE_LOWER_LAVA_MAIN},
	[21554] = {150, 7, SPIKE_UPPER_PACIFIER_MAIN}
}

local onBuy = function(creature, item, subType, amount, ignoreCap, inBackpacks)
	if not doPlayerRemoveMoney(creature, spike_items[item][1] * amount) then
		selfSay("You don't have enough money.", npc, creature)
	else
		doPlayerAddItem(creature, item, amount)
		selfSay("Here you are!", npc, creature)
	end
	return true
end
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

function creatureSayCallback(npc, creature, type, message)

	if not npcHandler:isFocused(creature) then
		return false
	end

	local player, canBuy, shopWindow = Player(creature), false, {}

	for itemid, data in pairs(spike_items) do
		if not isInArray({-1, data[2]}, player:getStorageValue(data[3])) then
			canBuy = true
			table.insert(shopWindow, {id = itemid, subType = 0, buy = data[1], sell = 0, name = ItemType(itemid):getName()})
		end
	end

	if msgcontains(message, 'trade') then
		if canBuy then
			openShopWindow(creature, shopWindow, onBuy, onSell)
			return npcHandler:say("Here you are.", npc, creature)
		else
			return npcHandler:say("Sorry, there's nothing for you right now.", npc, creature)
		end
		return true
	end

	if msgcontains(message, 'job') then
		npcHandler:say("I'm responsible for resupplying foolish adventurers with equipment that they may have lost. If you're one of them, just ask me about a {trade}. ", npc, creature)
	end

	if msgcontains(message, 'gnome') then
		npcHandler:say("What could I say about gnomes that anyone would not know? I mean, we're interesting if not fascinating, after all.", npc, creature)
	end

	if msgcontains(message, 'spike') then
		npcHandler:say({"I came here as a crystal farmer and know the Spike all the way back to when it was a little baby crystal. I admit I feel a little fatherly pride in how big and healthy it has become.","When most other crystal experts left for new assignments, I decided to stay and help here a bit."}, npc, creature)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
