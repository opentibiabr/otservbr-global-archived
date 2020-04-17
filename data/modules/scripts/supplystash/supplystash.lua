SupplyStash = {}

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
    end
end

function stashContainer(container, items)
	if container:isContainer() then
		for index = 0, container:getSize() do
			local item = container:getItem(index)
			if item then
				local type = item:getType()
				if item:isContainer() then
					items = stashContainer(Container(item.uid), items)
				elseif item:isItem() and type:isStackable() then
					local cid = type:getClientId()
					if not items[cid] then
						items[cid] = 0
					end

					local current = items[cid] or 0
					items[cid] = current + item:getSubType()
				end
			end
		end
	end

	return items
end

SupplyStash.sendOpenWindow = function(player)
	print("SupplyStash.sendOpenWindow")
	local msg = NetworkMessage()
	msg:addByte(SupplyStash.S_Packets.OpenWindow);

	local items = {}
	for id = 1, configManager.getNumber("depotBoxes") do
		local container = player:getDepotChest(id, true)
		if container:getItemHoldingCount() > 0 then
			items = stashContainer(container, items)
		end
	end

	-- workaround: idk why #items not working
	local count = 0
	local depotSlots = 1
	for _, itemCount in pairs(items) do
		print(math.floor(math.min(itemCount / 100, 1)))
		depotSlots = depotSlots + math.ceil(math.min(itemCount / 100, 1))
		count = count + 1
	end

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