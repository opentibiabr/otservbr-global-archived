local internalNpcName = "Cledwyn"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 114,
	lookBody = 0,
	lookLegs = 76,
	lookFeet = 94,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

local talkState = {}
npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local shop = {
	{id=25177, buy=100, sell=0, name='earthheart cuirass'},
	{id=25178, buy=100, sell=0, name='earthheart hauberk'},
	{id=25179, buy=100, sell=0, name='earthheart platemail'},
	{id=25191, buy=100, sell=0, name='earthmind raiment'},
	{id=25187, buy=100, sell=0, name='earthsoul tabard'},
	{id=25174, buy=100, sell=0, name='fireheart cuirass'},
	{id=25175, buy=100, sell=0, name='fireheart hauberk'},
	{id=25176, buy=100, sell=0, name='fireheart platemail'},
	{id=25190, buy=100, sell=0, name='firemind raiment'},
	{id=25186, buy=100, sell=0, name='firesoul tabard'},
	{id=25183, buy=100, sell=0, name='frostheart cuirass'},
	{id=25184, buy=100, sell=0, name='frostheart hauberk'},
	{id=25185, buy=100, sell=0, name='frostheart platemail'},
	{id=25193, buy=100, sell=0, name='frostmind raiment'},
	{id=25189, buy=100, sell=0, name='frostsoul tabard'},
	{id=40398, buy=1, sell=0, name='magic shield potion'},
	{id=25180, buy=100, sell=0, name='thunderheart cuirass'},
	{id=25181, buy=100, sell=0, name='thunderheart hauberk'},
	{id=25182, buy=100, sell=0, name='thunderheart platemail'},
	{id=25192, buy=100, sell=0, name='thundermind raiment'},
	{id=25188, buy=100, sell=0, name='thundersoul tabard'}
}

local function setNewTradeTable(table)
	local items, item = {}
	for i = 1, #table do
		item = table[i]
		items[item.id] = {id = item.id, buy = item.buy, sell = item.sell, subType = 0, name = item.name}
	end
	return items
end

local function onBuy(creature, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(creature)
	local itemsTable = setNewTradeTable(shop)
	if not ignoreCap and player:getFreeCapacity() < ItemType(itemsTable[item].id):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_FAILURE, "You don't have enough cap.")
	end
	if itemsTable[item].buy then
		if player:removeItem(Npc():getCurrency(), amount * itemsTable[item].buy) then
			if amount > 1 then
				currencyName = ItemType(Npc():getCurrency()):getPluralName():lower()
			else
				currencyName = ItemType(Npc():getCurrency()):getName():lower()
			end
			player:addItem(itemsTable[item].id, amount)
			return player:sendTextMessage(MESSAGE_TRADE,
						"Bought "..amount.."x "..itemsTable[item].name.." for "..itemsTable[item].buy * amount.." "..currencyName..".")
		else
			return player:sendTextMessage(MESSAGE_FAILURE, "You don't have enough "..currencyName..".")
		end
	end

	return true
end

local function onSell(creature, item, subType, amount, ignoreCap, inBackpacks)
	return true
end

local chargeItem = {
	['pendulet'] = {noChargeID = 34067, ChargeID = 34983},
	['sleep shawl'] = {noChargeID = 34066, ChargeID = 34981},
	['blister ring'] = {noChargeID = 36392, ChargeID = 36456},
	['theurgic amulet'] = {noChargeID = 35236, ChargeID = 35238},
	['ring of souls'] = {noChargeID = 37456, ChargeID = 37471}
}

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	return true
end

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{ text = 'Trading tokens! First-class bargains!' },
	{ text = 'Bespoke armor for all vocations! For the cost of some tokens only!' },
	{ text = 'Tokens! Bring your tokens!' }
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

