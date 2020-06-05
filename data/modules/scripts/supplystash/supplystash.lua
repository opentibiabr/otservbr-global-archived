SupplyStash = {
	Size = 1000
}

SupplyStash.Credits = {
	Developer = "DudZ, Ticardo (Rick), gpedro, vinioliveirasilva",
	Version = "1.0",
	lastUpdate = "17/04/2020 - 12:00",
	todo = {"Missing create a custom stash depot", "Stow"}
}

SupplyStash.S_Packets= { OpenWindow = 0x29 }
SupplyStash.C_Packets = { Withdraw = 0x28 }

function onRecvbyte(player, msg, byte)
    if (byte == SupplyStash.C_Packets.Withdraw) then
		SupplyStash.parseStash(player, msg)
	else
		print("byte desconhecido - " ..byte)
    end
end

function loadStash(player, idToExcludeIfZeroCount, count)
	local items = {}
	
	local resultId = db.storeQuery("SELECT * FROM `player_stash` WHERE `player_id` = " .. player:getGuid())

	if resultId ~= false then
	    repeat
	    	itemId = result.getDataInt(resultId , "item_id")
	    	itemCount = result.getDataInt(resultId , "item_count")

	    	if (itemId ~= idToExcludeIfZeroCount) then 
    			items[itemId] = itemCount
			elseif (itemCount > count) then
				items[itemId] = itemCount - count
	    	end
			
		until not result.next(resultId)
	end	
	result.free(resultId)

	return items
end

function sendOpenWindowMessage(player, items)
	local count = 0
	local depotSlots = 1

	for _, itemCount in pairs(items) do
		depotSlots = depotSlots + math.ceil(math.max(itemCount / 100, 1))
		count = count + 1
	end

	local msg = NetworkMessage()
	msg:addByte(SupplyStash.S_Packets.OpenWindow);
	msg:addU16(count)

	for id, count in pairs(items) do
		msg:addU16(id)
		msg:addU32(count)
	end

	msg:addU16(SupplyStash.Size - depotSlots)
	msg:sendToPlayer(player)
	return true
end



SupplyStash.sendOpenWindow = function(player)
	local items = loadStash(player, 0, 0)
	return sendOpenWindowMessage(player, items)
end

SupplyStash.parseStash = function(player, msg)
	local action = msg:getByte()

	if action == 0 then
		-- stow
		print('stow')
	elseif action == 1 then
		-- stow container contents
		print('stow container')
	elseif action == 2 then
		-- stow all items of this type
		print('stow all items of this')
	elseif action == 3 then -- Withdraw from stash window
		-- retrieve
		local itemId = msg:getU16()
		local itemCount = msg:getU32()
		local items = loadStash(player, itemId, itemCount)

		if items[itemId] ~= nill then
			db.asyncQuery('UPDATE `player_stash` SET `item_count` = ' .. items[itemId] .. ' WHERE `item_id` = '.. itemId ..' AND `player_id` = ' .. player:getGuid())
		else
			db.asyncQuery('DELETE FROM `player_stash` WHERE `item_id` = ' .. itemId)
		end

		player:addItem((Game.getItemIdByClientId(itemId)):getId(), itemCount)
		
		return sendOpenWindowMessage(player, items)
	end
end