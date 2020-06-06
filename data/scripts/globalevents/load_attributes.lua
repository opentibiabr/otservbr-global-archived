
-- This script loads the actions and uniques lib file at: data/lib/tables/action_unique.lua
local loadAttribute = GlobalEvent("AdvancedAttributesLoad")

function loadAttribute.onStartup()
	-- It load actions
	for index, value in pairs(ActionTable) do
		for i = 1, #value.itemPos do
			local tile = Tile(value.itemPos[i])
			local item
			-- Checks if the position is valid
			if tile then
				-- Checks that you have no items created
				if tile:getItemCountById(value.itemId) == 0 then
					-- If not have items created, this create the item
					item = Game.createItem(value.itemId, 1, value.itemPos[i])
				end
				if not item then
					item = tile:getItemById(value.itemId)
				end
				-- If he found the item, add the action id.
				if item and value.actionId then
					item:setActionId(value.actionId)
				end
				if value.itemId == false and tile:getTopDownItem() then
					tile:getTopDownItem():setActionId(value.actionId)
				end
				if value.itemId == false and tile:getTopTopItem() then
					tile:getTopTopItem():setActionId(value.actionId)
				end
				-- This function add one action id on an item inside the container
				-- It was developed to add action on daily respawn item
				if item and value.isDailyAIDContainerItem then
					itemAttr = item:addItem(value.containerItem, 1)
					itemAttr:setActionId(value.actionId)
				end
			end
		end
	end
	-- It load uniques
	for key, value in pairs(UniqueTable) do
		local tile = Tile(value.itemPos)
		local item
		-- Checks if the position is valid
		if tile then
			-- Checks that you have no items created
			if tile:getItemCountById(value.itemId) == 0 then
				-- If not have items created, thisc create the item
				item = Game.createItem(value.itemId, 1, value.itemPos)
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- If he found the item, add the unique id
			if item then
				item:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, key)
			end
		end
	end
	-- It load signs on map table
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
	-- It load book on map table
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
			-- This add text on book inside a container
			if item and value.containerBook then
				itemAttr = item:addItem(value.bookId, 1)
				itemAttr:setAttribute(ITEM_ATTRIBUTE_TEXT, value.text)
			end
		end
	end
	return true
end

loadAttribute:register()