function creatureSayCallback(npc, creature, type, message)	local player = Player(creature)
	if not player then
		return false
	end
	if msgcontains(message, 'token') or msgcontains(message, 'tokens') then
		npcHandler:say("If you have any {silver} tokens with you, let's have a look! Maybe I can offer you something in exchange.", npc, creature)
	elseif msgcontains(message, 'information') then
		npcHandler:say("With pleasure. <bows> I trade {token}s. There are several ways to obtain the {token}s I am interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items.", npc, creature)
	elseif msgcontains(message, 'talk') then
		npcHandler:say({"Why, certainly! I'm always up for some small talk. ...",
						 "The weather continues just fine here, don't you think? Just the day for a little walk around the town! ...",
						 "Actually, I haven't been around much yet, but I'm looking forward to exploring the city once I've finished trading {token}s."}, npc, creature)
	elseif msgcontains(message, 'silver') then
		openShopWindow(creature, shop, onBuy, onSell)
		npcHandler:say({"Here's the deal, " .. player:getName() .. ". For 100 of your silver tokens, I can offer you some first-class torso armor. These armors provide a solid boost to your main attack skill, as well as ...",
		"some elemental protection of your choice! I also sell a magic shield potion for one silver token. So these are my offers."}, npc, creature)
	elseif msgcontains(message, 'enchant') then
		npcHandler:say("The following items can be enchanted: {pendulet}, {sleep shawl}, {blister ring}, {theurgic amulet}. Make you choice!", npc, creature)
		npcHandler.topic[playerId] = 1
	elseif isInArray({'pendulet', 'sleep shawl', 'blister ring', 'theurgic amulet'}, message:lower()) and npcHandler.topic[playerId] == 1 then
		npcHandler:say("Should I enchant the item pendulet for 2 ".. ItemType(Npc():getCurrency()):getPluralName():lower() .."?", npc, creature)
		charge = message:lower()
		npcHandler.topic[playerId] = 2
	elseif npcHandler.topic[playerId] == 2 then
		if msgcontains(message, 'yes') then
			if not chargeItem[charge] then
				npcHandler:say("Sorry, you don't have an unenchanted ".. charge ..".",creature)
			else
				if (player:getItemCount(Npc():getCurrency()) >= 2) and (player:getItemCount(chargeItem[charge].noChargeID) >= 1) then
					player:removeItem(Npc():getCurrency(), 2)
					player:removeItem(chargeItem[charge].noChargeID, 1)
					local itemAdd = player:addItem(chargeItem[charge].ChargeID, 1)
					npcHandler:say("Ah, excellent. Here is your " .. itemAdd:getName():lower() .. ".", npc, creature)
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(Npc():getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
				npcHandler.topic[playerId] = 0
			end
		elseif msgcontains(message, 'no') then
			npcHandler:say("Alright, come back if you have changed your mind.", npc, creature)
			npcHandler.topic[playerId] = 0
		end
	elseif msgcontains(message, 'addon') then
		if player:hasOutfit(846, 0) or player:hasOutfit(845, 0) then
			npcHandler:say("Ah, very good. Now choose your addon: {first} or {second}.", npc, creature)
			npcHandler.topic[playerId] = 3
		else
			npcHandler:say("Sorry, friend, but one good turn deserves another. You need to obtain the rift warrior outfit first.", npc, creature)
		end
	elseif isInArray({'first', 'second'}, message:lower()) and npcHandler.topic[playerId] == 3 then
		if message:lower() == 'first' then
			if not(player:hasOutfit(846, 1)) and not(player:hasOutfit(845, 1)) then
				if player:removeItem(25172, 100) then
					npcHandler:say("Ah, excellent. Obtain the first addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 1)
					player:addOutfitAddon(845, 1)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(Npc():getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the first Rift Warrior addon.", npc, creature)
			end
		elseif message:lower() == 'second' then
			if not(player:hasOutfit(846, 2)) and not(player:hasOutfit(845, 2)) then
				if player:removeItem(25172, 100) then
					npcHandler:say("Ah, excellent. Obtain the second addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 2)
					player:addOutfitAddon(845, 2)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(Npc():getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the second Rift Warrior addon.", npc, creature)
			end
		end
		npcHandler.topic[playerId] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
