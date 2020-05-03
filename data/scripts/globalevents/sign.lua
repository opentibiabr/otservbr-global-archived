-- this function loads the writeable lib file at: data/lib/tables/writeable.lua
local loadSign = GlobalEvent("LuaSignLoad")

function loadSign.onStartup()
	for key, value in pairs(SignTable) do
		local tile = Tile(value.itemPos)
		local item
		-- checks if the position is valid
		if tile then
			-- checks that you have no items created
			if tile:getItemCountById(value.itemId) == 0 then
				-- create item
				item = Game.createItem(value.itemId, 1, value.itemPos)
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- if he found the item, add the text
			if item then
				item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, value.text)
			end
		end
	end
	return true
end

loadSign:register()
