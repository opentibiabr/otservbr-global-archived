DailyRewardSystem = {
	Developer = "Ticardo (Rick)",
	Version = "1.0",
	lastUpdate = "22/02/2020 - 00:00"
}

local ClientPackets = {
	ManageItemList = 0x91,
	SelectBackpack = 0x90,
	LootCorpse = 0x8F
}

local ServerPackets = {
	SendBackpack = 0xC0
}

local QUICKLOOT_CATEGORY_ATTRIBUTE = "quickLootCategory"

local QuickLootCategory = {
	UnassignedLoot = 31,
	Gold =  30,
	Armors = 1,
	Amulets = 2,
	Boots = 3,
	Containers = 4,
	CreatureProducts = 24,
	Decoration = 5,
	Food = 6,
	Helmets = 7,
	Legs = 8,
	Others = 9,
	Potions = 10,
	Rings = 11,
	Runes = 12,
	Shields = 13,
	Tools = 14,
	Valuables = 15,
	WeaponsAmmo = 16,
	WeaponsAxe = 17,
	WeaponsClubs = 18,
	WeaponsDistance = 19 ,
	WeaponsSwords = 20,
	WeaponsWands = 21,
	StashRetrieve = 27,
}

function onRecvbyte(player, msg, byte)
	setupDatabase()
	print(byte)
	if byte == ClientPackets.ManageItemList then -- adiciona ou remove items da lista de loot
		local lootMode = msg:getByte() -- 0 skipped / 1 accepted loot
		local itemCount = msg:getU16() -- tamanho do array de items
		local itemList = {}
		
		if itemCount >= 1 then
			for i = 1, itemCount do
				table.insert(itemList, msg:getU16()) -- lista de items
			end
		end
		
		-- player:setQuickLootItems(itemList)
	elseif byte == ClientPackets.LootCorpse then
		local position = msg:getPosition()
		local itemId = msg:getU16()
		local stackPos = msg:getByte()

		local quickLootBackpacks = player:getQuickLootBackpacks()
		if position.x == CONTAINER_POSITION then
			local container = player:getContainerById(position.y - 64)
			if container then
				local item = container:getItem(position.z)
				if item then
					lootItem(player, quickLootBackpacks, item)
					return
				end
			end
		end

		local itemTile = Tile(position)
		if not itemTile then
			return
		end

		local thing = itemTile:getThing(stackPos)
		if thing then
			if thing:isContainer() then
				-- print("looting as container")
				lootContainer(player, quickLootBackpacks, thing)
			elseif thing:isItem() then
				-- print("looting as item")
				lootItem(player, quickLootBackpacks, thing)
			end
		end
	elseif byte == ClientPackets.SelectBackpack then
		local action = msg:getByte() -- 0 add bp | 1 remove bp | 2 - ? | 3 - use main container as fallback
		if action == 0 then
			local category = msg:getByte() -- category
			local containerType = msg:getU16()
			local containerSlot = msg:getU16()
			local containerPosition = msg:getByte() 
			local containerId = msg:getU16() -- clientid

			player:setQuickLootBackpack(category, containerSlot, containerPosition, containerId)
			player:sendLootBackpacks()
		elseif action == 1 then
			local category = msg:getByte()
			player:setQuickLootBackpack(category, nil)
			player:sendLootBackpacks()
		elseif action == 2 then
			-- ????????
		elseif action == 3 then
			-- ???????? (idk how to parse this)
			print ("1b: " .. msg:getByte())
			print ("2b: " .. msg:getByte())
			print ("3b: " .. msg:getByte())
			print ("4b: " .. msg:getByte())
		end
		
	end
end

function lootContainer(player, backpacks, containerItem)
	--print("looting container " .. containerItem.itemid)
	local container = Container(containerItem.uid)
	for i = 0, container:getSize() do
		local item = container:getItem(i)
		if item then
			if item:isContainer() then
				lootContainer(player, backpacks, item)
			elseif item:isItem() then
				if lootItem(player, backpacks, item) then
					lootContainer(player, backpacks, container)
					break
				end
			end
		end
	end
end

function lootItem(player, backpacks, item)
	--print("looting item " .. item.itemid)
	local itemType = ItemType(item.itemid)
	if not itemType or not itemType:getLootCategory() then
		--print("item without lootCategory: " .. item.itemid)
		return false
	end

	local definedBackpack = backpacks[itemType:getLootCategory()]
	if not definedBackpack then
		--print("container not defined for category " .. itemType:getLootCategory())
		return false
	end

	local destination = getContainerByQuickLootCategory(player, itemType:getLootCategory(), definedBackpack.sid)
	if not destination then
		--print("cannot find container backpack with sid " .. definedBackpack.sid)
		return false
	end

	item:moveTo(destination)
	return true
end

function getContainerBySlot(player, containerSlot, containerIndex)
	local item
	local container = player:getContainerById(containerSlot - 64)
	if container then
		item = container:getItem(containerIndex)
	else
		item = player:getSlotItem(containerSlot)
	end

	return item
end

function getContainerByQuickLootCategory(player, categoryId, serverId)

	-- check if is main backpack has quick loot category
	local mainBp = player:getSlotItem(CONST_SLOT_BACKPACK)
	if mainBp and checkItemCategory(mainBp, categoryId) then
		return mainBp
	end
	
	-- check if has any item with serverid on player containers
	local itemsCount = player:getItemCount(serverId)
	if not itemsCount then
		return nil
	end

	-- search item inside main backpack
	local insideBp = checkContainerCategory(mainBp, categoryId)
	if insideBp then
		return insideBp
	end
	
	return nil
