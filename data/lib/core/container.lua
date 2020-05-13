function Container.isContainer(self)
	return true
end

function Container.createLootItem(self, item)
	if self:getEmptySlots() == 0 then
		return true
	end

	local itemCount = 0
	local randvalue = getLootRandom()
	local lootBlockType = ItemType(item.itemId)
	
	if randvalue < item.chance then
		if lootBlockType:isStackable() then
			local maxc, minc = item.maxCount or 1, item.minCount or 1
			itemCount = math.max(0, randvalue % (maxc - minc + 1)) + minc			
		else
			itemCount = 1
		end
	end
	
	while (itemCount > 0) do
		local n = math.min(itemCount, 100)
		itemCount = itemCount - n
		
		local tmpItem = self:addItem(item.itemId, n)
		if not tmpItem then
			return false
		end

		if tmpItem:isContainer() then
			for i = 1, #item.childLoot do
				if not tmpItem:createLootItem(item.childLoot[i]) then
					tmpItem:remove()
					return false
				end
			end
		end

		if item.subType ~= -1 then
			tmpItem:transform(item.itemId, item.subType)
		elseif lootBlockType:isFluidContainer() then
			tmpItem:transform(item.itemId, 0)
		end

		if item.actionId ~= -1 then
			tmpItem:setActionId(item.actionId)
		end

		if item.text and item.text ~= "" then
			tmpItem:setText(item.text)
		end
	end
	return true
end