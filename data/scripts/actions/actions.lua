function destroyItem(player, target, toPosition)
	if type(target) ~= "userdata" or not target:isItem() then
		return false
	end

	if target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID) then
		return false
	end

	if toPosition.x == CONTAINER_POSITION then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	local destroyId = ItemType(target.itemid):getDestroyId()
	if destroyId == 0 then
		return false
	end

	if math.random(7) == 1 then
		local item = Game.createItem(destroyId, 1, toPosition)
		if item then
			item:decay()
		end

		-- Move items outside the container
		if target:isContainer() then
			for i = target:getSize() - 1, 0, -1 do
				local containerItem = target:getItem(i)
				if containerItem then
					containerItem:moveTo(toPosition)
				end
			end
		end
		target:remove(1)
	end
	
		-- Against The Spider Cult (Spider Eggs)
	if targetId == 233 then
		local eggStorage = player:getStorageValue(Storage.TibiaTales.AgainstTheSpiderCult)
		if eggStorage >= 1 and eggStorage < 5 then
			player:setStorageValue(Storage.TibiaTales.AgainstTheSpiderCult, math.max(1, eggStorage) + 1)
		end
		Game.createMonster("Giant Spider", Position(33181, 31869, 12))
	end
	
	-- Threatned Dreams Quest (Energy Barrier)
	if targetId == 25798 or targetId == 25800 then 
		addEvent(Game.createItem, math.random(13000, 17000), targetId, 1, toPosition)
	end

	toPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local function removeRemains(toPosition)
	local item = Tile(toPosition):getItemById(3133)
	if item then
		item:remove()
	end
end

local function revertCask(position)
	local caskItem = Tile(position):getItemById(3134)
	if caskItem then
		caskItem:transform(5539)
		position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
end

local function containsId(table, id)
	for i, v in pairs(table) do
		if (i == id) then
			return true
		end
	end

	return false
end