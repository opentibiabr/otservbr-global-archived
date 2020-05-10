local slots = {
	1, 2, 4, 5, 6, 7, 8, 9, 10
}

local vocationDoor = Action()

function vocationDoor.onUse(player, item, target, position, fromPosition)
	local setting = UniqueTable[item.uid]
	--Check Oressa storage before choose vocation
	if player:getStorageValue(setting.storage) == setting.vocation then
		-- Cycle through the slots table and store the slot id in slot
		for index, value in pairs(slots) do
			-- Get the player's slot item and store it in item
			local item = player:getSlotItem(value)
			-- If the item exists meaning its not nil then continue
			if item and not table.contains({2480}, item:getId()) then
				item:remove()
			end
		end
		local container = player:getSlotItem(CONST_SLOT_BACKPACK)
		if container and container:getSize() > 0 then
			local allowedIds = {
				2050, 2051, 2052, 2053,
				2054, 2055, 2056, 2120,
				2148, 2420, 2480, 2553,
				2554, 2580, 5710, 8722,
				8723
			}
			local toBeDeleted = {}

			for i = 0, container:getSize() do
				if player:getMoney() > 500 then
					player:removeMoney(math.abs(500 - player:getMoney()))
				end
				local item = container:getItem(i)
				if item then
					if not table.contains(allowedIds, item:getId()) then
						toBeDeleted[#toBeDeleted + 1] = item.uid
					end
				end
			end
			if #toBeDeleted > 0 then
				for i, v in pairs(toBeDeleted) do
					local item = Item(v)
					if item then
						item:remove()
					end
				end
			end
		end
		player:teleportTo(setting.destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif player:getStorageValue(setting.storage) ~= setting.vocation then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

vocationDoor:uid(25017, 25018, 25019, 25020)
vocationDoor:register()
