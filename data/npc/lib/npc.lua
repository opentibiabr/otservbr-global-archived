-- Including the Advanced NPC System
dofile('data/npc/lib/npcsystem/npcsystem.lua')
dofile('data/npc/lib/npcsystem/customModules.lua')

isPlayerPremiumCallback = Player.isPremium

function msgcontains(message, keyword)
	local message, keyword = message:lower(), keyword:lower()
	if message == keyword then
		return true
	end

	return message:find(keyword) and not message:find('(%w+)' .. keyword)
end

function doNpcSellItem(cid, itemId, amount, subType, ignoreCap, inBackpacks, backpack)
	local amount = amount or 1
	local subType = subType or 0
	local item = 0
	local player = Player(cid)
	if ItemType(itemId):isStackable() then
		local stuff
		if inBackpacks then
			stuff = Game.createItem(backpack, 1)
			item = stuff:addItem(itemId, math.min(100, amount))
		else
			stuff = Game.createItem(itemId, math.min(100, amount))
		end

		return player:addItemEx(stuff, ignoreCap) ~= RETURNVALUE_NOERROR and 0 or amount, 0
	end

	local a = 0
	if inBackpacks then
		local container, itemType, b = Game.createItem(backpack, 1), ItemType(backpack), 1
		for i = 1, amount do
			local item = container:addItem(itemId, subType)
			if isInArray({(itemType:getCapacity() * b), amount}, i) then
				if player:addItemEx(container, ignoreCap) ~= RETURNVALUE_NOERROR then
					b = b - 1
					break
				end

				a = i
				if amount > i then
					container = Game.createItem(backpack, 1)
					b = b + 1
				end
			end
		end

		return a, b
	end

	for i = 1, amount do -- normal method for non-stackable items
		local item = Game.createItem(itemId, subType)
		if player:addItemEx(item, ignoreCap) ~= RETURNVALUE_NOERROR then
			break
		end
		a = i
	end
	return a, 0
end

local func = function(cid, text, type, e, pcid)
	local npc = Npc(cid)
	if not npc then
		return
	end

	local player = Player(pcid)
	if player then
		npc:say(text, type, false, player, npc:getPosition())
		e.done = true
	end
end

function doCreatureSayWithDelay(cid, text, type, delay, e, pcid)
	if Player(pcid) then
		e.done = false
		e.event = addEvent(func, delay < 1 and 1000 or delay, cid, text, type, e, pcid)
	end
end

function doPlayerTakeItem(cid, itemid, count)
	local player = Player(cid)
	if player:getItemCount(itemid) < count then
		return false
	end

	while count > 0 do
		local tempcount = 0
		if ItemType(itemid):isStackable() then
			tempcount = math.min (100, count)
		else
			tempcount = 1
		end

		local ret = player:removeItem(itemid, tempcount)
		if ret then
			count = count - tempcount
		else
			return false
		end
	end

	if count ~= 0 then
		return false
	end
	return true
end

function doPlayerSellItem(cid, itemid, count, cost)
	local player = Player(cid)
	if doPlayerTakeItem(cid, itemid, count) then
		if not player:addMoney(cost) then
			error('Could not add money to ' .. player:getName() .. '(' .. cost .. 'gp)')
		end
		return true
	end
	return false
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	local player = Player(cid)
	if not player:removeMoney(cost) then
		return false
	end

	for i = 1, count do
		local container = Game.createItem(containerid, 1)
		for x = 1, ItemType(containerid):getCapacity() do
			container:addItem(itemid, charges)
		end

		if player:addItemEx(container, true) ~= RETURNVALUE_NOERROR then
			return false
		end
	end
	return true
end

function getCount(string)
	local b, e = string:find("%d+")
	return b and e and tonumber(string:sub(b, e)) or -1
end
