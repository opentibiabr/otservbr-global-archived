local ec = EventCallback

ec.onLook = function(self, thing, position, distance, description)
	local description = "You see "
	if thing:isItem() then
		if thing.actionid == 5640 then
			description = description .. "a honeyflower patch."
		elseif thing.actionid == 5641 then
			description = description .. "a banana palm."
		elseif thing.itemid >= ITEM_HEALTH_CASK_START and thing.itemid <= ITEM_HEALTH_CASK_END
		or thing.itemid >= ITEM_MANA_CASK_START and thing.itemid <= ITEM_MANA_CASK_END
		or thing.itemid >= ITEM_SPIRIT_CASK_START and thing.itemid <= ITEM_SPIRIT_CASK_END
		or thing.itemid >= ITEM_KEG_START and thing.itemid <= ITEM_KEG_END then
			description = description .. thing:getDescription(distance)
			local charges = thing:getCharges()
			if charges then
				description = string.format("%s\nIt has %d refillings left.", description, charges)
			end
		else
			description = description .. thing:getDescription(distance)
		end

		local itemType = thing:getType()
		if (itemType and itemType:getImbuingSlots() > 0) then
			local imbuingSlots = "Imbuements: ("
			for slot = 0, itemType:getImbuingSlots() - 1 do
				if slot > 0 then
					imbuingSlots = string.format("%s, ", imbuingSlots)
				end
				local duration = thing:getImbuementDuration(slot)
				if duration > 0 then
					local imbue = thing:getImbuement(slot)
					imbuingSlots = string.format("%s%s %s %s",
						imbuingSlots, imbue:getBase().name, imbue:getName(), getTime(duration))
				else
					imbuingSlots = string.format("%sEmpty Slot", imbuingSlots)
				end
			end
			imbuingSlots = string.format("%s).", imbuingSlots)
			description = string.gsub(description, "It weighs", imbuingSlots.. "\nIt weighs")
		end
	else
		description = description .. thing:getDescription(distance)
		if thing:isMonster() then
			local master = thing:getMaster()
			if master and table.contains({'thundergiant','grovebeast','emberwing','skullfrost'}, thing:getName():lower()) then
				description = description..' (Master: ' .. master:getName() .. '). \z
				It will disappear in ' .. getTimeinWords(master:getStorageValue(Storage.PetSummon) - os.time())
			end
		end
	end

	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format("%s\nItem ID: %d", description, thing:getId())

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end

			local itemType = thing:getType()

			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onDeEquip)", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecays to: %d", description, decayId)
			end
			
			local clientId = itemType:getClientId()
			if clientId then
				description = string.format("%s\nClient ID: %d", description, clientId)
			end
			
		elseif thing:isCreature() then
			local str = "%s\nHealth: %d / %d"
			if thing:isPlayer() and thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end

		description = string.format(
		"%s\nPosition: %d, %d, %d",
		description, position.x, position.y, position.z
		)

		if thing:isCreature() then
			if thing:isPlayer() then
				description = string.format("%s\nIP: %s.", description, Game.convertIpToString(thing:getIp()))
			end
		end
	end
	return description
end