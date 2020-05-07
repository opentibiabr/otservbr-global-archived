-- This function loads the writeable lib file at: data/lib/tables/writeable.lua
local loadWriteable = GlobalEvent("WriteableLoad")

function loadWriteable.onStartup()
	for key, value in pairs(SignTable) do
		local tile = Tile(value.itemPos)
		local item
		-- Checks if the position is valid
		if tile then
			-- Checks that you have no items created
			if tile:getItemCountById(value.itemId) == 0 then
				-- Create item
				item = Game.createItem(value.itemId, 1, value.itemPos)
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- If he found the item, add the text
			if item then
				item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, value.text)
			end
		end
	end
	for key, value in pairs(BookTable) do
		local tile = Tile(value.itemPos)
		local item
		-- Checks if the position is valid
		if tile then
			-- Checks that you have no items created
			if tile:getItemCountById(value.itemId) == 0 then
				-- Create item
				item = Game.createItem(value.itemId, 1, value.itemPos) 
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- If he found the item, add the text
			if item then
				item:setAttribute(ITEM_ATTRIBUTE_TEXT, value.text)
			end
		end
	end
	return true
end

loadWriteable:register()
