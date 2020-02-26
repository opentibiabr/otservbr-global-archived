
-- this function loads the actions and uniques lib file at: data/lib/tables/actions_uniques.lua
local loadAttribute = GlobalEvent("Advanced Attributes Load")

local function loadingAttribute()
	-- It load actions
	for key, value in pairs(ActionTable) do
		local tile = Tile(value.itemPos)
		local item
		-- Checks if the position is valid.
		if tile then
			-- Checks that you have no items created.
			if tile:getItemCountById(value.itemId) == 0 then
				-- If not have items created, thisc create the item.
				item = Game.createItem(value.itemId, 1, value.itemPos) 
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- If he found the item, add the action id.
			if item and value.actionId then
				item:setActionId(value.actionId)
			end
			-- This function add one action id on an item inside the container, it was developed to add action on daily respawn item.
			if item and value.isDailyAIDContainerItem then
				itemAttr = item:addItem(value.containerItem, 1)
				itemAttr:setActionId(value.actionId)
			end
		end
	end
	-- It load uniques
	for key, value in pairs(UniqueTable) do
		local tile = Tile(value.itemPos)
		local item
		-- Checks if the position is valid.
		if tile then
			-- Checks that you have no items created.
			if tile:getItemCountById(value.itemId) == 0 then
				-- If not have items created, thisc create the item.
				item = Game.createItem(value.itemId, 1, value.itemPos) 
			end
			if not item then
				item = tile:getItemById(value.itemId)
			end
			-- If he found the item, add the unique id.
			if item then
				item:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, key)
			end
		end
	end
end

function loadAttribute.onStartup()
	addEvent(loadingAttribute, 1 * 1000)
	print(">> Action and unique loading system for .lua")
	print("> All actions loaded.")
	print("> All uniques loaded.")
	return true
end

loadAttribute:register()
