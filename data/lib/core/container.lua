function Container.isContainer(self)
	return true
end

--[[
	return values for autoloot
	0 = Did not drop the item. No error
	-1 = For some reason, the item can not be created.
	> 0 = UID
]]
function Container.createLootItem(self, item)
	if self:getEmptySlots() == 0 then
	       return 0
	end

	local itemCount = 0
	local randvalue = getLootRandom()
	if randvalue < item.chance then
		if ItemType(item.itemId):isStackable() then
			itemCount = randvalue % item.maxCount + 1
		else
			itemCount = 1
		end
	end

	local tmpItem = false
	if itemCount > 0 then
		tmpItem = self:addItem(item.itemId, math.min(itemCount, 100))
		if not tmpItem then
			return -1
		end

		if tmpItem:isContainer() then
			for i = 1, #item.childLoot do
				if not tmpItem:createLootItem(item.childLoot[i]) then
					tmpItem:remove()
					return -1
				end
			end
		end

		if item.subType ~= -1 then
			tmpItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, item.subType)
		end

		if item.actionId ~= -1 then
			tmpItem:setActionId(item.actionId)
		end

		if item.text and item.text ~= "" then
			tmpItem:setText(item.text)
		end
	end

	return tmpItem and tmpItem.uid or 0
end
