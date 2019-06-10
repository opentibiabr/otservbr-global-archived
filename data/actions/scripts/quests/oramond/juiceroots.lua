local function revertRoot(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local harvestedCount = player:getStorageValue(20061)
	local rand = math.random(1, 100)
	if item.itemid == 23475 then
		if rand <= 50 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			player:addItem(23662, 1)
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 120000, toPosition, 23477, 23475)
			toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
			if player:getStorageValue(10060) <= 0 then
				player:setStorageValue(10060, 1)
			end
			if player:getStorageValue(20060) <= 0 then
				player:setStorageValue(20060, 1)
			end
			player:setStorageValue(20061, harvestedCount > 0 and harvestedCount + 1 or 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 120000, toPosition, 23477, 23475)
			toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
		end
	elseif item.itemid == 23476 then
		if rand <= 50 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			player:addItem(23662, 1)
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 120000, toPosition, 23478, 23476)
			toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
			if player:getStorageValue(10060) <= 0 then
				player:setStorageValue(10060, 1)
			end
			if player:getStorageValue(20060) <= 0 then
				player:setStorageValue(20060, 1)
			end
			player:setStorageValue(20061, harvestedCount > 0 and harvestedCount + 1 or 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 120000, toPosition, 23478, 23476)
			toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
		end
	elseif item.itemid == 23477 or item.itemid == 23478 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This root has already been harvested, nothing to gain here.')
	end
	return true
end
