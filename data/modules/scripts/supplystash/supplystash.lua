SupplyStash = {}

SupplyStash.Size = 1000

SupplyStash.Credits = {
	Developer = "DudZ, Ticardo (Rick), gpedro",
	Version = "1.0",
	lastUpdate = "17/04/2020 - 12:00",
	todo = {"Missing create a custom stash depot", "Stow", "Withdraw"}
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

function loadStash(player)
	local items = {}
	
	local resultId = db.storeQuery("SELECT * FROM `player_stash` WHERE `player_id` = " .. player:getGuid())

	if resultId ~= false then
	    repeat
			items[result.getDataInt(resultId , "item_id")] = result.getDataInt(resultId , "item_count")
		until not result.next(resultId)
	end	
	result.free(resultId)

	return items
end

SupplyStash.sendOpenWindow = function(player)
	local items = loadStash(player)
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

SupplyStash.parseStash = function(player, msg)
	local action = msg:getByte()
	print("SupplyStash.parseWithdraw")
	print("action: " ..action )
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
		print('withdraw')
	end
end