end

function checkContainerCategory(containerItem, categoryId)
	local container = Container(containerItem.uid)
	if container then
		-- check self
		if checkItemCategory(container, categoryId) then
			return container
		end

		for i = 0, container:getSize() - 1 do
			local item = container:getItem(i)

			-- check any container inside container
			if item:isContainer() then
				local nestedContainer = checkContainerCategory(item, categoryId)
				if nestedContainer then
					return nestedContainer
				end
			end
		end
	end

	return nil
end

function checkItemCategory(item, categoryId)
	return item:getCustomAttribute(QUICKLOOT_CATEGORY_ATTRIBUTE .. categoryId) == 1
end

function Player.sendLootBackpacks(self)
	
	local playerId = self:getGuid()
	local containers = {}
	local count = 0
	local rows = db.storeQuery("SELECT `category_id`, `cid`, `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId)
	
	if rows then
		repeat
			local categoryId = result.getNumber(rows, "category_id")
			local clientId = result.getNumber(rows, "cid")
			local serverId = result.getNumber(rows, "sid")
			
			-- check if has container setted with this property
			if getContainerByQuickLootCategory(self, categoryId, serverId) then
				count = count + 1
				containers[categoryId] = clientId
			end
		until not result.next(rows)

		result.free(rows)
	end
	
	local msg = NetworkMessage()
	
	msg:addByte(ServerPackets.SendBackpack)
	msg:addByte(0) -- main container as fallback (0 - empty, 1 - checked)
	msg:addByte(count)
	
	for categoryId, clientId in pairs(containers) do
		msg:addByte(categoryId)
		msg:addU16(clientId)
	end
	
	msg:sendToPlayer(self)
end

function Player.setQuickLootBackpack(self, categoryId, containerSlot, containerPosition, containerId)
	local playerId = self:getGuid()

	-- if is just remove instead replace
	if not containerSlot then
		local oldContainerQuery = db.storeQuery("SELECT `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId .. " and category_id = " .. categoryId)
		if oldContainerQuery then
			local serverId = result.getNumber(oldContainerQuery, "sid")
			local oldContainer = getContainerByQuickLootCategory(self, categoryId, serverId)
			if oldContainer then
				oldContainer:removeCustomAttribute(QUICKLOOT_CATEGORY_ATTRIBUTE .. categoryId)
			end
		end

		result.free(oldContainerQuery)
		db.query("DELETE FROM `quickloot_containers` WHERE `player_id` = " .. playerId .. " AND `category_id` = " .. categoryId)
		return
	end

	-- check if already exists
	local query = db.storeQuery("SELECT COUNT(category_id) as c FROM `quickloot_containers` WHERE player_id = " .. playerId .. " AND `category_id` = " .. categoryId)
	local count = result.getNumber(query, "c")
	result.free(query)

	local container = getContainerBySlot(self, containerSlot, containerPosition)
	if not container then
		return
	end
	
	-- if exists another value, remove custom attribute
	local oldServerId = container.itemid
	local oldContainer = getContainerByQuickLootCategory(self, categoryId, oldServerId)
	if oldContainer then
		oldContainer:removeCustomAttribute(QUICKLOOT_CATEGORY_ATTRIBUTE .. categoryId)
	end

	-- and add custom attribute to new container
	local serverId = container.itemid
	if container:getCustomAttribute(QUICKLOOT_CATEGORY_ATTRIBUTE .. categoryId) ~= 1 then
		container:setCustomAttribute(QUICKLOOT_CATEGORY_ATTRIBUTE .. categoryId, 1)
	end

	if count == 0 then
		db.query("INSERT INTO `quickloot_containers` (`player_id`, `category_id`, `cid`, `sid`) VALUES (" .. playerId .. ", " .. categoryId .. ", " .. containerId .. ", " .. serverId .. ");")
		return 
	end

	db.query('UPDATE `quickloot_containers` SET `cid` = ' .. containerId .. ', `sid` = ' .. serverId.. ' WHERE `player_id` = ' .. playerId .. ' AND `category_id` = ' .. categoryId .. '')
end

function Player.getQuickLootBackpacks(self)
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT `category_id`, `cid`, `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId)
	local containers = {}
	
	if query then
		repeat
			local categoryId = result.getNumber(query, "category_id")
			local clientId = result.getNumber(query, "cid")
			local serverId = result.getNumber(query, "sid")

			containers[categoryId] = {
				cid = clientId,
				sid = serverId,
			}
		until not result.next(query)

		result.free(query)
	end

	return containers
end

function Player.resetQuickLootItems(self)
	self:setQuickLootItems({})
end

function Player.setQuickLootItems(self, items)
	if type(items) ~= "table" then
		items = {}
		-- warning: items wrong usage
	end
	
	self:setStorageValue(Storage.QuickLoot.ItemsToLoot, table.concat(items, ","))
end

function Player.getQuickLootItems(self)
	local value = self:getStorageValue(Storage.QuickLoot.ItemsToLoot)
	
	if not value then
		return {}
	end
	
	return split(value, ",")
end

function setupDatabase()
	db.query([[CREATE TABLE IF NOT EXISTS `quickloot_containers` (
		`player_id` INT NULL,
		`category_id` INT UNSIGNED NULL,
		`cid` INT UNSIGNED NULL,
		`sid` INT UNSIGNED NULL,

		CONSTRAINT `fk_player_id` FOREIGN KEY (`player_id`) REFERENCES `otserv`.`players` (`id`)
	)]])
end