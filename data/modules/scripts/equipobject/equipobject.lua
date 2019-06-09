EquipObject = {}
EquipObject.Slots = {
	[48] = CONST_SLOT_LEFT,
	[49] = CONST_SLOT_HEAD,
	[50] = CONST_SLOT_NECKLACE,
	[52] = CONST_SLOT_BACKPACK,
	[56] = CONST_SLOT_ARMOR,
	[112] = CONST_SLOT_LEGS,
	[176] = CONST_SLOT_FEET,
	[304] = CONST_SLOT_RING,
	[560] = CONST_SLOT_AMMO,
	[2096] = SLOTP_TWO_HAND -- We only use slot position in this!
}

function onRecvbyte(player, msg, byte)
	local itemType = Game.getItemIdByClientId(msg:getU16())
	local item = player:getItemById(itemType:getId(), true)
	if not item then
		item = player:getItemById(itemType:getTransformEquipId(), true)
		if not item then
			item = player:getItemById(itemType:getTransformDeEquipId(), true)
		end

		if not item then
			return player:sendCancelMessage("Sorry not possible.")
		end
	end

	local newItemType = ItemType(item:getId())
	local slotP = EquipObject.Slots[newItemType:getSlotPosition()]
	if newItemType:getWeaponType() == WEAPON_SHIELD  then
		slotP = CONST_SLOT_RIGHT
	end

	if slotP == CONST_SLOT_BACKPACK then
		player:sendCancelMessage("You can't equip a backpack.")
	elseif slotP == SLOTP_TWO_HAND then
		local slotLeft_item = player:getSlotItem(CONST_SLOT_LEFT)
		local slotRight_Item = player:getSlotItem(CONST_SLOT_RIGHT)
		if slotLeft_item then
			if slotLeft_item:getId() == newItemType:getId() then
				slotLeft_item:moveToSlot(player, 0)
			else
				if slotRight_Item then
					slotRight_Item:moveToSlot(player, 0)
				end
				item:moveToSlot(player, CONST_SLOT_LEFT)
			end
		else
			if slotRight_Item then
				slotRight_Item:moveToSlot(player, 0)
			end
			item:moveToSlot(player, CONST_SLOT_LEFT)
		end
	elseif slotP == CONST_SLOT_RING then
		local slotRing_item = player:getSlotItem(CONST_SLOT_RING)
		if slotRing_item then
			if slotRing_item:getId() == newItemType:getId() then
				slotRing_item:moveToSlot(player, 0)
			elseif slotRing_item:getId() == newItemType:getTransformEquipId() then
				slotRing_item:moveToSlot(player, 0)
			elseif slotRing_item:getId() == newItemType:getTransformDeEquipId() then
				slotRing_item:moveToSlot(player, 0)
			else
				item:moveToSlot(player, CONST_SLOT_RING)
			end
		else
			item:moveToSlot(player, CONST_SLOT_RING)
		end
	elseif slotP == CONST_SLOT_RIGHT then
		local slotRight_Item = player:getSlotItem(CONST_SLOT_RIGHT)
		local slotLeft_item = player:getSlotItem(CONST_SLOT_LEFT)
		if slotRight_Item then
			if slotRight_Item:getId() == item:getId() then
				slotRight_Item:moveToSlot(player, 0)
			else
				item:moveToSlot(player, CONST_SLOT_RIGHT)
			end
		else
			if slotLeft_item and EquipObject.Slots[ItemType(slotLeft_item:getId()):getSlotPosition()] == SLOTP_TWO_HAND then
				slotLeft_item:moveToSlot(player, 0)
			end
			item:moveToSlot(player, CONST_SLOT_RIGHT)
		end
	elseif slotP then
		local slotItem = player:getSlotItem(slotP)

		if slotItem then
			if slotItem:getId() == item:getId() then
				item:moveToSlot(player, 0)
			else
				EquipObject.StackAdd(player, item, slotP, newItemType:isStackable())
			end
		else
			EquipObject.StackAdd(player, item, slotP, newItemType:isStackable())
		end
	end
	return true
end

EquipObject.StackAdd = function(player, item, slotP, isStackable)
	if isStackable and item:getCount() < 100 and item:getCount() < player:getItemCount(item:getId()) then
		local itemId, count = item:getId(), 0
		while player:getItemCount(itemId) do
			if count == 100 then break end
			local _item = player:getItemById(itemId, true)
			if not _item then break end
			if _item:getCount() > 100 - count then
				_item:remove(100 - count)
				count = 100
			else
				count = count + _item:getCount()
				_item:remove()
			end
		end

		player:addItem(itemId, count, true, 1, slotP)
	else
		item:moveToSlot(player, slotP)
	end
end
