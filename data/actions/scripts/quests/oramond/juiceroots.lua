local function revertJuice(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23470)
		if thing then
			thing:transform(23468)
		end
	end
end
local function revertJuicy(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23471)
		if thing then
			thing:transform(23469)
		end
	end
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand = math.random(1, 100)
	local player = Player(cid)
	local item1 = 23468
	local item2 = 23469
	if item.itemid == item1 then
		if((rand >= 1) and (rand < 50)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			doTransformItem(item.uid,23470)
			addEvent(revertJuice, 60 * 60 * 1000, toPosition)
			player:addItem(23655, 1)
			doSendMagicEffect(toPosition, CONST_ME_GREENSPARK)
			if getPlayerStorageValue(cid, 20061) <= 0 then
				setPlayerStorageValue(cid, 20061,1)
				setPlayerStorageValue(cid, 20060,1)
				setPlayerStorageValue(cid, 10060, 1)
			elseif getPlayerStorageValue(cid, 20061) == 1 then
				setPlayerStorageValue(cid, 20061,2)
			elseif getPlayerStorageValue(cid, 20061) == 2 then
				setPlayerStorageValue(cid, 20061,3)
			elseif getPlayerStorageValue(cid, 20061) == 3 then
				setPlayerStorageValue(cid, 20061,4)
			elseif getPlayerStorageValue(cid, 20061) == 4 then
				setPlayerStorageValue(cid, 20061,5)			
			end
		elseif((rand >= 50) and (rand < 100)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			doTransformItem(item.uid,23470)
			addEvent(revertJuice, 60 * 60 * 1000, toPosition)
			doSendMagicEffect(toPosition, CONST_ME_GREENSPARK)
		end
	end
	if item.itemid == item2 then
		if((rand >= 1) and (rand < 50)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			doTransformItem(item.uid,23471)
			addEvent(revertJuicy, 60 * 60 * 1000, toPosition)
			player:addItem(23655, 1)
			doSendMagicEffect(toPosition, CONST_ME_GREENSPARK)
			if getPlayerStorageValue(cid, 20061) <= 0 then
				setPlayerStorageValue(cid, 20061,1)
				setPlayerStorageValue(cid, 20060,1)
				setPlayerStorageValue(cid, 10060, 1)
			elseif getPlayerStorageValue(cid, 20061) == 1 then
				setPlayerStorageValue(cid, 20061,2)
			elseif getPlayerStorageValue(cid, 20061) == 2 then
				setPlayerStorageValue(cid, 20061,3)
			elseif getPlayerStorageValue(cid, 20061) == 3 then
				setPlayerStorageValue(cid, 20061,4)
			elseif getPlayerStorageValue(cid, 20061) == 4 then
				setPlayerStorageValue(cid, 20061,5)			
			end
		elseif((rand >= 50) and (rand < 100)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			doTransformItem(item.uid,23471)
			addEvent(revertJuicy, 60 * 60 * 1000, toPosition)
			doSendMagicEffect(toPosition, CONST_ME_GREENSPARK)
		end
	end
	return true
end
